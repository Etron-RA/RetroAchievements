// RoboCop 3
// #ID = 1915

// $0003: Stages
function Stages() => byte(0x000003)

// $0028: blue ninja off screen = 0 ---8-bit
function BlueNinjaOffScreen() => byte(0x000028)

// $008F: Stage segments...goes linear 1,2,3 --  8-bit
function StageSegments() => byte(0x00008F)

// $03C6: On-Screen Enemy Health 1
function OnScreenEnemyHealth1() => byte(0x0003C6)

// $06A0: Head Efficiency %
function HeadEfficiency() => byte(0x0006A0)

// $06A1: Chest Efficiency %
function ChestEfficiency() => byte(0x0006A1)

// $0775: start of high score initials - 8 bit
function StartOfHighScoreInitials8Bit() => byte(0x000775)

// $08A0: END = 22 dialogue screen = a6 game over = 3a robocop "boot sequence" = 5D start screen = 87 ---8-bit
function End() => byte(0x0008A0)

// $0E3E: Health
function Health() => byte(0x000E3E)

// Ticket 47183: I got damaged by ninja, but after ninja is dead, I walked to the right (screen scrolled to right),
//               cheevo popped.
//               RetroAchievements Hash: 7492ea7116258971c1c71c95ebe0d6ca
//               Emulator: RALibRetro (FCEUMM)
//               Emulator Version: 1.3.10
achievement(
    title = "Blue Ninja (zero damage) [m]", points = 10,
    description = "Defeated 1st blue ninja without being damaged after engaging",
    id = 112432, badge = "122518", published = "2020-06-05 2:11:39 PM", modified = "2020-06-17 6:40:31 AM",
    trigger = once(
                Stages() == 1 &&
                prev(StageSegments()) == 4 &&
                StageSegments() == 5 
              ) && 
              trigger_when(
                prev(OnScreenEnemyHealth1()) != 0 && 
                OnScreenEnemyHealth1() == 0
              ) &&
              never(Health() < prev(Health())) && 
              never(Stages() != 1) &&
              never(StageSegments() != 5) && 
              never(End() == 166) && 
              never(End() == 58) && 
              never(End() == 135)
)

// Ticket 50661: не работает
//               RetroAchievements Hash: Unknown
//               Emulator: RANes
//               Emulator Version: 1.2
achievement(
    title = "Offer Up Your Highscore", points = 1,
    description = "Tribute to Murphy in the top highscore spot",
    id = 112444, badge = "124319", published = "2020-06-05 2:12:17 PM", modified = "2020-06-12 11:53:14 PM",
    trigger = StartOfHighScoreInitials8Bit() == 13 && byte(0x000776) == 21 && byte(0x000777) == 18 && byte(0x000778) == 16 && 
              byte(0x000779) == 8 && byte(0x00077A) == 25 &&
              ((End() == 135 && prev(End()) == 34) ||
               (End() == 166 && prev(End()) == 34) ||
               (prev(End()) == 58 && End() == 34))
)
