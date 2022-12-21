// Addams Family, The
// #ID = 829


// $008A: 16bit - current location - 8bit : residence (inside = 00, outside = 01), tree = 02, conservatory = 03, chains/continue = 04, kitchen =05, portrait gallery/music room = 06, games room = 07, underground/graveyard/chimneys = 08, oven = 09, armoury = 0a, crypt =0b, library = 0d, vault = 0e)
function Location() => word(0x00008A)

// $00AB: (8 bit) dollars amount
function Dollars() => byte(0x0000AB)

// $00AC: (8 bit) lives - amount
function Lives() => byte(0x0000AC)

// $00D5: 16-bit : 9FF- >01 decreases frame by frame during start menu, demo mode starts at 01
function Demo() => word(0x0000D5)

achievement(
    title = "Monster Garden", points = 5,
    description = "Grab five 1-up in Monster Garden",
    id = 36360, badge = "37168", published = "2016-05-23 9:54:30 PM", modified = "2019-11-01 12:29:37 AM",
    trigger = never(Location() != 2051) && 
        never(Demo() <= 1) && 
        repeated(5, Lives() > prev(Lives())) && 
        tally(5, 
              prev(Lives()) < Lives(),
              prev(Lives()) + 1 < Lives(),
              prev(Lives()) + 2 < Lives(),
              prev(Lives()) + 3 < Lives(),
              prev(Lives()) + 4 < Lives()
        ) &&
        unless(Dollars() != prev(Dollars()))
)
