// Q*bert
// #ID = 16123

// $0092d4: [ASCII] CD-ROM Name
//          SLUS_009.04;1 = US
//          SLES_022.14;1 = EU
function CDROM(offset = 0) => 0x92d4 + offset

// $0C3F08: Adventure mode difficulty (EU)
// $0C7C1C: Adventure mode difficulty (US)
function AdventureDifficultyEU() => byte(0x0C3F08)
function AdventureDifficultyUS() => byte(0x0C7C1C)

// $13B55D: Current adventure world (EU)
// $13F22D: Current adventure world (US)
function AdventureWorldEU() => byte(0x13B55D)
function AdventureWorldUS() => byte(0x13F22D)

// $13B55E: Current adventure level (EU)
// $13F22E: Current adventure level (US)
function AdventureLevelEU() => byte(0x13B55E)
function AdventureLevelUS() => byte(0x13F22E)

// $142d58: Adventure mode score (EU)
// $146a28: Adventure mode score (US)
function AdventureScoreEU() => word(0x142d58)
function AdventureScoreUS() => word(0x146a28)

// $11FE11: Classic mode difficulty (EU)
// $1239D1: Classic mode difficulty (US)
function ClassicDifficultyEU() => byte(0x11FE11) 
function ClassicDifficultyUS() => byte(0x1239D1)

// $11246A: Current level (classic mode) (EU)
// $11602A: Current level (classic mode) (US)
function ClassicLevelEU() => byte(0x11246A)
function ClassicLevelUS() => byte(0x11602A)

// $112469: Current round (classic mode) (EU)
// $116029: Current round (classic mode) (US)
function ClassicRoundEU() => byte(0x112469)
function ClassicRoundUS() => byte(0x116029)

// $10e9ae: Classic mode score (EU)
// $11256e: Classic mode score (US)
function ClassicScoreEU() => word(0x10e9ae)
function ClassicScoreUS() => word(0x11256e)

Difficulty2 = {
    0: "easy",
    1: "hard"
}

Difficulty3 = {
    0: "easy",
    1: "medium",
    2: "hard"
}

//"SLUS_009.04;1" = US Disc
US_Disc = [0x53,0x4C,0x55,0x53,0x5F,0x30,0x30,0x39,0x2E,0x30,0x34,0x3B,0x31]

// "SLES_022.14;1" = EU Disc
EU_Disc = [0x53,0x4C,0x45,0x53,0x5F,0x30,0x32,0x32,0x2E,0x31,0x34,0x3B,0x31]

//-------------------------------------------------------------------------
// Helper Functions

// Check if the string hex values equal the hex values at the passed address
function StringCompare(address, string)
{
    strArray = []
    for hexValue in string
    {
        array_push(strArray, byte(address) == hexValue)
        address = address + 1
    }
    return all_of(strArray, a => a)
}

rich_presence_conditional_display(
    StringCompare(CDROM(), EU_Disc) &&
        ClassicLevelEU() >= 1 &&
        ClassicLevelEU() <= 4 && 
        ClassicRoundEU() >= 1 &&
        ClassicRoundEU() <= 4, 
    "Q*Bert is playing on {0} in classic mode {1}-{2} with {3} points", 
    rich_presence_lookup("ClassicDifficulty", ClassicDifficultyEU(), Difficulty2),
    rich_presence_value("ClassicLevel", ClassicLevelEU()),
    rich_presence_value("ClassicRound", ClassicRoundEU()),
    rich_presence_value("ClassicScore", ClassicScoreEU())
)

rich_presence_conditional_display(
    StringCompare(CDROM(), EU_Disc) &&
        AdventureWorldEU() >= 1 &&
        AdventureWorldEU() <= 4 && 
        AdventureLevelEU() >= 1 &&
        AdventureLevelEU() <= 6, 
    "Q*Bert is playing on {0} in adventure mode {1}-{2} with {3} points", 
    rich_presence_lookup("AdventureDifficulty", AdventureDifficultyEU(), Difficulty3),
    rich_presence_value("AdventureWorld", AdventureWorldEU()),
    rich_presence_value("AdventureLevel", AdventureLevelEU()),
    rich_presence_value("AdventureScore", AdventureScoreEU())
)

rich_presence_conditional_display(
    StringCompare(CDROM(), US_Disc) &&
        ClassicLevelUS() >= 1 &&
        ClassicLevelUS() <= 4 && 
        ClassicRoundUS() >= 1 &&
        ClassicRoundUS() <= 4, 
    "Q*Bert is playing on {0} in classic mode {1}-{2} with {3} points", 
    rich_presence_lookup("ClassicDifficulty", ClassicDifficultyUS(), Difficulty2),
    rich_presence_value("ClassicLevel", ClassicLevelUS()),
    rich_presence_value("ClassicRound", ClassicRoundUS()),
    rich_presence_value("ClassicScore", ClassicScoreUS())
)

rich_presence_conditional_display(
    StringCompare(CDROM(), US_Disc) &&
        AdventureWorldUS() >= 1 &&
        AdventureWorldUS() <= 4 && 
        AdventureLevelUS() >= 1 &&
        AdventureLevelUS() <= 6, 
    "Q*Bert is playing on {0} in adventure mode {1}-{2} with {3} points", 
    rich_presence_lookup("AdventureDifficulty", AdventureDifficultyUS(), Difficulty3),
    rich_presence_value("AdventureWorld", AdventureWorldUS()),
    rich_presence_value("AdventureLevel", AdventureLevelUS()),
    rich_presence_value("AdventureScore", AdventureScoreUS())
)

rich_presence_display("Q*Bert is confused in the menu!")