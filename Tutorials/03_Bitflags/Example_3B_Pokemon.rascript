// Pokémon Red Version | Pokémon Blue Version
// #ID = 724

// $C06E: Music Playng, title screen = 4105
function TitleMusic() => word(0x00C06E) == 4105

// Count each bit between $D2F7 bit 0 to $D309 bit 6 
// these are the consecutive bitflags for each of the  
// 151 Pokémon in the Pokédex
function PokedexCount()
{
   count = 0
    for address in range(0xD2F7, 0xD308) {
        count = count + bitcount(address)
    }
    count = count + sum_of(range(0,6), b => bit(b,0xD309))
    return count
}

// Create an achievement for when the player goes from
// 150 Pokémon to 151 Pokémon in the Pokédex
achievement(
    title = "Example 3B: Gotta ACTUALLY Catch 'em All", 
    description = "Catch all 151 Pokemon. Yes ALL of them.", 
    points = 0,
    trigger = never(TitleMusic()) &&
              prev(PokedexCount()) == 150 &&
              measured(PokedexCount() == 151)
)
