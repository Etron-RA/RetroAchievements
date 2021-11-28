// Smurfs' Nightmare, The
// #ID = 16218

// $D0A2: [8-bit] Level ID
//        0x4a=Village
//        0x1e=Kitchen-1
//        0x49=Kitchen-2
//        0x10=Rabbit
//        0x38=Library-1
//        0x15=Library-2
//        0x14=Well
//        0x57=Planet-1
//        0x28=Planet-2
//        0x1b=Wave
//        0x1f=iManor-1
//        0x35=Manor-2
//        0x5a=Workbench-1
//        0x5c=Workbench-2
//        0xff=Mole
//        0x01=Laboratory-1
//        0xa2=Laboratory-2
function Level() => byte(0xD0A2)

// $D6F7: Laboratory boss life (0xff=killed)
function LaboratoryBoss() => byte(0xD6F7)

// $D74A: Workbench Boss life (0xff when killed)
function WorkbenchBoss() => byte(0xD74A)

// $D756: Manor Boss Life (0xff=killed)
function ManorBoss() => byte(0xD756)

// $D790: Planet boss life (0xff=killed)
function PlanetBoss() => byte(0xD790)

// $D7AD: Kitchen Boss Life (0xff=killed)
function KitchenBoss() => byte(0xD7AD)

// $D823: Library boss life (0xff=killed)
function LibraryBoss() => byte(0xD823)

// $DB42: Pause (00=live ; 01=paused)
// $DEF1: Opened gifts
// $DEFF: Stage skip enable (80=active)
function StageSkip() => byte(0xDEFF)

// $FF8C: Difficulty (00=easy ff=hard)
function Difficulty() => byte(0xFF8C)

// $FF8D: Music (on=00 off=ff)
// $FF92: Current key or Item(), returns to 0x00 when used
//        (0x01=first door;
//        0x02=carrot;
//        0x03=second door;
//        0x04=rope;
//        0x05=third door;
//        0x06=hammer;
//        0x07=fourth door;
//        0x08=fifth door;
//        0x09=glasses;
//        0x0a=sixth door;
//        0x0b=potion)
function Item() => byte(0xFF92)

// $FF9B: Wings and Bubble time remaining
// $FFB8: Current place (00=village; ff=any level)
function Place() => byte(0xFFB8)

// $FFDC: Enemies freeze timer
function Freeze() => byte(0xFFDC)

// $FFDD: Invincibility timer
function Invincibility() => byte(0xFFDD)

// $FFEE: Collected leaves (10=double jump; 20=triple jump)
//        /!\ Value is converted into Ten/Unit for end of level scoring /!\
function Leaves() => byte(0xFFEE)

// $FFEF: Maximum hearts (bits 3 to 0)
//        Extra heart from library=bit7
//        Extra heart from manor=bit6
function Hearts() => low4(0xFFEF)
function LibraryHeart() => bit7(0xFFEF)
function ManorHeart() => bit6(0xFFEF)

// $FFF0: Current number of hearts

// $FFF1: Number of Lives()
function Lives() => byte(0xFFF1)

// $FFF2: 3rd and 4th score digits
function Score34() => byte(0xFFF2)

// $FFF3: 1st and 2nd score digits
function Score12() => byte(0xFFF3)

// $FFF4: Remaining Oxygen
function Oxygen() => byte(0xFFF4)

// $FFF5: Current Inputs
//        (bit7=down ; bit6=up ; bit5=left ; bit4=right ; bit3=start ; bit2=select ; bit1=B ; bit0=A)
function Inputs() => byte(0xFFF5)
function SelectKey() => bit2(0xFFF5)

// $FFFA: End of level animation (from 00 to 9b)
function EndLevel() => byte(0xFFFA)

// $FFFB: Increase when screen transition

PausedLookup = {
    0x00: "",
    0x01: "▌▌ ",
}

LevelLookup = {
    0x4a: "in the Village ",
    0x1e: "in the Kitchen-1 ",
    0x49: "in the Kitchen-2 ",
    0x10: "of a Rabbit ",
    0x38: "in the Library-1 ",
    0x15: "in the Library-2 ",
    0x14: "of a Well ",
    0x57: "in the Planet-1 ",
    0x28: "in the Planet-2 ",
    0x1b: "of a Wave ",
    0x1f: "in the Manor-1 ",
    0x35: "in the Manor-2 ",
    0x5a: "in the Workbench-1 ",
    0x5c: "in the Workbench-2 ",
    0xff: "of a Mole ",
    0x01: "in the Laboratory-1 ",
    0xa2: "in the Laboratory-2 ",
}

achievement(
    title = "Mole Rider", description = "Finish the Mole Level and Get the laboratory key", points = 5,
    id = 107440, badge = "118490", published = "2020-04-19 9:15:08 PM", modified = "2020-04-25 1:02:57 PM",
    trigger = Item() == 10 && prev(Item()) == 0
)

achievement(
    title = "Get the workbench key", description = "Finish the first level of the haunted Manor", points = 5,
    id = 107425, badge = "118838", published = "2020-04-19 9:13:29 PM", modified = "2020-04-26 4:01:07 PM",
    trigger = Item() == 8 && prev(Item()) == 0
)

achievement(
    title = "Get the workbench key (hard)", description = "Finish the first level of the haunted Manor in hard mode", points = 5,
    id = 107426, badge = "118846", published = "2020-04-19 9:13:34 PM", modified = "2020-04-26 4:43:26 PM",
    trigger = Item() == 8 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Manor 1", description = "Collect all leaves of the first Manor level and finish it", points = 5,
    id = 107427, badge = "118839", published = "2020-04-19 9:13:41 PM", modified = "2021-07-26 5:48:19 AM",
    trigger = Leaves() == 47 && Level() == 31 && Item() == 8 
)

achievement(
    title = "Shy Smurf has a dream", description = "Kill the Manor boss and Rescue Shy Smurf", points = 5,
    id = 107428, badge = "117637", published = "2020-04-19 9:13:53 PM", modified = "2020-04-19 9:13:53 PM",
    trigger = ManorBoss() == 255 && EndLevel() == 155 && Item() == 8
)

achievement(
    title = "Shy Smurf has a dream (hard)", description = "Kill the Manor boss and Rescue Shy Smurf in hard mode", points = 5,
    id = 107429, badge = "118491", published = "2020-04-19 9:13:56 PM", modified = "2020-04-25 1:02:59 PM",
    trigger = ManorBoss() == 255 && EndLevel() == 155 && Item() == 8 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Manor 2", description = "Collect all leaves of the second Manor level and defeat the boss", points = 5,
    id = 107430, badge = "118492", published = "2020-04-19 9:14:00 PM", modified = "2020-04-25 1:03:01 PM",
    trigger = Leaves() == 47 && ManorBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Get the glasses", description = "Finish the first level of the Workbench", points = 5,
    id = 107431, badge = "118847", published = "2020-04-19 9:14:09 PM", modified = "2020-04-26 4:43:43 PM",
    trigger = Item() == 9 && prev(Item()) == 0
)

achievement(
    title = "Get the glasses (hard)", description = "Finish the first level of the Workbench in hard mode", points = 5,
    id = 107432, badge = "118848", published = "2020-04-19 9:14:13 PM", modified = "2020-04-26 4:44:06 PM",
    trigger = Item() == 9 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Workbench 1", description = "Collect all leaves of the first Workbench level and finish it", points = 5,
    id = 107433, badge = "118849", published = "2020-04-19 9:14:16 PM", modified = "2021-07-26 5:48:24 AM",
    trigger = Leaves() == 47 && Level() == 90 && Item() == 9 
)

achievement(
    title = "Sarsaparilla Master of the Workbench 2", description = "Collect all leaves of the second Workbench level and defeat the boss", points = 5,
    id = 107434, badge = "118493", published = "2020-04-19 9:14:19 PM", modified = "2020-04-25 1:03:04 PM",
    trigger = Leaves() == 47 && WorkbenchBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Sarsaparilla Master of the Laboratory 1", description = "Collect all leaves of the first Laboratory level and finish it", points = 5,
    id = 107435, badge = "118841", published = "2020-04-19 9:14:28 PM", modified = "2021-07-26 5:49:12 AM",
    trigger = Leaves() == 47 && Level() == 1 && Item() == 11 
)

achievement(
    title = "Handy Smurf has a dream", description = "Kill the Workbench boss and Rescue Handy Smurf", points = 5,
    id = 107436, badge = "117638", published = "2020-04-19 9:14:40 PM", modified = "2020-04-19 9:14:40 PM",
    trigger = WorkbenchBoss() == 255 && EndLevel() == 155 && Item() == 9
)

achievement(
    title = "Handy Smurf has a dream (hard)", description = "Kill the Workbench boss and Rescue Handy Smurf in hard mode", points = 5,
    id = 107437, badge = "118851", published = "2020-04-19 9:14:42 PM", modified = "2020-04-26 4:46:09 PM",
    trigger = WorkbenchBoss() == 255 && EndLevel() == 155 && Item() == 9 && Difficulty() == 255
)

achievement(
    title = "Get the flask", description = "Finish the first level of the Laboratory", points = 5,
    id = 107438, badge = "118840", published = "2020-04-19 9:14:58 PM", modified = "2020-04-26 4:20:42 PM",
    trigger = Item() == 11 && prev(Item()) == 0
)

achievement(
    title = "Get the flask (hard)", description = "Finish the first level of the Laboratory in hard mode", points = 5,
    id = 107439, badge = "118852", published = "2020-04-19 9:15:02 PM", modified = "2020-04-26 4:46:18 PM",
    trigger = Item() == 11 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Wave Master", description = "Get all the leaves and finish the Die Flood Wave Level", points = 10,
    id = 107424, badge = "118862", published = "2020-04-19 9:13:20 PM", modified = "2020-04-26 5:14:41 PM",
    trigger = Leaves() == 47 && Item() == 7 && prev(Item()) == 0 && 
              never(Leaves() == 0) && never(Lives() < prev(Lives()))
)

achievement(
    title = "Mole Rider (Hard)", description = "Finish the Mole Level and Get the laboratory key in hard mode", points = 5,
    id = 107441, badge = "118861", published = "2020-04-19 9:15:11 PM", modified = "2020-04-26 4:58:45 PM",
    trigger = Item() == 10 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Mole Master", description = "Get all the leaves and finish the Mole Level", points = 10,
    id = 107442, badge = "118495", published = "2020-04-19 9:15:14 PM", modified = "2020-04-26 5:14:43 PM",
    trigger = Leaves() == 47 && Item() == 10 && prev(Item()) == 0 && 
              never(Leaves() == 0) && never(Lives() < prev(Lives()))
)

achievement(
    title = "Papa Smurf has a dream", description = "Kill the Laboratory boss and Rescue Papa Smurf", points = 5,
    id = 107443, badge = "117639", published = "2020-04-19 9:15:18 PM", modified = "2020-04-26 5:19:18 PM",
    trigger = LaboratoryBoss() == 255 && EndLevel() == 155 && Item() == 11
)

achievement(
    title = "Papa Smurf has a dream (hard)", description = "Kill the Laboratory boss and Rescue Papa Smurf in hard mode", points = 5,
    id = 107444, badge = "118853", published = "2020-04-19 9:15:20 PM", modified = "2020-04-26 4:46:38 PM",
    trigger = LaboratoryBoss() == 255 && EndLevel() == 155 && Item() == 11 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Laboratory 2", description = "Collect all leaves of the second Laboratory level and defeat the boss", points = 5,
    id = 107445, badge = "118854", published = "2020-04-19 9:15:23 PM", modified = "2020-04-26 4:47:48 PM",
    trigger = Leaves() == 47 && LaboratoryBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Bronze Score", description = "Score at least 100.000 points", points = 10,
    id = 107446, badge = "118842", published = "2020-04-19 9:15:26 PM", modified = "2021-07-18 11:25:21 PM",
    trigger = Score12() >= 16 && prev(Score12()) < 16
)

achievement(
    title = "Silver Score", description = "Score at least 200.000 points", points = 10,
    id = 107447, badge = "118843", published = "2020-04-19 9:15:27 PM", modified = "2020-04-26 4:32:43 PM",
    trigger = Score12() >= 32 && prev(Score12()) == 25
)

achievement(
    title = "Gold Score", description = "Score at least 300.000 points", points = 25,
    id = 107448, badge = "118844", published = "2020-04-19 9:15:29 PM", modified = "2020-04-26 4:32:45 PM",
    trigger = Score12() >= 48 && prev(Score12()) == 41
)

achievement(
    title = "The Heart of the Library", description = "Find the extra heart in the Library", points = 10,
    id = 107449, badge = "118414", published = "2020-04-19 9:15:30 PM", modified = "2020-04-26 7:54:55 PM",
    trigger = Hearts() == 5 && prev(Hearts()) == 4
)

achievement(
    title = "The Heart of the Manor", description = "Find the extra heart in the Manor", points = 10,
    id = 107450, badge = "118496", published = "2020-04-19 9:15:31 PM", modified = "2020-04-26 7:55:42 PM",
    trigger = ManorHeart() == 1 && prev(ManorHeart()) == 0 &&
              ((Hearts() == 6 && prev(Hearts()) == 5) ||
               (Hearts() == 5 && prev(Hearts()) == 4))
)

achievement(
    title = "Full of Life", description = "Find the two extra hearts of the game in one session", points = 25,
    id = 107451, badge = "118497", published = "2020-04-19 9:15:33 PM", modified = "2020-04-26 5:18:27 PM",
    trigger = Hearts() == 6 && prev(Hearts()) == 5
)

achievement(
    title = "The Eternal Schtroumpf", description = "Have 15 Lives()", points = 25,
    id = 107452, badge = "117640", published = "2020-04-19 9:15:37 PM", modified = "2020-04-24 1:31:34 PM",
    trigger = Lives() == 21 && prev(Lives()) == 20
)

achievement(
    title = "Sonic syndrome", description = "Get oxygen just before dying", points = 10,
    id = 107453, badge = "118498", published = "2020-04-19 9:15:39 PM", modified = "2020-04-25 1:03:17 PM",
    trigger = Oxygen() == 23 && prev(Oxygen()) == 1
)

achievement(
    title = "Traveler Smurf", description = "Activate stage skip mode and use it", points = 1,
    id = 107454, badge = "118863", published = "2020-04-19 9:15:41 PM", modified = "2020-04-26 5:01:09 PM",
    trigger = StageSkip() == 128 && SelectKey() == 1 && prev(Inputs()) == 0
)

achievement(
    title = "Sarsaparilla Master of the Library 1", description = "Collect all leaves of the first Library level and finish it", points = 5,
    id = 107409, badge = "118499", published = "2020-04-19 9:11:09 PM", modified = "2021-07-26 5:48:08 AM",
    trigger = Leaves() == 47 && Level() == 56 && Item() == 4 
)

achievement(
    title = "Triple Jump", description = "Earn the ability to triple Jump", points = 3,
    id = 107395, badge = "117386", published = "2020-04-19 9:09:11 PM", modified = "2020-04-19 9:09:11 PM",
    trigger = Leaves() == 32 && prev(Leaves()) == 31
)

achievement(
    title = "Destroy them all", description = "Get the invincibility potion for the first time", points = 2,
    id = 107396, badge = "118835", published = "2020-04-19 9:09:18 PM", modified = "2020-04-26 7:42:19 PM",
    trigger = repeated(254, Invincibility() < prev(Invincibility())) && never(Invincibility() == 255)
)

achievement(
    title = "Freeze them all", description = "Stop all the enemies for the first time", points = 2,
    id = 107397, badge = "117388", published = "2020-04-19 9:09:22 PM", modified = "2020-04-26 7:42:16 PM",
    trigger = repeated(191, Freeze() < prev(Freeze())) && never(Freeze() == 0)
)

achievement(
    title = "Get the carrot", description = "Finish the first level of the Kitchen of danger", points = 5,
    id = 107398, badge = "118500", published = "2020-04-19 9:09:35 PM", modified = "2020-04-25 1:03:29 PM",
    trigger = Item() == 2 && prev(Item()) == 0
)

achievement(
    title = "Get the carrot (hard)", description = "Finish the first level of the Kitchen of danger in hard mode", points = 5,
    id = 107399, badge = "118855", published = "2020-04-19 9:09:41 PM", modified = "2020-04-26 4:48:10 PM",
    trigger = Item() == 2 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Kitchen 1", description = "Collect all leaves of the first Kitchen level and finish it", points = 5,
    id = 107400, badge = "118370", published = "2020-04-19 9:09:53 PM", modified = "2021-07-26 5:48:03 AM",
    trigger = Leaves() == 47 && Level() == 30 && Item() == 2 
)

achievement(
    title = "Greedy Smurf has a dream", description = "Kill the Kitchen boss and Rescue Greedy Smurf", points = 5,
    id = 107401, badge = "118501", published = "2020-04-19 9:10:04 PM", modified = "2020-04-25 1:03:33 PM",
    trigger = KitchenBoss() == 255 && EndLevel() == 155 && Item() == 2
)

achievement(
    title = "Greedy Smurf has a dream (hard)", description = "Kill the Kitchen boss and Rescue Greedy Smurf in hard mode", points = 5,
    id = 107402, badge = "118506", published = "2020-04-19 9:10:11 PM", modified = "2020-04-25 1:03:35 PM",
    trigger = KitchenBoss() == 255 && EndLevel() == 155 && Item() == 2 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Kitchen 2", description = "Collect all leaves of the second Kitchen level and defeat the boss", points = 5,
    id = 107403, badge = "118514", published = "2020-04-19 9:10:15 PM", modified = "2020-04-25 1:28:51 PM",
    trigger = Leaves() == 47 && KitchenBoss() == 255 && EndLevel() == 155 && 
              never(Lives() < prev(Lives())) && never(Leaves() == 128)
)

achievement(
    title = "Rabbit Rider", description = "Finish the Rabbit Level and Get the library key", points = 5,
    id = 107404, badge = "118502", published = "2020-04-19 9:10:24 PM", modified = "2020-04-25 1:03:36 PM",
    trigger = Item() == 3 && prev(Item()) == 0
)

achievement(
    title = "Rabbit Rider (Hard)", description = "Finish the Rabbit Level and Get the library key in hard mode", points = 5,
    id = 107405, badge = "118860", published = "2020-04-19 9:10:28 PM", modified = "2020-04-26 4:57:27 PM",
    trigger = Item() == 3 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Rabbit Master", description = "Get all the leaves and finish the Rabbit Level", points = 10,
    id = 107406, badge = "118503", published = "2020-04-19 9:10:37 PM", modified = "2020-04-26 5:14:48 PM",
    trigger = Leaves() == 47 && Item() == 3 && prev(Item()) == 0 && 
              never(Leaves() == 0) && never(Lives() < prev(Lives()))
)

achievement(
    title = "Get the rope", description = "Finish the first level of the Library of Fear", points = 5,
    id = 107407, badge = "118504", published = "2020-04-19 9:10:55 PM", modified = "2020-04-25 1:03:44 PM",
    trigger = Item() == 4 && prev(Item()) == 0
)

achievement(
    title = "Get the rope (hard)", description = "Finish the first level of the Library of Fear in hard mode", points = 5,
    id = 107408, badge = "118856", published = "2020-04-19 9:11:03 PM", modified = "2020-04-26 4:48:32 PM",
    trigger = Item() == 4 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Double Jump", description = "Earn the ability to double Jump", points = 3,
    id = 107394, badge = "117385", published = "2020-04-19 9:09:04 PM", modified = "2020-04-19 9:09:04 PM",
    trigger = Leaves() == 16 && prev(Leaves()) == 15
)

achievement(
    title = "Brainy Smurf has a dream", description = "Kill the Library boss and Rescue Brainy Smurf", points = 5,
    id = 107410, badge = "117635", published = "2020-04-19 9:11:19 PM", modified = "2020-04-19 9:11:19 PM",
    trigger = LibraryBoss() == 255 && EndLevel() == 155 && Item() == 4
)

achievement(
    title = "Brainy Smurf has a dream (hard)", description = "Kill the Library boss and Rescue Brainy Smurf in hard mode", points = 5,
    id = 107411, badge = "118505", published = "2020-04-19 9:11:23 PM", modified = "2020-04-25 1:03:47 PM",
    trigger = LibraryBoss() == 255 && EndLevel() == 155 && Item() == 4 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Library 2", description = "Collect all leaves of the second Library level and defeat the boss", points = 5,
    id = 107412, badge = "118507", published = "2020-04-19 9:11:31 PM", modified = "2020-04-25 1:03:49 PM",
    trigger = Leaves() == 47 && LibraryBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Well swimmer", description = "Finish the Bottomless Well Level and Get the mysterious planet key", points = 5,
    id = 107413, badge = "118508", published = "2020-04-19 9:12:07 PM", modified = "2020-04-25 1:03:51 PM",
    trigger = Item() == 5 && prev(Item()) == 0
)

achievement(
    title = "Well swimmer (Hard) ", description = "Finish the Bottomless Well Level and Get the mysterious key in hard mode", points = 5,
    id = 107414, badge = "118859", published = "2020-04-19 9:12:12 PM", modified = "2020-04-26 4:57:12 PM",
    trigger = Item() == 5 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Well Master", description = "Get all the leaves and finish the Well Bottomless Level", points = 10,
    id = 107415, badge = "118509", published = "2020-04-19 9:12:15 PM", modified = "2020-04-26 5:14:52 PM",
    trigger = Leaves() == 47 && Item() == 5 && prev(Item()) == 0 && 
              never(Leaves() == 0) && never(Lives() < prev(Lives()))
)

achievement(
    title = "Get the hammer", description = "Finish the first level of the Mysterious Planet", points = 5,
    id = 107416, badge = "118837", published = "2020-04-19 9:12:23 PM", modified = "2020-04-26 3:56:18 PM",
    trigger = Item() == 6 && prev(Item()) == 0
)

achievement(
    title = "Get the hammer (hard)", description = "Finish the first level of the Mysterious Planet in hard mode", points = 5,
    id = 107417, badge = "118857", published = "2020-04-19 9:12:28 PM", modified = "2020-04-26 4:48:50 PM",
    trigger = Item() == 6 && prev(Item()) == 0 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Planet 1", description = "Collect all leaves of the first Planet level and finish it", points = 5,
    id = 107418, badge = "118836", published = "2020-04-19 9:12:33 PM", modified = "2021-07-26 5:48:15 AM",
    trigger = Leaves() == 47 && Level() == 87 && Item() == 6 
)

achievement(
    title = "Space Smurf has a dream", description = "Kill the Planet boss and Rescue Space Smurf", points = 5,
    id = 107419, badge = "117636", published = "2020-04-19 9:12:42 PM", modified = "2020-04-19 9:12:42 PM",
    trigger = PlanetBoss() == 255 && EndLevel() == 155 && Item() == 6
)

achievement(
    title = "Space Smurf has a dream (hard)", description = "Kill the Planet boss and Rescue Space Smurf in hard mode", points = 5,
    id = 107420, badge = "118510", published = "2020-04-19 9:12:48 PM", modified = "2020-04-25 1:03:55 PM",
    trigger = PlanetBoss() == 255 && EndLevel() == 155 && Item() == 6 && Difficulty() == 255
)

achievement(
    title = "Sarsaparilla Master of the Planet 2", description = "Collect all leaves of the second Planet level and defeat the boss", points = 5,
    id = 107421, badge = "118511", published = "2020-04-19 9:12:55 PM", modified = "2020-04-25 1:03:56 PM",
    trigger = Leaves() == 47 && PlanetBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Wave survivor", description = "Finish the Die Flood Wave Level and Get the Manor key", points = 5,
    id = 107422, badge = "118512", published = "2020-04-19 9:13:14 PM", modified = "2020-04-25 1:03:58 PM",
    trigger = Item() == 7 && prev(Item()) == 0
)

achievement(
    title = "Wave survivor (Hard)", description = "Finish the Die Flood Wave and Get the manor key in hard mode", points = 5,
    id = 107423, badge = "118858", published = "2020-04-19 9:13:18 PM", modified = "2020-04-26 4:56:56 PM",
    trigger = Item() == 7 && prev(Item()) == 0 && Difficulty() == 255
)

rich_presence_display("{0}The Smurf is dreaming {1}with {2} Lives() and {3} points.",
    rich_presence_lookup("Paused", word(0x00DB42), PausedLookup),
    rich_presence_lookup("Level", Level(), LevelLookup),
    rich_presence_value("Lives()", bcd(Lives())),
    rich_presence_value("Score", bcd(Score34()) * 100 + bcd(Score12()) * 10000)
)
