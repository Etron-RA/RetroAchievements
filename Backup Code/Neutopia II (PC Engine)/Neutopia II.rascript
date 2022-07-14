// Neutopia II
// #ID = 2310

// $05A0: 01 is demo
function Demo() => byte(0x5A0)

// $0A62: [8-bit] Boss sprite 1 health
function BossHealth1() => bit7(0x000A62)

// $0A63: [8-bit] Boss sprite 2 health
function BossHealth2() => bit7(0x000A63)

// $0A64: [8-bit] Boss sprite 3 health
function BossHealth3() => bit7(0x000A64)

// $0A65: [8-bit] Boss sprite 4 health
function BossHealth4() => bit7(0x000A65)

// $0A66: [8-bit] Boss sprite 5 health
function BossHealth5() => bit7(0x000A66)

// $0A67: [8-bit] Boss sprite 6 health
function BossHealth6() => bit7(0x000A67)

// $0A68: [8-bit] Boss sprite 7 health
function BossHealth7() => bit7(0x000A68)

// $0A69: [8-bit] Boss sprite 8 health
function BossHealth8() => bit7(0x000A69)

// $0A6A: [8-bit] Boss sprite 9 health
function BossHealth9() => bit7(0x000A6A)

// $1E33: health
function Health() => byte(0x001E33)

// $1E88: [16-bit] Room ID
//        Mechaworm boss room = 0x1400
//        Mechaworm ready room = 0x401
//        Maggot Moths boss room = 0x2b02
//        Maggot Moths ready room = 0x1b03
//        Weretoad boss room = 0xd205
//        Weretoad ready room = 0xc206
//        Roboid boss room = 0xcf07
//        Roboid ready room = 0xcf07
//        Karken boss room = 0x7b09
//        Karken ready room = 0x6b0a
//        Medusa boss room = 0x2000
//        Medusa ready room = 0x1005
//        Salamander boss room = 0x7c07
//        Salamander ready room = 0x8c06
//        Zarbon boss room = 0x7d09
//        Zarbon ready room = 0x8d08
//        Sorfloid boss room = 0xb0b
//        Sorfloid ready room = 0x1b0a
//        Dirth boss room = 0x7b10
//        Dirth ready room = 0x8b0c
function Room() => word(0x001E88)

// Ticket 49319: I keep beating this boss, but it’s not popping. I had an issue with the Damageless Medusa achievement
//               as well; had to do it twice.
//               RetroAchievements Hash: Unknown
//               Emulator: RALibRetro (SuperGrafx)
//               Emulator Version: I don’t know
achievement(
    title = "Sorfloid", description = "Defeat the ninth boss.", points = 10,
    id = 145193, badge = "162016", published = "2021-03-11 5:05:57 PM", modified = "2021-11-21 7:46:17 AM",
    trigger = Room() == 0xb0b && 
        Demo() != 1 && 
        (
             prev(BossHealth1()) < BossHealth1() ||
             prev(BossHealth2()) < BossHealth2() ||
             prev(BossHealth3()) < BossHealth3() ||
             prev(BossHealth4()) < BossHealth4() ||
             prev(BossHealth5()) < BossHealth5() ||
             prev(BossHealth6()) < BossHealth6() ||
             prev(BossHealth7()) < BossHealth7() ||
             prev(BossHealth8()) < BossHealth8() ||
             prev(BossHealth9()) < BossHealth9()
        )
    
)

achievement(
    title = "Bested Sorfloid", description = "Defeat the ninth boss without getting hit.", points = 25,
    id = 145194, badge = "162017", published = "2021-03-11 5:06:02 PM", modified = "2021-11-21 7:46:13 AM",
    trigger = once(prev(Room()) == 0x1b0a && Room() == 0xb0b) &&
        never(Room() != 0xb0b) && 
        never(Health() < prev(Health())) && 
        trigger_when(
            prev(BossHealth1()) < BossHealth1() ||
             prev(BossHealth2()) < BossHealth2() ||
             prev(BossHealth3()) < BossHealth3() ||
             prev(BossHealth4()) < BossHealth4() ||
             prev(BossHealth5()) < BossHealth5() ||
             prev(BossHealth6()) < BossHealth6() ||
             prev(BossHealth7()) < BossHealth7() ||
             prev(BossHealth8()) < BossHealth8() ||
             prev(BossHealth9()) < BossHealth9()
        )        
)
