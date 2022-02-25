// Pokemon Red Version | Pokemon Blue Version
// #ID = 724

Flags = [
    bit4(0xD5B1), // TM17 Submission
    bit5(0xD5B1), // Full Heal
    bit6(0xD5B1), // TM05 Mega Kick
    bit7(0xD5B1), // Guard Spec.
    bit0(0xD5B5), // Max Revive
    bit1(0xD5B5), // TM47 Explosion
    bit4(0xD5C0), // TM43 Sky Attack
    bit5(0xD5C0), // Rare Candy
    bit0(0xD6F4), // Hidden Ultra Ball
    bit1(0xD6F4), // Hidden Full Restore
    bit1(0xD7EE), // Blackbelt 09
    bit2(0xD7EE), // Juggler 02
    bit3(0xD7EE), // Tamer 05
    bit4(0xD7EE), // Pokemaniac 06
    bit5(0xD7EE), // Juggler 05
    bit1(0xD813), // Cooltrainer M 02
    bit2(0xD813), // Cooltrainer F 02
    bit3(0xD813), // Cooltrainer M 03
    bit4(0xD813), // Cooltrainer F 03
    bit1(0xD869), // Cooltrainer F 05
    bit2(0xD869)  // Cooltrainer M 05
]
              

// Count each pokemon that is part of the DreamTeam
function FlagCount()
{
    count = 0
    for Flag in Flags {
        count = count + Flag
    }
    return count
}

achievement(
    title = "Example 3A: Victory Lap", 
    description = "Find every Item and defeat every Trainer in Victory Road.",
    points = 10,  
    trigger = prev(FlagCount()) == 20 &&
              measured(FlagCount() == 21) 
)
