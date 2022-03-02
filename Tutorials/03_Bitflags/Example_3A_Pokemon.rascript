// Pokemon Red Version | Pokemon Blue Version
// #ID = 724

// An array on all the bitflags in the Viridian Forest
ViridianForest = [
    bit0(0xd6f0), // Hidden Potion
    bit1(0xd6f0), // Hidden Antidote
    bit4(0xd5b2), // Antidote
    bit5(0xd5b2), // Potion
    bit6(0xd5b2), // Poke Ball
    bit2(0xd7f3), // Bug Catcher 01
    bit3(0xd7f3), // Bug Catcher 02
    bit4(0xd7f3) // Bug Catcher 03
]
              
// Count the value of each flag in the passed array
function FlagCount(Flags)
{
    count = 0
    for Flag in Flags {
        count = count + Flag
    }
    return count
}

// Check if array of passed flags goes from previously all but one flag is true
// to all flags being true.
function FlagsComplete(Flags)
{
    return prev(FlagCount(Flags)) == length(Flags) - 1 &&
        measured(FlagCount(Flags) == length(Flags)) 
}

// Make an achievement for finding every item and defeating every trainer 
// in the Viridian Forest
achievement(
    title = "Example 3A: Setting the Forest Ablaze", 
    description = "Find every Item and defeat every Trainer in the Viridian Forest.",
    points = 0,  
    trigger = FlagsComplete(ViridianForest) 
)
