// Armor Attack
// #ID = 4465

// $001A: [8-bit] Menu (0x0 = In Menu, 0x10 = In Game)
function Menu() => byte(0x00001A)
function Playing() => Menu()==0x10

// $002E: [8-bit] Death Timer (Counts 0x0 to 0xff when dead)
function PlayerDeathTimer() => byte(0x00002E)

// $0079: [8-bit] Players (1-2)
function Players() => byte(0x000079)

// $007A: [8-bit] Game Mode (1-3)
function Mode() => byte(0x00007A)

// $0081: [8-bit] Number of active tanks (1-3)
function ActiveTanks() => byte(0x000081)

// $0084: [8-bit] Enemy Speed (0xfd = Slow, 0xff = Fast)
function EnemySpeed() => byte(0x000084)

// $0092: [8-bit] Helicoptor Death Timer (counts down from 0x7f to 0x5f)
function HelicoptorDeath() => byte(0x000092)

// $00C5: [8-bit] Helicoptor Status (1 = Alive)
function HelicoptorStatus() => byte(0x0000C5)

// $00E2: [8-bit] Lives
function Lives() => byte(0x0000E2)

// $00E4: [8-bit] Score Bonus (2-7 x100 added when tank destoryed) 
function Bonus() => byte(0x0000E4)

// $00E5: [8-bit] Score x100 to be added next frame (BCD)
function ScoreAdder() => byte(0x0000E5)

// $00ED: [8-bit] Game Active (0x0 = Game Over, 0xff = In Game)
function Active() => byte(0x0000ED)

// $0100: [8-bit] Tank 1 Status (0 = dead, 1 = alive, counts up when dying)
function Tank1Status() => byte(0x000100)

// $0101: [8-bit] Tank 1 Hits (0-2)
function Tank1Hits() => byte(0x000101)

// $0140: [8-bit] Tank 2 Status (0 = dead, 1 = alive, counts up when dying)
function Tank2Status() => byte(0x000140)

// $0141: [8-bit] Tank 2 Hits (0-2)
function Tank2Hits() => byte(0x000141)

// $0180: [8-bit] Tank 3 Status (0 = dead, 1 = alive, counts up when dying)
function Tank3Status() => byte(0x000180)

// $0181: [8-bit] Tank 3 Hits (0-2)
function Tank3Hits() => byte(0x000181)

// $0200: [8-bit] Jeep Status (0 = dead, 1 = alive, counts up when dying)
function JeepStatus() => byte(0x000200)

// $0206: [8-bit] Jeep Y-Axis (signed byte, +up, -down, 0 center)
function JeepX() => byte(0x000206)

// $0208: [8-bit] Jeep X-Axis (signed byte, +right, -left, 0 center)
function JeepY() => byte(0x000208)

// $028A: [BCD] Score 0x28A-0x28B
function ScoreXXXX00() => dword(0x00028A)
function ScoreX00000() => low4(0x00028A)
function Score0X0000() => low4(0x00028B)
function Score00X000() => low4(0x00028C)
function Score000X00() => low4(0x00028D)
function Score0000X0() => low4(0x00028E)
function Score00000X() => low4(0x00028F)
function Score() {
    return ScoreX00000() * 100000 +
        Score0X0000() * 10000 +
        Score00X000() * 1000 +
        Score000X00() * 100 +
        Score0000X0() * 10 +
        Score00000X()
}

//--------------------------------------------------------------
// Helper Functions

// Game state functions
function StartGame() => Menu() == 0x10 && prev(Active()) == 0 && Active() == 0xff
function GameOver() => Menu() == 0x10 && prev(Active()) == 0xff && Active() == 0
function GameActive() => Menu() == 0x10 && Active() == 0xff && Players() == 1

// Life and death function
function Death() => prev(Lives()) > Lives()
function GainLife() => prev(Lives()) + 1 == Lives()

// Convert the time minutes:seconds:frames to frames (1/60s each)
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

//------------------------------------------------------------
// Score achievements

// Check if the score goes from between low to high, to above the high score (measured version)
function ScoreMeasure(lowScore, highScore)
{
    return prev(Score()) > lowScore &&
        prev(Score()) < highScore &&
        measured(Score() >= highScore)
}


// Basic score achievements
achievement("Private","Score 10,000", 3, GameActive() && ScoreMeasure(8000, 10000))
achievement("Corporal","Score 25,000", 5, GameActive() && ScoreMeasure(23000, 25000))
achievement("Sergeant","Score 50,000", 10, GameActive() && ScoreMeasure(48000, 50000))
achievement("Sergeant Major","Score 100,000", 25, GameActive() && ScoreMeasure(98000, 100000))

// Check if the score goes from between low to high, to above the high score (trigger version)
// This is to complement the deathless score achievements
function ScoreTrigger(lowScore, highScore)
{
    return trigger_when(prev(Score()) > lowScore &&
        prev(Score()) < highScore &&
        Score() >= highScore)
}

// Check if the player has obtained the target score without dying
function DeathlessScore(lowScore, highScore)
{        
    trigger_conditions = once(StartGame()) && 
        never(Death()) && 
        never(GameOver()) &&
        ScoreTrigger(lowScore, highScore)

    return GameActive() && trigger_conditions
}

// Deathless score achievements
achievement("Tough as Nails","Score 10,000 without dying", 5, DeathlessScore(8000, 10000))
achievement("One-Man Army","Score 25,000 without dying", 10, DeathlessScore(23000, 25000))
achievement("Indestructible","Score 50,000 without dying", 25, DeathlessScore(48000, 50000))

// Check if the player reached the spped up phase and a certain mode

function ModeBeat(mode)
{
    return GameActive() && Mode() == mode && prev(EnemySpeed()) == 0xfe && EnemySpeed() == 0xff
}

// Play in the 3 modes
achievement("Finely Tuned","Reach the final speed up phase in mode 1", 5, ModeBeat(1))
achievement("Broad Strokes","Reach the final speed up phase in mode 2", 5, ModeBeat(2))
achievement("Fear of the Dark","Reach the final speed up phase in mode 3", 5, ModeBeat(3))

// Trigger when to gain 1 life (by shooting down 5 helicoptors)
achievement("Jeep Tricks","Gain a life", 5, GameActive() && GainLife())

//------------------------------------------------------------
// Challenge achievements

// Count how long the player is on the hill (center of screen is 0,0)
function OnTheHill(count)
{
    return tally(count,
        JeepX() <= 0x20 && JeepY() <= 0x20,
        JeepX() <= 0x20 && JeepY() >= 0xe0,
        JeepX() >= 0xe0 && JeepY() <= 0x20,
        JeepX() >= 0xe0 && JeepY() >= 0xe0
    )
}

// Reset if the player is off the hill
function OffTheHill()
{
    return never(JeepX() > 0x20 && JeepX() < 0xe0) &&
        never(JeepY() > 0x20 && JeepY() < 0xe0)
}

// Reset if the player is off the hill (no nevers ever)
function OffTheHillCancle()
{
    return JeepX() > 0x20 && JeepX() < 0xe0 ||
        JeepY() > 0x20 && JeepY() < 0xe0
}

// Time how long the player remains on the hill
function KingOfTheHill(time)
{
    start = OnTheHill(1)
    cancle = OffTheHill() && 
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1) 
    trigger = trigger_when(OnTheHill(time))
    
    return start && cancle && trigger
}

// King of the hill achievments
achievement("King of the Hill","Survive in the middle of the middle for 1 minute", 3, KingOfTheHill(TimeSpan(1,0,0)))
achievement("King of the Mountain","Survive in the middle of the middle for 3 minutes", 5, KingOfTheHill(TimeSpan(3,0,0)))

// Check if the player has moved since last frame
function KeepingStill() => prev(JeepX()) == JeepX() && prev(JeepY()) == JeepY()

// Time how long the player has stayed in one spot without moving or dying
function Camping(time)
{
    start = repeated(TimeSpan(0,15,0),KeepingStill())
    cancle = never(!KeepingStill()) && 
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1) 
    trigger = trigger_when(repeated(time,KeepingStill()))
    
    return start && cancle && trigger
}

// Camping achievements
achievement("Happy Camper","Survive without moving for 1 minute (rotating and shooting allowed)", 2, Camping(TimeSpan(1,0,0)))
achievement("Wilderness Survival","Survive without moving for 3 minutes (rotating and shooting allowed)", 5, Camping(TimeSpan(3,0,0)))

// Check if the player shot something (and gained points)
function NoKills() => prev(ScoreAdder()) == ScoreAdder()

// Time how long the player goes without killing an enemy or dying
function Pacifist(time)
{
    start = repeated(TimeSpan(0,20,0), NoKills())
    cancle = never(!NoKills()) && 
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1) 
    trigger = trigger_when(repeated(time, NoKills()))
    
    return start && cancle && trigger
}

// Pacifist achievements
achievement("Armor Pacifist","Survive without destroying an enemy for 1 minute", 2, Pacifist(TimeSpan(1,0,0)))
achievement("Peace Keeper","Survive without destroying an enemy for 3 minutes", 5, Pacifist(TimeSpan(3,0,0)))

//------------------------------------------------------------
// Enemy achievements
damaged = 1
destroyed = 2

// Check if a tank was destroyed by another enemy and the score adder is zero
function EnemyDestroyedTanks(tankStatus, tankHits, damage)
{
    return tankStatus != 0 && 
        prev(tankHits) == damage - 1 && 
        tankHits == damage && 
        prev(ScoreAdder()) == 0 &&
        ScoreAdder() == 0
}

// Count how many tanks where destroyed
function TanksDestroyedByEnemy(count)
{
    return GameActive() &&
        never(GameOver()) &&
        measured(
            tally(count,
                EnemyDestroyedTanks(Tank1Status(), Tank1Hits(), damaged),
                EnemyDestroyedTanks(Tank2Status(), Tank2Hits(), damaged),
                EnemyDestroyedTanks(Tank3Status(), Tank3Hits(), damaged),                
                EnemyDestroyedTanks(Tank1Status(), Tank1Hits(), destroyed),
                EnemyDestroyedTanks(Tank2Status(), Tank2Hits(), destroyed),
                EnemyDestroyedTanks(Tank3Status(), Tank3Hits(), destroyed)
            )
        )
}

// Let the tanks destroy each other
achievement("Friendly Fire","Let an enemy damage or destroy another tank 25 times", 5, TanksDestroyedByEnemy(25))

// Check if a tank was destroyed by the player and the score adder increments
function PlayerDestroyedTanks(tankStatus, tankHits)
{
    return tankStatus != 0 && 
        prev(tankHits) == 1 && 
        tankHits == 2 && 
        prev(ScoreAdder()) == 0 &&
        ScoreAdder() > 0 && 
        ScoreAdder() < 0x10
}


// Count how many tanks where destroyed
function TanksDestroyedByPlayer(count)
{
    return GameActive() &&
        never(GameOver()) &&
        measured(
            tally(count,
                PlayerDestroyedTanks(Tank1Status(), Tank1Hits()),
                PlayerDestroyedTanks(Tank2Status(), Tank2Hits()),
                PlayerDestroyedTanks(Tank3Status(), Tank3Hits())
            )
        )
}

// Destroy tanks achievements
achievement("Tanks for Nothing!","Fully destroy 10 tanks (requires two shots)", 2, TanksDestroyedByPlayer(10))
achievement("Go Get 'em Tiger!","Fully destroy 20 tanks (requires two shots)", 3, TanksDestroyedByPlayer(20))
achievement("Doom Turtles All the Way Down!","Fully destroy 30 tanks (requires two shots)", 5, TanksDestroyedByPlayer(30))

// Check if a helicoptor was shot down
function HelicoptorDown()
{
    return HelicoptorStatus() > 0 &&
        JeepStatus() == 1 &&
        PlayerDeathTimer() == 0xff &&
        prev(Bonus()) != Bonus()
}

// Count how many helicoptors where shot down
function HelicoptorsDestroyed(count)
{
    return GameActive() &&
        never(GameOver()) &&
        measured(repeated(count, HelicoptorDown()))
}

// Destroy helicoptors achievements
achievement("Aerial Attack!","Destroy 6 Helicoptors", 2, HelicoptorsDestroyed(5))
achievement("Whirlybird Wrecked!","Destroy 12 Helicoptors", 3, HelicoptorsDestroyed(12))
achievement("Blackhawk Down!","Destroy 24 Helicoptors", 5, HelicoptorsDestroyed(24))

//------------------------------------------------------------
// Leaderboards

// Highest score and deathless leaderboards
function HighScoreLB(title, description, deathless)
{
    // Start when the game starts
    start = StartGame() && Players() == 1
    
    // Never cancle
    cancle = always_false()
    
    // Sumbit on death by default
    submit = GameOver()
    
    // If deathless then submit on death
    if (deathless == true)
        submit = Death()
        
    measure = Score()
    
    leaderboard(title, description, start, cancle, submit, measure, "VALUE")
}
HighScoreLB("High Score", "Highest score", false)
HighScoreLB("High Score Deathless", "Highest score without dying", true)

// Longest time in the middle
function KingOfTheHillLB(title, description, delay)
{
    // Start with a delay after the player stays on the hill
    start = OnTheHill(delay) &&
        OffTheHill() &&
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1) 
    
    // Never cancle
    cancle = always_false()
    
    // Sumbit when off the hill, player dies, or game over
    submit = OffTheHillCancle() || 
        Death() ||
        GameOver()
    
    // Measure time in middle plus a delay time with dummy hits
    measure_array = []
    array_push(measure_array, Playing())
    for index in range(0,delay)
        array_push(measure_array, once(Playing()))
    measure = tally(0,measure_array)
    
    leaderboard(title, description, start, cancle, submit, measure, "FRAMES")
}
KingOfTheHillLB("King of the Hill", "Longest time in the center of the maze (starts after 15 seconds staying in the middle)", TimeSpan(0,15,0))

function CamperLB(title, description, delay)
{
    // Start with a delay after the player stays stilll
    start = repeated(delay,KeepingStill()) &&
        never(!KeepingStill()) && 
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1)     
        
    // Never cancle
    cancle = always_false()
    
    // Sumbit when not still, player dies, or game over
    submit = !KeepingStill() || 
        Death() ||
        GameOver()
        
    // Measure time still plus a delay time with dummy hits
    measure_array = []
    array_push(measure_array, Playing())
    for index in range(0,delay)
        array_push(measure_array, once(Playing()))
    measure = tally(0,measure_array)
    
    leaderboard(title, description, start, cancle, submit, measure, "FRAMES")
}
CamperLB("Happy Camper", "Longest time surviving without moving (starts after 15 seconds of not moving)", TimeSpan(0,15,0))

function PeaceKeeperLB(title, description, delay)
{
    // Start with a delay after the player doesn't kill
    start = repeated(delay, NoKills()) &&
        never(!NoKills()) && 
        never(Players() != 1) &&
        never(Death()) && 
        never(GameOver()) && 
        never(PlayerDeathTimer() != 0xff) && 
        never(JeepStatus() != 1)    
        
    // Never cancle
    cancle = always_false()
    
    // Sumbit when player kills, player dies, or game over
    submit = !NoKills() || 
        Death() ||
        GameOver()
        
    // Measure time not killing plus a delay time with dummy hits
    measure_array = []
    array_push(measure_array, Playing())
    for index in range(0,delay)
        array_push(measure_array, once(Playing()))
    measure = tally(0,measure_array)
    
    leaderboard(title, description, start, cancle, submit, measure, "FRAMES")
}
PeaceKeeperLB("Peace Keeper", "Longest time surviving without destroying an enemy (starts after 20 seconds of not killing)", TimeSpan(0,20,0))

//------------------------------------------------------------
// Rich Presence
rich_presence_conditional_display(GameActive(),
    "Fighting back the armor attack with {0} score and {1} lives.",
    rich_presence_value("Score", Score(), "VALUE"),
    rich_presence_value("Lives", Lives(), "VALUE"))

rich_presence_display("In Menu")