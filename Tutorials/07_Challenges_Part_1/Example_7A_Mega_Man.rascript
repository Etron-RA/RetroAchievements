// Mega Man
// #ID = 1448

// $001B: Universal stage scrolling progress big parts
function StageBoss() => byte(0x00001B) == 22

// $0031: Stage id
function StageID() => byte(0x000031)

// $0041: Solid pause
function SolidPause() => byte(0x000041) == 1

// $006A: Health
function Health() => byte(0x00006A)

// $00BB: Stage clear flag
function StageClear() => byte(0x0000BB) == 1

// Uses once to start the challenge, never to cancel the challenge, and trigger_when to submit challenge
function Challenge(start, cancel, submit)
{
    return any_of(start, s => once(s)) && 
        all_of(cancel, c => never(c)) && 
        all_of(submit, s => trigger_when(s))
}

// Start at the beginning of the stage
bombmanDamagelessStart = [StageBoss()]

// Cancel if not Bombman Stage, health lost, or the pause glitch used
bombmanDamagelessCancel = [
    StageID() != 2, 
    Health() < prev(Health()), 
    SolidPause()
]

// Submit when the stage is cleared
bombmanDamagelessSubmit = [StageClear()]

achievement(
    title = "Example 7A: Blue Bomber",
    description = "Defeat Bombman without taking damage (pause glitch not allowed)", 
    points = 10,
    trigger = Challenge(bombmanDamagelessStart, bombmanDamagelessCancel, bombmanDamagelessSubmit)
)
