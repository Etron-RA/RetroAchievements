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

// Check if array of passed flags goes from previously all but one flag is true
// to all flags being true.
function FlagsComplete(Flags)
{
    return sum_of(Flags, f => prev(f)) == length(Flags) - 1 &&
        measured(sum_of(Flags, f => f) == length(Flags)) 
}

// Create an achievement for when the player collects the entire Dream Team
achievement(
    title = "Example 3C: Assemble the Dream Team", 
    description = "Catch Pikachu, Squirtle, Tauros, Lapras, Bulbasaur, and Charizard.", 
    points = 0,
    trigger = never(TitleMusic()) && FlagsComplete(DreamTeam)
)