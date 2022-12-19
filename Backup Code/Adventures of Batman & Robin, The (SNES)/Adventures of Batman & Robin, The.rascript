// Adventures of Batman & Robin, The
// #ID = 830

// $006A: 16-bit Score 
function Score() => word(0x00006A)

// $008C: Level ID
//        0x00=Amused to Death
//        0x01=No Green Peace
//        0x02=Fowl Play
//        0x03=Tale of the Cat
//        0x04=Trouble in Transit
//        0x05=Perchance to Scream
//        0x06=Riddle Me This
//        0x07=The Gauntlet
//        0x08=Ending
function LevelId() => byte(0x00008C)

// $008E: Scene (sub-stages)
function Scene() => byte(0x00008E)

// $0096: Lives
function Lives() => byte(0x000096)

// $00A2: smoke bomb
//        timer  (Trouble in Transit)
function Timer() => byte(0x0000A2)

// $00c8  Controls Locked (at level end) (01)
//        Cutscene (FF)
function Controls() => byte(0x0000c8)

// $00CC: Car acceleration (dialog two-face)
function CarAccelerationDialogTwoFace() => byte(0x0000CC)

achievement(
    title = "Road Chaser", points = 25,
    description = "Destroy 10 cars in area 2 and find Two-face",
    id = 61077, badge = "64188", published = "2018-06-10 8:28:15 PM", modified = "2021-07-20 7:22:21 AM",
    trigger = measured(repeated(10, Score() > prev(Score()))) && 
            CarAccelerationDialogTwoFace() == 0x7F && 
            Scene() == 2 &&
            never(LevelId()  != 4) &&
            never(Lives()  < prev(Lives())) && 
            never(CarAccelerationDialogTwoFace() < prev(CarAccelerationDialogTwoFace())) &&
            never(Scene() < 2) && 
            never(Timer() == 0x99) &&
            never(Controls() == 1)
)
