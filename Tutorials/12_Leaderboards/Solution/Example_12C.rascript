// Doom
// #ID = 11256

// $077E10: Map ID
function MapId() => byte(0x077E10)

// $077dc8: Results Screen
//          01 = Activated (Also at Main Menu)
function ResultScreen() => byte(0x077dc8)

// $07814C: Game Timer 32-bit
//          (Reset to 0 when the game load a level)
function GameTimer() => dword(0x07814C)

// $078258: Current Difficulty
function Difficulty() => byte(0x078258)

// $08656A: Loading...
//          10= On screen
function Loading() => byte(0x08656A)

// $086763: [8-bit] Password Screen (0x64 = on password screen)
function PasswordScreen() => byte(0x086763)

// $09874d: Intermission Screen Background
//          01 = Activated
function IntermissionScreen() => byte(0x09874d)

// $098740: Last HUD Text ID (16-bit)
//          10b0 = All powerful mode on
//          10e0= Lots of goodies!
//          52c= You got the BFG9000!  Oh, yes.
//          5bc= You got the shotgun!
//          5d4= You got the supershotgun!
//          54c= You got the chaingun!
//          564= A chainsaw! Find some meat!
//          584= You got the rocket launcher!
//          5a4= You got the plasma gun!
function LastHudText() => word(0x098740)

// $098744: HUD Text Timer in screen
function HudTextTimerInScreen() => byte(0x098744)

// $0A88AC: Cheats
//          Bit1= God Mode
//          Bit2= Full Map
//          Bit3= Show All Things on the Map
//          Bit5= Level Warping
//          Bit7= Invisible Walls
function Cheats() => byte(0x0A88AC)

/// Helper Functions ////////////////////////////////////////////////////////////

// Start when mapid = current map, no intermission or load screen, 
// on Hurt me Plenty difficulty or higher, and the game timer has started
function StartMap(map)
{
    return MapId() == map &&
        Difficulty() >= 2 &&
        ResultScreen() == 0 &&
        IntermissionScreen() == 0 &&
        prev(GameTimer()) == 0 && 
        GameTimer() == 2
}

// End when mapid = current map and the results screen is shown
function EndMap(map)
{
    return MapId() == map &&
        prev(ResultScreen()) == 0 && 
        ResultScreen() == 1
}

// Cancel when the loading screen appears, or any cheat are used
function GoodiesCheat() => HudTextTimerInScreen() == 1 && LastHudText() == 0x0010e0
function CheatsBitflags() => Cheats() != 0

// Submit when main menu is open
function MainMenu() => MapId() == 0x0

// Cancel when entering a password
function PasswordEntry()
{
    return PasswordScreen() == 0x64 && 
    prev(Loading()) != 0x10 && 
    Loading() == 0x10
}

// Level name constants
firstDoom1Level = 0x1
firstDoom2Level = 0x1f 
lastDoom1Level = 0x1e 
lastDoom2Level = 0x36

/// Leaderboards ////////////////////////////////////////////////////////////
leaderboard
(
   "Ultimate Doom Speedrun",
   "Quickest time to beat Ultimate Doom on Hurt Me Plenty or above",
   StartMap(firstDoom1Level),
   MainMenu() || GoodiesCheat() || CheatsBitflags()  || PasswordEntry(),
   EndMap(lastDoom1Level),
   always_true(),
   format = "FRAMES",
   lower_is_better = true
)

leaderboard
(
   "Doom II Speedrun",
   "Quickest time to beat Doom II on Hurt Me Plenty or above",
    StartMap(firstDoom2Level),
   MainMenu() || GoodiesCheat() || CheatsBitflags()  || PasswordEntry(),
   EndMap(lastDoom2Level),
   always_true(),
   format = "FRAMES",
   lower_is_better = true
)