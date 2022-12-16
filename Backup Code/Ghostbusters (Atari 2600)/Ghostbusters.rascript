// Ghostbusters
// #ID = 16305

// $0013: c6=stay puft is shown on city map
function StayPuftOnMap() => byte(0x000013) == 0xc6


// $0040: money (x10000)
// $0041: money (x100)
// $0042: money (x1)
function MoneyX00000() => high4(0x000040)
function Money0X0000() => low4(0x000040)
function Money00X000() => high4(0x000041)
function Money000X00() => low4(0x000041)
function Money0000X0() => high4(0x000042)
function Money00000X() => low4(0x000042)
function Money() {
    return MoneyX00000() * 100000 +
        Money0X0000() * 10000 +
        Money00X000() * 1000 +
        Money000X00() * 100 +
        Money0000X0() * 10 +
        Money00000X() 
}
function AllMoney() => tbyte(0x40)

// $0044: pk (x100)
// $0045: pk (x1)
function PkX000() => high4(0x000044)
function Pk0X00() => low4(0x000044)
function Pk00X0() => high4(0x000045)
function Pk000X() => low4(0x000045)
function Pk() {
    return PkX000() * 1000 +
        Pk0X00() * 100 +
        Pk00X0() * 10 +
        Pk000X()
}

// $0054: screen id:
//        0=city map
//        1=driving
//        2=building
//        3=shop
function ScreenId() => byte(0x000054)

Screens = {
    0: "looking at the city map",
    1: "driving to a call",
    2: "bustin' ghosts",
    3: "shopping for new tech"    
}

rich_presence_conditional_display(
    MoneyX00000() == 0x0 &&
    Money0X0000() == 0xA &&
    Money00X000() == 0xB &&
    Money000X00() == 0xC &&
    Money0000X0() == 0xD &&
    Money00000X() == 0xE, 
    "The Ghostbusters are resting at the firehouse"
)

rich_presence_conditional_display(
    StayPuftOnMap(), 
    "The Ghostbusters are {0} while the Stay Puft Marshmallow Man destroys New York | ${1} | PK {2}", 
    rich_presence_lookup("SCREEN", ScreenId(), Screens, "resting at the firehouse"),
    rich_presence_value("MONEY", Money()),
    rich_presence_value("PK",  Pk())
)

rich_presence_display(
    "The Ghostbusters are {0} | ${1} | PK {2}", 
    rich_presence_lookup("SCREEN", ScreenId(), Screens, "resting at the firehouse"),
    rich_presence_value("MONEY", Money()),
    rich_presence_value("PK",  Pk())
)