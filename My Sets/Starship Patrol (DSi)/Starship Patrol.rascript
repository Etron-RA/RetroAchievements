// Starship Patrol
// #ID = 22327


// $0F7C68: [ASCII] Application Name ("StarshipAppE" for Europe version)
function AppName() => 0x0F7C68

// $106534: [8-bit] In-Game (DSi Menu = 0, In-Game  = 1)
function DSiMenu() => byte(0x106534)
function DSiMenuActive() =>  DSiMenu() == 0
function GameActive() =>  DSiMenu() == 1

// $11a7c4: [32-bit] Game Pointer
function GamePointer() => dword(0x11a7c4)
function InGame() => GamePointer() != 0
function OnMap() => GamePointer() == 0

// $11A7CC: [8-bit] Current Level
function Level() => dword(0x11A7CC)
Levels = {
    0: "Recruitment Centre",
    1: "Simulation Centre",
    2: "Maiden Voyage",
    3: "Star Fortress Siege",
    4: "Zigzag",
    5: "Symmetry",
    6: "Four Corners",
    7: "Broadsided",
    8: "Survivor",
    9: "Fuel Station 9",
    10: "Showdown",
    11: "Tight Defence",
    12: "Containment",
    13: "Spectre Invasion",
    14: "Easy Corner",
    15: "Battle Formation 15",
    16: "Hurricane",
    17: "Right Base Battle",
    18: "Technical Difficulties",
    19: "Left Base Battle",
    20: "Close to the Sun",
    21: "Dalde-Dalde",
    22: "Flood",
    23: "Satellites",
    24: "EMP Rush",
    25: "Asteroid Field",
    26: "Orbitals",
    27: "Control Centre",
    28: "Deep Space",
    29: "Right or Left?",
    30: "Final Battle"
}

// $11A7D4: [32-bit] Energy
function Energy() => dword(0x11A7D4)

// $11A7D8: [32-bit] Power Crystals
function PowerCrystals() => dword(0x11A7D8)

// $11a7d0: [16-bit] Startup Flags (Always 0xffff when running app, used to block loading triggers)
function Startup() => word(0x11a7de)
function StartupComplete() => Startup() == 0xffff

// $11A7E0: [8-bit] State (1 = In-game/Results, 0 = Map)
function State() => byte(0x11A7E0)

// $11A888: [8-bit] Current Wave
function Wave() => byte(0x11A888)

// $11ad10: [8-bit] Map Enabled (map is loaded when 0x63)
function MapEnabled() => byte(0x11ad10) == 0x63

// $11AD18: [32-bit] Level 1 Score
// $11AD20: [8-bit] Level 1 Flags (bit1 = beat, bit2 = unlocked, bit3 = perfect, bit5 = medal)
//          Note: Level 11 unlocks when the first gate is down
//          Note: Level 21 unlocks when the second gate is down
//          Note: Level 30 unlocks when the third gate is down
function Score(level) => dword((level - 1) * 0xC + 0x11AD18)
function ScoreSign(level) => bit(31,(level - 1) * 0xC + 0x11AD18)
function Beat(level) => bit1((level - 1) * 0xC + 0x11AD20)
function Unlocked(level) => bit2((level - 1) * 0xC + 0x11AD20)
function Perfect(level) => bit3((level - 1) * 0xC + 0x11AD20)
function Medal(level) => bit5((level - 1) * 0xC + 0x11AD20)

// $ba3668: [8-bit] SOS Card Selected
function SelectedCard() => byte(0xba3668)

// $11AE80: [8-bit] Rank 
function Rank() => byte(0x11AE80)
Ranks = {
    0: "Recruit",
    1: "Ensign",
    2: "Co-pilot",
    3: "Pilot",
    4: "Midshipman",
    5: "Lieutenant",
    6: "Commander",
    7: "Admiral",
    8: "Fleet Admiral"
}

// $11AEA2: [8-bit] SOS Card Slot 1
// $11AEA3: [8-bit] SOS Card Slot 2
// $11AEA4: [8-bit] SOS Card Slot 3
function SOSCard(card) => byte(0x11AEA2 + (card - 1))
function SOSOpenSlots() => bit7(0x11AEA2) + bit7(0x11AEA3) + bit7(0x11AEA4)
SOSItems = {
    0: "Repair",
    1: "Energy +200",
    2: "Energy +500",
    3: "Energy +1000",
    4: "Starport",
    5: "Black Hole",
    6: "Storm Gun",
    7: "E-Boost",
    8: "Smart Bomb",
    9: "Bounty Hunter Ash",
    10: "Bounty Hunter Amanda",
    11: "Bounty Hunter James",
    12: "Upgrade Power Boost",
    13: "Upgrade Speed Boost",
    14: "Upgrade Range Boost"
}


// "StarshipAppE" = Japan GD-ROM Name
StarshipAppE = [0x53,0x74,0x61,0x72,0x73,0x68,0x69,0x70,0x41,0x70,0x70,0x45,0x0]

// Check if the string hex values equal the hex values at the passed address
function StringCompare(address, string)
{
    return all_of(range(0, length(string) - 1), i => byte(address + i) == string[i])
}

// Check if the passed mission has been beat
function BeatMission(level)
{
    return StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        OnMap()  &&
        prev(Beat(level)) < Beat(level)
}


// Check if the passed mission has been unlocked
function UnlockMission(level)
{
    return StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        OnMap()  &&
        prev(Unlocked(level)) < Unlocked(level)
}

// Check if the the player just ranked up
function RankUp(rank)
{
    return StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        OnMap() &&
        prev(Rank()) == rank - 1 &&
        Rank() == rank
}

// Check if the player earned a medal on any mission between start and end
function MedalEarned(start, end)
{
    altArray = []
    for alt in range(start, end)
    {
        medalArray = []
        for medal in range(start, end)
        {
            // Check if only one medal was earned
            if (alt == medal)      
            {
                array_push(medalArray, prev(Medal(medal)) < Medal(medal))
            }
            else
            {
                array_push(medalArray, prev(Medal(medal)) == Medal(medal))
            }
        }
        // Combined all the alts together
        array_push(altArray, all_of(medalArray, a => a))
    }
    return StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        OnMap() &&
        any_of(altArray, a => a)
}

// Check if a an SOS card is used
function UsedSOS(card)
{
    return StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        InGame() && 
        SelectedCard() == card &&
        SOSOpenSlots() > prev(SOSOpenSlots())
}

function CollectEnergy(energy)
{
    return StringCompare(AppName(), StarshipAppE) &&
        StartupComplete() &&
        GameActive() && 
        InGame() && 
        prev(Energy()) < energy &&
        Energy() >= energy
}

// Progress achievements
achievement(Levels[1],"Complete the " + Levels[1] + " mission", 5, BeatMission(1))
achievement(Levels[2],"Complete the " + Levels[2] + " mission", 5, BeatMission(2))
achievement(Levels[3],"Complete the " + Levels[3] + " mission", 5, BeatMission(3))
achievement(Levels[4],"Complete the " + Levels[4] + " mission", 5, BeatMission(4))
achievement(Levels[5],"Complete the " + Levels[5] + " mission", 5, BeatMission(5))
achievement(Levels[6],"Complete the " + Levels[6] + " mission", 5, BeatMission(6))
achievement(Levels[7],"Complete the " + Levels[7] + " mission", 5, BeatMission(7))
achievement(Levels[8],"Complete the " + Levels[8] + " mission", 5, BeatMission(8))
achievement(Levels[9],"Complete the " + Levels[9] + " mission", 5, BeatMission(9))
achievement(Levels[10],"Complete the " + Levels[10] + " mission", 5, BeatMission(10))

achievement(Levels[11],"Complete the " + Levels[11] + " mission", 5, BeatMission(11))
achievement(Levels[12],"Complete the " + Levels[12] + " mission", 5, BeatMission(12))
achievement(Levels[13],"Complete the " + Levels[13] + " mission", 5, BeatMission(13))
achievement(Levels[14],"Complete the " + Levels[14] + " mission", 5, BeatMission(14))
achievement(Levels[15],"Complete the " + Levels[15] + " mission", 5, BeatMission(15))
achievement(Levels[16],"Complete the " + Levels[16] + " mission", 10, BeatMission(16))
achievement(Levels[17],"Complete the " + Levels[17] + " mission", 10, BeatMission(17))
achievement(Levels[18],"Complete the " + Levels[18] + " mission", 10, BeatMission(18))
achievement(Levels[19],"Complete the " + Levels[19] + " mission", 10, BeatMission(19))
achievement(Levels[20],"Complete the " + Levels[20] + " mission", 10, BeatMission(20))

achievement(Levels[21],"Complete the " + Levels[21] + " mission", 10, BeatMission(21))
achievement(Levels[22],"Complete the " + Levels[22] + " mission", 10, BeatMission(22))
achievement(Levels[23],"Complete the " + Levels[23] + " mission", 10, BeatMission(23))
achievement(Levels[24],"Complete the " + Levels[24] + " mission", 10, BeatMission(24))
achievement(Levels[25],"Complete the " + Levels[25] + " mission", 10, BeatMission(25))
achievement(Levels[26],"Complete the " + Levels[26] + " mission", 10, BeatMission(26))
achievement(Levels[27],"Complete the " + Levels[27] + " mission", 10, BeatMission(27))
achievement(Levels[28],"Complete the " + Levels[28] + " mission", 10, BeatMission(28))
achievement(Levels[29],"Complete the " + Levels[29] + " mission", 10, BeatMission(29))
achievement(Levels[30],"Complete the " + Levels[30] + " mission", 25, BeatMission(30))

// Gate achievements
achievement("First Gate", "Unlock the first gate", 5, UnlockMission(11))
achievement("Second Gate", "Unlock the second gate", 10, UnlockMission(21))
achievement("Third Gate", "Unlock the third gate", 25, UnlockMission(30))

// Rank achievements
achievement(Ranks[1], "Obtain the " + Ranks[1] + " rank", 5, RankUp(1))
achievement(Ranks[2], "Obtain the " + Ranks[2] + " rank", 5, RankUp(2))
achievement(Ranks[3], "Obtain the " + Ranks[3] + " rank", 5, RankUp(3))
achievement(Ranks[4], "Obtain the " + Ranks[4] + " rank", 10, RankUp(4))
achievement(Ranks[5], "Obtain the " + Ranks[5] + " rank", 10, RankUp(5))
achievement(Ranks[6], "Obtain the " + Ranks[6] + " rank", 10, RankUp(6))
achievement(Ranks[7], "Obtain the " + Ranks[7] + " rank", 25, RankUp(7))
achievement(Ranks[8], "Obtain the " + Ranks[8] + " rank", 50, RankUp(8))

// Medal achievements
achievement("Bronze Medal","Earn a medal on any mission between 2 to 10", 5, MedalEarned(2,10))
achievement("Silver Medal","Earn a medal on any mission between 11 to 20", 10, MedalEarned(11,20))
achievement("Gold Medal","Earn a medal on any mission between 21 to 30", 25, MedalEarned(21,30))

// SOS Card achievements
achievement("Bounty Hunter Ash","Hire the bounty hunter Ash", 5, UsedSOS(9))
achievement("Bounty Hunter Amanda","Hire the bounty hunter Amanda", 5, UsedSOS(10))
achievement("Bounty Hunter James","Hire the bounty hunter James", 10, UsedSOS(11))

achievement("Energy Stores","Collect 500 unspent energy during a mission", 5, CollectEnergy(500))
achievement("An Economy Is You","Collect 1000 unspent energy during a mission", 10, CollectEnergy(1000))
achievement("War for Fun and Profit","Collect 2500 unspent energy during a mission", 25, CollectEnergy(2500))


// Rich Presence
rich_presence_conditional_display(
    GameActive() && InGame(),
    "Mission: {0} | Wave: {1} | Rank: {2} | Energy: {3} | Crystals: {4}",
    rich_presence_lookup("Levels", Level(), Levels),    
    rich_presence_value("Wave", Wave() + 1),
    rich_presence_lookup("Ranks", Rank(), Ranks),
    rich_presence_value("Energy",Energy()),
    rich_presence_value("PowerCrystals",PowerCrystals())
)

rich_presence_conditional_display(
    GameActive() && OnMap(),
    "Mission: {0} | Rank: {1} | Perfects: {2} | Medals: {3}",
    rich_presence_lookup("Levels", Level(), Levels), 
    rich_presence_lookup("Ranks", Rank(), Ranks),
    rich_presence_value("PerfectCount",sum_of(range(1,30), i => Perfect(i))),
    rich_presence_value("MedalCount",sum_of(range(1,30), i => Medal(i)))
)

rich_presence_display("In DSi Menu")

for index in range(1,30)
{
    submit = StringCompare(AppName(), StarshipAppE) &&
        GameActive() && 
        State() == 1 && 
        Level() == index &&
        MapEnabled() &&
        prev(Score(index)) < Score(index)
        
    leaderboard(
        Levels[index],
        "Highest score on " + Levels[index] + " (submits when new high score is recorded)",
        submit,
        always_false(),
        submit,
        Score(index)
    )
}

