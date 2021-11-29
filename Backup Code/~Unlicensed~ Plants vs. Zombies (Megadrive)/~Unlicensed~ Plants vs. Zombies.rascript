// ~Unlicensed~ Plants vs. Zombies
// #ID = 8781

// $0002: Game State?
//        06=Menus
//        12=Ingame
// $0338: [Input]
//        bit0 = Up
//        bit1 = Down
//        bit2 = Left
//        bit3 = Right
//        bit4 = A
//        bit5 = B
//        bit6 = C
//        bit7 = Start
// $033A: [Input]
//        bit4 = X?
//        bit5 = Y?
//        bit6 = Z?
// $55F0: Cursor X Position
// $55FE: 16bit Sun Overflow Count
// $5600: 16bit Sun
// $5610: Number of Peas on Screen
// $5614: [Game Mode]
//        00=Story Mode
//        01=Endless
//        02=Options
// $5618: Lawn Mowers Remaining
// $561C: Option Selected in Pause Menu
//        00=Main Menu
//        01=Restart
//        02=Resume
// $5638: Text Palette? Can be used to check for end screen
// $563C: 01=Paused
// $5656: 01=Lawn Mower
// $5666: 01=Lawn Mower
// $5676: 01=Lawn Mower
// $5686: 01=Lawn Mower
// $5696: 01=Lawn Mower
// $56B0: Number of Zombies on Screen
// $56C8: Plant 1
//        01=Peashooter
//        02=Sunflower
//        03=Wall-nut
//        04=Potato Mine
//        05=Snow Pea
//        06=Repeater
//        07=Cherry Bomb
//        08=Chomper
// $56EC: Plant 2
// $5710: Plant 3
// $5734: Plant 4
// $5758: Plant 5
// $577C: Plant 6
// $57A0: Plant 7
// $57C4: Plant 8
// $57E8: Plant 9
// $580C: Plant 10
// $5830: Plant 11
// $5854: Plant 12
// $5878: Plant 13
// $589C: Plant 14
// $58C0: Plant 15
// $58E4: Plant 16
// $5908: Plant 17
// $592C: Plant 18
// $5950: Plant 19
// $5974: Plant 20
// $5998: Plant 21
// $59BC: Plant 22
// $59E0: Plant 23
// $5A04: Plant 24
// $5A28: Plant 25
// $5A4C: Plant 26
// $5A70: Plant 27
// $5AA4: Plant 28
// $5AC8: Plant 29
// $5AEC: Plant 30
// $5B10: Plant 31
// $5B34: Plant 32
// $5B58: Plant 33
// $5B7C: Plant 34
// $5BA0: Plant 35
// $5BC4: Plant 36
// $5BE8: Plant 37
// $5C0C: Plant 38
// $5C30: Plant 39
// $5C54: Plant 40
// $5C78: Plant 41
// $5C9C: Plant 42
// $5CC0: Plant 43
// $5CE4: Plant 44
// $5D08: Plant 45
// $5F23: [Options] SFX Toggle
// $5F5A: Number of Plants Placed
// $5F5E: 16bit Natural Sun Generation Timer
// $5F70: 01=Win
//        02=Game Over
// $5F71: [Options] Music Toggle
// $7D78: Current Level
//        Level 4 = First 5 Lane Map
//        Level 16 = Miniboss
//        Level 18 = Miniboss
//        Level 20 = Final Boss
// $848C: Cursor Y Position
// $8490: Current Plant Type Selected
//        01=Peashooter
//        02=Sunflower
//        03=Wall-nut
//        04=Potato Mine
//        05=Snow Pea
//        06=Repeater
//        07=Cherry Bomb
//        08=Chomper
//        09=Shovel
// $849E: Something Related To Music

achievement(
    title = "Gardening Has Started", description = "Complete all 'Day' levels in Adventure Mode.", points = 5,
    id = 146255, badge = "163386", published = "3/21/2021 7:31:26 AM", modified = "3/21/2021 7:31:26 AM",
    trigger = never(byte(0x005614) != 0) && byte(0x007D78) == 10 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1
)

achievement(
    title = "Gardening Has Ended", description = "Complete all 'Night' levels in Adventure Mode.", points = 10,
    id = 146256, badge = "163390", published = "3/21/2021 7:31:31 AM", modified = "3/21/2021 7:31:31 AM",
    trigger = never(byte(0x005614) != 0) && byte(0x007D78) == 20 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1
)

achievement(
    title = "Not Even Scared", description = "Complete 1-1 to 1-4 of Adventure Mode without restarting, losing Lawn Mowers, or losing any plants.", points = 5,
    id = 146258, badge = "163391", published = "3/21/2021 7:31:40 AM", modified = "3/27/2021 6:32:47 PM",
    trigger = 
              unless(once(prev(byte(0x005F70)) == 0 && prev(byte(0x000002)) != 0 && prev(byte(0x005F5A)) > byte(0x005F5A))) && unless(once(prev(byte(0x005656)) == 0 && byte(0x005656) == 1)) && 
              unless(once(prev(byte(0x005666)) == 0 && byte(0x005666) == 1)) && unless(once(prev(byte(0x005676)) == 0 && byte(0x005676) == 1)) && 
              unless(once(prev(byte(0x005686)) == 0 && byte(0x005686) == 1)) && unless(once(prev(byte(0x005696)) == 0 && byte(0x005696) == 1)) && 
              unless(once(prev(byte(0x005F70)) == 0 && byte(0x005F70) == 2)) && once(byte(0x007D78) == 1 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 2 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && once(byte(0x007D78) == 3 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 4 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && unless(once((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1
               || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1)) &&
              (always_false() || (never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
                 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
                 byte(0x00561C) == 0)))
)

achievement(
    title = "The Real Game Starts Here", description = "Complete 1-5 to 1-10 of Adventure Mode without losing Lawn Mowers.", points = 10,
    id = 146320, badge = "163391", published = "3/22/2021 8:38:31 AM", modified = "3/27/2021 6:32:35 PM",
    trigger = unless(once(prev(byte(0x005656)) == 0 && byte(0x005656) == 1)) && 
              unless(once(prev(byte(0x005666)) == 0 && byte(0x005666) == 1)) && unless(once(prev(byte(0x005676)) == 0 && byte(0x005676) == 1)) && 
              unless(once(prev(byte(0x005686)) == 0 && byte(0x005686) == 1)) && unless(once(prev(byte(0x005696)) == 0 && byte(0x005696) == 1)) && 
              unless(once(prev(byte(0x005F70)) == 0 && byte(0x005F70) == 2)) && once(byte(0x007D78) == 5 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 6 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && once(byte(0x007D78) == 7 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 8 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && once(byte(0x007D78) == 9 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 10 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) &&
              (always_false() || (never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
                 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
                 byte(0x00561C) == 0)))
)

achievement(
    title = "Good Night Here", description = "Complete 2-1 to 2-5 of Adventure Mode without losing Lawn Mowers.", points = 10,
    id = 146321, badge = "163525", published = "3/22/2021 8:38:36 AM", modified = "3/23/2021 4:59:57 PM",
    trigger = unless(once(prev(byte(0x005656)) == 0 && byte(0x005656) == 1)) && 
              unless(once(prev(byte(0x005666)) == 0 && byte(0x005666) == 1)) && unless(once(prev(byte(0x005676)) == 0 && byte(0x005676) == 1)) && 
              unless(once(prev(byte(0x005686)) == 0 && byte(0x005686) == 1)) && unless(once(prev(byte(0x005696)) == 0 && byte(0x005696) == 1)) && 
              unless(once(prev(byte(0x005F70)) == 0 && byte(0x005F70) == 2)) && once(byte(0x007D78) == 11 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 12 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && once(byte(0x007D78) == 13 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 14 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && once(byte(0x007D78) == 15 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) &&
              (always_false() || (never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
                 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
                 byte(0x00561C) == 0)))
)

achievement(
    title = "Sleeping Spot", description = "Complete 2-7 and 2-9 of Adventure Mode without losing Lawn Mowers.", points = 5,
    id = 146322, badge = "163525", published = "3/22/2021 8:38:39 AM", modified = "3/27/2021 7:40:22 PM",
    trigger = unless(once(prev(byte(0x005656)) == 0 && byte(0x005656) == 1)) && 
              unless(once(prev(byte(0x005666)) == 0 && byte(0x005666) == 1)) && unless(once(prev(byte(0x005676)) == 0 && byte(0x005676) == 1)) && 
              unless(once(prev(byte(0x005686)) == 0 && byte(0x005686) == 1)) && unless(once(prev(byte(0x005696)) == 0 && byte(0x005696) == 1)) && 
              unless(once(prev(byte(0x005F70)) == 0 && byte(0x005F70) == 2)) && once(byte(0x007D78) == 17 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              once(byte(0x007D78) == 19 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) &&
              (always_false() || (never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
                 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
                 byte(0x00561C) == 0)))
)

achievement(
    title = "Great Value", description = "Defeat ''Dr. Zomboss'' without losing more than 1 plant.", points = 10,
    id = 146323, badge = "163530", published = "3/22/2021 8:38:45 AM", modified = "3/28/2021 12:53:21 AM",
    trigger = never(repeated(2, prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 &&
               repeated(20, byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && prev(byte(0x005F5A)) > byte(0x005F5A))) && 
              prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1 && never(byte(0x007D78) != 20) &&
              (always_false() || (never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
                 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
                 byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1 ||
                
                 bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1)))
)

achievement(
    title = "Only the Best For My Lawn", description = "Beat the Game without getting a game over or restarting after 1-1.", points = 25,
    id = 146624, badge = "164290", published = "3/23/2021 6:13:53 PM", modified = "3/25/2021 3:37:08 PM",
    trigger = once(byte(0x007D78) == 1 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && 
              (byte(0x007D78) == 20 && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never(byte(0x005614) != 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1
               || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 &&
               byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 || bit6(0x000338) == 1 ||
              
               bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) && prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2)
)

achievement(
    title = "Endless Fun", description = "Complete a Round in Endless Mode.", points = 2,
    id = 146257, badge = "163387", published = "3/21/2021 7:31:36 AM", modified = "3/21/2021 7:31:36 AM",
    trigger = never(byte(0x005614) != 1) && repeated(500, byte(0x0056B0) != 0) && prev(byte(0x005F70)) == 0 && 
              byte(0x005F70) == 1
)

achievement(
    title = "Having Fun Yet?", description = "Survive 10 Rounds in Endless Mode. (No Restarting)", points = 10,
    id = 146895, badge = "163887", published = "3/24/2021 4:55:41 PM", modified = "3/24/2021 6:41:35 PM",
    trigger = never(byte(0x005614) != 1) && (prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A)
               == 0 && once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) == 1) &&
               prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && once(byte(0x0056B0) ==
               0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) == 1) && prev(byte(0x000002)) == 0 &&
               once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) ==
               0 && once(byte(0x005F70) == 1) && prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) &&
               byte(0x005F5A) == 0 && once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) ==
               1) && prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 &&
               once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) == 1) &&
               prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && once(byte(0x0056B0) ==
               0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) == 1) && prev(byte(0x000002)) == 0 &&
               once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) ==
               0 && once(byte(0x005F70) == 1) && prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) &&
               byte(0x005F5A) == 0 && once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) ==
               1) && prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 &&
               once(byte(0x0056B0) == 0) && prev(byte(0x005F70)) == 0 && once(byte(0x005F70) == 1) &&
               prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && once(byte(0x0056B0) ==
               0) && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338)
               == 1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2)
)

achievement(
    title = "Praise The Sun", description = "Have over 8000 Sun at once.", points = 5,
    id = 146324, badge = "163534", published = "3/22/2021 8:38:49 AM", modified = "3/22/2021 8:38:49 AM",
    trigger = word(0x0055FE) == 0 && prev(word(0x005600)) > 7500 && prev(word(0x005600)) < 8000 && 
              word(0x005600) >= 8000 && word(0x005600) < 8500
)

achievement(
    title = "Explodonator", description = "Blow up 5 or more zombies at once with a single cherry bomb.", points = 5,
    id = 146325, badge = "163388", published = "3/22/2021 8:38:53 AM", modified = "3/27/2021 5:39:45 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && never(byte(0x000002) == 0) && prev(byte(0x005F70)) == 0 && byte(0x005F70) == 0 && 
              (prev(byte(0x0056B0)) - byte(0x0056B0)) >= 5 && (prev(byte(0x0056B0)) - byte(0x0056B0)) < 20
)

achievement(
    title = "Photosensitive Jr.", description = "Complete any 5 lane level without planting sunflowers.", points = 5,
    id = 146625, badge = "163787", published = "3/23/2021 6:13:56 PM", modified = "3/23/2021 6:13:56 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never((byte(0x008490) == 2 && prev(byte(0x005F5A)) < byte(0x005F5A)))
)

achievement(
    title = "Luxury Garden", description = "Complete any 5 lane level only using Snow Peas and Repeaters for offense. (Besides 2-6, 2-8, or 2-10)", points = 5,
    id = 146626, badge = "163788", published = "3/23/2021 6:13:59 PM", modified = "3/27/2021 7:39:55 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never(byte(0x007D78) == 16) && never(byte(0x007D78) == 18) && never(byte(0x007D78) == 20) && 
              never((byte(0x008490) == 1 || byte(0x008490) == 4 || byte(0x008490) == 7 || byte(0x008490) == 8) &&
               prev(byte(0x005F5A)) < byte(0x005F5A))
)

achievement(
    title = "Unfasting On Rotten Flesh", description = "Complete any 5 lane level only using Chompers for offense.", points = 5,
    id = 146627, badge = "163789", published = "3/23/2021 6:14:02 PM", modified = "3/24/2021 6:50:03 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never((byte(0x008490) == 1 || byte(0x008490) == 4 || byte(0x008490) == 5 || byte(0x008490) == 6 ||
               byte(0x008490) == 7) && prev(byte(0x005F5A)) < byte(0x005F5A))
)

achievement(
    title = "Minimalist Gardening", description = "Complete any 5 lane level without planting more than 5 plants at once.", points = 5,
    id = 146628, badge = "163786", published = "3/23/2021 6:14:06 PM", modified = "3/23/2021 6:14:06 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never((prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 &&
               once(byte(0x0056B0) == 0) && byte(0x005F5A) > 5))
)

achievement(
    title = "Nuclear War", description = "Complete any 5 lane level only using Potato Mines and Cherry Bombs for offense.", points = 5,
    id = 146892, badge = "163882", published = "3/24/2021 4:55:33 PM", modified = "3/24/2021 6:49:59 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never((byte(0x008490) == 1 || byte(0x008490) == 5 || byte(0x008490) == 6 || byte(0x008490) == 8) &&
               prev(byte(0x005F5A)) < byte(0x005F5A))
)

achievement(
    title = "Heliophobia", description = "Complete any 5 lane level without ever having more than 300 Sun.", points = 5,
    id = 146901, badge = "163902", published = "3/24/2021 6:32:09 PM", modified = "3/24/2021 6:32:09 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never(word(0x005600) > 300) && never(word(0x0055FE) != 0)
)

achievement(
    title = "My Mouse Is Broken", description = "Complete any 5 lane level without pressing left.", points = 5,
    id = 146893, badge = "164288", published = "3/24/2021 4:55:37 PM", modified = "3/25/2021 3:36:56 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never((byte(0x005614) == 0 && byte(0x007D78) < 4)) && never((bit2(0x000338) == 1 && prev(byte(0x0055F0)) > byte(0x0055F0)))
)

achievement(
    title = "Genocide Garden", description = "Defeat around 250 Zombies in one session.", points = 5,
    id = 146898, badge = "163900", published = "3/24/2021 6:14:25 PM", modified = "3/24/2021 6:38:22 PM",
    trigger = unless(byte(0x000002) != 18) && measured(repeated(250, prev(byte(0x0056B0)) > byte(0x0056B0)))
)

achievement(
    title = "Don't Pea In The Garden", description = "Shoot around 1000 Peas in one session", points = 5,
    id = 146899, badge = "163899", published = "3/24/2021 6:14:28 PM", modified = "3/24/2021 6:38:25 PM",
    trigger = unless(byte(0x000002) != 18) && measured(repeated(1000, prev(byte(0x005610)) > byte(0x005610)))
)

achievement(
    title = "Dedicated Gardener", description = "Plant around 150 Plants in one session.", points = 5,
    id = 146900, badge = "163901", published = "3/24/2021 6:14:32 PM", modified = "3/24/2021 6:38:29 PM",
    trigger = unless(byte(0x000002) != 18) && measured(repeated(150, prev(byte(0x005F5A)) < byte(0x005F5A)))
)

achievement(
    title = "oh no he has airpods in he can't hear us", description = "Complete any level with the music and sfx off.", points = 2,
    id = 146896, badge = "163891", published = "3/24/2021 4:55:45 PM", modified = "3/24/2021 4:55:45 PM",
    trigger = 
              once(prev(byte(0x000002)) == 0 && once(byte(0x000002) == 18) && byte(0x005F5A) == 0 && byte(0x0056B0) == 0) && (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 1) && never((bit4(0x000338) == 1 || bit5(0x000338) ==
               1 || bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 0) && never((bit4(0x000338) == 1 || bit5(0x000338) == 1 ||
               bit6(0x000338) == 1 || bit4(0x00033A) == 1 || bit5(0x00033A) == 1 || bit6(0x00033A) == 1) &&
               prev(byte(0x00563C)) == 1 && byte(0x00561C) == 1) && never(byte(0x005F70) == 2) && 
              never(byte(0x005F71) != 1) && never(byte(0x005F23) != 1)
)

achievement(
    title = "Za Warudo", description = "But the game was paused!", points = 1,
    id = 146259, badge = "163535", published = "3/21/2021 7:32:26 AM", modified = "3/24/2021 6:38:20 PM",
    trigger = ((prev(byte(0x005656)) == 0 && byte(0x005656) == 1 && byte(0x00563C) == 1) ||
               (prev(byte(0x005666)) == 0 && byte(0x005666) == 1 && byte(0x00563C) == 1) ||
               (prev(byte(0x005676)) == 0 && byte(0x005676) == 1 && byte(0x00563C) == 1) ||
               (prev(byte(0x005686)) == 0 && byte(0x005686) == 1 && byte(0x00563C) == 1) ||
               (prev(byte(0x005696)) == 0 && byte(0x005696) == 1 && byte(0x00563C) == 1) ||
               (byte(0x005F5A) < prev(byte(0x005F5A)) && prev(byte(0x00563C)) == 1) ||
               (prev(byte(0x005F70)) == 0 && byte(0x005F70) == 2 && byte(0x00563C) == 1))
)
