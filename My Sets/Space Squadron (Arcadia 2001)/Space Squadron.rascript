// Space Squadron
// #ID = 21613

// $00E1: [8-bit] Title Screen (when = 0x66)
function TitleScreen() => byte(0x0000E1)

// $00E2: [8-bit] Game Status
//        0x4 = Playing
//        0x6 = Dying
//        0xa = Waiting for player to start
//        0xc = Game Over
function GameStatus() => byte(0x0000E2)

// $00E4: [8-bit] Scoll Location (0x0 to 0x3f)
function ScollLocation() => byte(0x0000E4)

// $0258: [8-bit] Enemy State (every two bytes from 0x0268 to 0x026E)
//        bit 6 - 0 = alive, 1 = dead
//        bit 7 - 0 = travel right, 1 = travel left
function EnemyState(index) => byte(0x000258 + (index * 2))
function EnemySide(index) => bit7(0x000258 + (index * 2))
function EnemyDead(index) => bit6(0x000258 + (index * 2))
function EnemyDeath(index) => prev(EnemyDead(index)) < EnemyDead(index) && EnemySide(index) == 0

// $0259: [8-bit] Enemy Location (every two bytes from 0x0269 to 0x026F)
function EnemyLocation(index) => byte(0x000259 + (index * 2))

// $026E: [8-bit] Alien State
//        bit 6 - 0 = alive, 1 = dead
//        bit 7 - 0 = travel right, 1 = travel left
function AlienState() => byte(0x00026E)
function AlienDead() => bit6(0x00026E)

// $026F: [8-bit] Alien Location
function AlienLocation() => byte(0x00026F)

// $02B0: [8-bit] Player Status (0x0 = dead. 0x4 = alive)
function PlayerStatus() => byte(0x0002B0)

// $02D2: [16-bit] Ship Distance Travelled
function ShipDistanceTravelled() => word(0x0002D2)

// $02F1: [BCD] Score
function ScoreWord() => word(0x0002F1)
function ScoreX000() => high4(0x0002F1)
function Score0X00() => low4(0x0002F1)
function Score00X0() => high4(0x0002F2)
function Score000X() => low4(0x0002F2)
function Score() {
    return ScoreX000() * 1000 +
        Score0X00() * 100 +
        Score00X0() * 10 +
        Score000X()
}

// $02F5: [8-bit] Lives
function Lives() => byte(0x0002F5)

// $02F6: [8-bit] Level (0 = Level 1, 1 = Level 2)
function Level() => byte(0x0002F6)

// Game events
function Reset() => GameStatus() == 0xe
function Death() => prev(Lives()) > Lives()
function LevelSelect() => TitleScreen() == 0x66 && GameStatus() == 0x0

// Event occur during a new game
function NewGame()
{
    return Lives() == 3 &&
        prev(GameStatus()) != 0x4 &&
        GameStatus() == 0x4
}

// Event occurs at the game over screen
function GameOver()
{
    return Lives() == 0 &&
        prev(GameStatus()) != 0xC &&
        GameStatus() == 0xC
}

// Code for when the score goes up by 5
MutantDeath = [
    prev(Score00X0()) != Score00X0() &&
    prev(Score000X()) == 0x5 &&
    Score000X() == 0x0,
    prev(Score00X0()) == Score00X0() &&
    prev(Score000X()) == 0x0 &&
    Score000X() == 0x5  
]
    
// Code for when the score goes up by 10
AlienDeath = [
    prev(Score000X()) == Score000X() &&
    prev(Score00X0()) + 1 == Score00X0(),
    prev(Score000X()) == Score000X() && 
    prev(Score00X0()) == 0x9 && 
    Score00X0() == 0x0   
]

// Kill some enemeies while missing other
function Hunt(count, kill, miss)
{
    return never(GameOver()) &&
           never(LevelSelect()) &&
           never(Death()) &&
           all_of(miss, b => never(b)) &&
           measured(
               tally(count, kill),
               GameStatus() == 0x4 && 
               ScoreWord() != 0x0
           )  
}

// Loop the scenery without dying and or killing anything
function WorldPeace()
{
    mapped = []
    for index in range(0,0x3f)
        array_push(mapped, once(ScollLocation() == index))        

    return never(GameOver()) &&
        never(LevelSelect()) &&
        never(Death()) &&
        never(prev(ScoreWord()) != ScoreWord())&&
        measured(
            tally(0x40, mapped),
            GameStatus() == 0x4,
            format="percent"
        )           
}

function HighScore(highScore, level)
{
    lowScore = highScore - 10
    return prev(Score()) >= lowScore &&
        prev(Score()) < highScore &&
        measured(
            Score() >= highScore,
            GameStatus() == 0x4 && 
            Level() == level - 1            
        )     
}

achievement("Stellar Initiate","Score 50 or more in level 1", 2, HighScore(50,1))
achievement("Celestial Voyager","Score 100 or more in level 1", 3, HighScore(100,1))
achievement("Galactic Master","Score 250 or more in level 1", 5, HighScore(250,1))
achievement("Lunar Novice","Score 25 or more in level 2", 2, HighScore(25,2))
achievement("Solar Ace","Score 50 or more in level 2", 3, HighScore(50,2))
achievement("Nebula Conqueror","Score 100 or more in level 2", 5, HighScore(100,2))
achievement("Mutant Exterminator","Kill 15 mutants in a row without dying or hitting an alien", 5, Hunt(15, MutantDeath, AlienDeath))
achievement("Alien Annihilator","Kill 5 aliens in a row without dying or hitting a mutant", 5, Hunt(5, AlienDeath, MutantDeath))
achievement("World Peace","Fly around the map looping once without dying or killing anything", 5, WorldPeace())

// Leaderboards -------------------------------------------------------------------------------

for level in range(1,2)
{
    leaderboard(
        "Level " + level + " High Score",
        "Highest score on level " + level,
        NewGame() && Level() == level - 1,
        LevelSelect(),
        GameOver(),
        Score(),
        lower_is_better = false
    )
}

// Rich Presence ------------------------------------------------------------------------------
rich_presence_conditional_display(
    LevelSelect(), 
    "Selecting level {0}",
    rich_presence_value("Level", Level() + 1)
)
rich_presence_display(
    "Level {0}, Lives {1}, Score: {2}",
    rich_presence_value("Level", Level() + 1),
    rich_presence_value("Lives", Lives()),
    rich_presence_value("Score", Score())
)

