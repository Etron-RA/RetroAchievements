// Pokemon Red Version | Pokemon Blue Version [Bonus]
// #ID = 11632

// $C06E: Music Playng, title screen = 4105
function Music() => word(0x00C06E)

// Count each bit between $D2F7 bit 0 to $D309 bit 6 
// these are the consecutive bitflags for each the 151 
// Pokemon in the Pokedex
function PokedexCount()
{
    return sum_of(range(0,31), b => bit(b,0xD2F7)) +
           sum_of(range(0,31), b => bit(b,0xD2FB)) +
           sum_of(range(0,31), b => bit(b,0xD2FF)) +
           sum_of(range(0,31), b => bit(b,0xD303)) +
           sum_of(range(0,22), b => bit(b,0xD307))
}

// Create an achievement for when the player goes from
// 150 Pokemon to 151 Pokemon in the Pokedex
achievement(
    title = "Example 3B: Gotta ACTUALLY Catch 'em All", 
    description = "Catch all 151 Pokemon. Yes ALL of them.", 
    points = 0,
    trigger = never(Music() == 4105) &&
              prev(PokedexCount()) == 150 &&
              PokedexCount() == 151
)
