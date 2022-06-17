// Qix Adventure
// #ID = 4246

// $A002: Start of the treasures memory
// Each treasure stores what stage it was unlocked in, this code normalizes that value to 1 if non-zero and 0 otherwise
// Note due to a bug with the optimizer using a type mismatch to bypass
// The value of each treasure is less than 16 so the code is equivalent to byte/byte
function Treasures() => sum_of(range(0x00a002,0xa05b), addr => low4(addr)/byte(addr))

// $A08E: Main Stage?
//        0x00 - Field
//        0x01 - Starcoast
//        0x02 - Wood
//        0x03 - Mountain
//        0x04 - River
//        0x05 - Iced Lake
//        0x06 - Village
//        0x08 - Castle
//        0x09 - Original Mode
function Stage() => byte(0x00A08E)

StageLookup = {
    00: "Field",
    01: "Starcoast",
    02: "Wood",
    03: "Mountain",
    04: "River",
    05: "Iced Lake",
    06: "Village",
    07: "Sleep Sea",
    08: "Castle",
    09: "Mt.Death",
}

// $A07A: [16-bit] The lower part of the total money (value +  higher money * 1,000)
// $A07C: [16-bit] The higher part of the total money (value * 1,000 + lower money)
function MoneyHigh() => word(0xa07c)
function MoneyLow() => word(0xa07a)
function Money() => MoneyHigh() * 1000 + MoneyLow()

// $A09E: [16-bit] The higher part of the total score (value * 10,000 + lower score)
// $A0A0: [16-bit] The lower part of the total score (value + higher score * 10,000)
function ScoreHigh() => word(0xa09e)
function ScoreLow() => word(0xa0a0)
function Score() => ScoreHigh() * 10000 + ScoreLow()

// $C1FB-0xC200: Original Score
function OriginalScoreX00000() => low4(0x00C1FB)
function OriginalScore0X0000() => low4(0x00C1FC)
function OriginalScore00X000() => low4(0x00C1FD)
function OriginalScore000X00() => low4(0x00C1FE)
function OriginalScore0000X0() => low4(0x00C1FF)
function OriginalScore00000X() => low4(0x00C200)

function OriginalScore(sigDigits)
{
    score = 0
    if(sigDigits >= 6) score = score + OriginalScoreX00000() * 100000
    if(sigDigits >= 5) score = score + OriginalScore0X0000() * 10000
    if(sigDigits >= 4) score = score + OriginalScore00X000() * 1000
    if(sigDigits >= 3) score = score + OriginalScore000X00() * 100
    if(sigDigits >= 2) score = score + OriginalScore0000X0() * 10
    if(sigDigits >= 1) score = score +  OriginalScore00000X()
    return score
}

// $D26E: Original Mode (0 - Treasure Mode, 1 - Original Mode)
function OriginalMode() => byte(0x00D26E)

// $D26F: Original Stage Number
function OriginalStage() => byte(0x00D26F)

// $d270: [byte] Game Mode (0x0 = none, 0x3 = original, 0x10 = Treasure)
function GameMode() => byte(0x00d270)

// $D2F3 [bit 0] Demo Mode (0 = no demo, 1 = demo)
function DemoMode() => bit0(0x00D2F3)

// Shortcut test if at the menu
function InMenu() => OriginalMode() == 0 && OriginalStage() == 0 && GameMode() == 0

rich_presence_conditional_display(DemoMode() == 1, "Qixing back at the demo")
rich_presence_conditional_display(InMenu(), "Qixing back at the menu")

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScoreX00000() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(6))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore0X0000() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(5))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore00X000() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(4))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore000X00() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(3))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore0000X0() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(2))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore00000X() != 0xf, 
    "Qixing back at Stage {0} with {1} points",
    rich_presence_value("OGStage", OriginalStage()),
    rich_presence_value("OGScore", OriginalScore(1))
)

rich_presence_conditional_display(OriginalMode() == 1 && OriginalScore00000X() == 0xf, 
    "Qixing back at Stage {0} with 0 points",
    rich_presence_value("OGStage", OriginalStage())
)

rich_presence_display("Qixing back at {0} with {1} points, ${2} and {3}/90 Treasures",
    rich_presence_lookup("Stage", Stage(), StageLookup),
    rich_presence_value("Score", Score()),
    rich_presence_value("Money", Money()),
    rich_presence_value("Treasures", Treasures())
)


