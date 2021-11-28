// Twisted Tales of Spike McFang, The
// #ID = 1287

// $09F1: Story progress?
//        
//        b4 = got card box, c4 = level 1 beaten, cc = croc
//        cd = root fight
// $0A3F: Spike's current level [8-bit]
// $0A55: Current hat
//        01 =spinning hat, 02 = star hat,
//        03 = feather hat
//        04 = lightning hat
// $0A57: Player money least significant digits
// $0A5B: Player experience least significant digits
// $0A5C: player experience most significant digits
// $0B00: Debug
// $0B08: Game Time (Hours)
// $0B0A: Game Time (Seconds)
// $0B0B: Game Time (Minutes)
// $0B82: Related to boss fight
// $4CE4: Boss1 Felina's health
//        FFFF = beaten
// $4CE5: Boss2 Croc's health
// $4E30: number of quake cards
// $4E31: Number of fire cards
// $4E32: Number of ice cards
// $4E33: Number of lightning cards
// $4E34: Number of Tomato Juice cards
// $4E35: Number of Big Tomato Cards
// $4E36: Number of time cards
// $4E37: number of animal cards
// $4E38: Number of angel cards
// $4E39: number of bat cards
// $4E3A: number of invisicards
// $4E3B: number of flying hat cards
// $4E3C: number of soup cards
// $4E3D: number of companion cards
// $4E3E: number of transport cards


achievement(
    title = "Overcome My Magic Cane", description = "Finish the tutorial. That instructor gives me the creeps.", points = 5,
    id = 26028, badge = "26519", published = "2015-07-22 1:48:56 AM", modified = "2019-11-27 2:54:26 AM",
    trigger = byte(0x0009F1) == 180 && byte(0x000B00) == 0 && byte(0x000A55) == 1 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Prepare To Go Down", description = "Beat up Felina and take back your castle. Eat hat, cat!", points = 10,
    id = 26088, badge = "90947", published = "2015-07-22 10:02:53 PM", modified = "2019-11-27 2:54:40 AM",
    trigger = byte(0x0009F1) == 196 && byte(0x000B00) == 0 && byte(0x000A55) < 4 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Let's See How Tough You Really Are", description = "Beat up Croc. That water is for everyone, green man.", points = 5,
    id = 26163, badge = "26649", published = "2015-07-23 9:38:12 PM", modified = "2019-11-27 2:54:47 AM",
    trigger = byte(0x004CE5) == 255 && byte(0x0009F1) == 204 && byte(0x000B00) == 0 && byte(0x000A55) < 4 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "GAAAAA...", description = "Defeat the Kalala Root. Let's fight, Root.", points = 10,
    id = 26164, badge = "26650", published = "2015-07-23 9:39:21 PM", modified = "2019-11-27 2:54:51 AM",
    trigger = byte(0x0009F1) == 156 && prev(byte(0x0009F1)) == 205 && byte(0x000B00) == 0 && byte(0x000A55) < 4 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "I've Never Lost a Fight", description = "The Freezer is tough.", points = 1,
    id = 26312, badge = "26814", published = "2015-07-25 5:03:09 AM", modified = "2019-11-27 2:54:54 AM",
    trigger = byte(0x0009F1) == 221 && byte(0x000B00) == 0 && never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && 
              never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && 
              never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && 
              never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && 
              never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && 
              never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && 
              never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && 
              never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "You Will Now", description = "Defeat the Freezer (finally). HOW DID YOU KNOW ABOUT MY WEAKNESS?!", points = 10,
    id = 26313, badge = "26815", published = "2015-07-25 5:03:19 AM", modified = "2019-11-27 2:54:58 AM",
    trigger = byte(0x0009F1) == 223 && byte(0x000B00) == 0 && never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && 
              never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && 
              never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && 
              never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && 
              never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && 
              never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && 
              never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && 
              never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "That Would Be You!", description = "Defeat Moray. Uh, that's not an eel...", points = 5,
    id = 26516, badge = "27108", published = "2015-07-28 6:44:14 PM", modified = "2020-04-10 3:53:11 AM",
    trigger = word(0x004CE4) == 65535 && byte(0x0009F1) == 234 && byte(0x000B00) == 0 && never(word(0x000B82) != 35682) && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Stranger From the Ice Cave", description = "Defeat Hydra. She sure had me fooled. How about you?", points = 5,
    id = 26517, badge = "90948", published = "2015-07-28 6:44:27 PM", modified = "2019-11-27 2:55:06 AM",
    trigger = byte(0x0009F1) == 237 && byte(0x000B00) == 0 && never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && 
              never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && 
              never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && 
              never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && 
              never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && 
              never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && 
              never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && 
              never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "You Will Go Down...Again", description = "Defeat Von Hesler. Is he the real foe? Is he just an elderly physician?", points = 10,
    id = 26518, badge = "90949", published = "2015-07-28 6:48:09 PM", modified = "2019-11-27 2:55:11 AM",
    trigger = byte(0x0009F1) == 240 && byte(0x000B00) == 0 && never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && 
              never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && 
              never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && 
              never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && 
              never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && 
              never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && 
              never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && 
              never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "This Menace Won't Give Us Any More Trouble", description = "Save the goddang kingdom. And get that big coin, too.", points = 25,
    id = 26519, badge = "27111", published = "2015-07-28 6:48:34 PM", modified = "2019-11-27 2:55:15 AM",
    trigger = byte(0x0009F1) == 245 && byte(0x000B00) == 0 && never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && 
              never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && 
              never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && 
              never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && 
              never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && 
              never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && 
              never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && 
              never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Newborn Vampire", description = "Level up to reach level 2, the first of many.", points = 1,
    id = 26029, badge = "26520", published = "2015-07-22 1:49:02 AM", modified = "2019-11-27 12:58:07 AM",
    trigger = word(0x000A5B) >= 50 && prev(word(0x000A5B)) < 50 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Fledgling Vampire", description = "Reach level 3. Show that garlic who's boss!", points = 1,
    id = 26030, badge = "26521", published = "2015-07-22 1:49:06 AM", modified = "2019-11-27 12:58:12 AM",
    trigger = word(0x000A5B) >= 100 && prev(word(0x000A5B)) < 100 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Thrall", description = "Reach level 4. Can you begin to see your true power!?", points = 2,
    id = 26031, badge = "26522", published = "2015-07-22 1:49:10 AM", modified = "2019-11-27 12:58:17 AM",
    trigger = word(0x000A5B) >= 250 && prev(word(0x000A5B)) < 250 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Underling", description = "Reach level 5. Vegetables are no big deal to you.", points = 2,
    id = 26032, badge = "26523", published = "2015-07-22 1:49:14 AM", modified = "2019-11-27 12:58:21 AM",
    trigger = word(0x000A5B) >= 500 && prev(word(0x000A5B)) < 500 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Neonate Vampire", description = "Reach level 6. You can probably survive on your own.", points = 2,
    id = 26053, badge = "26640", published = "2015-07-22 4:38:02 AM", modified = "2019-11-27 12:58:25 AM",
    trigger = word(0x000A5B) >= 1000 && prev(word(0x000A5B)) < 1000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Keeper", description = "Reach level 7.", points = 2,
    id = 26054, badge = "26641", published = "2015-07-22 4:38:09 AM", modified = "2019-11-27 12:58:29 AM",
    trigger = word(0x000A5B) >= 1800 && prev(word(0x000A5B)) < 1800 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Guardian", description = "Reach level 8.", points = 3,
    id = 26055, badge = "26642", published = "2015-07-22 4:38:14 AM", modified = "2019-11-27 12:58:32 AM",
    trigger = word(0x000A5B) >= 2800 && prev(word(0x000A5B)) < 2800 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Hunter", description = "Reach level 9.", points = 3,
    id = 26056, badge = "26643", published = "2015-07-22 4:38:36 AM", modified = "2019-11-27 12:58:36 AM",
    trigger = word(0x000A5B) >= 4300 && prev(word(0x000A5B)) < 4300 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Ancillus", description = "Reach level 10.", points = 3,
    id = 26057, badge = "26644", published = "2015-07-22 4:39:10 AM", modified = "2019-11-27 12:58:41 AM",
    trigger = word(0x000A5B) >= 6500 && prev(word(0x000A5B)) < 6500 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Ascendant", description = "Reach level 11.", points = 3,
    id = 26058, badge = "26645", published = "2015-07-22 4:39:54 AM", modified = "2019-11-27 12:58:45 AM",
    trigger = word(0x000A5B) >= 10000 && prev(word(0x000A5B)) < 10000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Vampire Elder", description = "Reach level 12.", points = 4,
    id = 26059, badge = "26646", published = "2015-07-22 4:40:10 AM", modified = "2019-11-27 12:58:48 AM",
    trigger = word(0x000A5B) >= 15000 && prev(word(0x000A5B)) < 15000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Methuselah", description = "Reach level 13.", points = 4,
    id = 26060, badge = "26647", published = "2015-07-22 4:40:27 AM", modified = "2019-11-27 12:58:51 AM",
    trigger = word(0x000A5B) >= 23000 && prev(word(0x000A5B)) < 23000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Eldest Vampire", description = "Reach level 14.", points = 4,
    id = 26061, badge = "26648", published = "2015-07-22 4:40:42 AM", modified = "2019-11-27 12:58:55 AM",
    trigger = word(0x000A5B) >= 35000 && prev(word(0x000A5B)) < 35000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Master Vampire", description = "Reach level 15.", points = 4,
    id = 26062, badge = "27113", published = "2015-07-22 4:41:09 AM", modified = "2019-11-27 12:58:59 AM",
    trigger = word(0x000A5B) >= 50000 && prev(word(0x000A5B)) < 50000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0 &&
              ((byte(0x000A5B) >= 80 && byte(0x000A5C) >= 195) ||
               (byte(0x000A5C) >= 196))
)

achievement(
    title = "Tomato Deity", description = "Reach the maximum level.", points = 5,
    id = 26063, badge = "27114", published = "2015-07-22 4:41:14 AM", modified = "2019-11-27 12:59:04 AM",
    trigger = word(0x000A5B) >= 65000 && prev(word(0x000A5B)) < 65000 && prev(word(0x000A5B)) > 0 && byte(0x000B00) == 0
)

achievement(
    title = "Coin Collection", description = "Gather up 250G. Don't spend it all in one place!", points = 2,
    id = 26033, badge = "26525", published = "2015-07-22 2:12:29 AM", modified = "2019-11-27 2:55:21 AM",
    trigger = word(0x000A57) >= 250 && prev(word(0x000A57)) < 250 && prev(word(0x000A57)) > 0 && byte(0x000B00) == 0 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Healthy Hoard", description = "Gather 500G. Just like a dragon.", points = 5,
    id = 26034, badge = "26524", published = "2015-07-22 2:12:36 AM", modified = "2019-11-27 2:55:25 AM",
    trigger = word(0x000A57) >= 500 && prev(word(0x000A57)) < 500 && prev(word(0x000A57)) > 0 && byte(0x000B00) == 0 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Vampire Vault", description = "Get 999G. You can't get any more!", points = 10,
    id = 26035, badge = "26526", published = "2015-07-22 2:12:39 AM", modified = "2019-11-27 2:55:28 AM",
    trigger = word(0x000A57) == 999 && prev(word(0x000A57)) < 999 && prev(word(0x000A57)) > 0 && byte(0x000B00) == 0 && 
              never((byte(0x000A3F) == 1 && word(0x000A5B) < 50)) && never((byte(0x000A3F) == 2 && word(0x000A5B) < 100)) && 
              never((byte(0x000A3F) == 3 && word(0x000A5B) < 250)) && never((byte(0x000A3F) == 4 && word(0x000A5B) < 500)) && 
              never((byte(0x000A3F) == 5 && word(0x000A5B) < 1000)) && never((byte(0x000A3F) == 6 && word(0x000A5B) < 1800)) && 
              never((byte(0x000A3F) == 7 && word(0x000A5B) < 2800)) && never((byte(0x000A3F) == 8 && word(0x000A5B) < 4300)) && 
              never((byte(0x000A3F) == 9 && word(0x000A5B) < 6500)) && never((byte(0x000A3F) == 10 && word(0x000A5B) < 10000)) && 
              never((byte(0x000A3F) == 11 && word(0x000A5B) < 15000)) && never((byte(0x000A3F) == 12 && word(0x000A5B) < 23000)) && 
              never((byte(0x000A3F) == 13 && word(0x000A5B) < 35000)) && never((byte(0x000A3F) == 14 && word(0x000A5B) < 50000)) && 
              never((byte(0x000A3F) == 15 && word(0x000A5B) < 65000))
)

achievement(
    title = "Vampire Sparkle Attack", description = "Equip the Star Hat. Oh, no. Vampires have been sparkling longer than we had thought.", points = 5,
    id = 26036, badge = "26527", published = "2015-07-22 4:04:36 AM", modified = "2019-11-27 12:59:32 AM",
    trigger = byte(0x000A55) == 2 && once((prev(word(0x000A57)) - 200) == word(0x000A57)) && byte(0x000B00) == 0
)

achievement(
    title = "Oh, That's Fancy", description = "Equip the Feather Hat. This hat can wiggle.", points = 5,
    id = 26037, badge = "26528", published = "2015-07-22 4:04:52 AM", modified = "2019-11-27 12:59:36 AM",
    trigger = byte(0x000A55) == 3 && once((prev(word(0x000A57)) - 400) == word(0x000A57)) && byte(0x000B00) == 0
)

achievement(
    title = "Before Wizards Were Cool", description = "Equip the Lightning Hat. Spike had a bolt on his head before it was cool.", points = 10,
    id = 26051, badge = "26816", published = "2015-07-22 4:36:48 AM", modified = "2019-11-27 12:59:39 AM",
    trigger = byte(0x000A55) == 4 && once((prev(word(0x000A57)) - 800) == word(0x000A57)) && byte(0x000B00) == 0
)

achievement(
    title = "Divine Intervention", description = "Get an Angel card. Cherubs, attack!", points = 3,
    id = 26044, badge = "26535", published = "2015-07-22 4:07:54 AM", modified = "2019-11-01 7:42:18 AM",
    trigger = byte(0x004E38) >= 1 && byte(0x004E38) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E38))) == byte(0x004E38)
)

achievement(
    title = "Cute Critters", description = "Get an Animal card. THEN SPLAT THEM CRITTERS!", points = 1,
    id = 26043, badge = "26534", published = "2015-07-22 4:07:41 AM", modified = "2019-11-01 7:42:23 AM",
    trigger = byte(0x004E37) >= 1 && byte(0x004E37) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E37))) == byte(0x004E37)
)

achievement(
    title = "Chiroptera", description = "Get a Bat card. A colony of Mexican Free-tailed Bats in Texas eats over 10k lbs", points = 2,
    id = 26045, badge = "26536", published = "2015-07-22 4:08:05 AM", modified = "2019-11-01 7:42:27 AM",
    trigger = byte(0x004E39) >= 1 && byte(0x004E39) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E39))) == byte(0x004E39)
)

achievement(
    title = "It's As Big As Your Head!", description = "Get a Big Tomato card, you vegetable vampire, you.", points = 1,
    id = 26050, badge = "26541", published = "2015-07-22 4:17:29 AM", modified = "2019-11-01 7:42:31 AM",
    trigger = byte(0x004E35) >= 1 && byte(0x004E35) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E35))) == byte(0x004E35)
)

achievement(
    title = "Wolvy Berserk Style", description = "Get a Companion card. It's like catnip for your friends!", points = 2,
    id = 26052, badge = "27112", published = "2015-07-22 4:36:57 AM", modified = "2019-11-01 7:42:36 AM",
    trigger = byte(0x004E3D) >= 1 && byte(0x004E3D) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E3D))) == byte(0x004E3D)
)

achievement(
    title = "Friendly Fires", description = "Get a Fire card. It's smiling at you.", points = 3,
    id = 26039, badge = "26530", published = "2015-07-22 4:06:12 AM", modified = "2019-11-01 7:42:41 AM",
    trigger = byte(0x004E31) >= 1 && byte(0x004E31) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E31))) == byte(0x004E31)
)

achievement(
    title = "That's an Odd Job", description = "Get a Flying Hat card. Don't hit anyone in the head. Ow!", points = 1,
    id = 26047, badge = "26538", published = "2015-07-22 4:08:32 AM", modified = "2019-11-01 7:42:45 AM",
    trigger = byte(0x004E3B) >= 1 && byte(0x004E3B) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E3B))) == byte(0x004E3B)
)

achievement(
    title = "Icy Pillars", description = "Get an Ice card. You could build a castle with these!", points = 3,
    id = 26040, badge = "26531", published = "2015-07-22 4:06:25 AM", modified = "2019-11-01 7:42:49 AM",
    trigger = byte(0x004E32) >= 1 && byte(0x004E32) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E32))) == byte(0x004E32)
)

achievement(
    title = "Invisible Boy", description = "Get an Invisi-Card. Just don't look at yourself or it won't work.", points = 2,
    id = 26046, badge = "26537", published = "2015-07-22 4:08:18 AM", modified = "2019-11-01 7:42:53 AM",
    trigger = byte(0x004E3A) >= 1 && byte(0x004E3A) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E3A))) == byte(0x004E3A)
)

achievement(
    title = "Latnin", description = "Get a Lightning card. It's-a stormin out!", points = 3,
    id = 26041, badge = "26532", published = "2015-07-22 4:06:42 AM", modified = "2019-11-01 7:42:57 AM",
    trigger = byte(0x004E33) >= 1 && byte(0x004E33) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E33))) == byte(0x004E33)
)

achievement(
    title = "That's One Way To Start an Earthquake...", description = "Get a Quake card. It smells fishy.", points = 3,
    id = 26038, badge = "26529", published = "2015-07-22 4:05:59 AM", modified = "2019-11-01 7:43:02 AM",
    trigger = byte(0x004E30) >= 1 && byte(0x004E30) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E30))) == byte(0x004E30)
)

achievement(
    title = "Three Bowls?!", description = "Get a Soup card. Just don't tell the Freezer about it.", points = 5,
    id = 26311, badge = "26813", published = "2015-07-25 5:02:57 AM", modified = "2019-11-27 1:00:14 AM",
    trigger = byte(0x004E3C) >= 1 && byte(0x004E3C) <= 54 && (1 + prev(byte(0x004E3C))) == byte(0x004E3C) && 
              byte(0x000B00) == 0
)

achievement(
    title = "Don't Move", description = "Get a Time card. Don't even blink.", points = 2,
    id = 26042, badge = "26533", published = "2015-07-22 4:07:26 AM", modified = "2019-11-01 7:43:07 AM",
    trigger = byte(0x004E36) >= 1 && byte(0x004E36) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E36))) == byte(0x004E36)
)

achievement(
    title = "Running On All Cylinders", description = "Get a Tomato Juice card. Sweet nectar of life!", points = 2,
    id = 26049, badge = "26540", published = "2015-07-22 4:17:01 AM", modified = "2019-11-01 7:43:12 AM",
    trigger = byte(0x004E34) >= 1 && byte(0x004E34) <= 54 && once((prev(word(0x000A57)) - 100) == word(0x000A57)) && 
              (1 + prev(byte(0x004E34))) == byte(0x004E34)
)

achievement(
    title = "Sanctuary", description = "Get a Transport card. Do you think those balloons are sentient? O.o", points = 1,
    id = 26048, badge = "26539", published = "2015-07-22 4:08:47 AM", modified = "2019-11-01 7:43:16 AM",
    trigger = byte(0x004E3E) >= 1 && byte(0x004E3E) <= 54 && once((prev(word(0x000A57)) - 20) == word(0x000A57)) && 
              (1 + prev(byte(0x004E3E))) == byte(0x004E3E)
)

