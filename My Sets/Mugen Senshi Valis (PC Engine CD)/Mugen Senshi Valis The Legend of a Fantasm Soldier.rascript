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
//        0x14 = Loading
function GameState() => byte(0x000280)
function StageTransistion() => GameState() == 0x1
function Playing() => GameState() == 0x8
function GameOver() => prev(GameState()) != 0xb && GameState() == 0xb

// $0300: Stage
//        0x00 - Stage 1-1
//        0x01 - Stage 1-2
//        0x02 - Stage 2-1
//        0x03 - Stage 2-2
//        0x04 - Stage 3
//        0x05 - Stage 4-1
//        0x06 - Stage 4-2
//        0x07 - Stage 5-1
//        0x08 - Stage 5-2
//        0x09 - Stage 6-1
//        0x0a - Stage 6-2
//        0x0b - Reiko
//        0x0c - Stage 7-2
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

// Stage split array
// name: [start stage, end stage5]
StageSplits = {
    "Act 1": [0x00, 0x01],
    "Act 2": [0x02, 0x03],
    "Act 3": [0x04, 0x04],
    "Act 4": [0x05, 0x06],
    "Act 5": [0x07, 0x08],
    "Act 6": [0x09, 0x0b],
    "Act 6-2": [0x0a, 0x0b],
    "Act 7": [0x0c, 0x0d]   
}

// $0300: Cutscreen
//        0x20 = Opening
//        0x21 = Act 1
//        0x22 = Act 2
//        0x23 = Act 3
//        0x24 = Act 4
//        0x25 = Act 5
//        0x26 = Act 6
//        0x27 = Defeated Reiko
//        0x28 = Act 7
//        0x29 = Final
//        0x2a = Title screen
//        0x2b = Debug menu
function Cutscene() => byte(0x000301)
function TitleScreen() => prev(Cutscene()) != 0x2a && Cutscene() == 0x2a

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
    0xd: "Dark World",
    0x2a: "Opening Movie"
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
function Damaged() => Playing() && prev(Health()) > Health() 

// $0306: MP
function Magic() => byte(0x000306)
function MagicUsed() => Playing() && prev(Magic()) > Magic() 

// $030B: [16-bit] Player Score
function Score() => word(0x00030B) * 10

// $0316: Auto-Scrolling Camera
//        
//        00 = follows Yuko
//        ff = automatically moves somewhere
function Autoscroll() => word(0x000316)

// $0317: Camera Position X
function CameraX() => byte(0x000317)

// $0318: Camera Position Y
function CameraY() => byte(0x000318)

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

// Event for starting on the first stage 
function StartGame() {
    return StartStage(0x0) && 
        Power() == 0x0 &&
        Weapon() == 0xff &&
        Lives() == 0x3
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

// Challenge to complete an Act
function CompleteAct(act)
{
    levelArray = StageSplits[act]
    begin = levelArray[0]
    end = levelArray[1]

    // Only enabled if the player started normally from Act 1-1
    enabled = once(StartGame())

    // Start at the begin of the act
    start = once(StartStage(begin))
    
    // Reset if at the title screen
    cancel = never(TitleScreen())
    
    // Trigger when the act has been completed
    submit = trigger_when(EndStage(end))
    
    return enabled && start && cancel && submit
}

// Challenge to complete an Act deathless
function CompleteActDeathless(act)
{
    levelArray = StageSplits[act]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the act
    start = once(StartStage(begin))
    
    // Reset if at the title screen, game over screen, or on death
    cancel = never(TitleScreen()) &&
        never(Death()) &&
        never(GameOver())
    
    // Trigger when the act has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

// Challenge to complete an Act without using magic
function CompleteActNoMagic(act)
{
    levelArray = StageSplits[act]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the act
    start = once(StartStage(begin))
    
    // Reset if at the title screen or if magic used
    cancel = never(TitleScreen()) &&
        never(MagicUsed())
    
    // Trigger when the act has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

// Challenge to complete an Act without upgrading the sword
function CompleteActSwordOnly(act)
{
    levelArray = StageSplits[act]
    begin = levelArray[0]
    end = levelArray[1]

    // Start at the begin of the act
    start = once(StartStage(begin))
    
    // Reset if at the title screen or if the sword is higher than level-0
    cancel = never(TitleScreen()) &&
        never(Power() > 0)
    
    // Trigger when the act has been completed
    submit = trigger_when(EndStage(end))
    
    return start && cancel && submit
}

// Challenge to complete a stage under a time limit
function SpeedrunAct(stage, time)
{
    // Start at the begin of the stage
    start = once(StartStage(stage))
    
    // Reset if at the title screen or if the timer has expired
    cancel = never(TitleScreen()) &&
        never(Time() > time)
    
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
    return Playing() &&
        Power() > 0 &&
        prev(Weapon()) != weapon &&
        Weapon() == weapon
}

// Challenge to max out any weapon
function MaxWeapon()
{
    return Playing() &&
        prev(Power()) < 3 &&
        measured(Power() == 3)
}

// Challenge to reach a certain high score
function HighScore(score, buffer)
{
    return Playing() &&
        prev(Score()) >= score - buffer &&
        prev(Score()) < score &&
        measured(Score() >= score)
}

// Challenge to collect 1up in a stage
function Collect1Up(stage, minX, maxX)
{
    // Enable if on the stage with a 1up
    enable = Playing() &&
        Stage() == stage
        
    // Trigger if within camera range when the lives go up
    submit = trigger_when(
            CameraX() >= minX &&
            CameraX() <= maxX &&
            prev(Lives()) < Lives()
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
achievement("City","Complete Act 1.", 5, CompleteAct("Act 1"))
achievement("Ice Caves","Complete Act 2.", 5, CompleteAct("Act 2"))
achievement("Mountines","Complete Act 3.", 5, CompleteAct("Act 3"))
achievement("Volcano","Complete Act 4.", 5, CompleteAct("Act 4"))
achievement("Aquaducts","Complete Act 5.", 5, CompleteAct("Act 5"))
achievement("Forest","Complete Act 6.", 5,  CompleteAct("Act 6"))
achievement("Dark World","Complete Act 7.", 10, CompleteAct("Act 7"))

// Deathless Challenges
achievement("Gaida the Lord of Earth","Complete Act 1 without dying.", 10, CompleteActDeathless("Act 1"))
achievement("Geeva the Lord of Water","Complete Act 2 without dying.", 10, CompleteActDeathless("Act 2"))
achievement("Venon the Lord of Fire","Complete Act 3 without dying.", 10, CompleteActDeathless("Act 3"))
achievement("Izard the Lord of Winds","Complete Act 4 without dying.", 10, CompleteActDeathless("Act 4"))
achievement("Voltez the Lord of Thunder","Complete Act 5 without dying.", 10, CompleteActDeathless("Act 5"))
achievement("Reiko Kirishima","Complete Act 6 without dying.", 10, CompleteActDeathless("Act 6"))
achievement("Rogles King of the Dark Lords","Complete Act 7 without dying.", 25, CompleteActDeathless("Act 7"))

// No Magic Challenges
achievement("Arcane Aversion","Complete Act 2 without using magic.", 5, CompleteActNoMagic("Act 2"))
achievement("Sorcery Suppressed","Complete Act 3 without using magic.", 5,CompleteActNoMagic("Act 3"))
achievement("Enchantment Evasion","Complete Act 4 without using magic.", 5,CompleteActNoMagic("Act 4"))
achievement("Wizardry Ward","Complete Act 5 without using magic.", 5,  CompleteActNoMagic("Act 5"))
achievement("Mystic-Free Mayhem","Complete Act 6 without using magic.", 5, CompleteActNoMagic("Act 6"))
achievement("Natural Charm","Complete Act 7 without using magic.", 10, CompleteActNoMagic("Act 7"))

// Low Level Blade Challenges
achievement("Basic Blade","Complete Act 1 with a level 0 sword.", 10,  CompleteActSwordOnly("Act 1"))
achievement("Novice's Valor","Complete Act 2 with a level 0 sword.", 10,  CompleteActSwordOnly("Act 2"))
achievement("Apprentice Blade Ace","Complete Act 3 with a level 0 sword.", 10,  CompleteActSwordOnly("Act 3"))
achievement("Blade's Triumph","Complete Act 4 with a level 0 sword.", 10,  CompleteActSwordOnly("Act 4"))
achievement("Valiant Vanguard","Complete Act 5 with a level 0 sword.", 10,  CompleteActSwordOnly("Act 5"))
achievement("Swordmaster's Legacy","Complete Stage 6-2 and beat Reiko with a level 0 sword.", 10,  CompleteActSwordOnly("Act 6-2"))
achievement("Blade Bearing Champion","Complete Act 7 with a level 0 sword.", 25,  CompleteActSwordOnly("Act 7"))

// Speedrun Challenges
achievement("Late for Class","Complete Act 1-1 with 275 or more left on the clock", 5, SpeedrunAct(0, 275))

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
achievement("Honored Harold","Score 10,000 or higher.", 1, HighScore(10000, 9000))
achievement("Blade Brilliance","Score 50,000 or higher.", 3, HighScore(50000, 10000))
achievement("Glorious Guardian","Score 100,000 or higher.", 4, HighScore(100000, 10000))
achievement("Masterful Mademoiselle","Score 250,000 or higher.", 5, HighScore(250000, 10000))
achievement("Swordmaster Supreme","Score 500,000 or higher.", 10, HighScore(500000, 10000))

// 1up Collections
achievement("Extra Credit","Acquire the life on stage 1-1.", 1, Collect1Up(0x0, 0x8c, 0x90))
achievement("Above and Beyond","Acquire the life on stage 1-2.", 1, Collect1Up(0x1, 0x60, 0x75))
achievement("Arctic Spelunking","Acquire the life on stage 2-1.", 1, Collect1Up(0x2, 0xf, 0x17))
achievement("Crystal Caverns","Acquire the life on stage 2-2.", 1, Collect1Up(0x3, 0x50, 0x65))
achievement("Boldly Bouldering","Acquire the life on stage 3-1.", 1, Collect1Up(0x4, 0x50, 0x65))
achievement("Inferno Expedition","Acquire the life on stage 4-1.", 1, Collect1Up(0x5, 0x4d, 0x5f))
achievement("Falling with Grace","Acquire the life on stage 6-1.", 1, Collect1Up(0x9, 0x10, 0x11))

// Debug Memory
achievement("Extreme Game of Memory","Enter the debug menu. Warning! Progress achievements and leaderboards require starting on Act 1-1 with default lives and upgrades.", 0, DebugMenu())

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

// Speedrun for each act
for split in StageSplits
{
    name = split    
    if (name != "Act 6-2")
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

rich_presence_conditional_display(Playing(),
    "Yuko is in the {0} {1} • Health {2}/8 • Magic {3}/8 • Time Left {4} • Score {5}",
    rich_presence_lookup("StageNames", Stage(), StageNames),    
    rich_presence_lookup("StageNumbers", Stage(), StageNumbers),    
    rich_presence_value("Health", Health()), 
    rich_presence_value("Magic", Magic()), 
    rich_presence_value("Time", Time()),
    rich_presence_value("Score", Score())
)

rich_presence_display("Yuko is getting ready for school")
 