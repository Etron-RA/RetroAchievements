// ~Hack~ Vegetable Valley Nightmare
// #ID = 6392

// $004E: Power Up State [8-bit]
//        
//        40 = Have Power Up
//        41 = No Power Up
//        47 = CLEAR
function PowerUpState() => byte(0x00004E)

// $0191 pallet: 30=drawing, f=title/story/paused, 7=demo/gameplay, 13=start,
function Pallet() => byte(0x0191)

// $055e: Current Screen [8-bit]
//        00 = Hub
//        19 = Museum Room
//        2b = Level 1 Room 1
//        2c = Level 1 Room 2
//        2d = Level 1 Room 3
//        2f = Level 2 Room 1
//        31 = Level 2 Room 2
//        32 = Level 2 Room 3
//        33 = Level 2 Room 4
//        35 = Level 3 Room 1
//        36 = Level 3 Room 2
//        37 = Level 3 Room 3
//        38 = Level 3 Room 4
//        39 = Level 4 Room 1
//        3a = Level 4 Room 2
//        3b = Level 4 Room 3
//        3c = Level 4 Room 4
//        43 = Level 4 Room 5
//        08 = Boss Room
function CurrentScreen() => byte(0x00055e)

// $0570: Current Map in Stage [8-bit]
function CurrentMapInStage() => byte(0x000570)

// $057B: Screen X Position [8-bit]
function ScreenXPosition() => byte(0x00057B)

// $057C: Screen Y Position [8-bit]
function ScreenYPosition() => byte(0x00057C)

// $058F: Game Pause
//        
//        00 = Game Paused
function GamePause() => byte(0x00058F)

// $0593: Score [16-bit]
//        
//        Not using, cause can be cheesed too easy
function Score() => word(0x000593)

// $0597: Health [8-bit]
//        
//        2f = 6 HP
//        27 = 5 HP
//        1f = 4 HP
//        17 = 3 HP
//        0f = 2 HP
//        07 = 1 HP
//        ff = Dead
function Health() => byte(0x000597)

// $0598: Temporary Powers
//        
//        Mic,Crash, Light
function TemporaryPowers() => byte(0x000598)

// $0599: Lives [8-bit]
//        
//        00 = Default
//        ff= Game Over
//        04 = If you die and try to restart
function Lives() => byte(0x000599)

// $05E1: Move being used [8-bit]
//        
//        0c = Blowing Water
//        0d = Flying
function MoveBeingUsed() => byte(0x0005E1)

// $05E3: Current Ability [8-bit]
//        
//        ff = NORMAL
//        00 = FIRE
//        01 = SPARK
//        02 = CUTTER
//        03 = SWORD
//        04 = FIREBALL
//        0d = FREEZE
//        0f = BEAM
//        13 = CRASH
function CurrentAbility() => byte(0x0005E3)

// $0782: Sound Effects
//        
//        12 = Pick Up Item
function SoundEffects() => byte(0x000782)

// $0783: Music [8-bit]
//        
//        00 = Hub Area and Level 3
//        03 = Level 1
//        07 = CLEAR
//        0b = Game Over
//        35 = Title Screen
function Music() => byte(0x000783)

// $603D: Frame Rate
function FrameRate() => byte(0x00603D)

// $61D3: Boss HP [8-bit]
//        
//        1 Bar every 4
function BossHp() => byte(0x0061D3)


achievement(
    title = "Speed Demon", points = 25,
    description = "Beat the game in under 5 minutes. (Good Luck)",
    id = 218731, badge = "242028", published = "2022-05-16 3:02:37 AM", modified = "2022-05-16 5:42:07 PM",
    trigger = unless(once(Lives() > 0)) &&
        unless(once(prev(Health()) < 47)) &&
        unless(repeated(5,
            MoveBeingUsed() != prev(MoveBeingUsed()) && 
            MoveBeingUsed() == 13)) &&
        prev(PowerUpState()) != 71 && 
        trigger_when(PowerUpState() == 71) && 
        trigger_when(CurrentScreen() == 0x8) &&
        unless(repeated(18000, always_true())) &&
        (always_false() || (never(Music() == 53)))
)

leaderboard(
    id = 34794, title = "Speed Demon",
    description = "Beat the game as fast as possible, no restrictions",
    start  = Music() == 0 && 
             Pallet() == 19,
    cancel = (Music() == 53 ||
              Music() == 11),
    submit = prev(PowerUpState()) != 71 && 
             PowerUpState() == 71 &&
             CurrentScreen() == 0x8,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 34795, title = "True Speed Demon Ultra",
    description = "Beat the game as fast as possible, without taking a hit, or flying more than 4 times.",
    start  = Music() == 0 &&
             Pallet() == 19,
    cancel = ((Music() == 53) ||
              (Music() == 11) ||
              (Lives() > 0) ||
              (prev(Health()) < 47) ||
              (repeated(5, MoveBeingUsed() != prev(MoveBeingUsed()) && MoveBeingUsed() == 13))),
    submit = prev(PowerUpState()) != 71 && 
             PowerUpState() == 71 &&
             CurrentScreen() == 0x8,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
