// Sonic the Hedgehog
// #ID = 1

//------------------------------------------------------------------------
// Memory Variables

// $F601: [8-bit] Stage type
//        0x10 = special
//        0x0C = normal?
StageType = byte(0xF601)

// $FE10: [16-bit] Current Act and Zone Together
Level = word(0xFE10)

// $FE17: [8-bit] Current special stage
//        0 = White Emerald
//        1 = Blue Emerald
//        2 = Yellow Emerald
//        3 = Purple Emerald
//        4 = Green Emerald
//        5 = Red Emerald
SpecialStage = byte(0xFE17)

// $FE20: [8-bit] Ring counter
Rings = byte(0xFE20)

// $FE56: [8-bit] Chaos Emeralds Count (range 0-6)
ChaosEmeralds = byte(0xFE56)

// $FFE1: [8-bit] Level Select Active (0 = not active)
LevelSelect = byte(0xFFE1)

// $FFF0: [8-bit] Demo Mode Active (0 = not active)
DemoMode = byte(0xFFF0)

// $FFFB: [8-bit] Debug Mode active (0 = not active)
DebugMode = byte(0xFFFB)

//------------------------------------------------------------------------
// Helper Function

// Check if we are in a normal stage
function InNormalStage() => StageType == 0xC

// Check if we are in a special stage
function InSpecialStage() => StageType == 0x10

// Check for the transition  between two levels
function Transition(last, next) => prev(Level) == last && Level == next

// The Active function handles the level select, debug, and demo checks.
// This function should be added to each achievement for cheat protection
function Active()
{
    return LevelSelect == 0 &&
        DemoMode == 0 &&
        DebugMode == 0
}

//------------------------------------------------------------------------
// Example 1A - Ring Collection

// Create an achievement for when the player collects X rings
function CollectRings(count)
{
    achievement(
        title = "Example 1A: " + count + " Rings",
        description = "Collect " + count + " Rings",
        points = 0,
        trigger = Active() && 
            InNormalStage() &&
            Rings >= count
    )
}

// Create 3 tiered achievements for collecting rings
CollectRings(15)
CollectRings(100)
CollectRings(200)

//------------------------------------------------------------------------
// Example 1B - Level Transistions

// Shortcut variables for each level
GreenHillZoneAct1 = 0x0000
GreenHillZoneAct2 = 0x0001
GreenHillZoneAct3 = 0x0002
MarbleZoneAct1 = 0x0200
MarbleZoneAct2 = 0x0201
MarbleZoneAct3 = 0x0202
SpringYardZoneAct1 = 0x0400
SpringYardZoneAct2 = 0x0401
SpringYardZoneAct3 = 0x0402
LabyrinthZoneAct1 = 0x0100
LabyrinthZoneAct2 = 0x0101
LabyrinthZoneAct3 = 0x0102
StarLightZoneAct1 = 0x0300
StarLightZoneAct2 = 0x0301
StarLightZoneAct3 = 0x0302
ScrapBrainZoneAct1 = 0x0500
ScrapBrainZoneAct2 = 0x0501
ScrapBrainZoneAct3 = 0x0103
FinalZone = 0x0502
EndGame = 0x0601

// Create an achievement for when the player transistions between levels
function ZoneComplete(zone, last, next)
{
    achievement(
        title = "Example 1B: " + zone,
        description = "Complete " + zone,
        points = 0,
        trigger = Active() && Transition(last, next)
    )
}

// Create all of the progression achievements
ZoneComplete("Green Hill Zone", GreenHillZoneAct3, MarbleZoneAct1)
ZoneComplete("Marble Zone", MarbleZoneAct3, SpringYardZoneAct1)
ZoneComplete("Spring Yard Zone", SpringYardZoneAct3, LabyrinthZoneAct1)
ZoneComplete("Labyrinth Zone", LabyrinthZoneAct3, StarLightZoneAct1)
ZoneComplete("Star Light Zone", StarLightZoneAct3, ScrapBrainZoneAct1)
ZoneComplete("Scrap Brain Zone", ScrapBrainZoneAct3, FinalZone)
ZoneComplete("Final Zone", FinalZone, EndGame)

//------------------------------------------------------------------------
// Example 1C - Chaos Emeralds

SpecialStageWhiteEmerald = 0
SpecialStageBlueEmerald = 1
SpecialStageYellowEmerald = 2
SpecialStagePurpleEmerald = 3
SpecialStageGreenEmerald = 4
SpecialStageRedEmerald = 5

// Homework #1
// Using the memory addresses provided in this example make a function that
// can generate achievements for collecting each chaos emeralds