// Gargoyles
// #ID = 2364

// $0001: Difficulty: (00/01/02)
function Difficulty() => byte(0x000001)

// $000B: [8-bit] Demo (0x0 = None, 0xFF = Demo)
function DemoMode() => byte(0x00000B)

// $006F: Pause: (00/FF)
function GamePaused() => byte(0x00006F)

// $0072: [8-bit] Cutscene (0x0 = off, 0xff = on)
function Cutscene() => byte(0x000072)

// $0074: [8-bit] Level Progression
function Progression() => byte(0x000074)

// $007C: [16-bit] Health (0x100=Full, 0x0=Dead)
function GoliathHealth() => word(0x00007C)

// $00BA: [8-bit] Level
function Level() => byte(0x0000BA)

// $00DA: Lives
function Lives() => byte(0x0000DA)

// $00DD: [8-bit] Continues
function Continues() => byte(0x0000DD)

// $0106: [16-bit] Goliath X-Axis
function GoliathX() => word(0x000106)

// $0108: [16-bit] Goliath Y-Axis
function GoliathY() => word(0x000108)

// $0B1C: [8-bit] Level 1-1, 2-1, 3-1, 4-1 Extra Continue (0x0 = shown, 0xff = collected)
function CollectContinue() => byte(0x000B1C)

// $0B20: [8-bit] Level 1-1, 2-1(a), 2-3, 4-1(a), 5-2, & 5-3 Extra Life (0x0 = shown, 0xff = collected)
// $0B23: [8-bit] Level 1-3, 2-1(b) Extra Life (0x0 = shown, 0xff = collected)
// $0B25: [8-bit] Level 4-1(b) Extra Life (0x0 = shown, 0xff = collected)
function CollectLife1() => byte(0x000B20)
function CollectLife2() => byte(0x000B23)
function CollectLife3() => byte(0x000B25)

// $0B38: Boss HP
function BossHealth() => byte(0x000B38)

// $0b4e: [8-bit] 4-1 Boss Zone (0x0 = no, 0xff = yes)
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
// $EEF2: [8-bit] Cheat Byte 2 (Combined with 0xeef0)
function Cheat1() => byte(0x00EEF0)
function Cheat2() => byte(0x00EEF2)

//-----------------------------------------------------------------
// Lookups

LevelLookup = {
    0x0: "1-1", 0x1: "1-2", 0x2: "1-3", 0x3: "1-4",
    0x4: "2-1", 0x5: "2-2", 0x6: "2-3", 0x7: "2-4",
    0x8: "3-1", 0x9: "3-2", 0xA: "3-3", 0xB: "3-4",
    0x10: "4-1", 
    0x15: "5-1", 0x16: "5-2", 0x17: "5-3", 0x18: "5-4", 0x19: "5-5", 0x1B: "5-6"
}

LevelTransistions = {
    "1-1":[0x6,0xa], "1-2":[0x10,0x14], "1-3":[0x1a,0x1e], "1-4":[0x1e,0x20],
    "2-1":[0x32,0x36], "2-2":[0x3c,0x40], "2-3":[0x46,0x4a], "2-4":[0x4a,0x4c],
    "3-1":[0x62,0x66], "3-2":[0x6c,0x70], "3-3":[0x76,0x7a], "3-4":[0x7a,0x7c],
    "4-1":[0x88,0x8a], 
    "5-1":[0x9c,0xa0], "5-2":[0xa6,0xaa], "5-3":[0xb0,0xb4], "5-4":[0xba,0xbe], "5-5":[0xc8,0xcc], "5-6":[0xcc,0xce]
}

// List of all the enemies with the type id in the 1st element and size in the 2nd
EnemyLookup = {
    "Ball & Chain Viking": 0x00fc,
    "Valkyrie": 0x010e,
    "Crossbow Viking": 0x0102,
    "Melting Pot Viking": 0x011a,
    "Hunter": 0x00d2,
    "Arachnibot": 0x00de,
    "Hornet": 0x00d8,
    "Raptor": 0x00e4,
    "Thor 3000": 0x00f0,
    "Steel Clan": 0x00ea,
    "Garmech": 0x00f6
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

// Cheat Pause Lock
function CheatLock()
{
    noRegen = prev(Cheat1()) == 0x4 && Cheat1() == 0x8 && 
        prev(Cheat2()) == 0x8 && Cheat2() == 0x9

    noInvincible = prev(Cheat1()) == 0x4 && Cheat1() == 0xC && 
        prev(Cheat2()) == 0xA && Cheat2() == 0xB

    noFireBall = prev(Cheat1()) == 0x0 && Cheat1() == 0x9 && 
        prev(Cheat2()) == 0x9 && Cheat2() == 0xA
             
    return unless(once(noRegen)) && 
        unless(once(noInvincible)) && 
        unless(once(noFireBall))
}

// Check if the level skip code was used.
function LevelSkip()
{
    return prev(Cheat1()) == 0x0 && Cheat1() == 0xA && 
        prev(Cheat2()) == 0xA && Cheat2() == 0xB
}

//------------------------------------------------------------------
// Progression
function SectionComplete(begin, end)
{
    beginID = ReverseLookup(LevelLookup,begin)
    endID = ReverseLookup(LevelLookup,end)
    
    // create code for each level inbetween the begining and the end
    levels = []
    for levelID in LevelLookup
    {
        if (levelID >= beginID && levelID <= endID)
        {
            levelName = LevelLookup[levelID]
            transisitions = LevelTransistions[levelName]
            startTransistion = transisitions[0]
            endTransistion = transisitions[1]
        
            array_push(levels,
                once(
                    GamePaused() == 0 &&
                    prev(Progression()) == startTransistion &&
                    Progression() == endTransistion
                )
            )
        }
    }
    
    return measured(tally(length(levels),levels))
}

function ProgressSections()
{
    for levelID in LevelLookup
    {
        levelName = LevelLookup[levelID]
        title = "Complete Level " + levelName
        description = title
        points = 0
        trigger = SectionComplete(levelName, levelName)
        achievement(title, description, points, trigger)
    }
}
ProgressSections()

function ProgressLevels(beginName, endName)
{
    title = "Complete Level " + beginName + " to " + endName
    description = title
    points = 0
    trigger = SectionComplete(beginName, endName)
    achievement(title, description, points, trigger)
}
ProgressLevels("1-1", "1-4")
ProgressLevels("2-1", "2-4")
ProgressLevels("3-1", "3-4")
ProgressLevels("4-1", "4-1")
ProgressLevels("5-1", "5-6")
ProgressLevels("1-1", "5-6")

//------------------------------------------------------------------
// Enemy Knockouts

enemyMemoryBase = 0x1c70
enemyTypeOffset = 0x46
enemyHealthOffset = 0x56
enemyStatusOffset = 0x4e

// Check if an enemy died in any of the possible enemy locations
function EnemyDead(index, enemy)
{
    // Look up the type id and the size of the passed enemy
    typeID = EnemyLookup[enemy]

    // Calculate the memory location for this index
    memoryBase = index * 0x80 + enemyMemoryBase
    enemyType = word(memoryBase + enemyTypeOffset)
    enemyDead = bit5(memoryBase + enemyStatusOffset)
    
    // Return code to check if this enemy is dead
    return prev(enemyType) == typeID &&
        enemyType == typeID &&
        prev(enemyDead) < enemyDead
}

// Count any enemy dying in any enemy location
function AllEnemiesCount()
{
    enemyCount = []
    for enemy in EnemyLookup
    {
        for index in range (0,31)
        {
            array_push(enemyCount, EnemyDead(index, enemy))
        }
    }
    
    title = "All Enemies Knocked Out"
    description = title
    points = 0
    trigger = measured(tally(10000, enemyCount))
    achievement(title, description, points, trigger)
}
AllEnemiesCount()

// Count the passed array of enemies dying in any enemy location
function EnemyCount(name, array)
{
    enemyCount = []
    for enemy in array
    {
        for index in range (0,31)
        {
            array_push(enemyCount, EnemyDead(index, enemy))
        }
    }
    
    title = name + " Knocked Out"
    description = title
    points = 0
    trigger = measured(tally(10000, enemyCount))
    achievement(title, description, points, trigger)
}

// Count knocks outs per grouping
EnemyCount("Vikings", Vikings)
EnemyCount("Robots", Robots)
for enemy in EnemyLookup
{
    EnemyCount(enemy, [enemy])
}

//------------------------------------------------------------------
// Item Collection

function Collect(title, description, points, level, memory)
{
    levelID = ReverseLookup(LevelLookup,level)
    trigger = Easy() &&
        Level() == levelID &&
        prev(memory) == 0 &&
        memory == 0xff

    achievement(title, description, points, trigger)
}

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
    start = BossZone() == 0x0 && BoxCheck(startBox)
    
    // Build the cancel condition as an array
    cancel = BoundsCheck(boundsBox)
    array_push(cancel, Level() != levelID)
    array_push(cancel, prev(Lives()) > Lives())
    array_push(cancel, prev(Continues()) > Continues())
    
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

Speedrun("Ballista Blitz", "Climb the ballista gauntlet on", 5, sr1Level, sr1BoundsBox, sr1StartBox, sr1GoalBox, 30)
Speedrun("Rookery Rush", "Climb the rookery gauntlet to the vent switch", 5, sr2Level, sr2BoundsBox, sr2StartBox, sr2GoalBox, 25)
Speedrun("Rising Star on Broadway", "Climb from the bottom of the Broadway Theater Group building to the top of the apartment building on",
    5, sr3Level, sr3BoundsBox, sr3StartBox, sr3GoalBox, 40)
Speedrun("Express Train", "Run from the back of the train to the front on", 5, sr4Level, sr4BoundsBox, sr4StartBox, sr4GoalBox, 60)
Speedrun("Lavafall", "Climb the lavafall on", 5, sr5Level, sr5BoundsBox, sr5StartBox, sr5GoalBox, 20)
