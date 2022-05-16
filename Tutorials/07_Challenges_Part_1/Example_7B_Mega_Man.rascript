// Mega Man
// #ID = 1448

// $001B: Universal stage scrolling progress big parts
function StageStart() => byte(0x00001B) == 1

// $0031: Stage id
function StageID() => byte(0x000031)

// $0036: [8-bit] Stage Select (0xbd when selecting stage)
function StageSelect() => byte(0x000036) == 0xbd

// $0041: Solid pause
function SolidPause() => byte(0x000041) == 1

// $0071: Ammount of Magnet Beam left
function MagnetBeamAmmo() => byte(0x000071)

// $00A6: Lives
function Lives() => byte(0x0000A6)

// $00BB: Stage clear flag
function StageClear() => byte(0x0000BB) == 1

// Uses once to start the challenge, never to cancel the challenge, and trigger_when to submit challenge
// Each of the parameters are arrays of conditions
function Challenge(start, cancel, submit)
{
    return any_of(start, s => once(s)) && 
        all_of(cancel, c => never(c)) && 
        all_of(submit, s => trigger_when(s))
}

// Start at the beginning of the stage
bombmanDeathlessStart = [StageStart()]

// Cancel if not Bombman Stage, on stage selection screen, life lost, pause glitch used, or magnet gun used
bombmanDeathlessCancel = [
    StageID() != 2, 
    StageSelect(), 
    prev(Lives()) > Lives(), 
    SolidPause(), 
    prev(MagnetBeamAmmo()) > MagnetBeamAmmo()
]

// Submit when the stage is cleared
bombmanDeathlessSubmit = [StageClear()]

achievement(
    title = "Example 7B: MM1 Survivalist I (Bombman)", 
    description = "Complete Bombman's Stage without losing a life, pausing, or Magnet Beam (Weapon Menu is OK)", 
    points = 5,    
    trigger = Challenge(bombmanDeathlessStart, bombmanDeathlessCancel, bombmanDeathlessSubmit)
)
