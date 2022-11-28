// ~Hack~ Captain Toad Treasure Tracker
// #ID = 7701

// $02010B: Level ID
function LevelId() => byte(0x02010B)
Levels = {
    0x05: "1-1",
    0x06: "1-2",
    0x03: "1-3",
    0x02: "1-4",
    0x1a: "2-1",
    0x09: "2-2",
    0x0a: "2-3",
    0x19: "2-4",
    0x1f: "3-1",
    0x22: "3-2",
    0x23: "3-3",
    0x20: "3-4",
    0x30: "4-1",
    0x34: "4-2",
    0x36: "4-3",
    0x35: "4-4",
    0x25: "5-1",
    0x26: "5-2",
    0x27: "5-3",
    0x28: "5-4",
    0x0d: "6-1",
    0x0e: "6-2",
    0x10: "6-3",
    0x11: "6-4",
    0x1d: "The End"
}

// $020DB4: Lives in stage select 0 based
function LivesStageSelect() => byte(0x020DB4)

// $020DBE: Lives 0 Based
function LivesGame() => byte(0x020DBE)

// $020DBF: Coins
function Coins() => byte(0x020DBF)

// $020DDA: [8-bit] State 
//          0x0b = In Level
//          0x15 = Start the emulator and you're on titlescreen
//          0x18 = Overworld
//          0xff = Death also Game Over screen
function State() => byte(0x020DDA)

// $020F02: Potions
function Potions() => byte(0x020F02)

// $020F10: Time Front
// $020F11: Time Middle
// $020F12: Times Last
function TimeFront() => low4(0x020F10)
function TimeMiddle() => low4(0x020F11)
function TimesLast() => low4(0x020F12)
function Time() {
    return TimeFront() * 100 +
        TimeMiddle() * 10 +
        TimesLast()
}

// $0213E0: Animation? 3e = Death
function Death() => byte(0x0213E0)

// $021422: Cherry Counter Regressive
function Cherrys() => byte(0x021422)

rich_presence_conditional_display(State() == 0x0c, "Captian Toad found his treasure!")
rich_presence_conditional_display(State() == 0xff, "Captian Toad has ran out of lives!")
rich_presence_conditional_display(State() == 0x15, "Captian Toad is searching for treasure on the Title Screen!")
rich_presence_conditional_display(State() == 0x18, 
	"Captian Toad is searching for treasure on the Overworld  | 🚶‍ {0}!",
    rich_presence_value("SELECT_LIVES", LivesStageSelect() + 1)
)
rich_presence_conditional_display(State() >= 0x0a && State() <= 0x0f, 
    "Captian Toad is on level {0} | 🚶‍ {1} | 💰 {2} | 🧃 {3} | 🍒 {4} | ⏲ {5}!",
    rich_presence_lookup("LEVEL", LevelId(), Levels),
    rich_presence_value("LIVES", LivesGame() + 1),
    rich_presence_value("COINS", Coins()),
    rich_presence_value("POTIONS", Potions()),
    rich_presence_value("CHERRYS", Cherrys()),
    rich_presence_value("TIME", Time())
)
rich_presence_display("Captian Toad is lost!")
