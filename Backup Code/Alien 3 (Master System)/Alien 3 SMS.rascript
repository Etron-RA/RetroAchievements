// Alien 3
// #ID = 11660

// $040D: demo=02?
function Demo() => byte(0x00040D)

DemoLookup = {
    0x02: "[Demo]",
    0x0: " ",
}

// $041D: continues
function Conitnues() => byte(0x00041D)

// $0423: stage, 14= ending
function Stage() => byte(0x000423)

StageLookup = {
    00: "Mission 1",
    01: "Mission 2",
    02: "Mission 3",
    03: "First Guardian",
    04: "Mission 4",
    05: "Mission 5",
    06: "Mission 6",
    07: "Second Guardian",
    08: "Mission 7",
    09: "Mission 8",
    0x0a: "Mission 9",
    0x0b: "Third Guardian",
    0x0c: "Mission 10",
    0x0d: "Mission 11",
    0x0e: "Mission 12",
    0x0f: "Fourth Guardian",
    0x10: "Mission 13",
    0x11: "Mission 14",
    0x12: "Mission 15",
    0x13: "Fifth5 Guardian",
    0x14: "Ending",
}

// $0424: lives
function Lives() => byte(0x000424)

// $042F: Battery
function Batteries() => byte(0x00042F)

// $0434: score x0000
function ScoreX0000() => byte(0x000434)
function Score0X000() => byte(0x000435)
function Score00X00() => byte(0x000436)
function Score000X0() => byte(0x000437)
function Score0000X() => byte(0x000438)
function Score() => bcd(ScoreX0000()) * 10000 + bcd(Score0X000()) * 1000 + bcd(Score00X00()) * 100 + bcd(Score000X0()) * 10 + bcd(Score0000X())

// $046A: Actual Health
function Health() => byte(0x00046A)

// $0478: time seconds
function Seconds() => byte(0x000478)
function Minutes() => byte(0x000479)
function Time() => Minutes() * 60 + Seconds()

// $04C1: Prisoners
function Prisoners() => byte(0x0004C1)

// $04C2: Free prisoners
function Freed() => byte(0x0004C2)

rich_presence_conditional_display(Demo() == 2, "Ripley is watching the demo!")

rich_presence_conditional_display(Lives() == 0, "Ripley is at the main menu!")

rich_presence_conditional_display(Stage() == 0x14, "Ripley beat the game!")

rich_presence_conditional_display(Stage() == 0x3 || Stage() == 0x7 || Stage() == 0xb || Stage() == 0xf || Stage() == 0x13,
    "Ripley is fighting the {0} | 👩‍🚀 {1} | ♥ {2} | ⏲ {3} | 💯 {4} ",
    rich_presence_lookup("Level", Stage(), StageLookup),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("HP", Health(), "VALUE"),
    rich_presence_value("Time", Time(), "SECS"),
    rich_presence_value("Score", Score(), "VALUE")
)
rich_presence_display(
    "Ripley has {0} prisoners left to rescue in {1} | 👩‍🚀 {2} | ♥ {3} | ⏲ {4} | 💯 {5}",
    rich_presence_value("Prisoners", Prisoners(), "VALUE"),    
    rich_presence_lookup("Level", Stage(), StageLookup),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("HP", Health(), "VALUE"),
    rich_presence_value("Time", Time(), "SECS"),
    rich_presence_value("Score", Score(), "VALUE")
)
