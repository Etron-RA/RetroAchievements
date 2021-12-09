// Punisher, The
// #ID = 11787

// $17FC: Boss slowdown counter
function BossSlowdown() => high4(0x0017FC)
// $184E: Target 0d=Kingpin
function Target() => byte(0x00184E)
// $5AFB: Stage Scroll position (big part)
// $5AFC: Stage Scroll position (seems to be unique)

// $5B3C: Players active
//        bit0=P1 (Punisher)
//        bit1=P2 (Nick Fury)
function PlayerActive() => bit1(0x005B3C)
// $5B41: Game active flag
function GameActive() => byte(0x005B41)
// $5B42: System Configuration - Number of players
function NumberPlayers() => byte(0x005B42)
// $5B45: System Configuration - Difficulty
function Difficulty() => byte(0x005B45)
// $5B52: System Configuration - Extend
function Extend() => byte(0x005B52)
// $5BA2: P1 Enemies defeated
function P1Enemies() => word(0x005BA2)
// $5BA5: P1 Lives
function P1Lives() => byte(0x005BA5)
// $5BAA: P1 Score 00XX0000
// $5BAB: P1 Score XX000000
// $5BAD: P1 Score 0000XX00
// $5BB8: Stage
function Stage() => byte(0x005BB8)
// $5BBA: Player lock
// $5BCB: P1 Grenades
// $5FA0: Stage clear trigger
// $5FBA: P1 Items picked up
function P1Items() => byte(0x005FBA)
// $6013: Stage Section
function StageSection() => byte(0x006013)
// $6017: Number of points in bonus game
// $8E74: P1 Action
//        18=sonic kick
//        24=duck and cover grenade
//        2c=izuna drop
//        30=super izuna drop
//        6c=wall rebound jump kick
//        7c=air grenade
function P1Action() => byte(0x008E74)
// $8E9E: P1 Health
function P1Health() => byte(0x008E9E)
// $8E9F: KO flag
// $8EB4: Invincibility counter
// $8EBD: Grapple flag
function Grapple() => byte(0x008EBD)
// $8ECC Weapon held
//         01=knife
//         02=thug
//         05=Kingpin
function WeaponHeld() => byte(0x8ecc)
// $8F24: Projectile flag
//        10=shooting with gun
//        08=throwing knife, shuriken, stone, dynamite, pretty head
//        04=throwing fire, shootinguzi and rifle
// $8F2D: Desperate move flag
// $97E9: Grenade program flag?

StageLookup = {
    0x0: "🚩1:Back to the War",
    0x1: "🚩2:Raid on Pantaberde",
    0x2: "🚩3:Waterfront Warfare",
    0x3: "🚩4:Death On Rails",
    0x4: "🚩5:Kingpin's Wrath",
    0x5: "🚩6:Final Punishment",
    0x6: "Bonus Stage",
    0x7: "Bonus Stage",
}

function Fixed()
{
    achievement(
        title = "Izuna Encounter", description = "Defeat 10 enemies using Super Izuna Drop (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60788, badge = "63846", published = "5/30/2018 4:40:29 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = unless(GameActive() == 0) &&
                  never(PlayerActive() == 1) &&
                  never(NumberPlayers() < 2) && 
                  never(Extend() == 0) && 
                  never(Difficulty() < 3) && 
                  measured(repeated(10,                       
                      prior(P1Action()) == 0x30 &&
                      prev(P1Enemies()) < P1Enemies()
                  ))
    )

    achievement(
        title = "Chronic Sonic", description = "Defeat 10 enemies using Sonic Kick, while not grappling (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60789, badge = "63847", published = "5/30/2018 4:40:31 AM", modified = "6/2/2018 9:28:45 PM",
        trigger = unless(GameActive() == 0) &&
                  never(PlayerActive() == 1) && 
                  never(NumberPlayers() < 2) && 
                  never(Extend() == 0) && 
                  never(Difficulty() < 3) && 
                  measured(repeated(10, 
                      P1Action() == 0x18 && 
                      prev(P1Enemies()) < P1Enemies()
                  ))
    )

    achievement(
        title = "Goodnight Fat Boy!", description = "Lift Kingpin 5 times (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60795, badge = "63854", published = "5/30/2018 4:40:42 AM", modified = "1/29/2021 2:57:39 AM",
        trigger = unless(GameActive() == 0) &&
                  never(PlayerActive() == 1) && 
                  never(NumberPlayers() < 2) && 
                  never(Extend() == 0) && 
                  never(Difficulty() < 3) && 
                  never(Stage() != 5) && 
                  never(StageSection() != 4) && 
                  measured(repeated(5, 
                      WeaponHeld() == 0x5 &&
                      prev(Grapple()) != 0xFF &&
                      Grapple() == 0xFF 
                  ))
    )
    
    
    achievement(
        title = "The Parkournisher", description = "Defeat 10 enemies using Wall Rebound Jump Kick (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60787, badge = "63845", published = "5/30/2018 4:40:27 AM", modified = "10/10/2019 7:28:01 PM",
        trigger = unless(GameActive() == 0) &&
                  never(PlayerActive() == 1) && 
                  never(NumberPlayers() < 2) && 
                  never(Extend() == 0) && 
                  never(Difficulty() < 3) && 
                  measured(repeated(10, 
                      P1Action() == 0x6C &&
                      prev(P1Enemies()) < P1Enemies()
                  ))
    )
}
Fixed()

function Original()
{
    achievement(
        title = "Back to the War -Original Edition-", description = "Clear Stage 1 (P1, dif>=3, oth opt<=default)", points = 2,
        id = 60751, badge = "63808", published = "5/30/2018 4:39:03 AM", modified = "1/29/2021 2:58:23 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && never(StageSection() != 2) && BossSlowdown() == 2
    )

    achievement(
        title = "Raid on Pantaberde -Original Edition-", description = "Clear Stage 2 (P1, dif>=3, oth opt<=default)", points = 3,
        id = 60752, badge = "63809", published = "5/30/2018 4:39:06 AM", modified = "1/29/2021 2:58:21 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && never(StageSection() != 2) && BossSlowdown() == 2
    )

    achievement(
        title = "Waterfront Warfare -Original Edition-", description = "Clear Stage 3 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60753, badge = "63810", published = "5/30/2018 4:39:08 AM", modified = "6/9/2018 2:41:45 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 2) && never(StageSection() != 2) && BossSlowdown() == 2
    )

    achievement(
        title = "Death On Rails -Original Edition-", description = "Clear Stage 4 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60754, badge = "63811", published = "5/30/2018 4:39:10 AM", modified = "6/9/2018 12:43:13 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 3) && never(StageSection() != 4) && BossSlowdown() == 2
    )

    achievement(
        title = "Kingpin's Wrath -Original Edition-", description = "Clear Stage 5 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60755, badge = "63812", published = "5/30/2018 4:39:12 AM", modified = "6/9/2018 2:41:47 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 4) && never(StageSection() != 3) && BossSlowdown() == 2
    )

    achievement(
        title = "Final Punishment -Original Edition-", description = "Finish the Game (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60756, badge = "63813", published = "5/30/2018 4:39:13 AM", modified = "6/9/2018 2:41:49 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && never(StageSection() != 4) && BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher I", description = "Clear Stage 1 with full energy bar (P1, dif>=3, oth opt<=default)", points = 3,
        id = 60763, badge = "63820", published = "5/30/2018 4:39:28 AM", modified = "6/9/2018 2:41:51 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && never(StageSection() != 2) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher II", description = "Clear Stage 2 with full energy bar (P1, dif>=3, oth opt<=default)", points = 3,
        id = 60764, badge = "63821", published = "5/30/2018 4:39:29 AM", modified = "6/9/2018 2:41:52 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && never(StageSection() != 2) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher III", description = "Clear Stage 3 with full energy bar (P1, dif>=3, oth opt<=default)", points = 3,
        id = 60765, badge = "63822", published = "5/30/2018 4:39:31 AM", modified = "6/9/2018 2:41:54 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 2) && never(StageSection() != 2) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher IV", description = "Clear Stage 4 with full energy bar (P1, dif>=3, oth opt<=default)", points = 3,
        id = 60766, badge = "63825", published = "5/30/2018 4:39:34 AM", modified = "6/9/2018 2:41:55 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 3) && never(StageSection() != 4) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher V", description = "Clear Stage 5 with full energy bar (P1, dif>=3, oth opt<=default)", points = 4,
        id = 60767, badge = "63824", published = "5/30/2018 4:39:35 AM", modified = "1/29/2021 2:58:17 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 4) && never(StageSection() != 3) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Perfectionisher VI", description = "Clear Stage 6 with full energy bar (P1, dif>=3, oth opt<=default)", points = 4,
        id = 60768, badge = "63826", published = "5/30/2018 4:39:37 AM", modified = "1/29/2021 2:58:15 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && never(StageSection() != 4) && never(P1Health() != 136) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Pack-Rat-nisher I", description = "Claim at least 20 items ons Stage 1 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60769, badge = "63827", published = "5/30/2018 4:39:39 AM", modified = "5/31/2018 2:37:43 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && P1Items() >= 20
    )

    achievement(
        title = "The Pack-Rat-nisher II", description = "Claim at least 25 items ons Stage 2 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60770, badge = "63828", published = "5/30/2018 4:39:41 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && P1Items() >= 25
    )

    achievement(
        title = "The Pack-Rat-nisher III", description = "Claim at least 40 items ons Stage 3 (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60771, badge = "63829", published = "5/30/2018 4:39:43 AM", modified = "5/31/2018 2:37:47 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 2) && P1Items() >= 40
    )

    achievement(
        title = "The Pack-Rat-nisher IV", description = "Claim at least 50 items ons Stage 4 (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60772, badge = "63830", published = "5/30/2018 4:39:44 AM", modified = "1/29/2021 2:58:12 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 3) && P1Items() >= 50
    )

    achievement(
        title = "The Pack-Rat-nisher V", description = "Claim at least 70 items ons Stage 5 (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60773, badge = "63831", published = "5/30/2018 4:39:46 AM", modified = "1/29/2021 2:58:10 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 4) && P1Items() >= 70
    )

    achievement(
        title = "The Pack-Rat-nisher VI", description = "Claim at least 99 items ons Stage 6 (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60774, badge = "63832", published = "5/30/2018 4:39:48 AM", modified = "1/29/2021 2:58:09 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && P1Items() >= 99
    )

    achievement(
        title = "You're Guilty You're Dead! I (Scully)", description = "Defeat 1st Boss using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60779, badge = "63837", published = "5/30/2018 4:39:57 AM", modified = "1/29/2021 2:58:07 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && once(StageSection() == 1) && BossSlowdown() == 2 && StageSection() == 2 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! II (Guardroid)", description = "Defeat 2nd Boss using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60780, badge = "63838", published = "5/30/2018 4:39:58 AM", modified = "1/29/2021 2:58:06 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && once(StageSection() == 1) && BossSlowdown() == 6 && StageSection() == 2 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! III (Bone Breaker)", description = "Defeat 3rd Boss using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60781, badge = "63839", published = "5/30/2018 4:40:00 AM", modified = "1/29/2021 2:58:04 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 2) && once(StageSection() == 1) && BossSlowdown() == 2 && StageSection() == 2 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! IV (Bushwhacker)", description = "Defeat 4th Boss using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60782, badge = "63840", published = "5/30/2018 4:40:02 AM", modified = "1/29/2021 2:58:01 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 3) && once(StageSection() == 3) && BossSlowdown() == 2 && StageSection() == 4 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! V (Guardroid2)", description = "Defeat 5th Boss using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60783, badge = "63841", published = "5/30/2018 4:40:04 AM", modified = "1/29/2021 2:57:59 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 4) && once(byte(0x005AFB) == 4) && BossSlowdown() == 2 && StageSection() == 3 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! VI (Jigsaw)", description = "Play trough the elevator section of Stage 6 using only 1 credit and not using grenades (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60784, badge = "63842", published = "5/30/2018 4:40:06 AM", modified = "1/29/2021 2:57:57 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && once(StageSection() == 0) && StageSection() == 2 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "You're Guilty You're Dead! VII (Kingpin)", description = "Defeat the Last Boss using only 1 credit and not using grenades (P1, dif>=4, oth opt<=default)", points = 25,
        id = 60785, badge = "63843", published = "5/30/2018 4:40:08 AM", modified = "1/29/2021 2:57:56 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && once(StageSection() == 3) && BossSlowdown() == 2 && StageSection() == 4 && 
                  never(byte(0x005B3C) == 0) && unless(byte(0x008EB4) > 0) && unless(byte(0x008E9F) == 255) && never(byte(0x0097E9) == 1)
    )

    achievement(
        title = "Need no Bangs to Trash You, Punks! I", description = "Clear Stage 1 without using your gun (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60777, badge = "63835", published = "5/30/2018 4:39:53 AM", modified = "1/29/2021 2:57:54 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && once(dword(0x005AFC) == 33554720) && never(byte(0x008F24) == 16) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "Need no Bangs to Trash You, Punks! II", description = "Clear Stage 2 without using your gun (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60778, badge = "63836", published = "5/30/2018 4:39:55 AM", modified = "1/29/2021 2:57:53 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && once(dword(0x005AFC) == 33554688) && never(byte(0x008F24) == 16) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "CLIME HUNTER", description = "Clear Stage 1 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60757, badge = "63814", published = "5/30/2018 4:39:15 AM", modified = "6/9/2018 2:42:16 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && once(dword(0x005AFC) == 33554720) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "CASTLE -PANTA BELDE-", description = "Clear Stage 2 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60758, badge = "63815", published = "5/30/2018 4:39:16 AM", modified = "6/9/2018 2:42:18 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && once(dword(0x005AFC) == 33554688) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "SEASIDE TRAP", description = "Clear Stage 3 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60759, badge = "63816", published = "5/30/2018 4:39:20 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 2) && once(dword(0x005AFC) == 134217984) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "Out of Control Train -Huge Cave-", description = "Clear Stage 4 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60760, badge = "63817", published = "5/30/2018 4:39:21 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 3) && once(dword(0x005AFC) == 25166208) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "REVENGER -Theme of Revenge-", description = "Clear Stage 5 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60761, badge = "63818", published = "5/30/2018 4:39:23 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 4) && once(dword(0x005AFC) == 100663552) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "King Building Infiltration", description = "Clear Stage 6 using only 1 credit (P1, dif>=3, oth opt<=default)", points = 25,
        id = 60762, badge = "63819", published = "5/30/2018 4:39:25 AM", modified = "1/29/2021 2:57:48 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 5) && once(dword(0x005AFC) == 50333184) && never(byte(0x005B3C) == 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Purgamentonishser I", description = "Clear Stage 1 not claiming any items (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60775, badge = "63833", published = "5/30/2018 4:39:50 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && once(dword(0x005AFC) == 33554720) && never(P1Items() != 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Purgamentonishser II", description = "Clear Stage 2 not claiming any items (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60776, badge = "63834", published = "5/30/2018 4:39:51 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 1) && once(dword(0x005AFC) == 33554688) && never(P1Items() != 0) && 
                  BossSlowdown() == 2
    )

    achievement(
        title = "The Extra-Perfectionisher", description = "Clear the Bonus Stage with perfect score (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60786, badge = "63844", published = "5/30/2018 4:40:10 AM", modified = "10/13/2019 8:12:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 7) && byte(0x006017) == 32
    )

    achievement(
        title = "Charles Fort", description = "Reach the Boss on Stage 1 defeating 14 enemies (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60790, badge = "63848", published = "5/30/2018 4:40:33 AM", modified = "10/10/2019 7:28:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && never(Stage() != 0) && never(StageSection() != 1) && never(byte(0x005FA0) == 255) && 
                  P1Enemies() == 14
    )

    achievement(
        title = "Francis Stronghold", description = "Defeat 25 enemies without being damaged (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60792, badge = "63850", published = "5/30/2018 4:40:37 AM", modified = "10/16/2019 8:57:01 PM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && repeated(25, prev(P1Enemies()) < P1Enemies()) && never(byte(0x008E69) > 1)
    )

    achievement(
        title = "Franken-Castle", description = "Defeat 50 enemies without losing a life (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60793, badge = "63851", published = "5/30/2018 4:40:38 AM", modified = "1/29/2021 2:57:45 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && repeated(50, prev(P1Enemies()) < P1Enemies()) && never(prev(P1Lives()) > P1Lives())
    )

    achievement(
        title = "Yousoufian", description = "Defeat 300 enemies in one game (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60791, badge = "63849", published = "5/30/2018 4:40:35 AM", modified = "1/29/2021 2:57:43 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && P1Enemies() >= 300 && never(P1Enemies() == 65535)
    )

    achievement(
        title = "I Did It!", description = "Score over 1.8 milion of points (P1, dif>=3, oth opt<=default)", points = 5,
        id = 60750, badge = "63852", published = "5/30/2018 4:39:00 AM", modified = "5/31/2018 2:37:08 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && word(0x005BAA) >= 384 && never(word(0x005BAA) == 65535)
    )

    achievement(
        title = "It's Over Nine Thousand Thousands", description = "Score over 9 milion of points (P1, dif>=3, oth opt<=default)", points = 25,
        id = 60794, badge = "63853", published = "5/30/2018 4:40:40 AM", modified = "1/29/2021 2:57:41 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && word(0x005BAA) >= 2304 && never(word(0x005BAA) == 65535)
    )
    
    achievement(
        title = "The Private War of Mr. Smith", description = "Complete the game on the hardest difficulty (P1, dif=7, oth opt<=default)", points = 25,
        id = 60796, badge = "63855", published = "5/30/2018 4:40:43 AM", modified = "1/29/2021 2:57:37 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() != 7) && never(Stage() != 5) && never(StageSection() != 4) && BossSlowdown() == 2
    )

    achievement(
        title = "Dmitri Velikoff", description = "Complete the game always having at least 4 grenades (P1, dif>=3, oth opt<=default)", points = 10,
        id = 60798, badge = "63858", published = "5/30/2018 4:40:47 AM", modified = "1/29/2021 2:57:36 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && once(Stage() == 0) && once(Stage() == 1) && once(Stage() == 2) && 
                  once(Stage() == 3) && once(Stage() == 4) && Stage() == 5 && once(Stage() == 7) && BossSlowdown() == 2 && 
                  unless(byte(0x005BBA) == 0) && never(byte(0x005BCB) < 4)
    )

    achievement(
        title = "Big Nothing", description = "Complete the game without using Sliding Tornado Sweep or Big Swing (P1, dif>=3, oth opt<=default)", points = 25,
        id = 60799, badge = "63857", published = "5/30/2018 4:40:49 AM", modified = "1/29/2021 2:57:34 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && once(Stage() == 0) && once(Stage() == 1) && once(Stage() == 2) && 
                  once(Stage() == 3) && once(Stage() == 4) && Stage() == 5 && once(Stage() == 7) && BossSlowdown() == 2 && 
                  never(byte(0x008F2D) == 255)
    )

    achievement(
        title = "The Punisher 1CC", description = "Complete the game using only 1 credit (P1, dif>=3, oth opt<=default)", points = 50,
        id = 60797, badge = "63856", published = "5/30/2018 4:40:45 AM", modified = "1/29/2021 2:57:32 AM",
        trigger = never(PlayerActive() == 1) && never(NumberPlayers() < 2) && never(Extend() == 0) && 
                  never(Difficulty() < 3) && once(Stage() == 0) && once(Stage() == 1) && once(Stage() == 2) && 
                  once(Stage() == 3) && once(Stage() == 4) && Stage() == 5 && once(Stage() == 7) && 
                  never(byte(0x005B3C) == 0) && BossSlowdown() == 2
    )
}

rich_presence_conditional_display(GameActive() == 0, " Attract Mode")

rich_presence_display("{0}|🚶{1}|💣{2}|📦{3}|🤕{4}|💯:{5}|⚖LEVEL-{6}",
    rich_presence_lookup("Stage", low4(0x005BB8), StageLookup),
    rich_presence_value("Lives", low4(0x005BA5)),
    rich_presence_value("Grenades", low4(0x005BCB)),
    rich_presence_value("Items", P1Items()),
    rich_presence_value("Enemies", P1Enemies()),
    rich_presence_value("Score", high4(0x005BAB) * 10000000 + low4(0x005BAB) * 1000000 + high4(0x005BAA) * 100000 + low4(0x005BAA) * 10000 + high4(0x005BAD) * 1000 + low4(0x005BAD) * 100),
    rich_presence_value("Difficulty",  low4(0x005B45) + 1)
)
