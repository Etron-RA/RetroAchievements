// Tetris DX
// #ID = 4939

// $AD02: Tetris Board 10x19
//        Cell(0,0) = $AD02, Cell(9,0) = $AD0B, 
//        Cell(0,1) = $AD12, Cell(9,1) = $AD1B,
//        ... 
//        Cell(0,18) = $AE22, Cell(9,18) = $AE2B
function Cell(x,y) => byte(0xAD02 + x + (y * 16))

// Shortcut cell definitions
MT = 0xfb // Empty square
HL = 0xb0 // I horizontal left piece (orange)
HC = 0xb1 // I horizontal center piece
HR = 0xb2 // I horizontal right piece
VT = 0xb3 // I vertical top piece
VM = 0xb4 // I vertical center piece
VB = 0xb5 // I vertical bottom piece
LP = 0x88 // L piece (red)
JP = 0x90 // J piece (light blue)
TP = 0x98 // T piece (light green)
ZP = 0xa0 // Z piece (yellow)
SP = 0xa8 // S piece (purple)
OP = 0x80 // O piece (black)

// Special cells
NE = 0xff // Any square (not empty)
NO = 0x0  // Nothing (ignore)

// Build a set of conditions to test for the passed map
function TetrisMap(map)
{
    trigger = always_true()
    for y in range(0,18)
    {
        for x in range(0,9)
        {
            // Get the value of current cell
            cell = map[y][x]            
            if cell == NE 
                // If any cell then test not empty
                trigger = trigger && Cell(x,y) != MT
            elseif cell != NO 
                // If not ignoring cell then test for current cell value
                trigger = trigger && Cell(x,y) == cell
        }
    }
    return trigger
}

grandmaster= [
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NO,NO,NO,NO,NO,NO,NO,NO,NO,NO],
    [NE,NE,NE,NE,NE,NE,NE,NE,NE,MT],
    [NE,NE,NE,NE,NE,NE,NE,NE,MT,NE],
    [NE,NE,NE,NE,NE,NE,NE,MT,NE,NE],
    [NE,NE,NE,NE,NE,NE,MT,NE,NE,NE],
    [NE,NE,NE,NE,NE,MT,NE,NE,NE,NE],
    [NE,NE,NE,NE,MT,NE,NE,NE,NE,NE],
    [NE,NE,NE,MT,NE,NE,NE,NE,NE,NE],
    [NE,NE,MT,NE,NE,NE,NE,NE,NE,NE],
    [NE,MT,NE,NE,NE,NE,NE,NE,NE,NE],
    [MT,NE,NE,NE,NE,NE,NE,NE,NE,NE]
]

achievement(
    title = "Example 6B: Not Quite a Grandmaster",
    description = "Perform the secret grade grandmaster build up to the opposite wall", 
    points = 25,
    trigger = TetrisMap(grandmaster)
)