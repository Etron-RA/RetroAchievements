// Gargoyles
// #ID = 2364

// $0001: [8-bit] Difficulty: (00 = Easy, 01 = Normal, 02 = Hard)
function Difficulty() => byte(0x000001)

// $000B: [8-bit] Demo (0x0 = None, 0xFF = Demo)
function Demo() => byte(0x00000B)

// $006F: [8-bit] Pause: (00 = playing, FF = paused)
function GamePaused() => byte(0x00006F)

// $0072: [8-bit] Cutscene (0x0 = off, 0xff = on)
function Cutscene() => byte(0x000072)

// $0073: [8-bit] Game Active (0x0 = no, 0xff = yes)
function GameActive() => byte(0x000073)

// $0074: [8-bit] Level Progression
function Progression() => byte(0x000074)

// $007C: [16-bit] Health (0x100=Full, 0x0=Dead)
function GoliathHealth() => word(0x00007C)

// $00B0: [8-bit] Screen ID (0x48 => 0x3c for Game Start, 0x43 => 0x47 Game Over)
function ScreenID() => byte(0x0000B0)

// $00BA: [8-bit] Level
function Level() => byte(0x0000BA)

// $00DA: [8-bit] Lives (0 to 10 max)
function Lives() => byte(0x0000DA)

// $00DD: [8-bit] Continues
function Continues() => byte(0x0000DD)

// $0106: [16-bit] Goliath X-Axis
function GoliathX() => word(0x000106)

// $0108: [16-bit] Goliath Y-Axis
function GoliathY() => word(0x000108)

// $0B1C: [8-bit] Level 1-1, 2-1, 3-1, 4-1 Extra Continue (0x0 = shown, 0xff = collected)
function CollectContinue() => byte(0x000B1C)

// $0B20: [8-bit] Level 1-1, 2-1(a), 4-1(a), 5-2, & 5-3 Extra Life (0x0 = shown, 0xff = collected)
function CollectLife1() => byte(0x000B20)

// $0B23: [8-bit] Level 1-3, 2-1(b) Extra Life (0x0 = shown, 0xff = collected)
function CollectLife2() => byte(0x000B23)

// $0B25: [8-bit] Leve 4-1(b) Extra Life (0x0 = shown, 0xff = collected)
function CollectLife3() => byte(0x000B25)

// $0B38: [16-bit] Boss HP
function BossHealth() => word(0x000B38)

// $0B4E: [8-bit] 4-1 Boss Zone (0x0 = no, 0xff = yes)
function BossZone() => byte(0x000B4E)

// $1696: [16-bit] Hammer Timer (starts at 0x1fe and countsdown to 0)
function HammerTimer() => word(0x001696)

// $16D2: [16-bit] Invincibility Timer (Starts at 0x1fe and countdowns down to 0)
function InvincibilityTimer() => word(0x0016D2)

// $EEF0: [8-bit] Cheat Byte 1 (Combined with 0xeef2)
//        Cheat: Delta 1,Delta 2 -> Cheat 1,Cheat 2
//        Restore Health: 0x4,0x8 -> 0x8,0x9
//        Invulnerability: 0x4,0xA -> 0xC,0xB
//        Skip Level: 0x0,0xA -> 0x4,0xB
//        Fire Ball: 0x0,0x9 -> 0x4,0xA
function Cheat1() => byte(0x00EEF0)

// $EEF2: [8-bit] Cheat Byte 2 (Combined with 0xeef0)
function Cheat2() => byte(0x00EEF2)

//-----------------------------------------------------------------
// Lookups

DifficultyLookup = {
    0:"easy",
    1:"normal",
    2:"hard"
}

level1 = "Evil Awakens"
level2 = "Siege of the Rookery"
level3 = "Stone and Steel"
level4 = "Subterranean Terror"
level5 = "The Forge"

// Translates the level value to the area name
AreaLookup = {
    0x0: level1, 0x1: level1, 0x2: level1, 0x3: level1,
    0x4: level2, 0x5: level2, 0x6: level2, 0x7: level2,
    0x8: level3, 0x9: level3, 0xA: level3, 0xB: level3,
    0x10: level4, 
    0x15: level5, 0x16: level5, 0x17: level5, 0x18: level5, 0x19: level5, 0x1B: level5
}

// Translates the level value to the level name (non-sequential)
LevelLookup = {
    0x0: "1-1", 0x1: "1-2", 0x2: "1-3", 0x3: "1-4",
    0x4: "2-1", 0x5: "2-2", 0x6: "2-3", 0x7: "2-4",
    0x8: "3-1", 0x9: "3-2", 0xA: "3-3", 0xB: "3-4",
    0x10: "4-1", 
    0x15: "5-1", 0x16: "5-2", 0x17: "5-3", 0x18: "5-4", 0x19: "5-5", 0x1B: "5-6"
}

// Transistions format [before level, in level, end level]
LevelTransistions = {
    "1-1":[0x0,0x0,0x2], "1-2":[0x6,0xa,0xc], "1-3":[0x10,0x14,0x16], "1-4":[0x1a,0x1e,0x20],
    "2-1":[0x28,0x2c,0x2e], "2-2":[0x32,0x36,0x38], "2-3":[0x3c,0x40,0x42], "2-4":[0x46,0x4a,0x4c],
    "3-1":[0x58,0x5c,0x5e], "3-2":[0x62,0x66,0x68], "3-3":[0x6c,0x70,0x72], "3-4":[0x76,0x7a,0x7c],
    "4-1":[0x84,0x88,0x8a], 
    "5-1":[0x92,0x96,0x98], "5-2":[0x9c,0xa0,0xa2], "5-3":[0xa6,0xaa,0xac], "5-4":[0xb0,0xb4,0xb6], "5-5":[0xba,0xbe,0xc0], "5-6":[0xc8,0xcc,0xce]
}


// List of all the enemies with the type id in the 1st element and size in the 2nd
EnemyLookup = {
    "Ball & Chain Viking": [0x00fc,0x9234],
    "Valkyrie": [0x010e,0xcdd0],
    "Crossbow Viking": [0x0102,0xacf0],
    "Melting Pot Viking": [0x011a,0xe540],
    "Hunter": [0x00d2,0xb004],
    "Arachnibot": [0x00de,0],
    "Hornet": [0x00d8,0x0e2a],
    "Raptor": [0x00e4,0],
    "Thor 3000": [0x00f0,0x701a],
    "Steel Clan": [0x00ea,0],
    "Garmech": [0x00f6,0xa65a]
}

Vikings = [
    "Ball & Chain Viking",
    "Valkyrie",
    "Crossbow Viking",
    "Melting Pot Viking"
]

Robots = [
    "Hunter",
    "Arachnibot",
    "Hornet",
    "Raptor",
    "Thor 3000",
    "Steel Clan",
    "Garmech"
]

//------------------------------------------------------------------
// Helpers

// Reverse Lookup to lookup dictionaries by value and returns thekey or -1 if an error
function ReverseLookup(dictionary,value)
{
    result = -1
    for key in dictionary 
    {
        if(dictionary[key] == value) result = key
    }
    return result
}

// Macros to set the minimum level of difficulty 
function Easy() => Difficulty() <= 2
function Normal() => Difficulty() >= 1 && Difficulty() <= 2
function Hard() => Difficulty() == 2

function StartGame()
{
    return prev(ScreenID()) == 0x48 &&
        ScreenID() == 0x3c &&
        Cutscene() == 0x0 &&
        Level() == 0x0 &&
        Progression() == 0x0
}

function GameOver()
{
    return Lives() == 0xff &&
        ScreenID() == 0x47 &&
        Cutscene() == 0xff 
}

// Code to detect the flying cheat input
function FlyingCheat() 
{
    return prev(Cheat1()) == 0x0 &&
        Cheat1() == 0x0 && 
        prev(Cheat2()) == 0x7 &&
        Cheat2() == 0x8
}

// Code to detect the health regen cheat input
function RegenCheat() 
{
    return prev(Cheat1()) == 0x4 && 
        Cheat1() == 0x8 && 
        prev(Cheat2()) == 0x8 &&
        Cheat2() == 0x9
}

// Code to detect the invincible cheat input
function InvincibleCheat()
{
    return prev(Cheat1()) == 0x4 &&
        Cheat1() == 0xC && 
        prev(Cheat2()) == 0xA && 
        Cheat2() == 0xB
}

// Code to detect the fireball cheat input
function FireballCheat()
{
    return prev(Cheat1()) == 0x0 &&
        Cheat1() == 0x9 && 
        prev(Cheat2()) == 0x9 &&
        Cheat2() == 0xA
}

// Code to detect the level skip cheat input
function LevelSkip()
{
    return Cheat1() == 0x4 && 
        prev(Cheat2()) == 0xA &&
        Cheat2() == 0xB
}

// Cheat Pause Lock
function CheatLock()
{            
    return unless(Demo() == 0xff) &&
        unless(once(FlyingCheat())) && 
        unless(once(RegenCheat())) && 
        unless(once(InvincibleCheat())) && 
        unless(once(FireballCheat()))
}

// Detects in the player is cheating for RP
function DetectCheat()
{
    return always_false() ||    
        once(FlyingCheat()) || 
        once(RegenCheat()) || 
        once(InvincibleCheat()) || 
        once(FireballCheat())    
}

//------------------------------------------------------------------
// Progression

// Create code for each level inbetween the begining and the end
function SectionComplete(begin, end, difficulty)
{
    // Convert the level to memory values
    beginID = ReverseLookup(LevelLookup,begin)
    endID = ReverseLookup(LevelLookup,end)
    
    // Build an array of level progression gates
    levels = []
    for levelID in LevelLookup
    {
        if (levelID >= beginID && levelID <= endID)
        {
            // Figure out the transistion for this section
            levelName = LevelLookup[levelID]
            transisitions = LevelTransistions[levelName]
            startTransistion = transisitions[0]
            midTransistion = transisitions[1]
            endTransistion = transisitions[2]
            
            // Put an extra hit on the beginning of the 1st section
            if (levelID == beginID)
            {
                if (startTransistion == 0)
                {
                    // Use aa special function if start of game
                    array_push(levels, once(difficulty &&  StartGame()))                   
                }
                else
                {
                    // Add an extra hit for the 1st level
                    array_push(levels,
                        once(
                            difficulty &&
                            prev(Progression()) == startTransistion &&
                            Progression() == midTransistion
                        )
                    ) 
                }                
            }

            // Add hit if transistion occured without a cheat code
            array_push(levels,
                once(
                    difficulty &&
                    prev(Progression()) == midTransistion &&
                    Progression() == endTransistion
                )
            )            
        }
    }
    
    return never(GameOver()) && 
        never(LevelSkip()) &&
        measured(tally(length(levels),levels), format="percent")
}

// Setup the progression achievements
function ProgressLevels(title, description, points, difficulty, beginName, endName)
{
    trigger = CheatLock() && SectionComplete(beginName, endName, difficulty) 
    achievement(title, description, points, trigger)
}

// Setup the progression achievements that have resets
function CompleteGame(title, description, points, difficulty)
{
    trigger = CheatLock() && SectionComplete("1-1", "5-6", difficulty) 
    achievement(title, description, points, trigger)
}

ProgressLevels("Evil Awakens","Complete level 1 on easy+", 5, Easy(), "1-1", "1-4")
ProgressLevels("Siege of the Rookery","Complete level 2 on easy+", 5, Easy(), "2-1", "2-4")
ProgressLevels("Stone and Steel","Complete level 3 on easy+", 5, Easy(), "3-1", "3-4")
ProgressLevels("Subterranean Terror","Complete level 4 on easy+", 5, Easy(), "4-1", "4-1")
ProgressLevels("The Forge","Complete level 5 on easy+", 5, Easy(), "5-1", "5-6")

ProgressLevels("The Sorcerer Strikes","Beat the level 1 boss on hard", 10, Hard(), "1-4", "1-4")
ProgressLevels("Odin’s Wrath","Beat the level 2 boss on hard", 10, Hard(), "2-4", "2-4")
ProgressLevels("Free Fall","Beat the level 3 boss on hard", 10, Hard(), "3-4", "3-4")
ProgressLevels("Steel Clan","Beat the level 4 boss on hard", 10, Hard(), "4-1", "4-1")
ProgressLevels("Angel of the Night","Beat the level 5 boss on hard", 25, Hard(), "5-6", "5-6")

CompleteGame("Without Trust, There Can Be No Clan","Complete the game on easy+", 10, Easy())
CompleteGame("Stone by Day, Warrior by Night","Complete the game on normal+", 25, Normal())
CompleteGame("A Gargoyle Doesn't Whine. He Roars!","Complete the game on hard", 50, Hard())

//----------------------------------------------------------
// Speedruns
function BoxCheck(boxArray)
{
    startX = boxArray[0]
    startY = boxArray[1]
    endX = boxArray[2]
    endY = boxArray[3]
    return GoliathX() >= startX &&
        GoliathX() <= endX &&
        GoliathY() >= startY &&
        GoliathY() <= endY
}

function BoundsCheck(boxArray)
{
    startX = boxArray[0]
    startY = boxArray[1]
    endX = boxArray[2]
    endY = boxArray[3]
    cancelArray = [
        GoliathX() < startX,
        GoliathX() > endX,
        GoliathY() < startY,
        GoliathY() > endY
    ]
    return cancelArray
}

// Convert the time minutes:seconds:frames to frames (1/60s each)
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Setup an achievement and leaderboard pair for sectional speedrun
function Speedrun(title, race, points, level, boundsBox, startBox, goalBox, seconds)
{
    levelID = ReverseLookup(LevelLookup,level)
    
    // Create a description for the achievement and the leaderboard
    descriptionAch = race + " " + level + " in under " + seconds + " seconds on normal+ (see comments for map)"
    descriptionLB = race + " " + level + " on normal+ (see comments for map)"
    
    // Setup the start conditions
    if (level == "4-1")
        start = CheatLock() && ScreenID() != 0x45 &&  BoxCheck(startBox)
    else    
    start = CheatLock() && BoxCheck(startBox)
    
    // Build the cancel condition as an array
    cancel = BoundsCheck(boundsBox)
    array_push(cancel, Level() != levelID)
    array_push(cancel, prev(Lives()) > Lives())
    array_push(cancel, prev(Continues()) > Continues())
    array_push(cancel, FlyingCheat())
    array_push(cancel, RegenCheat())
    array_push(cancel, InvincibleCheat())
    array_push(cancel, FireballCheat()) 
    
    // Setup the submit conditions
    submit = BoxCheck(goalBox)
    
    // Create achievement and the leaderboard
    SpeedrunLB(title, descriptionAch, descriptionLB, points, start, cancel, submit, TimeSpan(0,seconds,0))
}

// Create a achievement and leaderboard pair for sectional speedrun
function SpeedrunLB(title, descriptionAch, descriptionLB, points, start, cancel, submit, time)
{
    // Build the achievement and leaderboard cancel conditions
    cancelAch = never(repeated(time,always_true()))
    cancelLB = always_false()
    for condition in cancel
    {
        cancelAch = cancelAch && never(condition)
        cancelLB = cancelLB || condition
    }
    
    // Build the achievement code with once/never/trigger_when
    triggerAch = once(start) && cancelAch && trigger_when(submit)
    achievement(title, descriptionAch, points, triggerAch)
    
    // Build the leaderboard to be in sync with achievement
    leaderboard(title, descriptionLB, start, cancelLB, submit, always_true(), 
        format = "FRAMES", lower_is_better = true)
}

// Create a leaderboard pair for completing the levels between begin and end
function SpeedrunLevel(title, description, begin, end)
{
    // Look up the start and end transitions for the beginning level
    beginTransisitions = LevelTransistions[begin]
    startTransistion = beginTransisitions[0]
    endTransistion = beginTransisitions[1]
    
    // Setup the start conditions
    start = CheatLock()
    if (startTransistion == endTransistion)
    {
        start = start && 
            Normal() &&
            StartGame()
    }
    else
    {
        start = start && 
            Normal() &&
            prev(Progression()) == startTransistion &&
            Progression() == endTransistion
    }

    // Build the cancel condition as an array
    cancelArray = []   
    array_push(cancelArray, GameOver())
    array_push(cancelArray, LevelSkip())
    array_push(cancelArray, FlyingCheat())
    array_push(cancelArray, RegenCheat())
    array_push(cancelArray, InvincibleCheat())
    array_push(cancelArray, FireballCheat()) 

    cancel = always_false()
    for condition in cancelArray
    {
        cancel = cancel || condition
    }
    
    // Look up the start and end transitions for the ending level
    endTransisitions = LevelTransistions[end]
    startTransistion = endTransisitions[1]
    endTransistion = endTransisitions[2]
    
    // Submit when the player transisition past the end level
    submit = prev(Progression()) == startTransistion &&
        Progression() == endTransistion
        
    leaderboard(title, description, start, cancel, submit, always_true(), 
        format = "FRAMES", lower_is_better = true)
}

// Speedrun 1
sr1Level = "1-3"
sr1BoundsBox = [0x0, 0x0, 0x1b4, 0x430]
sr1StartBox = [0x190, 0x40b, 0x1a0, 0x430]
sr1GoalBox = [0x130, 0x0, 0x168, 0xb0]

// Speedrun 2
sr2Level = "2-1"
sr2BoundsBox = [0x150, 0x0, 0x612, 0x330]
sr2StartBox = [0x1d0, 0x300, 0x228, 0x330]
sr2GoalBox = [0x59a, 0x120, 0x612, 0x180]

// Speedrun 3
sr3Level = "3-2"
sr3BoundsBox = [0x100, 0x0, 0x5d0, 0x500]
sr3StartBox = [0x14f, 0x480, 0x243, 0x4d8]
sr3GoalBox = [0x4f0, 0x0, 0x5d0, 0x80]

// Speedrun 4
sr4Level = "4-1"
sr4BoundsBox = [0xb0, 0x0, 0x1b00, 0x162]
sr4StartBox = [0xb0, 0x0, 0xc0, 0x7a]
sr4GoalBox = [0x1a44, 0xbd, 0x1b00, 0xd3]

// Speedrun 5
sr5Level = "5-4"
sr5BoundsBox = [0x0, 0x560, 0x200, 0x9c0]
sr5StartBox = [0x120, 0x970, 0x140, 0x9a9]
sr5GoalBox = [0x1a0, 0x560, 0x1b0, 0x5d8]

SpeedrunLevel("Any % Speedrun", "Fastest time to complete the game on normal+", "1-1","5-6")
SpeedrunLevel("Evil Awakens Speedrun", "Fastest time to complete level 1 on normal+", "1-1","1-4")
SpeedrunLevel("Siege of the Rookery Speedrun", "Fastest time to complete level 2 on normal+", "2-1","2-4")
SpeedrunLevel("Stone and Steel Speedrun", "Fastest time to complete level 3 on normal+", "3-1","3-4")
SpeedrunLevel("Subterranean Terror Speedrun", "Fastest time to complete level 4 on normal+", "4-1","4-1")
SpeedrunLevel("The Forge Speedrun", "Fastest time to complete level 5 on normal+", "5-1","5-6")

Speedrun("Ballista Blitz", "Climb the ballista gauntlet on", 5, sr1Level, sr1BoundsBox, sr1StartBox, sr1GoalBox, 30)
Speedrun("Rookery Rush", "Climb the rookery gauntlet to the vent switch", 5, sr2Level, sr2BoundsBox, sr2StartBox, sr2GoalBox, 25)
Speedrun("Rising Star on Broadway", "Climb from the bottom of the Broadway Theater Group building to the top of the apartment building on",
    5, sr3Level, sr3BoundsBox, sr3StartBox, sr3GoalBox, 40)
Speedrun("Express Train", "Run from the back of the train to the front on", 5, sr4Level, sr4BoundsBox, sr4StartBox, sr4GoalBox, 60)
Speedrun("Lavafall", "Climb the lavafall on", 5, sr5Level, sr5BoundsBox, sr5StartBox, sr5GoalBox, 20)

//------------------------------------------------------------------
// Item Collection

function ItemTimer(title, description, points, itemTimer)
{
    trigger = CheatLock() &&
        Easy() &&
        prev(itemTimer) == 0 &&
        itemTimer == 0x1fe

    achievement(title, description, points, trigger)
}

function TenLives(title, description, points)
{
    trigger = CheatLock() &&
        Easy() &&
        prev(Lives()) == 9 &&
        Lives() == 10

    achievement(title, description, points, trigger)
}

function Collect(title, description, points, level, memory)
{
    levelID = ReverseLookup(LevelLookup,level)
    trigger = CheatLock() &&
        Easy() &&
        Cutscene() == 0 &&
        GameActive() == 0xff &&
        GoliathHealth() > 0 &&
        Level() == levelID &&
        trigger_when(
            prev(memory) == 0 &&
            memory == 0xff
        )

    achievement(title, description, points, trigger)
}

ItemTimer("Protect the Castle!","Collect a shield for temporary invulnerability on easy+", 1, InvincibilityTimer())
ItemTimer("Hammer of Justice!","Collect a hammer for temporary one-hit kills on easy+", 2, HammerTimer())
TenLives("Stone Skin","Have 10 ten lives at once on easy+", 10)

Collect("Evil Awakens Secret I","Collect the extra life in level 1-1 on easy+",2,"1-1",CollectLife1())
Collect("Evil Awakens Secret II","Collect the extra continue in level 1-1 on easy+",3,"1-1",CollectContinue())
Collect("Evil Awakens Secret III","Collect the extra life in level 1-3 on easy+",2,"1-3",CollectLife2())
Collect("Siege of the Rookery Secret I","Collect the extra continue in level 2-1  on easy+",3,"2-1",CollectContinue())
Collect("Siege of the Rookery Secret II","Collect the first extra life in level 2-2 on easy+",3,"2-2",CollectLife1())
Collect("Siege of the Rookery Secret III","Collect the second extra life in level 2-2 on easy+",3,"2-2",CollectLife2())
Collect("Siege of the Rookery Secret IV","Collect the extra life in level 2-3 on easy+",2,"2-3",CollectLife1())
Collect("Stone and Steel Secret I","Collect the extra continue in level 3-1 on easy+",3,"3-1",CollectContinue())
Collect("Subterranean Terror Secret I","Collect the first extra life in level 4-1 on easy+",2,"4-1",CollectLife1())
Collect("Subterranean Terror Secret II","Collect the second extra life in level 4-1 on easy+",2,"4-1",CollectLife3())
Collect("Subterranean Terror Secret III","Collect the extra continue in level 4-1  on easy+",3,"4-1",CollectContinue())
Collect("The Forge Secret I","Collect the extra life in level 5-2 on easy+",2,"5-2",CollectLife1())
Collect("The Forge Secret II","Collect the extra life in level 5-3 on easy+",2,"5-3",CollectLife1())

//------------------------------------------------------------------
// Enemy Knockouts

enemyMemoryBase = 0x1c70
enemyCounterOffset = 0x32
enemyFrameOffset = 0x40
enemyTypeOffset = 0x46
enemyHealthOffset = 0x56
enemyStatus1Offset = 0x4e
enemyStatus2Offset = 0x4f

// Check if an enemy lost health in any of the possible enemy locations
function EnemyNormalKill(index, enemy)
{
    // Look up the type id and the size of the passed enemy
    enemyArray = EnemyLookup[enemy]
    typeID = enemyArray[0]
    frameID = enemyArray[1]

    // Calculate the memory location for this index
    memoryBase = index * 0x80 + enemyMemoryBase
    enemyType = word(memoryBase + enemyTypeOffset)
    enemyFrame = word(memoryBase + enemyFrameOffset)
    enemyHealth = word(memoryBase + enemyHealthOffset)
    
    trigger = prev(enemyType) == typeID &&
        enemyType == typeID &&
        prev(enemyHealth) > 0 &&        
        enemyHealth == 0
    
    // Return code to check if this enemy is dead
    return  trigger
}

// Check if an enemy lost health in any of the possible enemy locations
function EnemyInstantKill(index, enemy)
{
    // Look up the type id and the size of the passed enemy
    enemyArray = EnemyLookup[enemy]
    typeID = enemyArray[0]
    frameID = enemyArray[1]

    // Calculate the memory location for this index
    memoryBase = index * 0x80 + enemyMemoryBase
    enemyType = word(memoryBase + enemyTypeOffset)
    enemyFrame = word(memoryBase + enemyFrameOffset)
    enemyHealth = word(memoryBase + enemyHealthOffset)
   
    trigger = prev(enemyType) == typeID &&
        enemyType == typeID &&
        enemyHealth > 0 &&  
        prev(enemyFrame) != frameID &&        
        enemyFrame == frameID
    
    // Return code to check if this enemy is dead
    return  trigger
}

// Check if an enemy lost health in any of the possible enemy locations
function EnemyExplodeKill(index, enemy)
{
    // Look up the type id and the size of the passed enemy
    enemyArray = EnemyLookup[enemy]
    typeID = enemyArray[0]
    frameID = enemyArray[1]

    // Calculate the memory location for this index
    memoryBase = index * 0x80 + enemyMemoryBase
    enemyType = word(memoryBase + enemyTypeOffset)
    enemyHealth = word(memoryBase + enemyHealthOffset)
   
    trigger = prev(enemyHealth) > 0 && 
        prev(enemyType) == typeID &&
        enemyType == 0x96 
    
    // Return code to check if this enemy is dead
    return trigger
}

// Count the passed array of enemies dying in any enemy location
function EnemyCount(title, description, points, count, array)
{
    enemyCount = []
    for enemy in array
    {
        for index in range (0,31)
        {
            array_push(enemyCount, EnemyInstantKill(index, enemy))
            array_push(enemyCount, EnemyNormalKill(index, enemy))
            array_push(enemyCount, EnemyExplodeKill(index, enemy))
        }
    }

    trigger = CheatLock() && measured(tally(count, enemyCount))
    achievement(title, description, points, trigger)
}

// Count knocks outs per grouping
EnemyCount("Betrayal of Castle Wyvern!","Knock out 25 Vikings in a single session on normal+", 2, 25, Vikings)
EnemyCount("Track Down the Vikings Before They Attack Again!","Knock out 50 Vikings in a single session on normal+", 5, 50, Vikings)
EnemyCount("Ragnarök!","Knock out 100 Vikings in a single session on normal+", 10, 100, Vikings)
EnemyCount("Valhalla, I'm Coming!","Knock out 10 Valkyries in a single session on normal+", 10, 10, ["Valkyrie"])
EnemyCount("They’re Steel Instead of Stone?","Knock out 25 Robots in a single session on normal+", 3, 25, Robots)
EnemyCount("Debugger!","Knock out 50 Robots in a single session on normal+", 5, 50, Robots)
EnemyCount("System Purge!","Knock out 100 Robots in a single session on normal+", 10, 100, Robots)
EnemyCount("No, Machine, You’ll Not Get Rid of Me That Easily!","Knock out 10 Thor 3000s in a single session on normal+", 10, 10, ["Thor 3000"])

rich_presence_conditional_display(DetectCheat(), "Goliath is cheating! Achievements paused, reset emulator to reactivate achievements.")
rich_presence_conditional_display(Progression() == 0 && GameActive() == 0xff && Cutscene() == 0xff && Lives() == 0 && Continues() == 0, "Goliath is in menu.")
rich_presence_conditional_display(Demo() == 0xff, "Goliath is watching the demo.")
rich_presence_display("Goliath is playing on {0} in {1} {2} with {3} live(s) and {4} continue(s).",  
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_lookup("Area", Level(), AreaLookup), 
    rich_presence_lookup("Level", Level(), LevelLookup),
    rich_presence_value("Value", Lives()),
    rich_presence_value("Value", Continues())
)

