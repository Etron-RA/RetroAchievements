// Megabots
// #ID = 14024

//-------------------------------------------------------------------------------
// Memory functions

// $001C: [16-bit] Level Stat (equals 19256 at end of level)
function LevelStat() => word(0x00001C)

// $00FF: [8-bit] ASCII Text Buffer
function TextBuffer(index = 0) => byte(0xff + index)

// $2028: [8-bit] Scene Drawn (0x0 = Drawing, otherwise drawn)
function SceneDrawing() => byte(0x002028)

// $2522: A1-A5 (5 bytes)
function RowA(offset = 0) => byte(0x002522 + offset)

// $25A2: B1-B5 (5 Bytes)
function RowB(offset = 0) => byte(0x0025A2 + offset)

// $2622: C1-C5 (5 Bytes)
function RowC(offset = 0) => byte(0x002622 + offset)

// $26A2: D1-D5 (5 Bytes)
function RowD(offset = 0) => byte(0x0026A2 + offset)

// $2722: E1-E5 (5 Bytes)
function RowE(offset = 0) => byte(0x002722 + offset)

// $2BF3: Level
function Level() => byte(0x002BF3)
Level4 = 0xc0
Level3 = 0xcf
Level2 = 0xf1
Level1 = 0xf3

// $97ED: [16-bit BE] Animation (0x8832 to 0x8746 means player was hit)
function Animation() => word_be(0x0097ED)

// $97FC: Power
function Power() => byte(0x0097FC)

// $982d: X
function X() => byte(0x00982d)

// $9834: Y
function Y() => byte(0x009834)

// $9865: X Clear
function ClearX() => byte(0x009865)

// $986C: Y Clear
function ClearY() => byte(0x00986C)

// $9873: [8-bit] Robot Type (0x0-0x3 randomize robot types, 0x4 Dragon, 0x5 Item Robot, 0x63 room empty)
function RoomType() => byte(0x009873)

// $983B: [bit 0] Aggressive Robot (0 = no, 1 = yes)
function AggressiveRobot() => byte(0x00983B)

// $9842: [bit 0] Robot On Screen (0 = no, 1 = yes)
function RobotAlive() => byte(0x009842)

// $98EA: Credit
function Credits() => word_be(0x0098E9)

//-------------------------------------------------------------------------------
// Look up tables

ASCII = {
    115: [0x31,0x31,0x35,0x0],    
    149: [0x31,0x34,0x39,0x0],
    150: [0x31,0x35,0x30,0x0], 
    230: [0x32,0x33,0x30,0x0], 
    350: [0x33,0x35,0x30,0x0], 
    500: [0x35,0x30,0x30,0x0],
}

// The stage numbers
StageLookup = {
    Level4: "04",
    Level3: "03",
    Level2: "02",
    Level1: "01",
}

AggressiveLookup = {
    0: "Interrogating",
    1: "Fighting"
}

// Robots names are a hash of the grid location and robot type
RobotNames = {
    0: "Item Shop Droid",
    1: "Andy Roid",
    2: "Clank",
    3: "Aytron",
    4: "Rusty",
    5: "Twobit",
    6: "Rob Bott",
    7: "Beta",
    8: "Hard Wire",
    9: "Scrappie",
    10: "Spanner",
    11: "Etron",
    12: "Rock",
    13: "Unbx",
    14: "Terra",
    15: "Edaz",
    16: "Socket",
    17: "Gadget",
    18: "Dotty",
    19: "Boomer",
    20: "Prototron",
    21: "Roberto",
    22: "Drillbit",
    23: "Gearbox",
    24: "Spark",
    25: "Bender",
    26: "Bolt",
    27: "Gage",
    28: "Zat",
    29: "Gort",
    30: "Boron",
    31: "Torg",
    32: "Ash",
    33: "Plex",
    34: "Zed",
    35: "Tachikomas",
    36: "Cambot",
    37: "Tom Servo",
    38: "Crooooow",
    39: "Robocop",
    40: "Andromeda",
    41: "Daemon",
    42: "Helena",
    43: "Marius",
    44: "Primus",
    45: "Radius",
    46: "Sulla",
    47: "Nomad",
    48: "Alpha",
    49: "Omega",
    50: "T-800",
    51: "C-3PO",
    52: "R2-D2",
    53: "L-76",
    54: "HK-47",
    55: "K-9",
    56: "Z-3",
    57: "HAL 9000",
    58: "ED-209",
    59: "B-9",
    60: "GLaDOS",
    61: "Prime",
    62: "Bishop",
    63: "David",
    64: "Data",
    65: "Anne Droid",
    66: "Sparkle",
    67: "Hardac",
    68: "Scrap",
    69: "Terra",
    70: "Cable",
    71: "Optimus",
    72: "Kitt",
    73: "Plexi",
    74: "Jet",
    75: "Qwerty",
    76: "Ulysses",
    77: "H.E.L.P.eR",
    78: "Hammer",
    79: "AWESOM-O",
    80: "Johnny 5",
    81: "Sterling",
    82: "EggRobo",
    83: "Scyther",
    84: "Norbit",
    85: "Ranger",
    86: "Gigabit",
    87: "Marvin",
    88: "Experiment 9",
    89: "Booker",
    90: "Dot",
    91: "Freya",
    92: "Tracker",
    93: "Sona",
    94: "Auto",
    95: "Max",
    96: "Tin",
    97: "Core",
    98: "Fiber",
    99: "01010010",
    100: "Centurion"
}

//-------------------------------------------------------------------------------
// Helper functions

function LevelEnd() => LevelStat() == 19256
function LevelStart() => prev(RowA()) == 30 && RowA() != 30
function GameStart() => Level() == Level4 && LevelStart()
function GameEnd() => LevelEnd() && ClearY() >= 48 && ClearX() >= 48
function Steps(count) => tally(count, Y() < 5 && Y() != prev(Y()), X() < 5 && X() != prev(X()))
function PlayerHit() => Power() + 20 <= prev(Power())
function PlayerRecharge() => Power() == 0
function MonsterDefeated() => SceneDrawing() != 0 && AggressiveRobot() == 1 && prev(RobotAlive()) == 1 && RobotAlive() == 0

function RoomCount()
{
    RoomArray = []
    for index in range(0,4)
    {
        array_push(RoomArray, once(RowA(index) != 30))
        array_push(RoomArray, once(RowB(index) != 30))
        array_push(RoomArray, once(RowC(index) != 30))
        array_push(RoomArray, once(RowD(index) != 30))
        array_push(RoomArray, once(RowE(index) != 30))
    }
    return tally(25,RoomArray)
}

function NeverPowerCreditsLessThan149()
{
    return never(
            SceneDrawing() != 0 &&
            TextBuffer(0) >= 0x30 && TextBuffer(0) <= 0x39 && 
            TextBuffer(1) >= 0x30 && TextBuffer(1) <= 0x39 && 
            TextBuffer(2) == 0
        ) && 
        never(
            SceneDrawing() != 0 &&
            TextBuffer(0) == 0x31 && 
            TextBuffer(1) >= 0x30 && TextBuffer(1) <= 0x34 &&
            TextBuffer(2) >= 0x30 && TextBuffer(2) <= 0x39 &&
            TextBuffer(3) == 0
        )
}

function PowerCredits(number)
{
    string = ASCII[number]
    return TextBuffer(0) == string[0] &&
        TextBuffer(1) == string[1] &&
        TextBuffer(2) == string[2] &&
        TextBuffer(3) == string[3]
}

//-------------------------------------------------------------------------------
// Achievements

achievement(
    title = "Nanobots", 
    description = "Clear level 4", 
    points = 10, 
    id = 73134,
    trigger = Level() == Level4 && LevelEnd()
)

achievement(
    title = "Microbots", 
    description = "Clear level 3", 
    points = 10, 
    id = 73135, 
    trigger = Level() == Level3 && LevelEnd()
)

achievement(
    title = "Kilobots", 
    description = "Clear level 2", 
    points = 10, 
    id = 73136,
    trigger = Level() == Level2 && LevelEnd()
)

achievement(
    title = "Megabots", 
    description = "Clear level 1 and defeat the final boss", 
    points = 10,
    id = 73137,
    trigger = Level() == Level1 && GameEnd()
)

achievement(
    title = "Taste of Power", 
    description = "Clear level 4 with 100+ power",
    points = 10, 
    id = 73138,
    trigger = Level() == Level4 && LevelEnd() && Power() >= 100
)

achievement(
    title = "Hour of Power",
    description = "Clear level 3 with 100+ power",
    points = 10,
    id = 73139,
    trigger = Level() == Level3 && LevelEnd() && Power() >= 100
)

achievement(
    title = "Powered Armor", 
    description = "Clear level 2 with 100+ power",
    points = 10,
    id = 73140,
    trigger = Level() == Level2 && LevelEnd() && Power() >= 100
)

achievement(
    title = "Cyborg Power", 
    description = "Clear level 1 with 150+ power credits", 
    points = 10,
    id = 73141,
    trigger = once(PowerCredits(150)) && NeverPowerCreditsLessThan149() && trigger_when(Level() == Level1 && GameEnd())
)
achievement(
    title = "Logic Gate Analysis", 
    description = "Clear level 4 in 10 steps or less [5 NS - 5 EW]", 
    points = 10,
    id = 73146,
    trigger = once(LevelStart()) && never(RowA() == 30) && never(Level() != Level4) && never(Steps(10)) && trigger_when(LevelEnd())
)

achievement(
    title = "Elimination Grid", 
    description = "Clear level 3 in 10 steps or less [5 NS - 5 EW]", 
    points = 10, 
    id = 73147,
    trigger = once(LevelStart()) && never(RowA() == 30) && never(Level() != Level3) && never(Steps(10)) && trigger_when(LevelEnd())
)

achievement(
    title = "Ockham's Razor",
    description = "Clear level 2 in 10 steps or less [5 NS - 5 EW]", 
    points = 10,
    id = 73148,
    trigger = once(LevelStart()) && never(RowA() == 30) && never(Level() != Level2) && never(Steps(10)) && trigger_when(LevelEnd())
)

achievement(
    title = "Mastermind",
    description = "Clear level 1 in 10 steps or less [5 NS - 5 EW]", 
    points = 10,
    id = 73149,
    trigger = once(LevelStart()) && never(RowA() == 30) && never(Level() != Level1) && never(Steps(10)) && trigger_when(GameEnd())
)

achievement(
    title = "Robonaut",
    description = "Access all rooms in level 4",
    points = 25,
    id = 73150,
    trigger = never(Level() != Level4) && measured(RoomCount())
)

achievement(
    title = "Pioneer", 
    description = "Access all rooms in level 3",
    points = 25, 
    id = 73151,
    trigger = never(Level() != Level3) && measured(RoomCount())
)

achievement(
    title = "Rover",
    description = "Access all rooms in level 2",
    points = 25,
    id = 73152,
    trigger = never(Level() != Level2) && measured(RoomCount())
)

achievement(
    title = "Voyager",
    description = "Access all rooms in level 1",
    points = 25,
    id = 73153,
    trigger = never(Level() != Level1) && measured(RoomCount())
)
achievement(
    title = "Power Conservation",
    description = "Accumulate 115 power credits without an emergency recharge", 
    points = 10, 
    id = 73142,
    trigger = once(GameStart()) && trigger_when(PowerCredits(115)) && never(PlayerRecharge())
)

achievement(
    title = "Balance of Power", 
    description = "Accumulate 230 power credits without an emergency recharge",
    points = 10,
    id = 73143,
    trigger =  once(GameStart()) && trigger_when(PowerCredits(230)) && never(PlayerRecharge())
)

achievement(
    title = "Power Source",
    description = "Accumulate 350 power credits total before game's end",
    points = 25,
    id = 73144,
    trigger = Level() >= Level4 && Level() <= Level1 && PowerCredits(350)
)

achievement(
    title = "Power Overwhelming",
    description = "Accumulate 500 power credits total before game's end",
    points = 25,
    id = 73145,
    trigger = Level() >= Level4 && Level() <= Level1 && PowerCredits(500)
)

achievement(
    title = "Cyborg Knight",
    description = "Defeat a dragon", 
    points = 5,
    trigger = RoomType() == 4 && MonsterDefeated()
)

achievement(
    title = "Quick Draw", 
    description = "Defeat 3 monsters in a row without taking damage or an emergency recharge", 
    points = 5,
    trigger = never(PlayerHit()) && never(PlayerRecharge()) && measured(repeated(3, MonsterDefeated()))
)


achievement(
    title = "Robot Reflexes", 
    description = "Defeat 5 monsters in a row without taking damage or an emergency recharge", 
    points = 10,
    trigger = never(PlayerHit()) && never(PlayerRecharge()) && measured(repeated(5, MonsterDefeated()))
)

achievement(
    title = "Quickest Gun on the Grid", 
    description = "Defeat 10 monsters in a row without taking damage or an emergency recharge", 
    points = 25,
    trigger = never(PlayerHit()) && never(PlayerRecharge()) && measured(repeated(10, MonsterDefeated()))
)

//-------------------------------------------------------------------------------
// Rich Presence

rich_presence_conditional_display(Level() == 128, "Enjoing the title screen")

rich_presence_conditional_display(Level() == 252, "Listening for briefing before starting an adventure")

rich_presence_conditional_display(X() == 0 && Y() == 0, 
    "At the item shop on level {0}",
    rich_presence_lookup("Stage", Level(), StageLookup)
)

rich_presence_conditional_display(RoomType() <= 0x3, "{0} {1} on level {2}",
    rich_presence_lookup("Aggressive", AggressiveRobot(), AggressiveLookup),
    rich_presence_lookup("Robot", (RoomType() * 25) + (Y() * 5) + X(), RobotNames),
    rich_presence_lookup("Stage", Level(), StageLookup)
)

rich_presence_conditional_display(RoomType() == 0x4, 
    "Fighting a dragon on level {0}",
    rich_presence_lookup("Stage", Level(), StageLookup)
)

rich_presence_conditional_display(RoomType() == 0x6, 
    "Exploring the grid on level {0}",
    rich_presence_lookup("Stage", Level(), StageLookup)
)

rich_presence_display("Exploring level {0}",
    rich_presence_lookup("Stage", Level(), StageLookup)
)
