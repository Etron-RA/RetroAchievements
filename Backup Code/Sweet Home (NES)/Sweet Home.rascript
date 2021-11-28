// Sweet Home
// #ID = 2230

// $0050: [bit-0] In-Game (0 = menu/intro, 1 = in game)
function InGame() => bit0(0x000050)
// $01CC: Music? 4d = final area? 3a = final boss?
//        01 = form 2? 29 = outside? 74 = cutscene?
//        ca = further cutscene? 5b = battle?
function Music() => byte(0x0001CC)
// $61A8: Kazuo's Level
function KazuoLevel() => byte(0x0061A8)
// $61A9: Akiko's Level
function AkikoLevel() => byte(0x0061A9)
// $61AA: Taro's Level
function TaroLevel() => byte(0x0061AA)
// $61AB: Asuka's Level
function AsukaLevel() => byte(0x0061AB)
// $61AC: Emi's Level
function EmiLevel() => byte(0x0061AC)
// $6255: Kazuo's Permanent Item
function KazuoPermanentItem() => byte(0x006255)
// $625A: Kazuo's 1st Item
function KazuoItem1() => byte(0x00625A)
// $625B: Akiko's 1st Item
function AkikoItem1() => byte(0x00625B)
// $625C: Taro's 1st Item
function TaroItem1() => byte(0x00625C)
// $625D: Asuka's 1st Item
function AsukaItem1() => byte(0x00625D)
// $625E: Emi's 1st Item
function EmiItem1() => byte(0x00625E)
// $625F: Kazuo's 2nd Item
function KazuoItem2() => byte(0x00625F)
// $6260: Akiko's 2nd Item
function AkikoItem2() => byte(0x006260)
// $6261: Taro's 2nd Item
function TaroItem2() => byte(0x006261)
// $6262: Asuka's 2nd Item
function AsukaItem2() => byte(0x006262)
// $6263: Emi's 2nd Item
function EmiItem2() => byte(0x006263)
// $6264: Kazuo's Weapon
function KazuoWeapon() => byte(0x006264)
// $6265: Akiko's Weapon
function AkikoWeapon() => byte(0x006265)
// $6266: Taro's Weapon
function TaroWeapon() => byte(0x006266)
// $6267: Asuka's Weapon
function AsukaWeapon() => byte(0x006267)
// $6268: Emi's Weapon
function EmiWeapon() => byte(0x006268)

// Test if the hero has leveled up
function LevelUp(address, level) => InGame() == 1 && prev(address) == level - 1 && address == level

// Check if an inventory item has changed
function ChangedItem(address, item) => prev(address) == item - 1 && address == item

// Check if the play has picked up an item
function GetItem(item)
{
    trigger = InGame() == 1 &&
              ((KazuoItem1() == item) ||
               (AkikoItem1() == item) ||
               (TaroItem1() == item) ||
               (AsukaItem1() == item) ||
               (EmiItem1() == item) ||
               (KazuoItem2() == item) ||
               (AkikoItem2() == item) ||
               (TaroItem2() == item) ||
               (AsukaItem2() == item) ||
               (EmiItem2() == item))
    return trigger
}

// Check if a player has picked up a weapon
function GetWeapon(weapon)
{
    trigger = InGame() == 1 &&
              ((KazuoWeapon() == weapon) ||
               (AkikoWeapon() == weapon) ||
               (TaroWeapon() == weapon) ||
               (AsukaWeapon() == weapon) ||
               (EmiWeapon() == weapon))
    return trigger
}

achievement(
    title = "Penumbra", description = "Acquire the Flashlight", points = 2,
    id = 4689, badge = "05327", published = "2014-02-03 10:08:42 PM", modified = "2020-06-29 5:11:29 AM",
    trigger = GetItem(47)
)

achievement(
    title = "Getting The Point", description = "Acquire the Armor Spear", points = 3,
    id = 4690, badge = "05329", published = "2014-02-03 10:08:55 PM", modified = "2020-06-29 5:11:27 AM",
    trigger = GetItem(35)
)

achievement(
    title = "Grave Robbing", description = "Acquire the Low Key", points = 5,
    id = 4696, badge = "05335", published = "2014-02-03 10:09:10 PM", modified = "2020-06-29 5:11:25 AM",
    trigger = GetItem(28)
)

achievement(
    title = "Right For The Job", description = "Acquire the Tool", points = 5,
    id = 4699, badge = "05338", published = "2014-02-03 10:09:19 PM", modified = "2020-06-29 5:11:23 AM",
    trigger = GetItem(33)
)

achievement(
    title = "Always Believe In Your Soul", description = "Acquire the Gold Key", points = 5,
    id = 4694, badge = "05333", published = "2014-02-03 10:09:05 PM", modified = "2020-06-29 5:11:22 AM",
    trigger = GetItem(27)
)

achievement(
    title = "Iron Will", description = "Acquire the Iron Key", points = 5,
    id = 4695, badge = "05334", published = "2014-02-03 10:09:08 PM", modified = "2020-06-29 5:11:21 AM",
    trigger = GetItem(34)
)

achievement(
    title = "Better Than One", description = "Acquire the Two Keys", points = 5,
    id = 4700, badge = "05339", published = "2014-02-03 10:09:21 PM", modified = "2020-06-29 5:11:20 AM",
    trigger = GetItem(26)
)
achievement(
    title = "Between The Lines", description = "Acquire the Diary", points = 5,
    id = 4692, badge = "05331", published = "2014-02-03 10:09:00 PM", modified = "2020-06-29 5:11:18 AM",
    trigger = GetItem(51)
)

achievement(
    title = "Infanticide", description = "Acquire the Coffin", points = 5,
    id = 4691, badge = "05330", published = "2014-02-03 10:08:57 PM", modified = "2020-06-29 5:11:17 AM",
    trigger = GetItem(43)
)

achievement(
    title = "Memories Of Life", description = "Acquire the Photo", points = 5,
    id = 4697, badge = "05336", published = "2014-02-03 10:09:14 PM", modified = "2020-06-29 5:11:16 AM",
    trigger = GetItem(45)
)

achievement(
    title = "Now This Is A Knife", description = "Equip the Silver Sword", points = 5,
    id = 4707, badge = "05345", published = "2014-02-03 10:09:40 PM", modified = "2020-06-29 5:11:15 AM",
    trigger = GetWeapon(66)
)

achievement(
    title = "Stick A Fork In It", description = "Equip the Pitchfork", points = 5,
    id = 4706, badge = "05346", published = "2014-02-03 10:09:37 PM", modified = "2020-06-29 5:11:14 AM",
    trigger = GetWeapon(70)
)

achievement(
    title = "Firebug", description = "Kazuo reached the maximum level!", points = 10,
    id = 4701, badge = "05344", published = "2014-02-03 10:09:24 PM", modified = "2020-06-29 5:11:11 AM",
    trigger = LevelUp(KazuoLevel(), 19)
)
achievement(
    title = "Medic!", description = "Akiko reached the maximum level!", points = 10,
    id = 4702, badge = "05340", published = "2014-02-03 10:09:27 PM", modified = "2020-06-29 5:11:10 AM",
    trigger = LevelUp(AkikoLevel(), 19)
)

achievement(
    title = "Neat and Tidy", description = "Asuka reached the maximum level!", points = 10,
    id = 4703, badge = "05341", published = "2014-02-03 10:09:30 PM", modified = "2020-06-29 5:11:08 AM",
    trigger = LevelUp(AsukaLevel(), 19)
)

achievement(
    title = "Master Of Unlocking", description = "Emi reached the maximum level!", points = 10,
    id = 4704, badge = "05342", published = "2014-02-03 10:09:32 PM", modified = "2020-06-29 5:11:07 AM",
    trigger = LevelUp(EmiLevel(), 19)
)

achievement(
    title = "Shutterbug", description = "Taro reached the maximum level!", points = 10,
    id = 4705, badge = "05343", published = "2014-02-03 10:09:34 PM", modified = "2020-06-29 5:11:06 AM",
    trigger = LevelUp(TaroLevel(), 19)
)

achievement(
    title = "Warp Speed!", description = "Acquire the Pulley", points = 10,
    id = 4698, badge = "05337", published = "2014-02-03 10:09:17 PM", modified = "2020-06-29 5:11:05 AM",
    trigger = GetItem(31)
)

achievement(
    title = "Mama Miya!", description = "Acquire the Dress", points = 10,
    id = 4693, badge = "05332", published = "2014-02-03 10:09:03 PM", modified = "2020-06-29 5:11:03 AM",
    trigger = GetItem(46)
)

achievement(
    title = "Rock-a-bye Lady", description = "Put Lady Mamiya to rest", points = 25,
    id = 53448, badge = "55276", published = "2017-10-15 2:46:13 AM", modified = "2020-06-29 5:11:01 AM",
    trigger = repeated(30, Music() == 77) && repeated(600, Music() == 58) && 
              repeated(600, Music() == 1) && repeated(300, Music() == 116) && never(Music() == 0) && never(Music() == 91)
)
