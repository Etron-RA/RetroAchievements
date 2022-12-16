// Ghostbusters
// #ID = 16305

// $0040: money (x10000)
// $0041: money (x100)
function MoneyX00000() => high4(0x000040)
function Money0X0000() => low4(0x000040)
function Money00X000() => high4(0x000041)
function Money000X00() => low4(0x000041)
function Money() {
    return MoneyX00000() * 100000 +
        Money0X0000() * 10000 +
        Money00X000() * 1000 +
        Money000X00() * 100
}

// $0044: pk (x100)
// $0045: pk (x1)
function PkX000() => high4(0x000044)
function Pk0X00() => low4(0x000044)
function Pk00X0() => high4(0x000045)
function Pk000X() => low4(0x000045)
function Pk() {
    return PkX000() * 1000 +
        Pk00X0() * 100 +
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