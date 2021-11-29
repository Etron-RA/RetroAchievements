// Chicken Run
// #ID = 4182

// $C01A: level id - last stage=24
//        19= end game sequence
function Stage() => byte(0x00C01A)

Stages = {
    1: "Meeting in Hut 17!",
    2: "The Dig!",
    3: "Hiding Away!",
    4: "Mud Bath!",
    5: "What Are All These Boxes For?",
    6: "As Fast as You Can Say Mixed Vegetables!",
    7: "Meat to the Left!",
    8: "Workout!",
    9: "Those Chickens Are up to Something!",
    10: "Steaming!",
    11: "Just a Touch of Gravy!",
    12: "What We Need Is Thrust!",
    13: "Mud Fight!",
    14: "A Fence Too Far!",
    15: "Sticky Stuff!",
    16: "Chicken Pies... Not Apple!",
    17: "Caught in the Light!",
    18: "Lights Out",
    19: "It’s Like an Oven in Here!",
    20: "Chickens Go In, Pies Come Out!",
    21: "The Great Escape!",
    22: "Escape the Machine!",
    23: "Entrapment!",
    24: "Mine Field!",
    25: "You’re Free!"    
}

// $C022: difficulity
function Difficulty() => byte(0x00C022)

Difficulties = {
    1: "Easy",
    2: "Normal",
    3: "Hard"
}

// $C1D0: number of feed piles
function Feed() => byte(0x00C1D0)

// $C1D1: timer - number of pie chunks remaining until complete
function Pies() => byte(0x00C1D1)

// $C1E4: Password: X000
function Password1() => byte(0x00C1E4)

// $C1E5: Password: 0X00
function Password2() => byte(0x00C1E5)

// $C1E6: Password: 00X0
function Password3() => byte(0x00C1E6)

// $C1E7: Password: 000X
function Password4() => byte(0x00C1E7)

// $C1FB: Time on Continue Screen
function Time() => byte(0x00C1FB)

// $DC30: number of remaining birds
function Birds() => byte(0x00DC30)

// $DC33: number of remaining birds
function Lives() => byte(0x00DC33)

// $DC92: menu options
function Options() => byte(0x00DC92)


achievement(
    title = "Beat Stage 5 (Any Difficulty)", description = "Beat Stage 5 (Any Difficulty)", points = 1,
    id = 8483, badge = "00136", published = "5/23/2014 7:29:00 AM", modified = "5/30/2021 3:51:18 PM",
    trigger = Stage() == 6 && once(Stage() == 0) && never(Password1() > 1) && never(Password2() > 1) && 
              never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 10 (Any Difficulty)", description = "Beat Stage 10 (Any Difficulty)", points = 1,
    id = 8484, badge = "00136", published = "5/23/2014 7:29:01 AM", modified = "5/30/2021 3:51:18 PM",
    trigger = Stage() == 11 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 15 (Any Difficulty)", description = "Beat Stage 15 (Any Difficulty)", points = 2,
    id = 8485, badge = "00136", published = "5/23/2014 7:29:02 AM", modified = "5/30/2021 3:51:19 PM",
    trigger = Stage() == 16 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 20 (Any Difficulty)", description = "Beat Stage 20 (Any Difficulty)", points = 2,
    id = 8486, badge = "00136", published = "5/23/2014 7:29:04 AM", modified = "5/30/2021 3:51:19 PM",
    trigger = Stage() == 21 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat the Game (Any Difficulty)", description = "Beat the Game (Any Difficulty)", points = 5,
    id = 8487, badge = "00136", published = "5/23/2014 7:29:05 AM", modified = "5/30/2021 3:51:20 PM",
    trigger = Stage() == 25 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 5 (Normal or Hard)", description = "Beat Stage 5 (Normal or Hard)", points = 3,
    id = 8488, badge = "00136", published = "5/23/2014 7:40:33 AM", modified = "5/30/2021 3:51:20 PM",
    trigger = Stage() == 6 && Difficulty() >= 2 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 10 (Normal or Hard)", description = "Beat Stage 10 (Normal or Hard)", points = 3,
    id = 8489, badge = "00136", published = "5/23/2014 7:40:34 AM", modified = "5/30/2021 3:51:20 PM",
    trigger = Stage() == 11 && Difficulty() >= 2 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 15 (Normal or Hard)", description = "Beat Stage 15 (Normal or Hard)", points = 4,
    id = 8490, badge = "00136", published = "5/23/2014 7:40:36 AM", modified = "5/30/2021 3:51:21 PM",
    trigger = Stage() == 16 && Difficulty() >= 2 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 20 (Normal or Hard)", description = "Beat Stage 20 (Normal or Hard)", points = 4,
    id = 8491, badge = "00136", published = "5/23/2014 7:40:37 AM", modified = "5/30/2021 3:51:22 PM",
    trigger = Stage() == 21 && Difficulty() >= 2 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat the Game (Normal or Hard)", description = "Beat the Game (Normal or Hard)", points = 5,
    id = 8492, badge = "00136", published = "5/23/2014 7:40:38 AM", modified = "5/30/2021 3:51:22 PM",
    trigger = Stage() == 25 && Difficulty() >= 2 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 5 (Hard)", description = "Beat Stage 5 (Hard)", points = 5,
    id = 8493, badge = "00136", published = "5/23/2014 7:40:40 AM", modified = "5/30/2021 3:51:22 PM",
    trigger = Stage() == 6 && Difficulty() >= 3 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 10 (Hard)", description = "Beat Stage 10 (Hard)", points = 5,
    id = 8494, badge = "00136", published = "5/23/2014 7:40:41 AM", modified = "5/30/2021 3:51:23 PM",
    trigger = Stage() == 11 && Difficulty() >= 3 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 15 (Hard)", description = "Beat Stage 15 (Hard)", points = 5,
    id = 8495, badge = "00136", published = "5/23/2014 7:40:43 AM", modified = "5/30/2021 3:51:23 PM",
    trigger = Stage() == 16 && Difficulty() >= 3 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat Stage 20 (Hard)", description = "Beat Stage 20 (Hard)", points = 5,
    id = 8496, badge = "00136", published = "5/23/2014 7:40:45 AM", modified = "5/30/2021 3:51:24 PM",
    trigger = Stage() == 21 && Difficulty() >= 3 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

achievement(
    title = "Beat the Game (Hard)", description = "Beat the Game (Hard)", points = 10,
    id = 8497, badge = "00136", published = "5/23/2014 7:40:46 AM", modified = "5/30/2021 3:51:24 PM",
    trigger = Stage() == 25 && Difficulty() >= 3 && once(Stage() == 0) && never(Password1() > 1) && 
              never(Password2() > 1) && never(Password3() > 1) && never(Password4() > 1)
)

// Password Enabled
rich_presence_conditional_display(
    Stage() > 0 && (
        Password1() > 1 ||
        Password2() > 1 ||
        Password3() > 1 ||
        Password4() > 1
    ),
    "Ginger is playing with passwords (achievements are DISABLED when using passwords)!"
)
// Playing a Stage
rich_presence_conditional_display(
    Stage() == 25,
    "Ginger has escaped the Tweedy's Farm!"
)
    
// Playing a Stage
rich_presence_conditional_display(
    Stage() > 0,
    "Ginger is on Stage {0} - {1} | 💀 {2} | ⏱ {3}/16 | 🌽 {4} | 🐔 {5}",
    rich_presence_value("Number", Stage(), "VALUE"),
    rich_presence_lookup("Stages", Stage(), Stages),
    rich_presence_lookup("Difficulties", Difficulty(), Difficulties),
    rich_presence_value("Number", Pies() + 1, "VALUE"),
    rich_presence_value("Number", Feed(), "VALUE"),
    rich_presence_value("Number", Birds(), "VALUE")
)

// In the Menu
rich_presence_display("In Menu")