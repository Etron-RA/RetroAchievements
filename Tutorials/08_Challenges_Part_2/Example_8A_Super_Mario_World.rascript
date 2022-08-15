// Super Mario World
// #ID = 228

// $0000CE: [3 byte] 24-bit pointer to level's sprite data
function LevelPointer() => tbyte(0x0000CE)

// $000100: Game mode. Anything 00 to 0a is title screen
//          Goes from 2314 to 2315 at new game start
function GameMode() => byte(0x000100)

// $000DB2: 2 player game flag
function Player2() => byte(0x000DB2) 

// $000DD5: [00] = Default value. [01] = Beat the level using the normal exit. [02] = Beat the level using the secret exit. [80] = Exiting the level by using Start Select or by dying. [E0] = Save prompt popup in the overworld. Value only appears on levels already completed.
//          Fun Fact: Donut Ghost House has normal and secret exit in reverse.
function LevelBeat() => byte(0x000DD5)

// $000F31: [3 bytes] Time (BCD)
function TimeX00() => byte(0x000F31)
function Time0X0() => byte(0x000F32)
function Time00X() => byte(0x000F33)
function Time() 
{
    return TimeX00() * 100 +
        Time0X0() * 10 +
        Time00X()
}

// $0013BF: 8-bit Level ID
function LevelID() => byte(0x0013BF)

// $0013CF: if = 40 player is enterting stage from mid point
function MidPoint() => byte(0x0013CF)

// Shortcut for when a player starts a certian level
function StartLevel(level) 
{
    return GameMode() > 0xa &&
        Player2() == 0 &&
        LevelID() == level &&
        MidPoint() != 0x40 &&
        prev(LevelPointer()) == 0 &&
        LevelPointer() != 0
}

// Shortcut for completeing a level (defaults to normal exit)
function ExitLevel(exit = 1)
{
    return prev(LevelBeat()) == 0 &&
        LevelBeat() == exit
}

// Speedrun challenge to complete the level parameter in under the time parameter
// Start: When the player start the level parameter
// Cancels: When the player returns to the world map, title screen, or time elapses
// Submits: When the player exits the level
function LevelSpeedrun(level, time)
{
    start = once(StartLevel(level))
        
    cancel = never(GameMode() == 0) &&
        never(LevelPointer() == 0) &&
        never(Time() < time)
    
    submit = trigger_when(ExitLevel())
    
    return  start && cancel && submit
}

achievement(
     "Example #8A - Yoshi's Island 1 Speedrun",
     "Complete Yoshi's Island 1 in under 240 seconds",
     0,
     LevelSpeedrun(0x29, 240)
)
