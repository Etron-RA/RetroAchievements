// Rez
// #ID = 3419

// $2003BC: [32-bit] Boss Pointer (not null when boss is spawned)
function BossPointer() => tbyte(0x2003BC)

// $201248: [8-bit] Immortal Cheat (0 = off, 1 = on)
function ImmortalCheat() => byte(0x201248)

// $201250: [8-bit] Overdrive Cheat (0 = off, 1 = on)
function OverdriveCheat() => byte(0x201250)

// $201270: [float] Boss Health
function BossHealth() => float(0x201270)

// $210AC4: [24-bit] Game Pointer (null in menu)
function GamePointer() => tbyte(0x210AC4)

// $3ADFF8: [ASCII] Earth Boss Type ("Earth[Mega]","Earth[Giga]", and "Earth[Tera]")
function EarthBossType(offset = 0) => 0x3ADFF8 + offset

// $960094: [32-bit] Game Mode (0xFFFFFFFF when in game, otherwise in menu)
function GameMode() => dword(0x960094)

//-------------------------------------------------------------------------
// Hex array string definitions

// "Earth[Tera]" hex array string when fighting Tera Earth boss
EarthTera = [0x45,0x61,0x72,0x74,0x68,0x5B,0x54,0x65,0x72,0x61,0x5D]

//-------------------------------------------------------------------------
// Helper Functions

// Check if the string hex values equal the hex values at the passed address
function StringCompare(address, string)
{
    return all_of(range(0, length(string) - 1), i => byte(address + i) == string[i])
}

// Game state constant
InGame = 0xffffffff

// Challenges for the giga and tera bosses
function BossTypeChallenge(bossMemory, bossType)
{
    // Start when the player encounters the passed boss type
    start = once(
                ImmortalCheat() == 0 && 
                OverdriveCheat() == 0 && 
                GamePointer() != 0 &&
                StringCompare(bossMemory, bossType)
            )
    
    // Cancel on game over or exiting early
    cancel = never(
                prev(GameMode()) == InGame &&
                GameMode() != InGame
            )
    
    // Submit when the bosses health goess from above zero to zero or below
    submit = trigger_when(
                BossPointer() != 0 && 
                prev(BossHealth()) > 0.0 &&
                BossHealth() <= 0.0 
            )
            
    return start && cancel && submit
}

// Achievement for beating the Tera Earth Boss
achievement(
    "Tera Earth",
    "Defeat the Tera form Earth boss in Area 1",
    10,
    BossTypeChallenge(EarthBossType(), EarthTera)
)
