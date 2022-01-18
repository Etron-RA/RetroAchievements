// ~Unlicensed~ Super Tank War
// #ID = 2448

///////////////////////////////////////////////////////////////
// Varibles

// $00EE: [8-bit] Enemies Left (BCD)
function EnemiesX0() => high4(0x0000EE)
function Enemies0X() => low4(0x0000EE)
function Enemies() => EnemiesX0() * 10 + Enemies0X()

// $0111: [8-bit] Start value
function StartValue() => byte(0x000111)

// $0115: [8-bit] Current Lives
function Lives() => byte(0x000115)

// $0119: [8-bit] Starting Enemies
function StartingEnemies() => byte(0x000119)

// $0187: [8-bit] Timer
function Timer() => byte(0x000187)

// $01D6: [8-bit] Difficulty (0 = Normal, 1 = Hard, 2 = Normal)
function Difficulty() => byte(0x0001D6)

DifficultyLookup = 
{
    0: "Normal",
    1: "Hard",
    2: "Easy"
}

// $01D7: [8-bit] Starting Lives
function StartLives() => byte(0x0001D7)

// $01D7: [8-bit] Starting Music
function StartMusic() => byte(0x0001D8)

// $01D9: [8-bit] Starting Credits
function StartCredits() => byte(0x0001D9)

// $01DB: [8-bit] Starting Credits
function ShotButton() => byte(0x0001DB)

ShotLookup = 
{
    0: "A",
    1: "B",
    2: "C"
}

// $01D9: [8-bit] Starting Credits
function Credits() => byte(0x0001e6)

// $022A: [8-bit] Score 00 XX 00 00 (BCD)
function Score00X00000() => high4(0x00022A)
function Score000X0000() => low4(0x00022A)

// $022B: [8-bit] Score XX 00 00 00 (BCD)
function ScoreX0000000() => high4(0x00022B)
function Score0X000000() => low4(0x00022B)

// $022C: [8-bit] Score 00 00 00 XX (BCD)
function Score000000X0() => high4(0x00022C)
function Score0000000X() => low4(0x00022C)

// $022D: [8-bit] Score 00 00 XX 00 (BCD)
function Score0000X000() => high4(0x00022D)
function Score00000X00() => low4(0x00022D)

function Score() => 
    ScoreX0000000() * 10000000 +
    Score0X000000() * 1000000 +
    Score00X00000() * 100000 +
    Score000X0000() * 10000 +
    Score0000X000() * 1000 +
    Score00000X00() * 100 +
    Score000000X0() * 10 +
    Score0000000X()
    
    
// $0232: [8-bit] Score 00 XX 00 00 (BCD)
function HighScore00X00000() => high4(0x000232)
function HighScore000X0000() => low4(0x000232)

// $0233: [8-bit] Score XX 00 00 00 (BCD)
function HighScoreX0000000() => high4(0x000233)
function HighScore0X000000() => low4(0x000233)

// $0234: [8-bit] Score 00 00 00 XX (BCD)
function HighScore000000X0() => high4(0x000234)
function HighScore0000000X() => low4(0x000234)

// $0235: [8-bit] Score 00 00 XX 00 (BCD)
function HighScore0000X000() => high4(0x000235)
function HighScore00000X00() => low4(0x000235)

function HighScore() => 
    HighScoreX0000000() * 10000000 +
    HighScore0X000000() * 1000000 +
    HighScore00X00000() * 100000 +
    HighScore000X0000() * 10000 +
    HighScore0000X000() * 1000 +
    HighScore00000X00() * 100 +
    HighScore000000X0() * 10 +
    HighScore0000000X()

// $0239: [8-bit] Current Stage
function StageX0() => high4(0x000239)
function Stage0X() => low4(0x000239)

function Stage() => StageX0() * 10 + Stage0X()

// $0280: [8-bit] Starting Stage
function StartStageX0() => high4(0x000280)
function StartStage0X() => low4(0x000280)

function StartStage() => StartStageX0() * 10 + StartStage0X()

// $0285: [8-bit] Paused
function Paused() => byte(0x000285)

PauseLookup = 
{
    0: "▶",
    1: "⏸"
}


// $0292: [8-bit] In game
function InGame() => byte(0x000292)

///////////////////////////////////////////////////////////////
// Functions

// Check if the player has clear the stage 
function StageClear(stage)
{
    return once(Enemies() == StartingEnemies()) &&
        prev(Enemies()) == 1 &&
        Enemies() == 0 &&
        never(Stage() != stage) &&
        never(InGame() == 0)   
}

// Check if the player has clear the stage on hard w/o dying
function StageClearHard(stage)
{
    return once(
            Difficulty() == 1 &&
            Enemies() == StartingEnemies()
        ) &&
        trigger_when(
            prev(Enemies()) == 1 &&
            Enemies() == 0   
        ) &&
        never(prev(Lives()) > Lives()) &&
        never(Stage() != stage) &&
        never(InGame() == 0)      
}

// Check if the player has cleared the high score
function ScoreClear(low, high)
{
    return InGame() == 1 &&
        measured(
            prev(Score()) > low &&
            prev(Score()) < high &&
            Score() >= high
        )
}

///////////////////////////////////////////////////////////////
// Progess Achievements

achievement(
    title = "First Level", description = "Complete Level 1", points = 5,
    id = 43085, badge = "44253", published = "2016-12-11 10:52:51 PM", modified = "2022-01-17 10:04:16 PM",
    trigger = StageClear(1)
)

achievement(
    title = "Second Level", description = "Complete Level 2", points = 5,
    id = 43086, badge = "44253", published = "2016-12-11 10:52:56 PM", modified = "2022-01-17 10:04:16 PM",
    trigger = StageClear(2)
)

achievement(
    title = "Third Level", description = "Complete Level 3", points = 5,
    id = 43087, badge = "44253", published = "2016-12-11 10:52:58 PM", modified = "2022-01-17 10:04:16 PM",
    trigger = StageClear(3)
)

achievement(
    title = "Fourth Level", description = "Complete Level 4", points = 5,
    id = 43088, badge = "44253", published = "2016-12-11 10:53:03 PM", modified = "2022-01-17 10:04:17 PM",
    trigger = StageClear(4)
)

achievement(
    title = "Fifth Level", description = "Complete Level 5", points = 5,
    id = 43089, badge = "44253", published = "2016-12-11 10:53:06 PM", modified = "2022-01-17 10:04:17 PM",
    trigger = StageClear(5)
)

achievement(
    title = "Sixth Level", description = "Complete Level 6", points = 5,
    id = 43090, badge = "44253", published = "2016-12-11 10:53:09 PM", modified = "2022-01-17 10:04:17 PM",
    trigger = StageClear(6)
)

achievement(
    title = "Seventh Level", description = "Complete Level 7", points = 5,
    id = 43091, badge = "44253", published = "2016-12-11 10:53:15 PM", modified = "2022-01-17 10:04:18 PM",
    trigger = StageClear(7)
)

achievement(
    title = "Eighth Level", description = "Complete Level 8", points = 5,
    id = 43092, badge = "44253", published = "2016-12-11 10:53:19 PM", modified = "2022-01-17 10:04:18 PM",
    trigger = StageClear(8)
)

achievement(
    title = "Ninth Level", description = "Complete Level 9", points = 5,
    id = 43093, badge = "44253", published = "2016-12-11 10:53:27 PM", modified = "2022-01-17 10:04:18 PM",
    trigger = StageClear(9)
)

achievement(
    title = "Tenth Level", description = "Complete Level 10", points = 5,
    id = 43094, badge = "44253", published = "2016-12-11 10:53:40 PM", modified = "2022-01-17 10:04:19 PM",
    trigger = StageClear(10)
)

achievement(
    title = "Super Level", description = "Complete the final stage", points = 10,
    id = 43107, badge = "44284", published = "2016-12-12 11:04:50 PM", modified = "2022-01-17 10:04:23 PM",
    trigger = StageClear(20)
)


///////////////////////////////////////////////////////////////
// Hard Progess Achievements

achievement(
    title = "First Level [Hard]", description = "Complete Level 1 on Hard difficulty without losing lives", points = 10,
    id = 43097, badge = "44261", published = "2016-12-12 10:52:09 PM", modified = "2022-01-17 10:04:20 PM",
    trigger = StageClearHard(1)
)

achievement(
    title = "Second Level [Hard]", description = "Complete Level 2 on Hard difficulty without losing lives", points = 10,
    id = 43098, badge = "44261", published = "2016-12-12 10:52:13 PM", modified = "2022-01-17 10:04:20 PM",
    trigger = StageClearHard(2)
)

achievement(
    title = "Third Level [Hard]", description = "Complete Level 3 on Hard difficulty without losing lives", points = 10,
    id = 43099, badge = "44261", published = "2016-12-12 10:59:21 PM", modified = "2022-01-17 10:04:20 PM",
    trigger = StageClearHard(3)
)
achievement(
    title = "Fourth Level Hard", description = "Complete Level 4 on Hard difficulty without losing lives", points = 10,
    id = 43100, badge = "44261", published = "2016-12-12 10:59:24 PM", modified = "2022-01-17 10:04:21 PM",
    trigger = StageClearHard(4)
)

achievement(
    title = "Fifth Level [Hard]", description = "Complete Level 5 on Hard difficulty without losing lives", points = 10,
    id = 43101, badge = "44261", published = "2016-12-12 10:59:28 PM", modified = "2022-01-17 10:04:21 PM",
    trigger = StageClearHard(5)
)

achievement(
    title = "Sixth Level [Hard]", description = "Complete Level 6 on Hard difficulty without losing lives", points = 10,
    id = 43102, badge = "44261", published = "2016-12-12 10:59:50 PM", modified = "2022-01-17 10:04:21 PM",
    trigger = StageClearHard(6)
)

achievement(
    title = "Seventh Level [Hard]", description = "Complete Level 7 on Hard difficulty without losing lives", points = 10,
    id = 43103, badge = "44261", published = "2016-12-12 11:01:10 PM", modified = "2022-01-17 10:04:22 PM",
    trigger = StageClearHard(7)
)

achievement(
    title = "Eighth Level [Hard]", description = "Complete Level 8 on Hard difficulty without losing lives", points = 10,
    id = 43104, badge = "44261", published = "2016-12-12 11:01:12 PM", modified = "2022-01-17 10:04:22 PM",
    trigger = StageClearHard(8)
)

achievement(
    title = "Ninth Level [Hard]", description = "Complete Level 9 on Hard difficulty without losing lives", points = 10,
    id = 43105, badge = "44261", published = "2016-12-12 11:01:15 PM", modified = "2022-01-17 10:04:22 PM",
    trigger = StageClearHard(9)
)

achievement(
    title = "Master Level [Hard]", description = "Complete the final stage on Hard difficulty", points = 10,
    id = 43109, badge = "44284", published = "2016-12-12 11:08:21 PM", modified = "2022-01-17 10:04:23 PM",
    trigger = StageClear(20) && Difficulty() == 1 
)

///////////////////////////////////////////////////////////////
// Score  Achievements

achievement(
    title = "Scorer", description = "Obtain a score of at least 5,000", points = 5,
    id = 43095, badge = "44260", published = "2016-12-11 11:02:13 PM", modified = "2022-01-17 10:04:19 PM",
    trigger = ScoreClear(1000, 5000)
)


achievement(
    title = "Super Scorer ", description = "Obtain a score of at least 20,000", points = 10,
    id = 43096, badge = "44256", published = "2016-12-11 11:02:17 PM", modified = "2022-01-17 10:04:19 PM",
    trigger = ScoreClear(10000, 20000)
)

achievement(
    title = "Master Scorer", description = "Obtain a score of at least 50,000", points = 25,
    id = 43108, badge = "44256", published = "2016-12-12 11:04:59 PM", modified = "2022-01-17 10:04:23 PM",
    trigger = ScoreClear(40000, 50000)
)

///////////////////////////////////////////////////////////////
// Unofficial Achievements

achievement(
    title = "Time Control", description = "Get a time freezer control.", points = 10,
    id = 43110, badge = "44257", published = "2016-12-12 11:08:25 PM", modified = "2016-12-12 11:08:25 PM",
    trigger = always_false()
)

achievement(
    title = "Final Level Hard", description = "Clear final level on hard.", points = 20,
    id = 43106, badge = "44261", published = "2016-12-12 11:01:18 PM", modified = "2018-01-18 12:59:08 AM",
    trigger = byte(0x000239) == 10 && byte(0x0000EE) == 0 && byte(0x0001D6) == 1 && byte(0x000115) == byte(0x0001D7)
)

rich_presence_conditional_display(
    InGame() == 0 && Paused() == 1, 
    "[Options] {0} | 🚩 {1} | 🚜 {2} | 🔁 {3} | 🎶 {4} | 🚀 {5} Button",
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_value("Stage", StartStage()),
    rich_presence_value("Lives", StartLives()),
    rich_presence_value("Credits", StartCredits()),
    rich_presence_value("Music", StartMusic()),
    rich_presence_lookup("Shot", ShotButton(), ShotLookup)
)

rich_presence_conditional_display(
    InGame() == 1, 
    "[In Game] {0} | {1} | 🚩 {2} | 💯 {3}| 🚜 {4} | 🔁 {5}  | 💀 {6}",
    rich_presence_lookup("Pause", Paused(), PauseLookup),
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_value("Stage", Stage()),
    rich_presence_value("Score", Score()),
    rich_presence_value("Lives", Lives()),
    rich_presence_value("Credits", Credits()),
    rich_presence_value("Enemies", Enemies())    
)

rich_presence_conditional_display(
    InGame() == 0, 
    "[Main Menu] High Score {0}",
     rich_presence_value("Score", HighScore())
)

rich_presence_display("Loading...")

leaderboard(
    title = "High Score",
    description = "Get high score in one credit",
    start  = StartStage() == 1,
    cancel = Stage() == 0,
    submit = Lives() == 0,
    value = Score(),
    format = "SCORE"
)

