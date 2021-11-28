// Maniac Mansion
// #ID = 1482

// $60B8: Characters Dead
//        Bit 1 - Syd
//        Bit 2 - Razor
//        Bit 3 - Dave
//        Bit 4 - Michael
//        Bit 5 - Bernard
//        Bit 6 - Wendy
//        Bit 7 - Jeff
function DeadCharacters() => byte(0x0060B8)

// $6100: Current Character ID
//        01 = Syd
//        02 = Razor
//        03 = Dave
//        04 = Michael
//        05 = Bernard
//        06 = Wendy
//        07 = Jeff
function CharacterID() => byte(0x006100)

// $6102: Screen X Position
function ScreenX() => byte(0x006102)

// $6104: Screen and Room ID
//        01 = Front Porch
//        05 = Library
//        21 = Intro
//        2B = Phone
//        2C = Start
//        2D = Character Select
//        31 = Maniac Mansion (Logo)
function ScreenID() => byte(0x006104)

// $6108: Last action used
function LastAction() => byte(0x006108)

// $6109: Last object interacted with
function LastPrimaryObject() => byte(0x006109)

// $610A: Last secondary object interacted with
function LastSecondaryObject() => byte(0x00610A)

// $616C: [8-bit] Self-destruct (0 = none, 1 = countdown started, 2 = machine turned off)
function SelfDestruct() => byte(0x616C)

// $6174: [bit-1] Entered Lab (0 = none, 1 = started)
function EnteredLab() => bit1(0x6174)

// $61A2: 03=police took meteor 02=meteor in trunk 01=have meteor
function MeteorStatus() => byte(0x0061A2)

// $636d: [8-bit] Timer:
//        If power off  then time to "Meltdown"
//        If power on the time to "Getting Your Pretty Brains Sucked Out" cutscene
function Timer2() => byte(0x636d)

// $6638: upper=DaveCDPlayer lowerbits=kidID[f if not picked, 0=death]
function KidStatus() => low4(0x006638)

// $66A7: bit7=power
function PowerOutage() => bit7(0x0066A7)

// $66A8: bit01=meltdown
function Meltdown1() => bit1(0x0066A8)
function Meltdown0() => bit0(0x0066A8)

// $6B06: Cutscene ID?
function CutsceneID() => byte(0x006B06)


achievement(
    title = "Lights Out", description = "Suffer a catastrophic nuclear meltdown via power overload.", points = 5,
    id = 28493, badge = "28908", published = "9/5/2015 11:41:20 PM", modified = "3/18/2021 9:30:56 PM",
    trigger = PowerOutage() == 1 &&              
              ScreenID() == 0x2f &&
              Meltdown1() == 0 &&
              Meltdown0() == 0 &&
              KidStatus() == 0
)

achievement(
    title = "Arrested Developments", description = "Finish the game with the 'police' ending.", points = 10,
    id = 28481, badge = "28941", published = "9/5/2015 11:40:21 PM", modified = "3/18/2021 9:36:04 PM",
    trigger = MeteorStatus() == 3 && 
              ScreenID() == 0x33 &&
              SelfDestruct() > 0 &&
              LastPrimaryObject() == 0xB0 &&
              (
                  LastAction() == 0x08 ||
                  LastAction() == 0x09 ||
                  LastAction() == 0x0A ||
                  LastAction() == 0x0B ||
                  LastAction() == 0x05
              )
)

achievement(
    title = "The Final Frontier", description = "Finish the game with the 'space' ending.", points = 10,
    id = 28482, badge = "28942", published = "9/5/2015 11:40:24 PM", modified = "3/18/2021 9:30:54 PM",
    trigger = MeteorStatus() == 2 &&
              ScreenID() == 0x10 && 
              SelfDestruct() > 0 &&
              LastAction() == 0x0B &&
              LastPrimaryObject() == 0x54 &&
              LastSecondaryObject() == 0xD7
)

