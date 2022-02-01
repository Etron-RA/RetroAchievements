// Sonic the Hedgehog
// #ID = 1

//------------------------------------------------------------------------
// Memory Variables

// $F601: stage number/ type
//        0x10 = special
//        0x0C = normal?
StageType = byte(0xF601)

// $FE10: 16-bit Current Act and Zone Together
Level = word(0xFE10)

// $FE20: 8-bit - Ring counter
Rings = byte(0xFE20)

// $FFE1: Level Select active
LevelSelect = byte(0xFFE1)

// $FFF0: Demo Mode Active
DemoMode = byte(0xFFF0)

// $FFFB: Debug Mode active
DebugMode = byte(0xFFFB)

//------------------------------------------------------------------------
// Helper Function

// Check if we are in a normal level
function NormalLevel() => StageType == 0xC

// Check for the transistion between two levels
function Transistion(last, next) => prev(Level) == last && Level == next

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
            NormalLevel() &&
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
        trigger = Active() && Transistion(last, next)
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