// Armour Force
// #ID = 10787

// $C007: [8-bit] Stage
function Stage() => byte(0x00C007)

// $C008: [8-bit] Stage started (0 = mission screen, 1 = stage started)
function StageStarted() => bit0(0x00C008)
function AnyStageStarted() =>prev(StageStarted()) < StageStarted()
function GameStarted() => Stage() == 0 && AnyStageStarted()

// $C00B: [5 bytes] Score
function ScoreX000000() => byte(0x00C00B)
function Score0X00000() => byte(0x00C00C)
function Score00X0000() => byte(0x00C00D)
function Score000X000() => byte(0x00C00E)
function Score0000X00() => byte(0x00C00F)
function Score() 
{
    return ScoreX000000() * 1000000 +
        Score0X00000() * 100000 +
        Score00X0000() * 10000 +
        Score000X000() * 1000 +
        Score0000X00() * 100 
} 

// $C010: [3 bytes] Health
function HealthX00() => byte(0x00C010)
function Health0X0() => byte(0x00C011)
function Health00X() => byte(0x00C012)
function Health() 
{
    return HealthX00() * 100 +
        Health0X0() * 10 +
        Health00X()
}

// $C015: [8-bit] Continue Credits (starts at 3, 0xff when game over)
function Continues() => byte(0x00C015)
function ContinueUsed() => prev(Continues()) > Continues()
function GameOver() => Continues() == 0xff

// $C01B: [8-bit] Background Pallete (0x1b = level palette, 0x1f = boss palette)
function Pallete() => byte(0x00C01B)

// $C020: [8-bit] Weapon Type (0 = Triple Shot, 1 = Fireball, 2 = Laser)
function WeaponType() => byte(0x00C020)
function Fileball() => StageStarted() == 1 && prev(WeaponType()) == 0 && WeaponType() == 1

// $C022: [8-bit] Triple Shot Power (0 = one shot, 1 = two shots, 2 = three shots)
function TripleShotPower() => byte(0x00C022)
function TripleShotMax() => StageStarted() == 1 && prev(TripleShotPower()) <= 1 && TripleShotPower() == 2

// $C035: [8-bit] Special Activated (0 = no, 1 = yes)
function Special() => byte(0x00C035)
function SpecialUsed() => StageStarted() == 1 && prev(Special()) < Special()

// $C037: [8-bit] Boss Type:
//        0x0 = Dead
//        0x4 = Stage 1
//        0x78 = Stage 2
//        0x8c = Stage 3
//        0xa0 = Stage 4
//        0xc8 = Stage 5
function BossType() => byte(0x00C037)

// $C046: [8-bit] End Credits Start (when = 0x60)
function EndCredits() => byte(0x00C046)
function CreditsRolling() => Stage() == 0x4 && EndCredits() == 0x60

stages = {
    0:"Battle of the Moon",
    1:"Colony Recovery",
    2:"Madrid Constellation",
    3:"Battle of Uranus",
    4:"Final Combat"
}

// Beat any stage
function BeatStage(stage)
{
    return Stage() == stage &&
        StageStarted() == 1 &&
        Pallete() == 0x1f &&
        prev(BossType() ) != 0 &&
        BossType() == 0
}

// Beat the game with using a continue
function NoContinues()
{
    // Start when the stage started turns on in the 1st stage
    start = once(
        GameStarted() && 
        Continues() == 0x3
    )

    // cancel if a continue is used or a game over
    cancel = never(ContinueUsed()) &&
         never(GameOver())

    // trigger/measure the number of stages beaten
    stageArray = []
    for stage in range(0,4)
        array_push(stageArray, BeatStage(stage))
    trigger = trigger_when(tally(5,stageArray))
    measure = measured(tally(5,stageArray))
    
    return start && cancel && (trigger || measure)
}

// Get health above the goal
function HealthAbove(goal)
{
    return StageStarted() == 1 &&
        prev(Health()) >= goal - 20 &&        
        prev(Health()) < goal &&        
        Health() >= goal
}

// Get the score above the goal
function ScoreAbove(goal, low)
{
    return prev(Score()) >= low &&        
        prev(Score()) < goal &&        
        measured(Score() >= goal)
}

// Defeat a boss while the special is activated
function SpecialBoss()
{
    start = once(
        prev(Special()) < Special() &&
        StageStarted() == 1 &&
        Pallete() == 0x1f
    )
        
    cancel = never(prev(Special()) > Special()) &&
        never(prev(Stage()) != Stage()) &&
        never(CreditsRolling()) &&
        never(ContinueUsed()) &&
        never(GameOver())
       
    submit = trigger_when(prev(BossType()) != 0 &&
        BossType() == 0)
        
    return start && cancel && submit
}

// Defeat a boss without activating the specia
function NoSpecialBoss()
{
    start = once(
        StageStarted() == 1 &&
        prev(BossType() ) == 0 &&
        BossType() != 0        
    )
        
    cancel = never(prev(Special()) < Special()) &&
        never(prev(Stage()) != Stage()) &&
        never(CreditsRolling()) &&
        never(ContinueUsed()) &&
        never(GameOver())
       
    submit = trigger_when(prev(BossType()) != 0 &&
        BossType() == 0)
        
    return start && cancel && submit
}

achievement(stages[0],"Beat Stage 1", 5, BeatStage(0))
achievement(stages[1],"Beat Stage 2", 5, BeatStage(1))
achievement(stages[2],"Beat Stage 3", 10, BeatStage(2))
achievement(stages[3],"Beat Stage 4", 10, BeatStage(3))
achievement(stages[4],"Beat Stage 5", 25, BeatStage(4))
achievement("Armour Force","Beat the game without using a continue", 50, NoContinues())
achievement("Super Shot","Activate the special weapon", 1, SpecialUsed())
achievement("Specialized Boss Slayer","Defeat a boss while the special is activated", 5, SpecialBoss())
achievement("Nothing Special Here","Defeat a boss without activating the special", 10, NoSpecialBoss())
achievement("Triple Shot","Maximize the standard shot power", 1, TripleShotMax())
achievement("Fire Arm","Upgrade to the firearm shot", 2, Fileball())
achievement("Armoured Core","Have 120 or more health at once", 3, HealthAbove(120))
achievement("Private","Score more than 100,000 points", 3, ScoreAbove(100000, 100))
achievement("Corporal ","Score more than 250,000 points", 5, ScoreAbove(250000, 100))
achievement("Sergeant ","Score more than 500,000 points", 10, ScoreAbove(500000, 100))
achievement("Commander","Score more than 1,000,000 points", 25, ScoreAbove(1000000, 400000))

rich_presence_display("Armour Force is on the mission {0} | ♥ {1} | 💯 {2} ",
    rich_presence_lookup("Mission", Stage(), stages, "World Defense"),
    rich_presence_value("Health", Health()),
    rich_presence_value("Score", Score())    
)

leaderboard(
    "Highest Score", 
    "Highest score", 
    AnyStageStarted() && Score() == 0,
    always_false(),
    ContinueUsed() || GameOver() || CreditsRolling(),
    Score(),
    lower_is_better=false
)
