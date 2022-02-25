// Pokemon Red Version | Pokemon Blue Version
// #ID = 724

// $C06E: Music Playng, title screen = 4105
function TitleMusic() => word(0x00C06E) == 4105

DreamTeam = [
    bit0(0xd2f7), // Bulbasaur
    bit5(0xd2f7), // Charizard 
    bit6(0xd2f7), // Squirtle 
    bit0(0xd2fa), // Pikachu
    bit7(0xd306), // Tauros
    bit2(0xd307)  // Lapras
]

// Count each pokemon that is part of the DreamTeam
function DreamTeamCount()
{
    count = 0
    for Pokemon in DreamTeam {
        count = count + Pokemon
    }
    return count
}

// Create an achievement for when the player goes from
// 150 Pokemon to 151 Pokemon in the Pokedex
achievement(
    title = "Example 3C: Assemble the Dream Team", 
    description = "Catch Pikachu, Squirtle, Tauros, Lapras, Bulbasaur, and Charizard.", 
    points = 0,
    trigger = never(TitleMusic()) &&
              prev(DreamTeamCount()) == 5 &&
              measured(DreamTeamCount() == 6)
)
