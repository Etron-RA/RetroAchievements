// Mega Man
// #ID = 1448

// $001B: Universal stage scrolling progress big parts
function StageStart() => byte(0x00001B) == 1

// $0031: Stage id
function StageID() => byte(0x000031)

// $0036: [8-bit] Stage Select (0xbd when selecting stage)
function StageSelect() => byte(0x000036) == 0xbd

// $006B: Amount of Rolling Cutter left
function RollingCutterAmmo() => byte(0x00006B)

// $006C: Amount of Ice Slasher left
function IceSlasherAmmo() => byte(0x00006C)

// $006D: Amount of Hyper Bomb left
function HyperBombAmmo() => byte(0x00006D)

// $006E: Amount of Fire Storm left
function FireStormAmmo() => byte(0x00006E)

// $006F: Amount of Thunder Beam left
function ThunderBeamAmmo() => byte(0x00006F)

// $0070: Amount of Power Arm left
function PowerArmAmmo() => byte(0x000070)

// $0071: Amount of Magnet Beam left
function MagnetBeamAmmo() => byte(0x000071)

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
bombmanBusterStart = [StageStart()]

// Cancel if not Bombman Stage, on stage selection screen, or any weapon other than the Mega Buster is used
bombmanBusterCancel = [
    StageID() != 2, 
    StageSelect(), 
    prev(RollingCutterAmmo()) > RollingCutterAmmo(), 
    prev(IceSlasherAmmo()) > IceSlasherAmmo(), 
    prev(HyperBombAmmo()) > HyperBombAmmo(), 
    prev(FireStormAmmo()) > FireStormAmmo(), 
    prev(ThunderBeamAmmo()) > ThunderBeamAmmo(), 
    prev(PowerArmAmmo()) > PowerArmAmmo(),     
    prev(MagnetBeamAmmo()) > MagnetBeamAmmo()
]

// Submit when the stage is cleared
bombmanBusterSubmit = [StageClear()]

achievement(
    title = "Example 7C: Master of the Robot Busters (B)",
    description = "Play through the whole Bombman's Stage using only Mega Buster",
    points = 10,
    trigger = Challenge(bombmanBusterStart, bombmanBusterCancel, bombmanBusterSubmit)
)
