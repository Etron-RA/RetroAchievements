// Streets of Rage
// #ID = 55

// $F00B: VOICE SFX ID
//        b2 =  blow
//        a3 = enemy hitting the ground
//        c0 = glass breaking
//        c7 = picking money
//        bb = picking up item (food)
//        d0 = voice1
//        db = voice2
//        d2 = voice3
//        d3 = voice 4
//        d4 = voice 5 (girl scream1)
//        d5 = voice 6 (girl scream2)
//        d6 = voice7 (man scream1)
//        d7= voice8 (man scream2)
//        d8= voice9 (man scream3)
//        d9 = voice10 (man scream4)
function VoiceSfx() => byte(0x00F00B)

// $FF00: SCREEN ID
//        06=intro
//        0a=title
//        12=title select mode
//        22=character select
//        26 = ending
//        2a=stage intro
//        16=in game
//        1a = results screen
function ScreenId() => byte(0x00FF00)

// $FF20: 8-bit Player 1 Specials Remaining
function Specials() => byte(0x00FF20)

// $ff2b: Characters Controlled by demo = 01
function Demo() => byte(0x00FF2B)

achievement(
    title = "Reinforcements!", points = 5,
    description = "Collect A Special Item",
    id = 88787, badge = "97717", published = "2019-11-20 8:16:11 PM", modified = "2019-11-29 12:27:42 AM",
    trigger = prev(Specials()) > Specials() &&
    Demo() == 0 &&
    VoiceSfx() == 0xc7 && 
    ScreenId() == 0x16
)
