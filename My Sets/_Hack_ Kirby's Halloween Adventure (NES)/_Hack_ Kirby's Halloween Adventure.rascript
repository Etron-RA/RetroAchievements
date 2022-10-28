// ~Hack~ Kirby's Halloween Adventure
// #ID = 20071

// $004E: powerup modifier
//        0x47 = Winning dance
function PowerupModifier() => byte(0x00004E)

// $0083: Kirby X
function KirbyX() => byte(0x000083)

// $00B9: Kirby Y
function KirbyY() => byte(0x0000B9)

// $00F4: [8-bit] Game Mode
//        
//        0x00 = Normal Mode
//        0x01 = Extra Game
//        0x02 = Vs. Boss
function Difficulty() => byte(0x0000F4)
NormalMode = 0
ExtraMode = 1
VSMode = 2

DifficultyLookup = {
    0x00: "",
    0x01: ":Extra Mode. ",
    0x02: ":V.S. Boss. ",
}

// $0191: re: pallet: 30=drawing, f=title/story/paused, 7=demo/gameplay, 13=start,
function Pallet() => byte(0x000191)
function GamePallet() => Pallet() == 0x7

// $01A2: ff during transformation (not the first frame)
function Transformation() => byte(0x0001A2)
function Transforming() => Transformation() == 0xff

// $01FE: e=demo, 2a=story, 34=title, fa=intro, 4=title, 51=game start, 65->8e=in game, 5f->65->8e=enter/exit stage, a1->8e=pause/un,
//        flashes a4,a1 somtimes, e6=reset, 6a=game over, 55=credits
function GameMode() => byte(0x0001FE)
function DemoMode() => GameMode() == 0xe
function Credits() => GameMode() == 0x55
function StartMode() => GameMode() == 0x51
function OverworldTransistion() => GameMode() == 0x5f
function GameOver() => GameMode() == 0x6a
ModeLookup = {
    0xe: "[demo] ",
    0x2a: "[story] ",
    0x34: "[title] ",
    0xfa: "[intro] ",
    0x04: "[title] ",
    0x6a: "[Game Over] ",
    0x55: "[credits] ",
    0x51: "",
    0x65: "",
    0x8e: "",
    0x5f: "",
    0xa1: "",
    0xa4: "",
    0xe6: "",
}

// $051E: Used for pause: 0=transitions?, 1=in game, 7=paused,
function Paused() => byte(0x00051E)
function InGame() => byte(0x00051E) == 1

PausedLookup = {
    0: "",
    1: "",
    7: "▌▌ ",
}

// $0528: Worlds Activated
function WorldsActivated() => byte(0x000528)

// $052B: [8-bit] World 3 Hidden Switch Flags
//        bit 0 - Switch 3-1
//        bit 5 - Switch 3-6
function HiddenSwitchesWorld3() => byte(0x00052B)
function HiddenSwitchWorld3_1() => bit0(0x00052B)
function HiddenSwitchWorld3_6() => bit5(0x00052B)

// $052C: [8-bit] World 4 Hidden Switch Flags
//        bit 0 - Switch 4-1
//        bit 2 - Switch 4-3
//        bit 5 - Switch 4-6
function HiddenSwitchesWorld4() => byte(0x00052C)
function HiddenSwitchWorld4_1() => bit0(0x00052C)
function HiddenSwitchWorld4_3() => bit2(0x00052C)
function HiddenSwitchWorld4_6() => bit5(0x00052C)


// $052D: [8-bit] World 5 Hidden Switch Flags
//        bit 0 - Switch 5-1
//        bit 3 - Switch 5-4
//        bit 4 - Switch 5-5
//        bit 5 - Switch 5-6
function HiddenSwitchesWorld5() => byte(0x00052D)
function HiddenSwitchWorld5_1() => bit0(0x00052D)
function HiddenSwitchWorld5_4() => bit3(0x00052D)
function HiddenSwitchWorld5_5() => bit4(0x00052D)
function HiddenSwitchWorld5_6() => bit5(0x00052D)

// $052E: [8-bit] World 6 Hidden Switch Flags
//        bit 0 - Switch 6-1
//        bit 1 - Switch 6-2
//        bit 2 - Switch 6-3
//        bit 3 - Switch 6-4
//        bit 4 - Switch 6-5
//        bit 5 - Switch 6-6
function HiddenSwitchesWorld6() => byte(0x00052E)
function HiddenSwitchWorld6_1() => bit0(0x00052E)
function HiddenSwitchWorld6_2() => bit1(0x00052E)
function HiddenSwitchWorld6_3() => bit2(0x00052E)
function HiddenSwitchWorld6_4() => bit3(0x00052E)
function HiddenSwitchWorld6_5() => bit4(0x00052E)
function HiddenSwitchWorld6_6() => bit5(0x00052E)

// $052F: [8-bit] World 7 Hidden Switch Flags
//        bit 0 - Switch 7-1
//        bit 5 - Switch 7-6
function HiddenSwitchesWorld7() => byte(0x00052F)
function HiddenSwitchWorld7_1() => bit0(0x00052F)
function HiddenSwitchWorld7_6() => bit5(0x00052F)

// $0558: [8-bit] Worlds
//        0x00 = Level 1 - Pumpkin Prairie
//        0x01 = Level 2 - Spooky Seaside
//        0x02 = Level 3 - Terror Tower
//        0x03 = Level 4 - Skull Street
//        0x04 = Level 5 - Mount Mist
//        0x05 = Level 6 - Hades Harbor
//        0x06 = Level 7 - Ghostly Graves
//        0x07 = Level 8 - Fountain of Dreams
function World() => byte(0x000558)

LevelNameLookup = {
    0x00: "Pumpkin Prairie 1",
    0x01: "Spooky Seaside 2",
    0x02: "Terror Tower 3",
    0x03: "Skull Street 4",
    0x04: "Mount Mist 5",
    0x05: "Hades Harbor 6",
    0x06: "Ghostly Graves 7",
    0x07: "Fountain of Dreams 8",
}

// $0559: [8-bit] Stage
function Stage() => byte(0x000559)
StageLookup = {
    0: "-1",
    1: "-2",
    2: "-3",
    3: "-4",
    4: "-5",
    5: "-6",
    6: "-7",
    7: "",
}

// $055e: [16-bit] Screen ID
//        0x00 = World 1
//        0x01 = World 2
//        0x02 = World 3
//        0x03 = World 4
//        0x04 = World 5
//        0x05 = World 6
//        0x06 = World 7
//        0x08 = World 1 Boss
//        0x09 = World 2 Boss
//        0x0A = World 3 Boss
//        0x0B = World 4 Boss
//        0x0C = World 5 Boss
//        0x0D = World 5 Boss Defeated Zone
//        0x6C = World 6 Boss
//        0x0E = World 7 Boss
//        0x0F = World 8 Boss (Form 1)
//        0x10 = World 8 Boss (Form 2)
//        0x11 = Ending [1] - Moon Blows Up
//        0x12 = Ending [3] - Dream Fountain + The End Sign
//        0x13 = Ending [2] - Dream Fountain Restored
//        0x19 = Museum World 2
//        0x1A = Museum World 3
//        0x1B = Museum World 4
//        0x1C = Museum World 5
//        0x1D = Museum World 6
//        0x1E = Warp Zone World 1
//        0x1F = Warp Zone World 2
//        0x20 = Warp Zone World 3
//        0x21 = Warp Zone World 4
//        0x22 = Warp Zone World 5
//        0x23 = Warp Zone World 6
//        0x24 = Warp Zone World 7
//        0x25 = Arena World 2 (Mr. Frosty)
//        0x26 = Arena World 3 (Wheelie)
//        0x27 = Arena World 4 (Bugzy)
//        0x28 = Arena World 5 (Bonkers)
//        0x29 = Arena World 6 (Fire Lion)
//        0x2A = Bonus Jump After Level
function ScreenID() => word(0x00055e)
function ScreenByte() => byte(0x00055e)
function OnOverworld() => ScreenID() <= 0x6
function EnterStage() => prev(ScreenID()) <= 0x6 && ScreenID() > 0x6
function BonusJump() => ScreenID() == 0x2A

// $057B: Screen X
function ScreenX() => byte(0x00057B)

// $057C: Screen Y
function ScreenY() => byte(0x00057C)

// $0593: Score (16-bit)
//        1=10 points
function Score() => word(0x000593)

// $0597: Life meter modifier (2f: full, 27: five life, 1f: 4 life, 17: 3 life,
//        0f: 2 life, 07: 1 life, ff: empty, 3f=demo
function Life() => byte(0x000597)

LifeLookup = {
    0: "",
    0x3f: "[demo]",
    0x2f: "⫿⫿⫿⫿⫿⫿",
    0x27: "⫿⫿⫿⫿⫿-",
    0x1f: "⫿⫿⫿⫿--",
    0x17: "⫿⫿⫿---",
    0x0f: "⫿⫿----",
    0x07: "⫿-----",
    0xff: "------",
}

// $0599: Lives
function Lives() => byte(0x000599)

// $05E1: Kirby's current move (0xb == transform)
function Moves() => byte(0x0005E1)
function Eat() => prev(Moves()) != 0xb && Moves() == 0xb

// $05E2: Whats inside your mouth. Same ids as the powerups
function InsideMouth() => byte(0x0005E2)

// $05E3: 00= fire 01=spark 02=cutter 03=Sword 04=fireball 05=laser 06=mike 07=wheel 08=hammer 09=parasol
//        0a=sleep 0b=needle 0c=ice 0d=freeze 0e=hi-jump 0f=beam 10=stone 11=ball 12=tornado
//        13=crash 14=light 15=back drop 16=throw 17=u.f.o. 18=star rod 19=bye bye ff=normal
function Ability() => byte(0x0005E3)
PowerupLookup = {
    0: "fire",
    1: "spark",
    2: "cutter",
    3: "sword",
    4: "burning",
    5: "laser",
    6: "mike",
    7: "wheel",
    8: "hammer",
    9: "parasol",
    0xa: "sleep",
    0xb: "needle",
    0xc: "ice",
    0xd: "freeze",
    0xe: "hi-jump",
    0xf: "beam",
    0x10: "rock",
    0x11: "ball",
    0x12: "tornado",
    0x13: "crash",
    0x14: "light",
    0x15: "wrestler",
    0x16: "throw",
    0x17: "U.F.O.",
    0x18: "star rod",
    0x19: "bye bye",
    0xff: "",
}

// $0783: Music
function Music() => byte(0x000783)

// $07B0: Eggs thrown
function EggsThrown() => byte(0x0007B0)

// $07B1: Eggs Catched
function EggsCaught() => byte(0x0007B1)

// $07C1: 01-end crane minigame
function CraneFeverEnd() => byte(0x0007C1)

// $07C2: Prizes in Crane Fever
function CraneFeverPrize1() => byte(0x0007C2)

// $07C3: 2nd Prize
function CraneFeverPrize2() => byte(0x0007C3)

// $6249: Stage in Draw Off
//        05-end
function QuickDrawEnd() => byte(0x006249)

// $626C: UnderMenu
function UnderMenu() => byte(0x00626C)

// $62C7: Kirby Animation (0xff = none)
function Animation() => byte(0x0062C7)

// $66e9: [8-bit] Boss Health Display
function BossHealth() => byte(0x66e9)

// $66eb: Mix Ability (goes from 22 to 1 during transformation)
function HUD() => byte(0x66eb)
function Mix() => HUD() == 0x22
function Nothing() => HUD() == 0x21

//------------------------------------------------------------------
// Helper Macros

// Reverse Lookup to lookup dictionaries by value and returns thekey or -1 if an error
function ReverseLookup(dictionary,value)
{
    result = -1
    for key in dictionary 
    {
        if(dictionary[key] == value) result = key
    }
    return result
}

// Converts the time minutes:seconds:frames to frames (1/60s each)
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

function BossBeat(screenid)
{
    trigger = prev(PowerupModifier()) != 0x47 &&
        PowerupModifier() == 0x47
        
    if (screenid >= 0x0e && screenid <= 0x10)
        trigger = prev(BossHealth()) > 0x0 &&
            prev(BossHealth()) < 0x7f &&
            BossHealth() == 0x0
    else if (screenid > 0x10 && screenid <= 0x29)
        trigger = Music() == 0x17
        
    return trigger
}

// Database of the levels
// Name, World, Stage, End Function, Overworld, Screen 1, Screen 2, ..., Screen 17
Levels = {
0x11: ["Pumpkin Path", 0, 0, BonusJump(), 0x00, 0x2b, 0x2c, 0x15, 0x2d],
0x12: ["Summit Scares", 0, 1, BonusJump(), 0x00, 0x2f, 0x31, 0x32, 0x33],
0x13: ["Haunted Hills", 0, 2, BonusJump(), 0x00, 0x35, 0x36, 0x34, 0x37, 0x38],
0x14: ["Fright Forest", 0, 3, BonusJump(), 0x00, 0x39, 0x3a, 0x3b, 0x3c],
0x18: ["Yggy Woods Jr.", 0, 7, BossBeat(0x08), 0x00, 0x08],
0x21: ["Skeleton Shore", 1, 0, BonusJump(), 0x01, 0xa9, 0xab, 0xaa, 0xac],
0x22: ["Morning Mangrove", 1, 1, BonusJump(), 0x01, 0xad, 0xab, 0xad, 0xae, 0xaf, 0xb0],
0x23: ["Sand Sea", 1, 2, BonusJump(), 0x01, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6],
0x24: ["West Wilderness", 1, 3, BonusJump(), 0x01, 0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbc, 0xbe],
0x25: ["Colorful Caverns", 1, 4, BonusJump(), 0x01, 0xc1, 0xbf, 0xc0, 0xc2, 0xc4, 0xc5],
0x28: ["Adeleine", 1, 7, BossBeat(0x09), 0x01, 0x09],
0x31: ["Menacing Mansion", 2, 0, BonusJump(), 0x02, 0xc6, 0xc7, 0xc9, 0xc8, 0xcb, 0xca, 0xcf, 0xc9],
0x32: ["Aquarium Altars", 2, 1, BonusJump(), 0x02, 0xcc, 0xce, 0xcd, 0xcc, 0xcf, 0xcc, 0xb7, 0xd0, 0xd2],
0x33: ["Phantom Pyramid", 2, 2, BonusJump(), 0x02, 0xd3, 0xd4, 0xd0, 0xd6, 0xd0, 0xd6, 0xd0, 0xd5],
0x34: ["Flying Fortress", 2, 3, BonusJump(), 0x02, 0xd8, 0xda, 0xdc, 0xdf, 0xd7, 0xdd],
0x35: ["Moonlight Memories", 2, 4, BonusJump(), 0x02, 0xc3, 0xde, 0xe0, 0xd1, 0xe0, 0xe8, 0xe1, 0xe2],
0x36: ["Titanic Tower", 2, 5, BonusJump(), 0x02, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe9, 0xea, 0xeb],
0x38: ["Mr Bright & Mr Shine", 2, 7, BossBeat(0x0a), 0x02, 0x0a],
0x41: ["Tombstone Tunnel", 3, 0, BonusJump(), 0x03, 0xec, 0xed, 0xef, 0xf1, 0xee, 0xf0],
0x42: ["Silent Streets", 3, 1, BonusJump(), 0x03, 0xf0, 0xf2, 0xf5, 0xf2, 0xee, 0xf6],
0x43: ["Creepy Circus", 3, 2, BonusJump(), 0x03, 0xf3, 0xf7, 0xf8, 0xf9, 0xfb, 0xfa, 0xfb, 0xfa, 0xfb, 0xfe, 0xfc, 0xfa, 0xfc, 0xfa, 0xfc, 0xff, 0x100],
0x44: ["Stardust Subway", 3, 3, BonusJump(), 0x03, 0x101, 0x103, 0x102, 0x103, 0x107, 0x106],
0x45: ["Macabre Museums", 3, 4, BonusJump(), 0x03, 0x104, 0x105, 0x110, 0x109, 0x108, 0x10a],
0x46: ["Fun Factory", 3, 5, BonusJump(), 0x03, 0x104, 0x10b, 0x10c, 0x10f, 0x10d, 0x10f, 0x10b, 0x110],
0x48: ["Kracko's Revenge", 3, 7, BossBeat(0x0b), 0x03, 0x0b],
0x51: ["Shivery Sierra", 4, 0, BonusJump(), 0x04, 0x111, 0x113, 0x114, 0x112, 0x115],
0x52: ["Magma Mountain", 4, 1, BonusJump(), 0x04, 0x116, 0x117, 0x11c, 0x118, 0x117, 0x118, 0x11b, 0x11a],
0x53: ["Woodland Warriors", 4, 2, BonusJump(), 0x04, 0x11d, 0x11e, 0x11f, 0x11e, 0x120, 0x122],
0x54: ["Tempest Traintracks", 4, 3, BonusJump(), 0x04, 0x123, 0x125, 0x126, 0x127, 0x128, 0x124, 0x129],
0x55: ["Desolate Division", 4, 4, BonusJump(), 0x04, 0x12a, 0x130, 0x12f, 0x12e, 0x12d, 0x12e],
0x56: ["Fear Factory", 4, 5, BonusJump(), 0x04, 0x12b, 0x131, 0x132, 0x134, 0x131, 0x133, 0x136],
0x58: ["Heavy Mole", 4, 7, BossBeat(0x0c), 0x04, 0x0c],
0x61: ["Haunted Harbor", 5, 0, BonusJump(), 0x05, 0x3d, 0x3e, 0x3f, 0x40],
0x62: ["Olympic Odyssey", 5, 1, BonusJump(), 0x05, 0x43, 0x44, 0x43, 0x45, 0x48, 0x47],
0x63: ["Sunken Shipwreck", 5, 2, BonusJump(), 0x05, 0x52, 0x51, 0x4a, 0x4c, 0x4e, 0x4f, 0x4d, 0x53],
0x64: ["Eerie Ends", 5, 3, BonusJump(), 0x05, 0x5c, 0x5f, 0x5e, 0x5d, 0x5e],
0x65: ["Thermal Temple", 5, 4, BonusJump(), 0x05, 0x61, 0x62, 0x65, 0x66, 0x67],
0x66: ["Pirate Poltergeist", 5, 5, BonusJump(), 0x05, 0x56, 0x57, 0x58, 0x54, 0x56, 0x64, 0x6e],
0x68: ["Tuxedo Meta Knight", 5, 7, BossBeat(0xd), 0x05, 0x6c],
0x71: ["Grassland Graveyard", 6, 0, BonusJump(), 0x06, 0x6d, 0x6e, 0x6f, 0x74],
0x72: ["Abstract Arts", 6, 1, BonusJump(), 0x06, 0xa7, 0x75, 0x79, 0x77, 0x79, 0x7a, 0x79],
0x73: ["Sinister Shadows", 6, 2, BonusJump(), 0x06, 0x7f, 0x80, 0x81, 0x83, 0x80, 0x82, 0x80, 0x84],
0x74: ["Cosmic Callbacks", 6, 3, BonusJump(), 0x06, 0x73, 0x90, 0x91, 0x92, 0x93, 0x8d, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x72],
0x75: ["Enchanted Express", 6, 4, BonusJump(), 0x06, 0x73, 0x76, 0xa3, 0xa5, 0xa4, 0xa6, 0xa8],
0x76: ["Rainbow Islands", 6, 5, BonusJump(), 0x06, 0x7e, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f, 0xa0, 0xa1],
0x78: ["Concerto Dedede", 6, 7, BossBeat(0x0e), 0x06, 0x14, 0xe],
0x88: ["Nightmare Angel", 7, 7, BossBeat(0x0f), 0xff0e, 0x0f],
0x89: ["Nightmare Reaper", 7, 7, BossBeat(0x10), 0xff00, 0x10]
}

// Number to text conversion
Transistions = {
    0: "first",
    1: "first",
    2: "second",
    3: "third",
    4: "fourth",
    5: "fifth",
    6: "sixth",
    7: "seventh",
    8: "eigth",
    9: "ninth",
    10: "tenth"
}

// Gets the name of the level
function LevelName(world, stage)
{
    hash = world * 0x10 + stage
    levelInfo = Levels[hash]
    return levelInfo[0]
}

// Get the code to start a level
function LevelStart(world, stage)
{
    hash = world * 0x10 + stage
    levelInfo = Levels[hash]
    worldID = levelInfo[1]
    stageID = levelInfo[2]
    preScreen = levelInfo[4]
    postScreen = levelInfo[5]
    return !DemoMode() &&
        !Credits() &&
        World() == worldID &&
        Stage() == stageID &&
        prev(ScreenID()) == preScreen && 
        ScreenID() == postScreen
}

// Gets the code for the end of the level
function LevelEnd(world, stage)
{
    hash = world * 0x10 + stage
    levelInfo = Levels[hash]    
    return levelInfo[3]
}

//------------------------------------------------------------------
// Abilities

// Code to obtain any copy ability
function ObtainAbility(abilityName)
{
    abilityID = ReverseLookup(PowerupLookup, abilityName)
    
    trigger = !DemoMode() && 
        !Credits() &&
        !StartMode() &&
        Transforming() &&
        InsideMouth() == 0xff &&
        Ability() == abilityID
        
    return trigger
}

// Code for using the mix ability
function MixAbility()
{
    trigger = !DemoMode() &&
        !Credits() &&
        prev(HUD()) == 0x22 &&
        Eat()
    
    return trigger
}

achievement("Playing With Fire!","Obtain the fire ability", 1, ObtainAbility("fire"))
achievement("It’s Alive!","Obtain the spark ability", 1, ObtainAbility("spark"))
achievement("Tell ‘Em Freddy Sent Ya!","Obtain the cutter ability", 1, ObtainAbility("cutter"))
achievement("Sword, Quench Your Thirst!","Obtain the sword ability", 1, ObtainAbility("sword"))
achievement("Burning Man!","Obtain the burning ability", 1, ObtainAbility("burning"))
achievement("Energy Blasts, Huh? Here’s One From a Pro!","Obtain the laser ability", 1, ObtainAbility("laser"))
achievement("Sibilance!","Obtain the mike ability", 1, ObtainAbility("mike"))
achievement("Roll Out!","Obtain the wheel ability", 1, ObtainAbility("wheel"))
achievement("Everything Looks Like a Nail!","Obtain the hammer ability", 1, ObtainAbility("hammer"))
achievement("I’m Mary Poppin’s Y’all!","Obtain the parasol ability", 1, ObtainAbility("parasol"))
achievement("Sweet Dreams!","Obtain the sleep ability", 1, ObtainAbility("sleep"))
achievement("Pins and Needles!","Obtain the needle ability", 1, ObtainAbility("needle"))
achievement("Cold as Ice!","Obtain the ice ability", 1, ObtainAbility("ice"))
achievement("Freeze!","Obtain the freeze ability", 1, ObtainAbility("freeze"))
achievement("Able to Leap Tall Buildings in a Single Bound!","Obtain the hi-jump ability", 1, ObtainAbility("hi-jump"))
achievement("Beaming!","Obtain the beam ability", 1, ObtainAbility("beam"))
achievement("I Got a Rock!","Obtain the rock ability", 1, ObtainAbility("rock"))
achievement("Be the Ball!","Obtain the b-ball ability", 1, ObtainAbility("ball"))
achievement("Sharknado!","Obtain the tornado ability", 1, ObtainAbility("tornado"))
achievement("Crash the Party!","Obtain the crash ability", 1, ObtainAbility("crash"))
achievement("Lightbringer!","Obtain the light ability", 1, ObtainAbility("light"))
achievement("Wanna Wrestle?","Obtain the wrestler ability", 1, ObtainAbility("wrestler"))
achievement("Throwing Stars!","Obtain the throw ability", 1, ObtainAbility("throw"))
achievement("It Came From Planet Dream Land!","Obtain the U.F.O. ability", 1, ObtainAbility("U.F.O."))
achievement("Remixed!","Obtain the mix ability", 1, MixAbility())

//------------------------------------------------------------------
// Progress

// Triggers when the player starts a new world in story mode
function StartWorld(world, mode = 3)
{
    trigger = !DemoMode() &&
        !Credits() 
        
    if (mode == 3)
        trigger =  trigger && Difficulty() < 2
    else
        trigger =  trigger && Difficulty() == mode
        
    if (world == 1)
    {
        trigger = trigger && 
           WorldsActivated() == 0 &&
           GameMode() == 0x51
    }
    else if (world == 8)
    {
        trigger = trigger && 
           BossHealth() == 0x0 &&
           prev(ScreenID()) == 0x0e &&
            ScreenID() == 0xff0e
    }
    else
    {
        trigger = trigger && 
           prev(WorldsActivated()) == (world - 2) &&
           WorldsActivated() == (world - 1)
    }
    return trigger
}

// Triggers when the player ends a new world in story mode
function EndWorld(world, mode = 3)
{
    trigger = !DemoMode()&&
        !Credits() 
        
    if (mode == 3)
        trigger = trigger && Difficulty() < 2
    else
        trigger = trigger && Difficulty() == mode
        
    if (world == 7)
    {
        trigger = trigger && 
           BossHealth() == 0x0 &&
           prev(ScreenID()) == 0x0e &&
            ScreenID() == 0xff0e
    }
    else if (world == 8)
    {
        trigger = trigger && 
           prev(ScreenID()) == 0xff00 &&
            ScreenID() == 0x0011
    }
    else
    {
        trigger = trigger && 
           prev(WorldsActivated()) == (world - 1) &&
           WorldsActivated() == world
    }
    return trigger
}

achievement("Pumpkin Prairie!","Complete Pumpkin Prairie on normal", 5, EndWorld(1, NormalMode))
achievement("Spooky Seaside!","Complete Spooky Seaside on normal", 5, EndWorld(2, NormalMode))
achievement("Terror Tower!","Complete Terror Tower on normal", 5, EndWorld(3, NormalMode))
achievement("Skull Street!","Complete Skull Street on normal", 5, EndWorld(4, NormalMode))
achievement("Mount Mist!","Complete Mount Mist on normal", 5, EndWorld(5, NormalMode))
achievement("Hades Harbor!","Complete Hades Harbor on normal", 5, EndWorld(6, NormalMode))
achievement("Ghostly Graves!","Complete Ghostly Graves on normal", 5, EndWorld(7, NormalMode))
achievement("The Fountain of Dreams!","Complete The Fountain of Dreams on normal", 5, EndWorld(8, NormalMode))
achievement("Pumpkin Prairie Extra!","Complete Pumpkin Prairie on extra", 10, EndWorld(1, ExtraMode))
achievement("Spooky Seaside Extra!","Complete Spooky Seaside on extra", 10, EndWorld(2, ExtraMode))
achievement("Terror Tower Extra!","Complete Terror Tower on extra", 10, EndWorld(3, ExtraMode))
achievement("Skull Street Extra!","Complete Skull Street on extra", 10, EndWorld(4, ExtraMode))
achievement("Mount Mist Extra!","Complete Mount Mist on extra", 10, EndWorld(5, ExtraMode))
achievement("Hades Harbor Extra!","Complete Hades Harbor on extra", 10, EndWorld(6, ExtraMode))
achievement("Ghostly Graves Extra!","Complete Ghostly Graves on extra", 10, EndWorld(7, ExtraMode))
achievement("The Fountain of Dreams Extra!","Complete The Fountain of Dreams on extra", 10, EndWorld(8, ExtraMode))

//------------------------------------------------------------------
// Bosses

function Damageless(noCopyAbility, screenid)
{    
    start = once(!DemoMode() &&
        !Credits() &&
        prev(ScreenID()) != screenid &&
        ScreenID() == screenid)
        
    cancel = never(OnOverworld()) &&
        never(GameOver()) &&
        never(prev(Life()) > Life())
    
    if (noCopyAbility == true)
    {
        
        // Yggy Woods Jr.! starts with fire ability in VS.mode for a couple of frames
        // Concerto Dedede starts with the sword ability in VS.mode for a couple of frames
        // No way to bring powers into these VS. fights
        if (screenid == 0x8 || screenid == 0xe) 
        {
            cancel = cancel && never(prev(Moves()) != Moves() && Ability() != 0xff)
        }
        else
        {
            cancel = cancel && never(Ability() != 0xff)
        }
    }

    // Heavy mole ending is on a different screen then the fight
    if (screenid == 0xc) screenid = 0xd

    // If an arena boss use the music cue otherwise use the power up modifier
    trigger = trigger_when(BossBeat(screenid))
        
    return start && cancel && trigger
}

achievement("Frosty Bones!","Defeat the Frosty Bones in the level 2 arena without taking damage or using a copy ability", 5, Damageless(true, 0x25))
achievement("Waiu!","Defeat the Waiu in the level 3 arena without taking damage or using a copy ability", 5, Damageless(true, 0x26))
achievement("Mother Moth!","Defeat the Mother Moth in the level 4 arena without taking damage or using a copy ability", 5, Damageless(true, 0x27))
achievement("Bonkerstein!","Defeat the Bonkerstein in the level 5 arena without taking damage or using a copy ability", 5, Damageless(true, 0x28))
achievement("Fire Liger!","Defeat the Fire Liger in the level 6 arena without taking damage or using a copy ability", 5, Damageless(true, 0x29))
achievement("Yggy Woods Jr.!","Defeat Yggy Woods Jr. without taking damage or using a copy ability", 5, Damageless(true, 0x08))
achievement("Adeleine!","Defeat Adeleine without taking damage or using a copy ability", 5, Damageless(true, 0x09))
achievement("Mr Bright & Mr Shine!","Defeat Mr Bright & Mr Shine without taking damage or using a copy ability", 5, Damageless(true, 0x0a))
achievement("Kracko's Revenge!","Defeat Kracko without taking damage or using a copy ability", 10, Damageless(true, 0x0b))
achievement("Heavy Mole!","Defeat Heavy Mole without taking damage or using a copy ability", 10, Damageless(true, 0x0c))
achievement("Tuxedo Meta Knight!","Defeat Tuxedo Knight without taking damage", 10, Damageless(false, 0x6c))
achievement("Concerto Dedede!","Defeat King Dedede without taking damage or using a copy ability", 10, Damageless(true, 0x0e))
achievement("Nightmare Angel!","Defeat the Nightmare Angel without taking damage", 10, Damageless(false, 0x0f))
achievement("Nightmare Reaper!","Defeat the Nightmare Reaper without taking damage", 10, Damageless(false, 0x10))

//------------------------------------------------------------------
// Boss Rush Mode

function StartVS()
{
    return !DemoMode() &&
        !Credits() &&
        Difficulty() == VSMode && 
        prev(ScreenID()) != 0x8 && 
        ScreenID() == 0x8 
}

function EndVS()
{
    return !DemoMode() &&
        !Credits() &&
        Difficulty() == VSMode && 
        prev(ScreenID()) == 0xff00 &&
        ScreenID() == 0x0011
}

function BossVS()
{    
    start = once(StartVS())
        
    cancel = never(GameOver())
    
    // If an arena boss use the music cue otherwise use the power up modifier
    trigger = trigger_when(EndVS())
        
    return start && cancel && trigger
}

achievement("The Real Boss!","Defeat the all the bosses consecutively in V.S. Boss mode", 50, BossVS())

//------------------------------------------------------------------
// Bonuses

function BonusChance()
{
    return !DemoMode() &&
        !Credits() &&
        BonusJump() &&
        prev(Lives()) < Lives()
}

function CraneFever()
{
    return !DemoMode() &&
        !Credits() &&
        prev(CraneFeverEnd()) == 0 &&
        CraneFeverEnd() == 1 &&
        CraneFeverPrize1() == 2 &&
        CraneFeverPrize2() == 2 
}

function EggCatcher()
{
    return !DemoMode() &&
        !Credits() &&
        EggsThrown() == 0x1e &&
        prev(EggsCaught()) == 0x1d &&
        EggsCaught() == 0x1e
}

function QuickDraw()
{
    return !DemoMode() &&
        !Credits() &&
        QuickDrawEnd() == 5 &&
        KirbyX() == 0x80 &&
        prev(KirbyY()) == 0x90 &&
        KirbyY() == 0x80
}

achievement("Bonus Chance!","Collect the 1up bonus at the end of any level", 3, BonusChance())
achievement("Crane Fever!","Get 4 lives in the crane fever bonus (any difficulty)", 5, CraneFever())
achievement("Egg Catcher!","Get 3 lives in the egg catcher bonus (any difficulty)", 5, EggCatcher())
achievement("Quick Draw!","Get 3 lives in the quick draw bonus (any difficulty)", 5, QuickDraw())

//------------------------------------------------------------------
// Hidden Switches

function FoundSwitch(world, stage, switch)
{
    return OverworldTransistion() &&
        World() == (world - 1) &&
        Stage() == (stage - 1) &&
        prev(switch) < switch
}

achievement("Terror Tower's Foundation!","Find the hidden switch in level 3-1", 1, FoundSwitch(3, 1, HiddenSwitchWorld3_1()))
achievement("Terror Tower's Peak!","Find the hidden switch in level 3-6", 1, FoundSwitch(3, 6, HiddenSwitchWorld3_6()))
achievement("Dead Man's Eye!","Find the hidden switch in level 4-1", 2, FoundSwitch(4, 1, HiddenSwitchWorld4_1()))
achievement("Haunted Airship!","Find the hidden switch in level 4-3", 2, FoundSwitch(4, 3, HiddenSwitchWorld4_3()))
achievement("The Dark Corners of Skull Street!","Find the hidden switch in level 4-6", 2, FoundSwitch(4, 6, HiddenSwitchWorld4_6()))
achievement("Mount Mist Waterfall!","Find the hidden switch in level 5-1", 3, FoundSwitch(5, 1, HiddenSwitchWorld5_1()))
achievement("Twilight Desert!","Find the hidden switch in level 5-4", 3, FoundSwitch(5, 4, HiddenSwitchWorld5_4()))
achievement("Area 51!","Find the hidden switch in level 5-5", 3, FoundSwitch(5, 5, HiddenSwitchWorld5_5()))
achievement("Storage Facility!","Find the hidden switch in level 5-6", 3, FoundSwitch(5, 6, HiddenSwitchWorld5_6()))
achievement("Hidden Cargo Hold!","Find the hidden switch in level 6-1", 4, FoundSwitch(6, 1, HiddenSwitchWorld6_1()))
achievement("Rock Bottom!","Find the hidden switch in level 6-2", 4, FoundSwitch(6, 2, HiddenSwitchWorld6_2()))
achievement("Sunken Switch!","Find the hidden switch in level 6-3", 4, FoundSwitch(6, 3, HiddenSwitchWorld6_3()))
achievement("Frozen Paradise!","Find the hidden switch in level 6-4", 4, FoundSwitch(6, 4, HiddenSwitchWorld6_4()))
achievement("Lava Lake!","Find the hidden switch in level 6-5", 4, FoundSwitch(6, 5, HiddenSwitchWorld6_5()))
achievement("Midnight Swim!","Find the hidden switch in level 6-6", 5, FoundSwitch(6, 6, HiddenSwitchWorld6_6()))
achievement("Flooded Crypt!","Find the hidden switch in level 7-1", 5, FoundSwitch(7, 1, HiddenSwitchWorld7_1()))
achievement("Retro Palace!","Find the hidden switch in level 7-6", 5, FoundSwitch(7, 6, HiddenSwitchWorld7_6()))

//------------------------------------------------------------------
// Rich Presence

rich_presence_display("{0}{1}{2} Kirby on {3}{4}{5} HP:{6} ❤️:{7}",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("Mode", GameMode(), ModeLookup),
    rich_presence_lookup("Powerup", Ability(), PowerupLookup),
    rich_presence_lookup("LevelName", World(), LevelNameLookup),
    rich_presence_lookup("Stage", Stage(), StageLookup),
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_lookup("Life", Life(), LifeLookup),
    rich_presence_value("Lives", Lives())
)

//------------------------------------------------------------------
// Leadrboards

leaderboard(
    "Speedrun!",
    "Fastest time to complete the game",
    StartWorld(1),
    GameOver(),
    EndWorld(8),
    always_true(),
    format="FRAMES"
)

for index in range(1,8)
{
    leaderboard(
        "World " + index + " Speedrun!",
        "Fastest time to complete world " + index,
        StartWorld(index),
        GameOver(),
        EndWorld(index),
        always_true(),
        format="FRAMES"
    )
}

for levelHash in Levels 
{ 
    levelDetails = Levels[levelHash]
    name = levelDetails[0]
    worldID = levelDetails[1]
    stageID = levelDetails[2]
    submit = levelDetails[3]  
    previousID = levelDetails[4]
    currentID = levelDetails[5]
        
    start = !DemoMode() &&
        !Credits() &&
        Difficulty() < 0x2 &&
        World() == worldID &&
        Stage() == stageID &&
        prev(ScreenID()) == previousID && 
        ScreenID() == currentID
    
    leaderboard(
        name + " Speedrun!",
        "Fastest time to complete " + name,
        start,
        always_true() && (GameOver() || (Animation() == 6 && OnOverworld())),
        submit,
        always_true(),
        format="FRAMES"
    )
}

leaderboard(
    "Speedrun V.S. Boss!",
    "Fastest time to complete the V.S. boss rush.",
    StartVS(),
    GameOver(),
    EndVS(),
    always_true(),
    format="FRAMES"
)

leaderboard(
    "The Wizard Copy Ability!",
    "Highest score in the 1st ten minutes of starting a new game",
     StartWorld(1, NormalMode) || StartWorld(1, ExtraMode),
     GameOver(),
     repeated(TimeSpan(10,0,0),always_true()),
     Score() * 10
)