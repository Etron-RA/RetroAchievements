// Super Mario World
// #ID = 228

// $000100: Game mode. Anything 00 to 0a is title screen
//          As a word is goes from 2314 to 2315 at new game start
function GameMode() => byte(0x000100)
function GameModeWord() => word(0x000100)

// $000DB2: 2 player game flag
function Player2() => byte(0x000DB2) 

// $0013BF: 8-bit Level ID
function LevelID() => byte(0x0013BF)

// $0013F9: Mario's layer (3 = game end)
function MariosLayer() => byte(0x13F9)

// $001F2E: Stages Cleared
function StagesCleared() => byte(0x001F2E)

// Shortcut for when a player starts a new game file
function NewGame() 
{
    return prev(GameModeWord()) == 2314 && 
        GameModeWord() == 2315 && 
        StagesCleared() == 0 && 
        Player2() == 0
}

// Shortcut for when a player beats bowser and wins the game
function EndGame()
{
    return StagesCleared() > 0 &&
        LevelID() == 49 && 
        MariosLayer() == 3 && 
        GameMode() == 2
}

// Converts the time minutes:seconds:frames to frames (1/60s each)
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Speedrun challenge to complete Super Mario World in under the time parameter
// Start: When the player creates a new game file
// Cancels: When the player returns to the title screen on time elapses
// Submits: When the player defeats bowser
function WorldSpeedrun(time)
{
    start = once(NewGame())
        
    cancel = never(GameMode() == 0) &&
        never(repeated(time, GameMode() > 0x0a))
    
    submit = trigger_when(EndGame())
    
    return  start && cancel && submit
}

achievement(
     "Example #8B - World Speedrun",
     "Defeat Bowser (front door) starting from a new save game file in under 16 minutes",
     0,
     WorldSpeedrun(TimeSpan(16,0,0))
)
