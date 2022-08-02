// Videocart-19: Checkers
// #ID = 8976

//////////////////////////////////////////////////////////////////////////////////////////
// Memory Locations

// $000F: [8-bit] Game State:
//        0x00 = Reset
//        0x18 = CPU done (redraw)
//        0x21 = CPU looking for a sacrifice
//        0x3a = Check for CPU multijumps
//        0x4d = CPU multijumps if possible
//        0x61 = Player done (redraw)
//        0x6F = Check for player multijumps
//        0x74 = CPU crowned
//        0x7C = New game
//        0x9E = CPU's turn
//        0x99 = Player's turn
//        0xba = Invalid move

function GameState() => byte(0x00000F)
State = {
    0x0: "Reset",
    0x18: "CPU done (redraw)",
    0x21: "CPU looking for a sacrifice",
    0x3a: "Check for CPU multijumps",
    0x4d: "CPU multijumps if possible",
    0x61: "Player done (redraw)",
    0x6F: "Check for player multijumps",
    0x74: "CPU crowned",
    0x7C: "New game",
    0x9E: "CPU's turn",
    0x99: "Player's turn",
    0xba: "Invalid move"
}
function StateChange(state) => prev(GameState()) != state &&  GameState() == state
function InGame() => GameState() != 0x0 && GameState() != 0x7C
function Reset() => StateChange(0x0)
function YourTurn() => GameState() == 0x99
function CPUsTurn() => GameState() == 0x9e
function NewGame() => prev(GameState()) != 0x0 && GameState() == 0x7C
function NextTurn() => StateChange(0x99) && prev(GameState()) != 0xba

// $0010: [8-bit] Last Target Move X (0,0 is bottom left)
function LastTargetX() => byte(0x000010)

// $0011: [8-bit] Last Target Move Y (0,0 is bottom left)
function LastTargetY() => byte(0x000011)

// $0012: [8-bit] Last Move Piece:
//        0x1 = Red King
//        0x2 = Red Piece
//        0x4 = Green King
//        0x8 = Green Piece
function LastPiece() => byte(0x000012)

// $0018: [8-bit] Cursor State 
//        0x0 = Not selected
//        0x1 = Player selected
//        0x2 = Last Move
//        0x14 = Player Jump
//        0x1b = CPU has rage quit (game won if for two frames)
//        0x1d= Undo move (invalid)
//        0xe0 = End turn (game won if for two frames)
//        0xf6= Jump Required!
function CursorState() => byte(0x000018)

// $0019: [32-bit] Next Move (used for turn switchs)
function NextMove() => dword(0x000019)

// $0019: [8-bit] Target Move X (0,0 is bottom left)
function TargetMoveX() => byte(0x000019)

// $001A: [8-bit] Target Move Y (0,0 is bottom left)
function TargetMoveY() => byte(0x00001A)

// $001B: [8-bit] Selected Move X (0,0 is bottom left)
function SelectedMoveX() => byte(0x00001B)

// $001C: [8-bit] Selected Move Y (0,0 is bottom left)
function SelectedMoveY() => byte(0x00001C)

// $001D: [bit 0] Manditory jump required
function JumpRequried() => byte(0x00001D)

// $001E: [8-bit] Red pieces on the board
function RedPieces() => byte(0x00001E)

// $001F: [8-bit] Green pieces on the board
function GreenPieces() => byte(0x00001F)

// $002E: [8-bit] Red pieces captured
function RedCaptured() => byte(0x00002E)

// $002F: [8-bit] Green pieces captured
function GreenCaptured() => byte(0x00002F)

// $0030: [16 bytes] Game board represented by nibbles for each blue square starting bottom right then going left to right, bottom to top.
//        0x1 = Red King
//        0x2 = Red Piece
//        0x4 = Green King
//        0x8 = Green Piece
//     ################################
//     ###    __________________    ###
//     ##   7 I  []  []  []  []I     ##
//     ##   6 I[]  []  []  []  I     ##
//     ##   5 I  []  []  []  []I     ##
//     ##   4 I##  ##  ##  ##  I     ##
//     ##   3 I  ##  ##  ##  ##I     ##
//     ##   2 I[]  []  []  []  I     ##
//     ##   1 I  []  []  []  []I     ##
//     ##   0 I[]__[]__[]__[]__I     ##
//     ###     0 1 2 3 4 5 6 7      ###
//     ################################
function Board(offset = 0) => byte(0x30 + offset)

// Bit locationsfor red kings in each square
Red_King_Array = [
    [bit0(0x30), 0, bit0(0x34), 0, bit0(0x38), 0, bit0(0x3c), 0],
    [0, bit0(0x32), 0, bit0(0x36), 0, bit0(0x3a), 0, bit0(0x3e)],
    [bit4(0x30), 0, bit4(0x34), 0, bit4(0x38), 0, bit4(0x3c), 0],
    [0, bit4(0x32), 0, bit4(0x36), 0, bit4(0x3a), 0, bit4(0x3e)],    
    [bit0(0x31), 0, bit0(0x35), 0, bit0(0x39), 0, bit0(0x3d), 0],
    [0, bit0(0x33), 0, bit0(0x37), 0, bit0(0x3b), 0, bit0(0x3f)],
    [bit4(0x31), 0, bit4(0x35), 0, bit4(0x39), 0, bit4(0x3d), 0],
    [0, bit4(0x33), 0, bit4(0x37), 0, bit4(0x3b), 0, bit4(0x3f)]
]

// Bit locationsfor red pieces in each square
Red_Piece_Array = [
    [bit1(0x30), 0, bit1(0x34), 0, bit1(0x38), 0, bit1(0x3c), 0],
    [0, bit1(0x32), 0, bit1(0x36), 0, bit1(0x3a), 0, bit1(0x3e)],
    [bit5(0x30), 0, bit5(0x34), 0, bit5(0x38), 0, bit5(0x3c), 0],
    [0, bit5(0x32), 0, bit5(0x36), 0, bit5(0x3a), 0, bit5(0x3e)],    
    [bit1(0x31), 0, bit1(0x35), 0, bit1(0x39), 0, bit1(0x3d), 0],
    [0, bit1(0x33), 0, bit1(0x37), 0, bit1(0x3b), 0, bit1(0x3f)],
    [bit5(0x31), 0, bit5(0x35), 0, bit5(0x39), 0, bit5(0x3d), 0],
    [0, bit5(0x33), 0, bit5(0x37), 0, bit5(0x3b), 0, bit5(0x3f)]
]

//////////////////////////////////////////////////////////////////////////////////////////
// Helper Functions

// Count the number of red pieces on the board
// If previous is true use the prev() command otherwise use current
function CountRedPieces(previous = false)
{
    redPieces = []
    for index in range(0x30,0x3F)
   {
       array_push(redPieces, bit0(index))
       array_push(redPieces, bit1(index))
       array_push(redPieces, bit4(index))
       array_push(redPieces, bit5(index))
   }
   if previous == true
       return sum_of(redPieces,  b => prev(b))
   else
        return sum_of(redPieces,  b => b)
}

// Count the number of red kings on the board
// If previous is true use the prev() command otherwise use current
function CountRedKings(previous = false)
{
    redKings = []
    for index in range(0x30,0x3F)
   {
       array_push(redKings, bit0(index))
       array_push(redKings, bit4(index))
   }
   
   if previous == true
       return sum_of(redKings,  b => prev(b))
   else
        return sum_of(redKings,  b => b)
}

// Count the number of green pieces on the board
// If previous is true use the prev() command otherwise use current
function CountGreenPieces(previous = false)
{
    greenPieces = []
    for index in range(0x30,0x3F)
   {
       array_push(greenPieces, bit2(index))
       array_push(greenPieces, bit3(index))
       array_push(greenPieces, bit6(index))
       array_push(greenPieces, bit7(index))
   }
   if previous == true
       return sum_of(greenPieces,  b => prev(b))
   else
        return sum_of(greenPieces,  b => b)
}

// Count the number of green kings on the board
// If previous is true use the prev() command otherwise use current
function CountGreenKings(previous = false)
{
    greenKings = []
    for index in range(0x30,0x3F)
   {
       array_push(greenKings, bit2(index))
       array_push(greenKings, bit6(index))
   }
   if previous == true
       return sum_of(greenKings,  b => prev(b))
   else
        return sum_of(greenKings,  b => b)
}

// Check if all green pieces have been captured
function Win()
{
    return InGame() && 
        CountGreenPieces(true) == 1 && 
        CountGreenPieces(false) == 0
}

// Check for the CPU being blocked while still having pieces remaining
function Blocked()
{
    return GreenPieces() > 0 && 
        prev(CursorState()) == 0xe0 &&
        CursorState() == 0xe0 &&
        CPUsTurn()
}

// Check for the CPU resigning
function RageQuit()
{
    return GreenPieces() > 0 && 
        prev(CursorState()) == 0x1b &&
        CursorState() == 0x1b &&
        CPUsTurn()
}

//////////////////////////////////////////////////////////////////////////////////////////
// Achivements

// Starts at the beginning of the game
// Cancels on reset or when red lose there first piece
// Submits when 
function FirstBlood()
{
    start = once(NewGame())

    cancel = never(Reset()) &&
        never(prev(RedCaptured()) == 0 && RedCaptured() == 1) 

    submit = trigger_when(prev(GreenCaptured()) == 0 && GreenCaptured() == 1)

    return start && cancel && submit
}
achievement("First Blood!","Capture the first piece", 1, FirstBlood())


// Count if the number of green kings in one less than previously
function Regicide()
{
    return InGame() &&
        CountGreenKings(true) - 1 == CountGreenKings(false)
        
}
achievement("Regicide!","Capture a king", 2, Regicide())


// Count if the capture count number of pieces in one turn
function Multijump(count)
{
    return InGame() &&
        repeated(count, prev(GreenCaptured()) + 1 == GreenCaptured()) &&
        never(NextTurn())
}
achievement("Double Jump!","Capture two pieces in one turn", 3, Multijump(2))


// Check if a player sacrifices a piece to gain two in the same jump sequence
function Trap()
{
    return once(InGame() && prev(RedCaptured()) + 1 == RedCaptured()) &&
        never(repeated(2, prev(RedCaptured()) + 1 == RedCaptured())) &&
        never(prev(JumpRequried()) == 0 && JumpRequried() == 0) &&
        trigger_when(
            repeated(2, prev(GreenCaptured()) + 1 == GreenCaptured()) &&
            prev(JumpRequried()) == 1 && JumpRequried() == 0)
}
achievement("It's a Trap!","Sacrifice a piece to capture two or more pieces in a single trade", 5, Trap())

// Check how many kings the player has at once
function KingCheck(count)
{
    return InGame() &&
        CountRedKings(true) == count - 1 &&
        measured(CountRedKings(false) == count)
}
       
achievement("King Me!","Crown one of your pieces", 1, KingCheck(1))
achievement("We'll Lead as Two Kings!","Have two kings at once", 2, KingCheck(2))
achievement("We Three Kings!","Have three kings at once", 3, KingCheck(3))

// Check if a red king is in the bottom row
function KingReturns()
{
    bottomRow = []
    array_push(bottomRow, Red_King_Array[0][0])
    array_push(bottomRow, Red_King_Array[2][0])
    array_push(bottomRow, Red_King_Array[4][0])
    array_push(bottomRow, Red_King_Array[6][0])

    return InGame() &&
        sum_of(bottomRow, b => prev(b)) == 0 &&
        measured(sum_of(bottomRow, b => b) == 1)
}
achievement("Return of the King!","Move a king to the bottom of the board", 2, KingReturns())

// Checks if the player has four kings at the top of the board
function FullPress(count)
{
    topRow = []
    array_push(topRow, Red_King_Array[1][7])
    array_push(topRow, Red_King_Array[3][7])
    array_push(topRow, Red_King_Array[5][7])
    array_push(topRow, Red_King_Array[7][7])

    return InGame() && 
        sum_of(topRow, b => prev(b)) == count - 1 &&
        measured(sum_of(topRow, b => b) == count)
}

achievement("Full Press!","Have four pieces on the top of the board at once", 5, FullPress(4))

function CentralControl(count)
{
    center = []
    array_push(center, Red_King_Array[2][2])
    array_push(center, Red_Piece_Array[2][2])
    array_push(center, Red_King_Array[4][2])
    array_push(center, Red_Piece_Array[4][2])
    array_push(center, Red_King_Array[3][3])
    array_push(center, Red_Piece_Array[3][3])
    array_push(center, Red_King_Array[5][3])
    array_push(center, Red_Piece_Array[5][3])
    array_push(center, Red_King_Array[2][4])
    array_push(center, Red_Piece_Array[2][4])
    array_push(center, Red_King_Array[4][4])
    array_push(center, Red_Piece_Array[4][4])
    array_push(center, Red_King_Array[3][5])
    array_push(center, Red_Piece_Array[3][5])
    array_push(center, Red_King_Array[5][5])
    array_push(center, Red_Piece_Array[5][5])
    
    return InGame() && 
        sum_of(center, b => prev(b)) == count - 1 &&
        measured(sum_of(center, b => b) == count)
}
achievement("Control Center!","Have five pieces in the middle of the board at once (between rows 3 to 6 and columns 3 to 6)", 5, CentralControl(5))

// Check if six red pieces are on the right or left of the board
function Flanked(count)
{
    flanks = []
    array_push(flanks, Red_King_Array[0][0])
    array_push(flanks, Red_Piece_Array[0][0])
    array_push(flanks, Red_King_Array[0][2])
    array_push(flanks, Red_Piece_Array[0][2])
    array_push(flanks, Red_King_Array[0][4])
    array_push(flanks, Red_Piece_Array[0][4])
    array_push(flanks, Red_King_Array[0][6])
    array_push(flanks, Red_Piece_Array[0][6])
    array_push(flanks, Red_King_Array[7][1])
    array_push(flanks, Red_Piece_Array[7][1])
    array_push(flanks, Red_King_Array[7][3])
    array_push(flanks, Red_Piece_Array[7][3])
    array_push(flanks, Red_King_Array[7][5])
    array_push(flanks, Red_Piece_Array[7][5])
    array_push(flanks, Red_King_Array[7][7])
    array_push(flanks, Red_Piece_Array[7][7])

    return InGame() && 
		sum_of(flanks, b => prev(b)) == count - 1 &&
        measured(sum_of(flanks, b => b) == count)
}
achievement("Flanked!","Have six pieces combined on the leftmost and rightmost side of the board at once", 5, Flanked(6))

// Check that the player has not move a back row piece in the first count moves
function Reserves(count)
{
    start = once(NewGame())

    bottomRow = []
        array_push(bottomRow, Red_Piece_Array[0][0])
        array_push(bottomRow, Red_Piece_Array[2][0])
        array_push(bottomRow, Red_Piece_Array[4][0])
        array_push(bottomRow, Red_Piece_Array[6][0])
       
    cancel = never(
        sum_of(bottomRow, b => prev(b)) == 4 &&
        sum_of(bottomRow, b => b) == 3
    )
    
    submit = trigger_when(repeated(count + 1, NextTurn()))
    
    // Note game state is never 255 so it should never be true during play
    measure = GameState() == 0xff &&
        measured(repeated(count, NextTurn()))

    return start && cancel && (submit || measure)
}
achievement("The Reserves!","Go ten turns without moving a piece from the bottom of the board", 5, Reserves(10))

// Check if the player has the advantage by count pieces
function Advantage(count)
{
    return YourTurn() &&
        GreenPieces() + count <= RedPieces()
}
achievement("Slight Advantage!","Have two or more pieces than your opponent during your turn", 2, Advantage(2))
achievement("Clear Advantage!","Have four or more pieces than your opponent during your turn", 4, Advantage(4))
achievement("Huge Advantage!","Have six or more pieces than your opponent during your turn", 10, Advantage(6))

// Check for a blocked CPU 
achievement("Tactical Victory!","Win a game by blocking the opponent from moving", 25, Blocked())

// Check if player has won in less than count moves
function QuickWin(turns)
{
    start = once(NewGame())

    cancel = never(Reset()) &&
        never(repeated(turns + 1, NextTurn()))
    
    submit = trigger_when(Win())
    
    // Note game state is never 255 so it should never be true during play
    measure = GameState() == 0xff &&
        measured(repeated(turns, NextTurn()))

    return start && cancel && (submit || measure)
}
achievement("Complete Victory!","Win a game by capturing all of the opponents pieces", 5, Win())
achievement("Decisive Victory!","Win a game by capturing all of the opponents pieces in 65 turns or less", 5, QuickWin(65))
achievement("Quick Victory!","Win a game by capturing all of the opponents pieces in 50 turns or less", 10, QuickWin(50))
achievement("Absolute Victory!","Win a game by capturing all of the opponents pieces in 40 turns or less", 25, QuickWin(40))

//////////////////////////////////////////////////////////////////////////////////////////
// Rich Presence

rich_presence_display("Red {0} Kings {1} | Green {2} Kings {3}", 
    rich_presence_value("Red Pieces", RedPieces()), 
    rich_presence_value("Red Kings", CountRedKings()), 
    rich_presence_value("Green Pieces", GreenPieces()), 
    rich_presence_value("Green Kings", CountGreenKings())
)

//////////////////////////////////////////////////////////////////////////////////////////
// Leaderboards

// Leaderboard for least number of turns to capture all of the green pieces
// Start on a new game event
// Cancels on game reset
// Submits on a capture win
// Value is the number of turn from the start
leaderboard(
    "Quick Winner!", 
    "Least number of turns to capture all of the green pieces",
    NewGame(), 
    Reset(),
    Win(),
    measured(NextTurn()), 
    format="VALUE",
    lower_is_better=true
)

// Leaderboard for least number of turns to block the opponent from moving
// Start on a new game event
// Cancels on game reset
// Submits on a block win
// Value is the number of turn from the start
leaderboard(
    "Tactical Winner!", 
    "Least number of turns to block the opponent from moving",
    NewGame(), 
    Reset(),
    Blocked(),
    measured(NextTurn()), 
    format="VALUE",
    lower_is_better=true
)

// Leaderboard for least number of turns to get the CPU to rage quit (resign the game with moves still availible)
// Start on a new game event
// Cancels on game reset
// Submits on rage quit
// Value is the number of turn from the start
leaderboard(
    "Rage Quit!", 
    "Least number of turns to get the CPU to rage quit (resign the game with moves still availible)",
    NewGame(), 
    Reset(),
    RageQuit(),
    measured(NextTurn()), 
    format="VALUE",
    lower_is_better=true
)
