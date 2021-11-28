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
    title = "Sarsaparilla Master of the Manor 1", description = "Collect all leaves of the first Manor level and finish it", points = 5,
    id = 107427, badge = "118839", published = "2020-04-19 9:13:41 PM", modified = "2021-07-26 5:48:19 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x1f) && Item() == 8 
)

achievement(
    title = "Sarsaparilla Master of the Manor 2", description = "Collect all leaves of the second Manor level and defeat the boss", points = 5,
    id = 107430, badge = "118492", published = "2020-04-19 9:14:00 PM", modified = "2020-04-25 1:03:01 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x35) && ManorBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Sarsaparilla Master of the Workbench 1", description = "Collect all leaves of the first Workbench level and finish it", points = 5,
    id = 107433, badge = "118849", published = "2020-04-19 9:14:16 PM", modified = "2021-07-26 5:48:24 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x5a) && Item() == 9 
)

achievement(
    title = "Sarsaparilla Master of the Workbench 2", description = "Collect all leaves of the second Workbench level and defeat the boss", points = 5,
    id = 107434, badge = "118493", published = "2020-04-19 9:14:19 PM", modified = "2020-04-25 1:03:04 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x5c) && WorkbenchBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Sarsaparilla Master of the Laboratory 1", description = "Collect all leaves of the first Laboratory level and finish it", points = 5,
    id = 107435, badge = "118841", published = "2020-04-19 9:14:28 PM", modified = "2021-07-26 5:49:12 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x01) && Item() == 11 
)

achievement(
    title = "Wave Master", description = "Get all the leaves and finish the Die Flood Wave Level", points = 10,
    id = 107424, badge = "118862", published = "2020-04-19 9:13:20 PM", modified = "2020-04-26 5:14:41 PM",
    trigger = measured(Leaves() == 47)  && unless(Level() != 0x1b) && Item() == 7 && prev(Item()) == 0
)

achievement(
    title = "Mole Master", description = "Get all the leaves and finish the Mole Level", points = 10,
    id = 107442, badge = "118495", published = "2020-04-19 9:15:14 PM", modified = "2020-04-26 5:14:43 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0xff) && Item() == 10 && prev(Item()) == 0
)

achievement(
    title = "Sarsaparilla Master of the Laboratory 2", description = "Collect all leaves of the second Laboratory level and defeat the boss", points = 5,
    id = 107445, badge = "118854", published = "2020-04-19 9:15:23 PM", modified = "2020-04-26 4:47:48 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0xa2) && LaboratoryBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Sarsaparilla Master of the Library 1", description = "Collect all leaves of the first Library level and finish it", points = 5,
    id = 107409, badge = "118499", published = "2020-04-19 9:11:09 PM", modified = "2021-07-26 5:48:08 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x38) && Item() == 4 
)

achievement(
    title = "Sarsaparilla Master of the Kitchen 1", description = "Collect all leaves of the first Kitchen level and finish it", points = 5,
    id = 107400, badge = "118370", published = "2020-04-19 9:09:53 PM", modified = "2021-07-26 5:48:03 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x1e) && Item() == 2 
)

achievement(
    title = "Sarsaparilla Master of the Kitchen 2", description = "Collect all leaves of the second Kitchen level and defeat the boss", points = 5,
    id = 107403, badge = "118514", published = "2020-04-19 9:10:15 PM", modified = "2020-04-25 1:28:51 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x49) && KitchenBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Rabbit Master", description = "Get all the leaves and finish the Rabbit Level", points = 10,
    id = 107406, badge = "118503", published = "2020-04-19 9:10:37 PM", modified = "2020-04-26 5:14:48 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x10) && Item() == 3 && prev(Item()) == 0
)

achievement(
    title = "Sarsaparilla Master of the Library 2", description = "Collect all leaves of the second Library level and defeat the boss", points = 5,
    id = 107412, badge = "118507", published = "2020-04-19 9:11:31 PM", modified = "2020-04-25 1:03:49 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x15) && LibraryBoss() == 255 && EndLevel() == 155 
)

achievement(
    title = "Well Master", description = "Get all the leaves and finish the Well Bottomless Level", points = 10,
    id = 107415, badge = "118509", published = "2020-04-19 9:12:15 PM", modified = "2020-04-26 5:14:52 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x14) && Item() == 5 && prev(Item()) == 0 
)

achievement(
    title = "Sarsaparilla Master of the Planet 1", description = "Collect all leaves of the first Planet level and finish it", points = 5,
    id = 107418, badge = "118836", published = "2020-04-19 9:12:33 PM", modified = "2021-07-26 5:48:15 AM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x57) && Item() == 6 
)

achievement(
    title = "Sarsaparilla Master of the Planet 2", description = "Collect all leaves of the second Planet level and defeat the boss", points = 5,
    id = 107421, badge = "118511", published = "2020-04-19 9:12:55 PM", modified = "2020-04-25 1:03:56 PM",
    trigger = measured(Leaves() == 47) && unless(Level() != 0x28) && PlanetBoss() == 255 && EndLevel() == 155 
)

rich_presence_display("{0}The Smurf is dreaming {1}with {2} Lives() and {3} points.",
    rich_presence_lookup("Paused", word(0x00DB42), PausedLookup),
    rich_presence_lookup("Level", Level(), LevelLookup),
    rich_presence_value("Lives()", bcd(Lives())),
    rich_presence_value("Score", bcd(Score34()) * 100 + bcd(Score12()) * 10000)
)
