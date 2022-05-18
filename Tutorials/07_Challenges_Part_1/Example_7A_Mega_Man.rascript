// Mega Man
// #ID = 1448

// $001B: Universal stage scrolling progress big parts
function StageBombmanBoss() => byte(0x00001B) == 22

// $0031: Stage id
function StageID() => byte(0x000031)

// $0041: Solid pause
function SolidPause() => byte(0x000041) == 1

// $006A: Health
function Health() => byte(0x00006A)

// $00BB: Stage clear flag
function StageClear() => byte(0x0000BB) == 1

// Start at the beginning of the Bombman boss fight
bombmanDamagelessStart = once(StageBombmanBoss())

// Cancel if not Bombman Stage, health lost, or the pause glitch used
bombmanDamagelessCancel = never(StageID() != 2) &&
    never(Health() < prev(Health())) &&
    never(SolidPause())

// Submit when the stage is cleared
bombmanDamagelessSubmit = trigger_when(StageClear())

achievement(
    title = "Example 7A: Blue Bomber",
    description = "Defeat Bombman without taking damage (pause glitch not allowed)", 
    points = 10,
    trigger = bombmanDamagelessStart && bombmanDamagelessCancel && bombmanDamagelessSubmit
)
