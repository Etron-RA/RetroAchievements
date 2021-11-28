// Scooby-Doo!: Unmasked
// #ID = 6772

// $014450: Notebook Text
//          00 = None
//          01 = Mystery Solved/Start
//          02 = Try Again/1
//          03 = 2
//          04 = 3
// $01E4A0: Sandwich Completed (See Bits)
//          1st bit  = Chinatown
//          2nd bit = Theme Park
//          3rd bit = Museum
// $01E4A1: Clues Unlocked (See Bits)
// $01E4A3: Ingredients Unlocked (See Bits)
// $01E4A4: 00 = Opening Cutscene
//          01 = Unlock Level 1
//          02 = Tip 1 Flag
//          03 = Clue Collected/Level Completed
//          04 = Dialogue
//          05 = Unlock Level 2
//          06 = Tip 2 Flag
//          07 = Clue Collected/Level Completed
//          08 = Velma's Minigame
//          09 =
//          0a = Daphne Rescued (CT)
//          0b = Unlock Coaster (CT)
//          0c = Coaster Completed (CT)
//          0d = Boss Caught (CT)
//          0e = Unlock Boss Fight (CT)
function Scene() => byte(0x01E4A4)
// $01E4A7: Area
//          00 = MFM
//          01 = Chinatown
//          02 = Theme Park
//          03 = Museum
function Area() => byte(0x01E4A7)
// $01E4A8: [Costume] Slot 1 (Up)
//          00 = Default
//          01 =
//          02 = Bat
//          03 = Kung Fu
//          04 = Archer
// $01E4A9: [Costume] Slot 2 (Right)
//          00 = Default
//          01 =
//          02 = Bat
//          03 = Kung Fu
//          04 = Archer
// $01E4AA: [Costume] Slot 3 (Down)
//          00 = Default
//          01 =
//          02 = Bat
//          03 = Kung Fu
//          04 = Archer
// $01E4AB: [Costume] Slot 4 (Left)
//          00 = Default
//          01 =
//          02 = Bat
//          03 = Kung Fu
//          04 = Archer
// $01E4AE: Goo Counter (Max 64)
// $01E4B2: Current HP
// $01E4B3: Max HP
// $01E4C4: Scooby Snax Counter
// $01E508: Music Played
//          00 = Opening
//          01 = MFM
//          02 = Workshop
//          03 = Chinatown
//          04 = Sewer
//          05 = Cookie Factory
//          06 = Chinatown Grill/Trap/Boss
//          07 = Theme Park
//          08 = Haunted Mansion
//          09 = Circus Tent
//          0a = Theme Park Grill/Trap/Boss
//          0b = Museum
//          0c = Medieval Exhibit
//          0d = Ice Age
//          0e = Museum Grill/Trap/Boss
//          0f = Final Fight
//          10 = Rollercoaster
//          11 = Area Screen
//          12 = Password/Notebook/Options/Paused
//          13 = Grill Fail/Death
//          14 = Victory Transition
// $01F0BB: Caveman Trap nth Slice
function CavemanTrap() => byte(0x01F0BB)
// $01F106: [16bit] Grill Score
// $01F147: Guitar Ghoul Trap nth Slice
function GuitarGhoulTrap() => byte(0x01F0BB)
// $01F98F: Zen Tuo Trap nth Slice
function ZenTuoTrap() => byte(0x01F98F)
// $020D3D: ZenTuo Health (Max c8)
// $020DC9: Caveman HP
// $021289: Guitar Ghoul HP (Max c8)
// $0213CF: Final Boss HP (Max fa)
// $0214C8: Guitar Ghoul HP 2??

achievement(
    title = "Caught the Caveman", description = "Help Fred trap the Caveman", points = 5,
    id = 67541, badge = "72063", published = "11/6/2018 3:43:06 AM", modified = "11/22/2018 2:22:40 PM",
    trigger = Area() == 3 && prev(Scene()) == 0xc && Scene() == 0xd
)

achievement(
    title = "Caught Zen Tuo", description = "Help Fred trap Zen Tuo", points = 5,
    id = 67525, badge = "72047", published = "11/6/2018 3:41:56 AM", modified = "10/15/2019 11:01:01 PM",
    trigger = Area() == 1 && prev(Scene()) == 0xc && Scene() == 0xd 
)

achievement(
    title = "Caught Guitar Ghoul", description = "Help Fred trap Guitar Ghoul", points = 5,
    id = 67533, badge = "72055", published = "11/6/2018 3:42:30 AM", modified = "11/22/2018 2:21:20 PM",
    trigger = Area() == 2 && prev(Scene()) == 0xa && Scene() == 0xb
)
