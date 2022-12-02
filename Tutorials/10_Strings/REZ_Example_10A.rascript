// Rez
// #ID = 3419

// $008040: [ASCII] Name of the GD-ROM disc in drive:
//          JPN = "HDR-0178"
//          US/EU = "MK-5119250"
function GDROM(offset = 0) => 0x8040 + offset

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

// "HDR-0178" = Japan GD-ROM Name
JapanDisc = [0x48,0x44,0x52,0x2D,0x30,0x31,0x37,0x38]

// "MK-5119250" = EU GD-ROM Name
EuDisc = [0x4D,0x4B,0x2D,0x35,0x31,0x31,0x39,0x32,0x35,0x30]

achievement(
    "Example #10A - Japan Region",
    "Start the game with the Japan region disc",
    0,
    StringCompare(GDROM(), JapanDisc)
)


achievement(
    "Example #10A - EU Region",
    "Start the game with the EU region disc",
    0,
    StringCompare(GDROM(), EuDisc)
)
