// Lumines
// #ID = 3223

// $8908a8: [32-bit] Menu Selection
//          0 = 1P Mode
//          1 = 2P Mode
//          2 = Vs CPU Mode
//          3 = Puzzle Mode
function MenuMode() => dword(0x8908a8)

// $890de8: [32-bit] 1P Mode
//          0 = Challenge Mode
//          1 = Single Skin Mode
//          2 = 60 Sec
//          3 = 180 Sec
//          4 = 300 Sec
//          5 = 600 Sec
function P1Mode() => dword(0x890de8)

// $8ABAFC: [25-bit] Menu Pointer Root
//          +0x05c [25-bit] Game Pointer Root
//          ++0x008 [25-bit] Game Pointer Chain
//          +++0x044 [32-bit] Vs CPU State (3=>4 = Start VS, 4=>7 Won VS)
//          +++0x060 [25-bit] Vs CPU Pointer Chain
//          ++++0x060 [25-bit] Vs CPU Divide Pointer
//          +++++0x020 [32-bit] Vs Divide (how many squares from left, 8 is middle)
//          ++++0x068 [25-bit] Vs CPU Stats Pointer
//          +++++0x000 = [32-bit] Level
//          +++++0x004 = [32-bit] Time (in frame)
//          +++++0x008 = [32-bit] Current Score
//          +++++0x00C = [32-bit] High Score
//          +++++0x010 = [32-bit] Total Combo
//          +++++0x014 = [32-bit] Deleted Blocks
//          +++++0x020 = [32-bit] Blocks removed this measure
//          +++++0x024 = [32-bit] Blocks removed last measure
//          +++++0x028 = [32-bit] Multipier
//          +++++0x02c = [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x044 = [32-bit] Player 1 Combo
//          +++++0x048 = [32-bit] Player 2 Combo
//          +++++0x1c0 = [32-bit] Number of color 1 on board
//          +++++0x1c4 = [32-bit] Number of color 2 on board
//          ++++0x0A8 [32-bit] Vs CPU Round Number
//          +++0x0C8 [25-bit] Challenge Pointer Chain
//          ++++0x02C [25-bit] Challenge Board Pointer Chain
//          +++++0x000 [25-bit] Challenge Board Pointer (see board pointer note below)
//          ++++0x034 [25-bit] Challenge Stats Pointer
//          +++++0x000 = [32-bit] Level
//          +++++0x004 = [32-bit] Time (in frame)
//          +++++0x008 = [32-bit] Current Score
//          +++++0x00C = [32-bit] High Score
//          +++++0x010 = [32-bit] Total Combo
//          +++++0x014 = [32-bit] Deleted Blocks
//          +++++0x020 = [32-bit] Blocks removed this measure
//          +++++0x024 = [32-bit] Blocks removed last measure
//          +++++0x028 = [32-bit] Multipier
//          +++++0x02c = [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x1c0 = [32-bit] Number of color 1 on board
//          +++++0x1c4 = [32-bit] Number of color 2 on board
//          +++0x0CC [25-bit] Puzzle Pointer Chain
//          ++++0x02C [25-bit] Puzzle Board Pointer Chain
//          +++++0x000 [25-bit] Puzzle Board Pointer (see board pointer note below)
//          ++++0x034 [25-bit] Puzzle Stats Pointer
//          +++++0x000 = [32-bit] Level
//          +++++0x004 = [32-bit] Time (in frame)
//          +++++0x008 = [32-bit] Current Score
//          +++++0x00C = [32-bit] High Score
//          +++++0x010 = [32-bit] Total Combo
//          +++++0x014 = [32-bit] Deleted Blocks
//          +++++0x020 = [32-bit] Blocks removed this measure
//          +++++0x024 = [32-bit] Blocks removed last measure
//          +++++0x028 = [32-bit] Multipier
//          +++++0x02c = [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x1c0 = [32-bit] Number of color 1 on board
//          +++++0x1c4 = [32-bit] Number of color 2 on board
//          +++0x0D4 [32-bit] Game State (0=>1 = Start Skin, 1=>2 = Done Skin)
//          +++0x0DC [32-bit] Game State (0=>1 = Start Challenge, 1=>2 = Done Challenge, 4=>5 = Start Puzzle, 5=>6 = Done Puzzle)
//          +++0x0E4 [32-bit] Time Left in Challenge (frames) or Puzzles Left to Solve (0 if all solved)
//          +++0x0E8 [32-bit] Time Left in Puzzle (frames)
//          +++0x0EC [32-bit] Time Attack Deleted Blocks
//          ++0x08C [32-bit] Exiting (0 = no, 1 = yes)
//          ++0x100 [25-bit] Vs CPU Board Pointer Chain #1
//          +++0x5c [25-bit] Vs CPU Board Pointer Chain #2
//          ++++0x00 [25-bit] Vs CPU Board Pointer (see board pointer note below)
//          ---------------------------------------------------------------
//          All board pointers share the same structure
//          Square 0,0 is the top left square at address +0x0000
//          Square 15,9 is the bottom right square at address +0x1164
//          A columns are every 0x1c bytes
//          A rows are every 0x1c0 bytes
//          A bit0 represents color 1 and bit1 represents color 2
function MenuPointerRoot() => dword(0x8abafc) & 0x1ffffff
function MenuPointerNull() => dword(0x8abafc) == 0

// Select Menu Chain
function MenuPointerChain() => dword(MenuPointerRoot() + 0x5c) & 0x1ffffff
function MenuPointerChainNull() => dword(MenuPointerRoot() + 0x5c) == 0

// Menu Functions
function MenuExit() => dword(MenuPointerChain() + 0x8c)

// Select Game Pointer
function GamePointerRoot() => dword(MenuPointerChain() + 0x8) & 0x1ffffff
function GamePointerNull() => dword(MenuPointerChain() + 0x8) == 0

// VS pointer chain
function VsPointerChain() => dword(GamePointerRoot() + 0x60) & 0x1ffffff
function VsPointerChainNull() => dword(GamePointerRoot() + 0x60) == 0

// VS pointer chain
function VsDividePointer() => dword(VsPointerChain() + 0x60) & 0x1ffffff
function VsDividePointerNull() => dword(VsPointerChain() + 0x60) == 0

// VS stats pointer
function VsStatPointer() => dword(VsPointerChain() + 0x68) & 0x1ffffff
function VsStatPointerNull() => dword(VsPointerChain() + 0x68) == 0

// VS board pointer chains
function VsBoardPointer() => dword(MenuPointerChain() + 0x100) & 0x1ffffff
function VsBoardPointerNull() => dword(MenuPointerChain() + 0x100) == 0

function VsBoardPointer2() => dword(VsBoardPointer() + 0x5c) & 0x1ffffff
function VsBoardPointer2Null() => dword(VsBoardPointer() + 0x5c) == 0

function VsBoardPointer3() => dword(VsBoardPointer2() + 0x0) & 0x1ffffff
function VsBoardPointer3Null() => dword(VsBoardPointer2() + 0x0) == 0

function VsBoardDW(x, y) => dword(VsBoardPointer3() + (y * 0x1c0) + (x * 0x1c))
function VsBoardC1(x, y) => bit0(VsBoardPointer3() + (y * 0x1c0) + (x * 0x1c))
function VsBoardC2(x, y) => bit1(VsBoardPointer3() + (y * 0x1c0) + (x * 0x1c))

// VS  values
function VsState() => dword(GamePointerRoot() + 0x44)
function VsRound() => dword(GamePointerRoot() + 0xA8)
function VsDivide() => dword(VsDividePointer() + 0x20)
function VsLevel() => dword(VsStatPointer())
function VsTime() => dword(VsStatPointer() + 0x04)
function VsCurrentScore() => dword(VsStatPointer() + 0x08)
function VsHighScore() => dword(VsStatPointer() + 0x0C)
function VsCombo() => dword(VsStatPointer() + 0x10)
function VsDeleted() => dword(VsStatPointer() + 0x14)
function VsRemovedCurrent() => dword(VsStatPointer() + 0x20)
function VsRemovedLast() => dword(VsStatPointer() + 0x24)
function VsMultiplier() => dword(VsStatPointer() + 0x28)
function VsEmptySpaces() => dword(VsStatPointer() + 0x2c)
function VsColor1() => dword(VsStatPointer() + 0x1c0)
function VsColor2() => dword(VsStatPointer() + 0x1c4)

// Challenge pointer chain
function ChallengePointerChain() => dword(GamePointerRoot() + 0xc8) & 0x1ffffff
function ChallengePointerChainNull() => dword(GamePointerRoot() + 0xc8) == 0

// Challenge stats pointer
function ChallengeStatPointer() => dword(ChallengePointerChain() + 0x34) & 0x1ffffff
function ChallengeStatPointerNull() => dword(ChallengePointerChain() + 0x34) == 0

// Challenge board pointer
function ChallengeBoardPointer() => dword(ChallengePointerChain() + 0x2c) & 0x1ffffff
function ChallengeBoardPointerNull() => dword(ChallengePointerChain() + 0x2c) == 0
function ChallengeBoard() => dword(ChallengeBoardPointer()) & 0x1ffffff
function ChallengeBoardDW(x, y) => dword(ChallengeBoard() + (y * 0x1c0) + (x * 0x1c))
function ChallengeBoardC1(x, y) => bit0(ChallengeBoard() + (y * 0x1c0) + (x * 0x1c))
function ChallengeBoardC2(x, y) => bit1(ChallengeBoard() + (y * 0x1c0) + (x * 0x1c))

// Challenge values
function SkinState() => dword(GamePointerRoot() + 0xd4)
function ChallengeState() => dword(GamePointerRoot() + 0xdc)
function ChallengeLevel() => dword(ChallengeStatPointer())
function ChallengeTime() => dword(ChallengeStatPointer() + 0x04)
function ChallengeCurrentScore() => dword(ChallengeStatPointer() + 0x08)
function ChallengeHighScore() => dword(ChallengeStatPointer() + 0x0C)
function ChallengeCombo() => dword(ChallengeStatPointer() + 0x10)
function ChallengeDeleted() => dword(ChallengeStatPointer() + 0x14)
function ChallengeRemovedCurrent() => dword(ChallengeStatPointer() + 0x20)
function ChallengeRemovedLast() => dword(ChallengeStatPointer() + 0x24)
function ChallengeMultiplier() => dword(ChallengeStatPointer() + 0x28)
function ChallengeEmptySpaces() => dword(ChallengeStatPointer() + 0x2c)
function ChallengeColor1() => dword(ChallengeStatPointer() + 0x1c0)
function ChallengeColor2() => dword(ChallengeStatPointer() + 0x1c4)

// Puzzle point chain
function PuzzlePointerChain() => dword(GamePointerRoot() + 0xcc) & 0x1ffffff
function PuzzlePointerChainNull() => dword(GamePointerRoot() + 0xcc) == 0

// Puzzle stats pointer
function PuzzleStatPointer() => dword(PuzzlePointerChain() + 0x34) & 0x1ffffff
function PuzzleStatPointerNull() => dword(PuzzlePointerChain() + 0x34) == 0

// Puzzle board pointer
function PuzzleBoardPointer() => dword(PuzzlePointerChain() + 0x2c) & 0x1ffffff
function PuzzleBoardPointerNull() => dword(PuzzlePointerChain() + 0x2c) == 0
function PuzzleBoard() => dword(PuzzleBoardPointer()) & 0x1ffffff
function PuzzleBoardDW(x, y) => dword(PuzzleBoard() + (y * 0x1c0) + (x * 0x1c))
function PuzzleBoardC1(x, y) => bit0(PuzzleBoard() + (y * 0x1c0) + (x * 0x1c))
function PuzzleBoardC2(x, y) => bit1(PuzzleBoard() + (y * 0x1c0) + (x * 0x1c))

// Puzzle  values
function PuzzleState() => dword(GamePointerRoot() + 0xdc)
function PuzzlesLeft() => dword(GamePointerRoot() + 0xe4)
function PuzzleCountdown() => dword(GamePointerRoot() + 0xe8)
function PuzzleLevel() => dword(PuzzleStatPointer())
function PuzzleTime() => dword(PuzzleStatPointer() + 0x04)
function PuzzleCurrentScore() => dword(PuzzleStatPointer() + 0x08)
function PuzzleHighScore() => dword(PuzzleStatPointer() + 0x0C)
function PuzzleCombo() => dword(PuzzleStatPointer() + 0x10)
function PuzzleDeleted() => dword(PuzzleStatPointer() + 0x14)
function PuzzleRemovedCurrent() => dword(PuzzleStatPointer() + 0x20)
function PuzzleRemovedLast() => dword(PuzzleStatPointer() + 0x24)
function PuzzleMultiplier() => dword(PuzzleStatPointer() + 0x28)
function PuzzleEmptySpaces() => dword(PuzzleStatPointer() + 0x2c)

// Time attack values (the rest are the same as puzzles)
function TimeAttackState() => dword(GamePointerRoot() + 0xdc)
function TimeAttackCountdown() => dword(GamePointerRoot() + 0xe4)
function TimeAttackDeleted() => dword(GamePointerRoot() + 0xec)

// $08ABEB0: [25-bit] Save Root
//           +0x001C [32-bit] 1st Rank Score
//           +0x0034 [32-bit] 2nd Rank Score
//           +0x004C [32-bit] 3rd Rank Score
//           +0x0064 [32-bit] 4th Rank Score
//           +0x007C [32-bit] 5th Rank Score
//           +0x0094 [32-bit] 6th Rank Score
//           +0x00AC [32-bit] 7th Rank Score
//           +0x00C4 [32-bit] 8th Rank Score
//           +0x00DC [32-bit] 9th Rank Score
//           +0x00F4 [32-bit] 10th Rank Score
//           +0x00F8 [6 bytes] Player name (ASCII)
//           +0x0102 [8-bit] Character Selected
//           +0x010C [32-bit] Total Time Played (frames)
//           +0x0128 [32-bit] Time Attack 60s Record
//           +0x0218 [32-bit] Time Attack 180s Record
//           +0x0308 [32-bit] Time Attack 300s Record
//           +0x03F8 [32-bit] Time Attack 600s Record
//           +0x06B4 [5 bytes] Skin Unlock Bitflags
//           +0x06D4 [7 bytes] Character Unlock Bitflags
//           +0x06F4 [7 bytes] Puzzle Unlock Bitflags (unlocked if bitcount is greater or equal to):
//           +0x9024 Selected Skin
//           +0x902C Selected Puzzle

// Select Pointer Chain
function SavePointer() => dword(0x8ABEB0) & 0x1ffffff
function SavePointerNull() => dword(0x8ABEB0) == 0

// Save Data Values
function Character() => byte(SavePointer() + 0x102)
function TotalTime() => dword(SavePointer() + 0x10C)
function Skin() => dword(SavePointer() + 0x9024)
function Puzzle() => dword(SavePointer() + 0x902C)

// -- Modes (uses pause to enable/disable achievements) ----------------------------------------------------------------

// Check that all the VS mode pointers are valid
function VsPointersValid()
{
    return unless(SavePointerNull()) &&
        unless(MenuPointerNull()) &&
        unless(MenuPointerChainNull()) &&
        unless(GamePointerNull()) &&
        unless(VsDividePointerNull()) &&
        unless(VsPointerChainNull()) &&
        unless(VsStatPointerNull()) &&
        unless(VsBoardPointerNull())
}

// Check that all the challenge mode pointers are valid
function ChallengePointersValid()
{
    return unless(SavePointerNull()) &&
        unless(MenuPointerNull()) &&
        unless(MenuPointerChainNull()) &&
        unless(GamePointerNull()) &&
        unless(ChallengePointerChainNull()) &&
        unless(ChallengeStatPointerNull()) &&
        unless(ChallengeBoardPointerNull())
}

// Check that all the puzzle and time attack modes pointers are valid
function PuzzlePointersValid()
{
    return unless(SavePointerNull()) &&
        unless(MenuPointerNull()) &&
        unless(MenuPointerChainNull()) &&
        unless(GamePointerNull()) &&
        unless(PuzzlePointerChainNull()) &&
        unless(PuzzleStatPointerNull()) &&
        unless(PuzzleBoardPointerNull())
}

// Game modes based on valid pointers and menu selections
function VsMode() => unless(MenuMode() != 2) && VsPointersValid()
function ChallengeMode() => unless(MenuMode() != 0) && unless(P1Mode() != 0) && ChallengePointersValid()
function SkinMode() => unless(MenuMode() != 0) && unless(P1Mode() != 1) && ChallengePointersValid()
function TimeAttack60Mode() => unless(MenuMode() != 0) && unless(P1Mode() != 2) && PuzzlePointersValid()
function TimeAttack180Mode() => unless(MenuMode() != 0) && unless(P1Mode() != 3) && PuzzlePointersValid()
function TimeAttack300Mode() => unless(MenuMode() != 0) && unless(P1Mode() != 4) && PuzzlePointersValid()
function TimeAttack600Mode() => unless(MenuMode() != 0) && unless(P1Mode() != 5) && PuzzlePointersValid()
function PuzzleMode() => unless(MenuMode() != 3) && PuzzlePointersValid()

// Check if the skin was unlocked
function UnlockSkin(skin)
{
    address = 0x06B4 + (skin / 8)
    maskedbit = skin & 7
    return prev(bit(maskedbit, SavePointer() + address)) < bit(maskedbit, SavePointer() + address)
}

// Check if the character was unlocked
function UnlockCharacter(character)
{
    address = 0x06D4 + (character / 8)
    maskedbit = character & 7
    return prev(bit(maskedbit, SavePointer() + address)) < bit(maskedbit, SavePointer() + address)
}

// Check if the puzzle was unlocked
function UnlockPuzzle(puzzle)
{
    address = 0x06F4 + (puzzle / 8)
    maskedbit = puzzle & 7
    return prev(bit(maskedbit, SavePointer() + address)) < bit(maskedbit, SavePointer() + address)
}

//-- Board Configurations ----------------------------------------------------------

// These board configurations are used to aid in finding the memory location of
// certain coordinates on the board and give guidance to what that board value
// should be.  It was use for setting up test configurations.
// 0 = ignored
// 1 = this square should be color 1
// 2 = this square should be color 2 (sometimes frozen to 0 to at as an eater)

Configs = [
    {
        "Name": "[Challenge] Boost",
        "Mode": "Challenge",
        "Board":[
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        ] 
    },
    {
        "Name": "[Vs] Half Block",
        "Mode": "Vs",
        "Board":[
            [0,0,0,0,0,0,0,0,2,1,2,1,2,1,2,2],
            [0,0,0,0,0,0,0,0,1,2,1,2,1,2,1,2],
            [0,0,0,0,0,0,0,0,2,1,2,1,2,1,2,1],
            [0,0,0,0,0,0,0,0,1,2,1,2,1,2,1,2],
            [0,0,0,0,0,0,0,0,2,1,2,1,2,1,2,1],
            [0,0,0,0,0,0,0,0,1,2,1,2,1,2,1,2],
            [0,0,0,0,0,0,0,0,2,1,2,1,2,1,2,1],
            [0,0,0,0,0,0,0,0,1,2,1,2,1,2,1,2],
            [0,0,0,0,0,0,0,0,2,1,2,1,2,1,2,1],
            [0,0,0,0,0,0,0,0,1,2,1,2,1,2,1,2]
        ] 
    },
    {
        "Name": "[Vs] Quater Block",
        "Mode": "Vs",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,1],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,1],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,1],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,1],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,2]
        ]
    },
    {
        "Name": "[Time Attack 60s] Boost",
        "Mode": "TimeAttack60",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        ]
    },
    {
        "Name": "[Time Attack 180s] Boost",
        "Mode": "TimeAttack180",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        ]
    },
    {
        "Name": "[Time Attack 300s] Boost",
        "Mode": "TimeAttack300",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        ]
    },
    {
        "Name": "[Time Attack 600s] Boost",
        "Mode": "TimeAttack600",
        "Board": [            
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        ]
    },
    {
        "Name": "[Puzzle] Blank",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Small Cross Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Small Square Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Small Checker Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Dog Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] A Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Giraffe Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Alligator Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0],
            [0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0],
            [0,0,0,0,2,2,1,2,1,2,2,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] 4x4 Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Smile Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,2,2,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Horse Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Up Arrow Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,1,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Left Arrow Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Right Arrow Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Down Arrow Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,1,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Infinity Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,1,1,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Clear All Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Big Square Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Big G Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] UFO Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,1,2,1,2,1,2,1,0,0,0,0,0],
            [0,0,0,0,2,1,2,1,2,1,2,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Human Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Snake Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,0,1,2,0,0,0,0],
            [0,0,0,0,0,0,1,2,1,0,1,2,0,0,0,0],
            [0,0,0,0,0,1,1,2,1,1,1,2,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Big Checker Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,1,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Big Cross Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,2,1,2,2,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0]
        ]
    },
    {
        "Name": "[Puzzle] Delete 20 Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1],
            [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
        ]
    },
    {
        "Name": "[Puzzle] Zero Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0]
        ]
    },
    
    {
        "Name": "[Puzzle] One Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0]
        ]
    },
    
    {
        "Name": "[Puzzle] Two Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,2,2,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0]
        ]
    },
    
    {
        "Name": "[Puzzle] Three Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0]
        ]
    },
    {
        "Name": "[Puzzle] Big O Solved",
        "Mode": "Puzzle",
        "Board": [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0]
        ]
    }
]

//-- Dictionaries -----------------------------------------------------------------------------------

VsScore = {
    0x0: "-8",
    0x1: "-7",
    0x2: "-6",
    0x3: "-5",
    0x4: "-4",
    0x5: "-3",
    0x6: "-2",
    0x7: "-1",
    0x8: "Neutral",
    0x9: "+1",
    0xa: "+2",
    0xb: "+3",
    0xc: "+4",
    0xd: "+5",
    0xe: "+6",
    0xf: "+7",
    0x10: "+8"
}

Characters = {
    0x01: "Boy",
    0x02: "Giant",
    0x03: "Zor",
    0x04: "Heby",
    0x05: "Rascal",
    0x06: "Flint",
    0x07: "Kuma",
    0x08: "Orbo",
    0x09: "Square",
    0x0a: "Futuo",
    0x0b: "Car",
    0x0c: "Piglet",
    0x0d: "Cell",
    0x0e: "Sleeves",
    0x0f: "Kii",
    0x10: "Mitsu",
    0x11: "Beak",
    0x12: "Miz",
    0x13: "Train",
    0x14: "Neko",
    0x15: "Dog",
    0x16: "Pigmo",
    0x17: "Heart",
    0x18: "Nigiri",
    0x19: "Kuchi",
    0x1a: "Wool",
    0x1b: "Ushi",
    0x1c: "Futako",
    0x1d: "Crab",
    0x1e: "Leo",
    0x1f: "Sawko",
    0x20: "Scale",
    0x21: "Scorpion",
    0x22: "Bow",
    0x23: "Yagi",
    0x24: "Aquarius",
    0x25: "Sakana",
    0x26: "Nay",
    0x27: "Kabuki",
    0x28: "Diskman",
    0x29: "Adam",
    0x2a: "Cheese",
    0x2b: "Demon King",
    0x2c: "Wayang",
    0x2d: "Gunman",
    0x2e: "Clown",
    0x2f: "Warrior",
    0x30: "Starman"
}

VsOpponents = {
    0x0: "Kabuki",
    0x1: "Diskman",
    0x2: "Adam",
    0x3: "Cheese",
    0x4: "Demon King",
    0x5: "Wayang",
    0x6: "Gunman",
    0x7: "Clown",
    0x8: "Warrior",
    0x9: "Starman"
}

Skins = {
    0x00: "Shinin'",
    0x01: "Urbanization",
    0x02: "Round About",
    0x03: "Slipping",
    0x04: "Shake ya Body",
    0x05: "Square Dance",
    0x06: "Talk 2 You",
    0x07: "Just...",
    0x08: "I Hear the Music in my Soul",
    0x09: "Dark Side Beside the River",
    0x0a: "Aback",
    0x0b: "Working in the Hole",
    0x0c: "Sister Walk",
    0x0d: "Da-Di-Do",
    0x0e: "Strangers",
    0x0f: "Holiday In Summer",
    0x10: "Take a Dog Out a Walk",
    0x11: "Big Elpaso",
    0x12: "My Generation",
    0x13: "Meguro",
    0x14: "Spirits",
    0x15: "Get up and Go",
    0x16: "Fly Into the Sky",
    0x17: "Lights",
    0x18: "Japanese Form",
    0x19: "Auto Mobile Industry",
    0x1a: "Please Return my CD",
    0x1b: "Bird Singing in the Night",
    0x1c: "Mekong",
    0x1d: "Whoop-De-Do",
    0x1e: "The Spy Loves Me",
    0x1f: "Brash",
    0x20: "Chinese Restaurant",
    0x21: "Moon Beam",
    0x22: "Degrees",
    0x23: "Accent",
    0x24: "Morning Beats",
    0x25: "Water Flower & Lights",
    0x26: "Tin Toy",
    0x27: "Prime factor"
}

Puzzles = {
    0x00: "Small Cross",
    0x01: "Small Square",
    0x02: "Small Checker",
    0x03: "Dog",
    0x04: "A",
    0x05: "Giraffe",
    0x06: "Alligator",
    0x07: "Create 4x4",
    0x08: "Smile",
    0x09: "Horse",
    0x0a: "Arrow Up",
    0x0b: "Arrow Left",
    0x0c: "Arrow Right",
    0x0d: "Arrow Down",
    0x0e: "Inifinty",
    0x0f: "Clear All",
    0x10: "Big Square",
    0x11: "Big G",
    0x12: "UFO",
    0x13: "Human",
    0x14: "Snake",
    0x15: "Big Checker",
    0x16: "Big Cross",
    0x17: "Delete Over 20 Blocks",
    0x18: "Zero to Three",
    0x19: "Large 0",
    0x1a: "Small Cross x2",
    0x1b: "Small Square x2",
    0x1c: "Small Checker x2",
    0x1d: "Dog x2",
    0x1e: "A x2",
    0x1f: "Giraffe x2",
    0x20: "Alligator x2",
    0x21: "Create 4x4 x2",
    0x22: "Smile x2",
    0x23: "Horse x2",
    0x24: "Arrow Up x2",
    0x25: "Arrow Left x2",
    0x26: "Arrow Right x2",
    0x27: "Arrow Down x2",
    0x28: "Infinity x2",
    0x29: "Clear All x2",
    0x2a: "Big Square x2",
    0x2b: "Big G x2",
    0x2c: "UFO x2",
    0x2d: "Human x2",
    0x2e: "Snake x2",
    0x2f: "Big Checker x2",
    0x30: "Big Cross x2",
    0x31: "Delete Over 20 Blocks x2",
    0x32: "Zero to Three x2",
    0x33: "Large O x2"
}

// -- Test Achievements Unlocks ---------------------------------------------------------

// Check if a skin unlocks during any mode
for id in Skins
{

    vsCheck = VsPointersValid() && UnlockSkin(id)       
    challengeCheck = ChallengePointersValid() && UnlockSkin(id)
    puzzleCheck = PuzzlePointersValid() && UnlockSkin(id)

    skin = Skins[id]
    text = "[Test] " + skin + " skin unlock"
    achievement(text, text, 0, vsCheck || challengeCheck || puzzleCheck)
}

// Check if a character unlocks during any mode
for id in Characters
{
    vsCheck = VsPointersValid() && UnlockCharacter(id)       
    challengeCheck = ChallengePointersValid() && UnlockCharacter(id)
    puzzleCheck = PuzzlePointersValid() && UnlockCharacter(id)

    character = Characters[id]
    text = "[Test] " + character + " character unlock"
    achievement(text, text, 0, vsCheck || challengeCheck || puzzleCheck)
}


// Check if a character unlocks during any mode
for id in Puzzles
{
    vsCheck = VsPointersValid() && UnlockPuzzle(id)       
    challengeCheck = ChallengePointersValid() && UnlockPuzzle(id)
    puzzleCheck = PuzzlePointersValid() && UnlockPuzzle(id)

    puzzle = Puzzles[id]
    text = "[Test] " + puzzle + " puzzle unlock"
    achievement(text, text, 0, vsCheck || challengeCheck || puzzleCheck)
}


for config in Configs
{
    name = config["Name"]
    mode = config["Mode"]
    board = config["Board"]
    
    y = 0
    cells = []    
    for row in board
    {
        x = 0
        for col in row
        {
            if (mode == "Challenge")
            {
                if (col == 1) array_push(cells, ChallengeBoardDW(x, y)==1)
                if (col == 2) array_push(cells, ChallengeBoardDW(x, y)==2)
            }
            else if (mode == "Vs")
            {
                if (col == 1) array_push(cells, VsBoardDW(x, y)==1)
                if (col == 2) array_push(cells, VsBoardDW(x, y)==2)
            }
            else
            {
                if (col == 1) array_push(cells, PuzzleBoardDW(x, y)==1)
                if (col == 2) array_push(cells, PuzzleBoardDW(x, y)==2)
            }
            x = x + 1
        }
        y = y + 1
    }
    
    start = always_false()
    if (mode=="Challenge") start = ChallengeMode()
    if (mode=="Vs") start = VsMode()
    if (mode=="TimeAttack60") start = TimeAttack60Mode()
    if (mode=="TimeAttack180") start = TimeAttack180Mode()
    if (mode=="TimeAttack300") start = TimeAttack300Mode()
    if (mode=="TimeAttack600") start = TimeAttack600Mode()
    if (mode=="Puzzle") start = PuzzleMode()
    
    achievement(name, name, 0, start && all_of(cells, a=>a))
}