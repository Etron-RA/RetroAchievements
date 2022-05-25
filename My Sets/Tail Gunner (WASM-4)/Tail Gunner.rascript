// Tail Gunner
// #ID = 19305

// $4888: [Float] Enemy 1 X-Axis (left = -12.0, right = 172.0)
function EnemyX(index = 0) => float(0x004888 + index * 24)

// $488C: [Float] Enemy 1 Y-Axis (top = -12.0, bottom = 172.0)
function EnemyY(index = 0) => float(0x00488C + index * 24)

// $4890: [Float] Enemy 1 Alive (0.0 = Dead, 1.0 = Alive)
function EnemyAlive(index = 0) => float(0x004890 + index * 24)

// $4894: [8-bit] Enemy 1 Type [0 = Small, 1 = Zepplin, 2 = Double)
function EnemyType(index = 0) => byte(0x004894 + index * 24)

// $50B0: [32-bit] Score
function Score() => dword(0x0050B0)

// $50CC: [8-bit] Game State (0 = Title, 1 = Game, 2 = Dead)
function GameState() => byte(0x0050CC)

//----------------------------------------------------------------
// Function Helpers

function GameStart() => GameState() == 1 && Score() == 0
function GameOver() => prev(GameState()) == 1 && GameState() == 2
function GameActive() => GameState() == 1

// Array of conditions if any enemy makes to the opposite side of the screen
function EnemyMiss()
{
    enemyMiss = []    
    for index in range(0,15)
    {
        array_push(enemyMiss, prev(EnemyAlive(index)) > EnemyAlive(index) && EnemyX(index) < -12.0)   
        array_push(enemyMiss, prev(EnemyAlive(index)) > EnemyAlive(index) && EnemyX(index) > 172.0)  
        array_push(enemyMiss, prev(EnemyAlive(index)) > EnemyAlive(index) && EnemyY(index) < -12.0)   
        array_push(enemyMiss, prev(EnemyAlive(index)) > EnemyAlive(index) && EnemyY(index) > 172.0)   
    }    
    return enemyMiss
}

// Array of condition if any enemy is shot down (enemy type can be filtered for)
small_plane = 0
zeppelin = 1
dual_plane = 2
function EnemyHit(type = -1)
{
    enemyHit = []
    
    for index in range(0,15)
    {
        hit = prev(EnemyAlive(index)) > EnemyAlive(index) && 
            EnemyX(index) >= -12.0 &&
            EnemyX(index) <= 172.0 &&
            EnemyY(index) >= -12.0 &&
            EnemyY(index) <= 172.0
            
        if (type != -1) hit = hit && EnemyType(index) == type
    
        array_push(enemyHit, hit)
    }    
    return enemyHit    
}

// Adds a game over condition to the passed array of conditions
function OrGameOver(array)
{
    array_push(array, GameOver())
    return array
}

// Checks if the score goes from low to high
function ScoreRange(low, high)
{
    return prev(Score()) > low &&
        prev(Score()) < high &&
        measured(Score() >= high)
}

// General challenge achievement
function Challenge(start, cancel, submit)
{
    return any_of(start, s => once(s)) && 
        all_of(cancel, c => never(c)) && 
        all_of(submit, s => trigger_when(s))
}

// Challenge for not missing x number of enemies
function NoMissChallenge(noMisses)
{
    start = EnemyHit()
    cancel = OrGameOver(EnemyMiss())    
    submit = GameActive() && tally(noMisses,EnemyHit())    
    return Challenge(start, cancel, [submit])    
}

// Challenge for not shooting any enemies
function PacifistChallenge(time)
{
    start = GameStart()
    cancel = OrGameOver(EnemyHit())    
    submit = repeated(time, GameActive())    
    return Challenge([start], cancel, [submit])  
}

//----------------------------------------------------------------
// Achievements

achievement("Officer Cadet","Score higher than 50", 1, GameActive() && ScoreRange(25, 50))
achievement("Flight Lieutenant","Score higher than 100", 2, GameActive() && ScoreRange(50, 100))
achievement("Squadron Leader","Score higher than 250", 3, GameActive() && ScoreRange(200, 250))
achievement("Wing Commander","Score higher than 500", 4, GameActive() && ScoreRange(400, 500))
achievement("Air Marshal","Score higher than 1000", 5, GameActive() && ScoreRange(900, 1000))

achievement("Led Zeppelin","Shoot down 5 zeppelins", 2, never(GameOver()) && GameActive() &&  tally(5,EnemyHit(zeppelin)))
achievement("Wing to Wing","Shoot down 5 dual planes", 5, never(GameOver()) && GameActive() && tally(5,EnemyHit(dual_plane)))

achievement("Thwarted Escape","Shoot down 8 enemies without any escaping", 2, NoMissChallenge(8))
achievement("The Dead Tell No Secrets","Shoot down 16 enemies without any escaping", 3, NoMissChallenge(16))
achievement("Don't Let a Single One Escape","Shoot down 24 enemies without any escaping", 5, NoMissChallenge(24))

achievement("Peace Keeper","Survive for 45 seconds from the start without shooting down anyone", 3, PacifistChallenge(45 * 60))
achievement("Pacifist","Survive for 90 seconds from the start without shooting down anyone", 10, PacifistChallenge(90 * 60))

//----------------------------------------------------------------
// Leaderboards

leaderboard("Highest Score", 
    "Highest Score", 
    GameStart(), 
    always_false(), 
    GameOver(), 
    Score(), 
    "VALUE",
    false)

leaderboard("Pacifist", 
    "Longest time surviving without shooting down anyone", 
    GameStart(), 
    always_false(),
    any_of(OrGameOver(EnemyHit()), s => s), 
    always_true(),
    "FRAMES",
    false)
    
enemyHitOffset = EnemyHit()
array_push(enemyHitOffset, once(prev(Score()) != Score()))
array_push(enemyHitOffset, once(prev(Score()) != Score()))
array_push(enemyHitOffset, once(prev(Score()) != Score()))
array_push(enemyHitOffset, once(prev(Score()) != Score()))
array_push(enemyHitOffset, once(prev(Score()) != Score()))

leaderboard("Expert Shot",
    "Most enemies shot down without any escaping (starts at 8)", 
    tally(8,EnemyHit()) && all_of(OrGameOver(EnemyMiss()), s => never(s)), 
    always_false(),
    any_of(OrGameOver(EnemyMiss()), s => s),
    tally(0,enemyHitOffset),
    "VALUE",
    false)

//----------------------------------------------------------------
// Rich Presence
rich_presence_conditional_display(GameState() != 1, "Waiting to start mission")
rich_presence_display("Clearing the skies with {0} points", rich_presence_value("Score", Score()))
