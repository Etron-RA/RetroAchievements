// Mugen Senshi Valis: The Legend of a Fantasm Soldier
// #ID = 14480

// $001A: [16-Bit] Timer 
function Time() => word(0x00001A)

// $009f: [8-bit] Input for debug menu (appears when 0x28 => 0x29)
function InputCode() => byte(0x009f)

// $0280: [8-bit] Game State
//        0x01 = Main Menu/stage transisition
//        0x08 = Playing/watching cutscene
//        0x0b = Game Over
//        0x0c = Back to Main Menu
//        0x14 = Loading
function GameState() => byte(0x000280)
function StageTransistion() => GameState() == 0x1 || GameState() == 0x8
function Playing() => GameState() == 0x8
function GameOver() => prev(GameState()) != 0xb && GameState() == 0xb
function TitleScreen() => prev(GameState()) != 0xc && GameState() == 0xc

// $0300: [8-bit] Stage
//        0x00 = Stage 1-1
//        0x01 = Stage 1-2
//        0x02 = Stage 2-1
//        0x03 = Stage 2-2
//        0x04 = Stage 3
//        0x05 = Stage 4-1
//        0x06 = Stage 4-2
//        0x07 = Stage 5-1
//        0x08 = Stage 5-2
//        0x09 = Stage 6-1
//        0x0a = Stage 6-2
//        0x0b = Reiko
//        0x0c = Stage 7-2
function Stage() => byte(0x000300)

StageNumbers = {
    0x0: "1-1",
    0x1: "1-2",
    0x2: "2-1",
    0x3: "2-2",
    0x4: "3-1",
    0x5: "4-1",
    0x6: "4-2",
    0x7: "5-1",
    0x8: "5-2",
    0x9: "6-1",
    0xa: "6-2",
    0xb: "6-3",
    0xc: "7-1",
    0xd: "7-2",
}

StageNames = {
    0x0: "City",
    0x1: "Subway",
    0x2: "Ice Caves",
    0x3: "Tundra",
    0x4: "Mountines",
    0x5: "Volcano",
    0x6: "Volcano",
    0x7: "Aquaducts",
    0x8: "Aquaducts",
    0x9: "Forest",
    0xa: "Forest",
    0xb: "Forest",
    0xc: "Dark World",
    0xd: "Dark World"
}

// Stage split array
// name: [start stage, end stage5]
StageSplits = {
    "World 1": [0x00, 0x01],
    "World 2": [0x02, 0x03],
    "World 3": [0x04, 0x04],
    "World 4": [0x05, 0x06],
    "World 5": [0x07, 0x08],
    "World 6": [0x09, 0x0b],
    "World 6-2": [0x0a, 0x0b],
    "World 7": [0x0c, 0x0d]   
}

// $0301: [8-bit] Cutscreen
//        0x20 = Opening
//        0x21 = Act 1
//        0x22 = Act 2
//        0x23 = Act 3
//        0x24 = Act 4
//        0x25 = Act 5
//        0x26 = Act 6
//        0x27 = Act 7
//        0x28 = Act 8
//        0x29 = Final
//        0x2b = Title screen
function Cutscene() => byte(0x000301)

MovieNames = {
    0x20 : "opening",
    0x21 : "Act 1",
    0x22 : "Act 2",
    0x23 : "Act 3",
    0x24 : "Act 4",
    0x25 : "Act 5",
    0x26 : "Act 6",
    0x27 : "Act 7",
    0x28 : "Act 8",
    0x29 : "final"
}

// $0303: Lives
function Lives() => byte(0x000302)
function Death() => prev(Lives()) > Lives()

// $0303: Power Up
function Power() => byte(0x000303)

// $0304: Weapon Type (only matters if Power-Up > 00, otherwise Yuko will simply slash the sword without any shot):
//        
//        00 = Bullet
//        01 = Saber
//        02 = Cutter
//        03 = Hunter
//        04 = Arc Shot
function Weapon() => byte(0x000304)

// $0305: Energy - HP
function Health() => byte(0x000305)
function Damaged() => prev(Health()) > Health() 

// $0306: MP
function Magic() => byte(0x000306)
function MagicUsed() => prev(Health()) > 0 && prev(Magic()) > Magic() 

// $030B: [16-bit] Player Score
function Score() => tbyte(0x00030B) * 10

// $030e: [8-bit] Air Shield HP
function AirShield() => byte(0x00030e)

// $030e: [8-bit] Fire Shield HP
function FireShield() => byte(0x00030f)

// $0316: [8-bit] Stage State (0x7 = Rogles Phase 1, 0x8 = Rogels Phase 2)
function StageState() => byte(0x000315)

// $0316: Auto-Scrolling Camera
//        
//        00 = follows Yuko
//        ff = automatically moves somewhere
function Autoscroll() => byte(0x000316)

// $0317: Camera Position X
function CameraX() => byte(0x000317)

// $0318: Camera Position Y
function CameraY() => byte(0x000318)

// &1600: [bit 0] Grammra bit (0 = none, 1 = shown)
function Gammera() => bit0(0x001600)

// -- Helper Functions ---------------------------------------------

// Event for starting any stage
function AnyStart()
{
    return Playing() &&
        prev(Time()) != 300 &&
        Time() == 300 
}

// Event for starting a certain stage
function StartStage(stage)
{
    // The stage start when the timer goes to 300
    return Stage() == stage &&
        AnyStart()               
}

// The general boss arena location
function BossStart(stage, x, y)
{
    return Playing() &&
        Stage() == stage &&
        CameraX() == x &&
        CameraY() == y 
}

// Event when the first phase of a boss start event (event occurs again for phase two)
function PhaseOne(stage, x, y)
{
    return BossStart(stage, x, y) &&
        prev(StageState()) != 7 &&
        StageState() == 7
}

// Event when the second phase of a boss start event (only for final boss)
function PhaseTwo(stage, x, y)
{
    return BossStart(stage, x, y) &&
        prev(StageState()) != 8 &&
        StageState() == 8
}

// Event for starting on the first stage 
function StartGame() {
    return StartStage(0x0) && 
        Power() == 0x0 &&
        Lives() == 0x3 &&
        Weapon() == 0
} 

// Event for the end of a stage
function EndStage(stage)
{
    // If last level look for the transisition to the final cutscene
    if (stage == 0xd)
        return StageTransistion() &&
            prev(Stage()) == stage &&
            Stage() == 0x0 && 
            Cutscene() == 0x29      
            
    // Else look for the transition to the next stage
    return StageTransistion() &&
        prev(Stage()) == stage &&
        Stage() == stage + 1
}

// Event for the end of the game
function EndGame() => EndStage(0xd)

// Challenge to complete an Stage
function CompleteStage(Stage)
{
    levelArray = StageSplits[Stage]
    begin = levelArray[0]
    end = levelArray[1]

    // Only enabled if the player started normally from Stage 1-1
    enabled = once(StartGame())

    // Start at the begin of the Stage
    start = once(StartStage(begin))
    
    // Reset if at the title screen
    cancel = never(TitleScreen())
    
    // Trigger when the Stage has been completed
    submit = trigger_when(EndStage(end))
    
    return enabled && start && cancel && submit
}

// Challenge to complete an Stage deathless
function CompleteStageDeathless(Stage)
{
    levelArray = StageSplits[Stage]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the Stage
    start = once(StartStage(begin))
    
    // Reset if at the title screen, game over screen, or on death
    cancel = never(TitleScreen()) &&
        never(Death()) &&
        never(GameOver())
    
    // Trigger when the Stage has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

function DamagelessBoss(boss)
{
    bossInfo = Bosses[boss]
    start = bossInfo[0]
    end = bossInfo[1]
    
    // Start when no shield and boss appears
    start = once(
            AirShield() == 0 && 
            FireShield() == 0 && 
            start
        )
    
    // Cancel on hit, death, game over, or if magic used
    cancel = never(Damaged()) &&
        never(Death()) &&
        never(GameOver()) &&
        never(MagicUsed()) 
        
    // Submit when boss is defeated  
    submit = trigger_when(end)
    
    return start && cancel && submit
}

// Challenge to complete an Stage without using magic
function CompleteStageNoMagic(Stage)
{
    levelArray = StageSplits[Stage]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the Stage
    start = once(StartStage(begin))
    
    // Reset if at the title screen or if magic used
    cancel = never(TitleScreen()) &&
        never(MagicUsed())
    
    // Trigger when the Stage has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

// Challenge to complete an Stage without upgrading the sword
function CompleteStageSwordOnly(Stage)
{
    levelArray = StageSplits[Stage]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the Stage
    start = once(StartStage(begin))
    
    // Reset if at the title screen or if the sword is higher than level-0
    cancel = never(TitleScreen()) &&
        never(Power() > 0)
    
    // Trigger when the Stage has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

// Challenge to complete a stage under a time limit
function SpeedrunStage(stage, time)
{
    // Start at the begin of the stage
    start = once(StartStage(stage))
    
    // Reset if at the title screen or if the timer has expired
    cancel = never(TitleScreen()) &&
        never(Time() < time)
    
    // Trigger when the stage has been completed
    submit = trigger_when(EndStage(stage))
    
    return start && cancel && submit
}

// Challenge to complete the game without using a continue
function NoContinues()
{
    // Start at the begining of the game
    start = once(StartGame())
    
    // Reset if at the title screen or the game over screen
    cancel = never(TitleScreen()) &&
        never(GameOver()) 
        
    // Trigger when the game has been completed
    submit = trigger_when(EndGame())
    
    return start && cancel && submit
}

// Challenge to obtain a weapon
function ObtainWeapon(weapon)
{
    swappedWeapon = Power() > 0 &&        
        prev(Weapon()) != weapon &&
        Weapon() == weapon
    
    upgradeWeapon = Weapon() == weapon &&
        prev(Power()) < Power()

    return Playing() && (swappedWeapon || upgradeWeapon)
        
}

// Challenge to max out any weapon
function MaxWeapon()
{
    return Playing() &&
        prev(Power()) < 3 &&
        measured(Power() == 3)
}

// Challenge to reach a certain high score
function HighScore(score)
{
    return Playing() &&
        prev(Score()) < score &&
        measured(Score() >= score)
}

// Challenge to collect 1up in a stage
function Collect1Up(stage, minX, maxX)
{
    // Enable if on the stage with a 1up
    enable = Playing() &&
        Stage() == stage &&
        Cutscene() < 0x20
        
    // Trigger if within camera range when the lives go up
    submit = trigger_when(
            CameraX() >= minX &&
            CameraX() <= maxX &&
            prev(Lives()) + 1 == Lives()
        )
    
    return enable && submit
}

function FoundGammera()
{
    enable = Playing() &&
        Stage() == 0x7 &&
        Cutscene() < 0x20

    submit = trigger_when(
        CameraX() >= 0x42 &&
        CameraX() <= 0x48 &&
        CameraY() <= 0x10 &&
        prev(Gammera()) > Gammera()
    )        
    
    return enable && submit
}

// Detect opening the debug menu
function DebugMenu()
{ 
    return StageTransistion() &&
        prev(InputCode()) == 0x28 &&
        InputCode() == 0x29
}

// -- Achievements --------------------------------------------------

// Progression Achievements
achievement("City","Complete World 1.", 5, CompleteStage("World 1"))
achievement("Ice Caves","Complete World 2.", 5, CompleteStage("World 2"))
achievement("Mountines","Complete World 3.", 5, CompleteStage("World 3"))
achievement("Volcano","Complete World 4.", 5, CompleteStage("World 4"))
achievement("Aquaducts","Complete World 5.", 5, CompleteStage("World 5"))
achievement("Forest","Complete World 6.", 5,  CompleteStage("World 6"))
achievement("Dark World","Complete World 7.", 10, CompleteStage("World 7"))

// Deathless Challenges
achievement("City Survivor","Complete World 1 without dying.", 10, CompleteStageDeathless("World 1"))
achievement("Ice Caves Survivor","Complete World 2 without dying.", 10, CompleteStageDeathless("World 2"))
achievement("Volcano Survivor","Complete World 4 without dying.", 10, CompleteStageDeathless("World 4"))
achievement("Aquaducts Survivor","Complete World 5 without dying.", 10, CompleteStageDeathless("World 5"))
achievement("Forest Survivor","Complete World 6 without dying.", 10, CompleteStageDeathless("World 6"))
achievement("Dark World Survivor","Complete World 7 without dying.", 25, CompleteStageDeathless("World 7"))

// "Boss Name"": [start event, end event]
Bosses =
{
    "Gaida": [PhaseOne(0x1, 0x8f, 0x1d), EndStage(0x1)],
    "Frosthound": [PhaseOne(0x2, 0x5f, 0x12), EndStage(0x2)],
    "Geeva": [PhaseOne(0x3, 0x7f, 0x47), EndStage(0x3)],
    "Izard": [PhaseOne(0x4, 0x6f, 0x6d), EndStage(0x4)],
    "Colossus": [PhaseOne(0x5, 0x5f, 0x2c), EndStage(0x5)],
    "Venon": [PhaseOne(0x6, 0x5f, 0x0d), EndStage(0x6)],
    "Voltez": [PhaseOne(0x8, 0x0f, 0x2d), EndStage(0x8)],
    "Knight": [PhaseOne(0xa, 0xef, 0x15), EndStage(0xa)],
    "Reiko": [StartStage(0xb), EndStage(0xb)],
    "Rogles1": [StartStage(0xd), PhaseTwo(0xd, 0x0f, 0x0d)],
    "Rogles2": [PhaseTwo(0xd, 0x0f, 0x0d), EndStage(0xd)],
}

// Damageless
achievement("Gaida the Lord of Earth","Defeat Gaida in Stage 1-2 without taking damage.", 10, DamagelessBoss("Gaida"))
achievement("Frosthound Warden","Defeat the Frosthound Warden in Stage 2-1 without taking damage or using magic during the battle.", 10, DamagelessBoss("Frosthound"))
achievement("Geeva the Lord of Water","Defeat Geeva in Stage 2-2 without taking damage or using magic during the battle.", 10, DamagelessBoss("Geeva"))
achievement("Izard the Lord of Winds","Defeat Izard in Stage 3-1 without taking damage or using magic during the battle.", 10, DamagelessBoss("Izard"))
achievement("Emberforged Warden","Defeat the Emberforged Warden in Stage 4-1 without taking damage, having an active shield, or using magic during the battle.", 10, DamagelessBoss("Colossus"))
achievement("Venon the Lord of Fire","Defeat Venon in Stage 4-2 without taking damage, having an active shield, or using magic during the battle.", 10, DamagelessBoss("Venon"))
achievement("Voltez the Lord of Thunder","Defeat Voltez in Stage 5-2 without taking damage, having an active shield, or using magic during the battle.", 10, DamagelessBoss("Voltez"))
achievement("Sylvan Warden","Defeat the Sylvan Warden in Stage 6-2 without taking damage, having an active shield, or using magic during the battle.", 10, DamagelessBoss("Knight"))
achievement("Reiko Kirishima","Defeat Reiko in Stage 6-3 without taking damage, having an active shield, or using magic during the battle.", 10, DamagelessBoss("Reiko"))
achievement("Darklord Rogles the Eternal","Defeat Rogles 1st phase in Stage 7-2 without taking damage, having an active shield, or using magic during the battle.", 25, DamagelessBoss("Rogles1"))
achievement("Rogles King of the Dark Lords","Defeat Rogles 2nd phase in Stage 7-2 without taking damage, having an active shield, or using magic during the battle.", 25, DamagelessBoss("Rogles2"))

// No Magic Challenges
achievement("Arcane Aversion","Complete World 2 without using magic.", 5, CompleteStageNoMagic("World 2"))
achievement("Sorcery Suppressed","Complete World 3 without using magic.", 5,CompleteStageNoMagic("World 3"))
achievement("Enchantment Evasion","Complete World 4 without using magic.", 5,CompleteStageNoMagic("World 4"))
achievement("Wizardry Ward","Complete World 5 without using magic.", 5,  CompleteStageNoMagic("World 5"))
achievement("Mystic-Free Mayhem","Complete World 6 without using magic.", 5, CompleteStageNoMagic("World 6"))
achievement("Natural Charm","Complete World 7 without using magic.", 10, CompleteStageNoMagic("World 7"))

// Low Level Blade Challenges
achievement("Basic Blade","Complete World 1 with a level 0 sword.", 10,  CompleteStageSwordOnly("World 1"))
achievement("Novice's Valor","Complete World 2 with a level 0 sword.", 10,  CompleteStageSwordOnly("World 2"))
achievement("Apprentice Blade Ace","Complete World 3 with a level 0 sword.", 10,  CompleteStageSwordOnly("World 3"))
achievement("Blade's Triumph","Complete World 4 with a level 0 sword.", 10,  CompleteStageSwordOnly("World 4"))
achievement("Valiant Vanguard","Complete World 5 with a level 0 sword.", 10,  CompleteStageSwordOnly("World 5"))
achievement("Swordmaster's Legacy","Complete Stage 6-2 and beat Reiko with a level 0 sword.", 10,  CompleteStageSwordOnly("World 6-2"))
achievement("Blade Bearing Champion","Complete World 7 with a level 0 sword.", 25,  CompleteStageSwordOnly("World 7"))

// Speedrun Challenges
achievement("Late for Class","Complete Stage 1-1 with 275 or more left on the clock", 5, SpeedrunStage(0, 275))

// 1CC Challenge
achievement("Legend of a Fantasm Soldier","Complete the game without using a continue.", 50, NoContinues())

// Obtain Weapons
achievement("Bullet Barrage","Obtain the bullet power up.", 1, ObtainWeapon(0))
achievement("Saber Savant","Obtain the saber power up.", 1, ObtainWeapon(1))
achievement("Cutter Crusader","Obtain the cutter power up.", 1, ObtainWeapon(2))
achievement("Hunter Hero","Obtain the hunter power up.", 1, ObtainWeapon(3))
achievement("Arc Shot Ace","Obtain the arc power up.", 1, ObtainWeapon(4))

// Max Out A Weapon
achievement("Valis Valor","Max out your sword level with any weapon.", 5, MaxWeapon())

//  Score Achievements
achievement("Honored Harold","Score 10,000 or higher.", 1, HighScore(10000))
achievement("Glorious Guardian","Score 50,000 or higher.", 2, HighScore(50000))
achievement("Blade Brilliance","Score 100,000 or higher.", 3, HighScore(100000))
achievement("Masterful Mademoiselle","Score 250,000 or higher.", 5, HighScore(250000))
achievement("Swordmaster Supreme","Score 500,000 or higher.", 10, HighScore(500000))

// 1up Collections
achievement("Extra Credit","Acquire the life on Stage 1-1.", 1, Collect1Up(0x0, 0x8c, 0x90))
achievement("Above and Beyond","Acquire the life on Stage 1-2.", 1, Collect1Up(0x1, 0x60, 0x75))
achievement("Arctic Spelunking","Acquire the life on Stage 2-1.", 1, Collect1Up(0x2, 0xf, 0x17))
achievement("Glacial Heights","Acquire the life on Stage 2-2.", 1, Collect1Up(0x3, 0x50, 0x65))
achievement("Boldly Bouldering","Acquire the life on Stage 3-1.", 1, Collect1Up(0x4, 0x50, 0x65))
achievement("Inferno Expedition","Acquire the life on Stage 4-1.", 1, Collect1Up(0x5, 0x4d, 0x5f))
achievement("Falling with Grace","Acquire the life on Stage 6-1.", 1, Collect1Up(0x9, 0x10, 0x11))
achievement("Dark World Treasure","Acquire the life on Stage 7-1.", 1, Collect1Up(0xc, 0x58, 0x64))

// Find Gammera
achievement("Gammera the Protector of Children","Find and touch Gammera the on Stage 5-1", 1, FoundGammera())

// Debug Memory
achievement("Extreme Game of Memory","Enter the debug menu. Warning! Progression achievements and leaderboards require starting on Stage 1-1 with default lives and upgrades.", 0, DebugMenu())

// -- Leaderboards --------------------------------------------------

// Full game speedrun
leaderboard(
    "Speedrun",
    "Fastest time to beat the game",
    StartGame(),
    TitleScreen(),
    EndGame(),
    always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// No magic speedrun
leaderboard(
    "Speedrun No Magic",
    "Fastest time to beat the game without using magic",
    StartGame(),
    TitleScreen() || MagicUsed(),
    EndGame(),
    always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// Deathless speedrun
leaderboard(
    "Speedrun Deathless",
    "Fastest time to beat the game without dying",
    StartGame(),
    TitleScreen() || Death(),
    EndGame(),
    always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// Speedrun for each Stage
for split in StageSplits
{
    name = split    
    if (name != "World 6-2")
    {
        levelArray = StageSplits[name]
        start = levelArray[0]
        end = levelArray[1]
    
        leaderboard(
            "Speedrun " + name,
            "Fastest time to beat " + name,
            StartStage(start),
            TitleScreen(),
            EndStage(end),
            always_true(),
            format = "FRAMES",
            lower_is_better = true
        )
    }
}

// Hi score leaderboard
leaderboard(
    "Hi Score",
    "Highest score in one continue",
    StartGame(),
    TitleScreen(),
    EndGame() || GameOver(),
    Score(),
    format = "VALUE",
    lower_is_better = false
)

// -- Rich Presence -------------------------------------------------------------------

rich_presence_conditional_display(Cutscene() >= 0x20 && Cutscene() <= 0x29,
    "Yuko is watching the {0} movie", 
    rich_presence_lookup("MovieNames", Cutscene(), MovieNames)
)

rich_presence_conditional_display(Playing(),
    "Yuko is in the {0} {1} • Lives {2} • Health {3}/8 • Magic {4}/8 • Time Left {5} • Score {6}",
    rich_presence_lookup("StageNames", Stage(), StageNames),    
    rich_presence_lookup("StageNumbers", Stage(), StageNumbers),  
    rich_presence_value("Lives", Lives()),   
    rich_presence_value("Health", Health()), 
    rich_presence_value("Magic", Magic()), 
    rich_presence_value("Time", Time()),
    rich_presence_value("Score", Score())
)

rich_presence_display("Yuko is getting ready for school")
 