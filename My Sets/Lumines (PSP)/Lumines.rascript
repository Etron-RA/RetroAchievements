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
//          +++0x010 [25-bit] Result Menu Pointer
//          ++++0x194 [32-bit] Vs CPU Result (5 = won, 6 = loss, 7 = beat all CPUs)
//          +++0x044 [32-bit] Vs CPU State (3=>4 = Start VS, 4 = Playing, 5 to 7 => End VS)
//          +++0x060 [25-bit] Vs CPU Pointer Chain
//          ++++0x060 [25-bit] Vs CPU Divide Pointer
//          +++++0x020 [32-bit] Vs Divide (how many squares from left, 8 is middle)
//          ++++0x068 [25-bit] Vs CPU Stats Pointer
//          +++++0x000 [32-bit] Level
//          +++++0x004 [32-bit] Time (in frame)
//          +++++0x008 [32-bit] Current Score
//          +++++0x00C [32-bit] High Score
//          +++++0x010 [32-bit] Total Combo
//          +++++0x014 [32-bit] Deleted Blocks
//          +++++0x020 [32-bit] Blocks removed this measure
//          +++++0x024 [32-bit] Blocks removed last measure
//          +++++0x028 [32-bit] Multipier
//          +++++0x02c [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x044 [32-bit] Player 1 Combo
//          +++++0x048 [32-bit] Player 2 Combo
//          +++++0x1c0 [32-bit] Number of color 1 on board
//          +++++0x1c4 [32-bit] Number of color 2 on board
//          ++++0x0A8 [32-bit] Vs CPU Round Number
//          +++0x0C8 [25-bit] Challenge Pointer Chain
//          ++++0x02C [25-bit] Challenge Board Pointer Chain
//          +++++0x000 [25-bit] Challenge Board Pointer (see board pointer note below)
//          ++++0x034 [25-bit] Challenge Stats Pointer
//          +++++0x000 [32-bit] Level
//          +++++0x004 [32-bit] Time (in frame)
//          +++++0x008 [32-bit] Current Score
//          +++++0x00C [32-bit] High Score
//          +++++0x010 [32-bit] Total Combo
//          +++++0x014 [32-bit] Deleted Blocks
//          +++++0x020 [32-bit] Blocks removed this measure
//          +++++0x024 [32-bit] Blocks removed last measure
//          +++++0x028 [32-bit] Multipier
//          +++++0x02c [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x1c0 [32-bit] Number of color 1 on board
//          +++++0x1c4 [32-bit] Number of color 2 on board
//          +++0x0CC [25-bit] Puzzle Pointer Chain
//          ++++0x02C [25-bit] Puzzle Board Pointer Chain
//          +++++0x000 [25-bit] Puzzle Board Pointer (see board pointer note below)
//          ++++0x034 [25-bit] Puzzle Stats Pointer
//          +++++0x000 [32-bit] Level
//          +++++0x004 [32-bit] Time (in frame)
//          +++++0x008 [32-bit] Current Score
//          +++++0x00C [32-bit] High Score
//          +++++0x010 [32-bit] Total Combo
//          +++++0x014 [32-bit] Deleted Blocks
//          +++++0x020 [32-bit] Blocks removed this measure
//          +++++0x024 [32-bit] Blocks removed last measure
//          +++++0x028 [32-bit] Multipier
//          +++++0x02c [32-bit] Empty Spaces (0xa0 = empty)
//          +++++0x1c0 [32-bit] Number of color 1 on board
//          +++++0x1c4 [32-bit] Number of color 2 on board
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

// VS divider chain
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

// VS Board result menu
function VsResultMenu() => dword(GamePointerRoot() + 0x10) & 0x1ffffff
function VsResultMenuNull() => dword(GamePointerRoot() + 0x10) == 0

// VS  values
function VsState() => dword(GamePointerRoot() + 0x44)
function VsResult() => dword(VsResultMenu() + 0x194)
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
function VsComboP1() => dword(VsStatPointer() + 0x44)
function VsComboP2() => dword(VsStatPointer() + 0x48)
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
        unless(VsStatPointerNull()) 
}

// Check that all the challenge mode pointers are valid
function ChallengePointersValid()
{
    return unless(SavePointerNull()) &&
        unless(MenuPointerNull()) &&
        unless(MenuPointerChainNull()) &&
        unless(GamePointerNull()) &&
        unless(ChallengePointerChainNull()) &&
        unless(ChallengeStatPointerNull()) 
}

// Check that all the puzzle and time attack modes pointers are valid
function PuzzlePointersValid()
{
    return unless(SavePointerNull()) &&
        unless(MenuPointerNull()) &&
        unless(MenuPointerChainNull()) &&
        unless(GamePointerNull()) &&
        unless(PuzzlePointerChainNull()) &&
        unless(PuzzleStatPointerNull())
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

//-- Events -------------------------------------------------------------------

// Vs CPU mode events
function VsAnyStart() => prev(VsState()) == 0x3 && VsState() == 0x4
function VsStart(round) => VsRound() == round && VsAnyStart()
function VsPlaying() => VsState() == 0x4
function VsAnyLost() => VsState() >= 0x5 && VsState() <= 0x7 && !VsResultMenuNull() && VsResult() == 6
function VsLost(round) => VsRound() == round && VsAnyLost()
function VsAnyWon() => VsState() >= 0x5 && VsState() <= 0x7 && !VsResultMenuNull() && __ornext(VsResult() == 5 || VsResult() == 7)  
function VsWon(round) => VsRound() == round && VsAnyWon()
function VsQuit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Challenge mode events
function ChallengeStart() => prev(ChallengeTime()) <= 0x5 && ChallengeTime() > 0x5
function ChallengePlaying() => ChallengeState() == 0x1
function ChallengeEnd() => prev(ChallengeState()) == 0x1 && ChallengeState() == 0x2
function ChallengeQuit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Single skin mode events
function SkinStart(skin) => Skin() == skin && prev(ChallengeTime()) <= 0x5 && ChallengeTime() > 0x5
function SkinPlaying() => SkinState() == 0x1
function SkinEnd(skin) => Skin() == skin && prev(SkinState()) == 0x1 && SkinState() == 0x2
function SkinQuit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Time attack 60s mode events
function TimeAttack60Start() => prev(TimeAttackState()) == 0x4 && TimeAttackState() == 0x5
function TimeAttack60Playing() => TimeAttackState() == 0x5
function TimeAttack60Fail() => TimeAttackCountdown() > 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack60Pass() => TimeAttackCountdown() == 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack60Quit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Time attack 180s mode events
function TimeAttack180Start() => prev(TimeAttackState()) == 0x4 && TimeAttackState() == 0x5
function TimeAttack180Playing() => TimeAttackState() == 0x5
function TimeAttack180Fail() => TimeAttackCountdown() > 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack180Pass() => TimeAttackCountdown() == 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack180Quit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Time attack 300s mode events
function TimeAttack300Start() => prev(TimeAttackState()) == 0x4 && TimeAttackState() == 0x5
function TimeAttack300Playing() => TimeAttackState() == 0x5
function TimeAttack300Fail() => TimeAttackCountdown() > 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack300Pass() => TimeAttackCountdown() == 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack300Quit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Time attack 600s mode events
function TimeAttack600Start() => prev(TimeAttackState()) == 0x4 && TimeAttackState() == 0x5
function TimeAttack600Playing() => TimeAttackState() == 0x5
function TimeAttack600Fail() => TimeAttackCountdown() > 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack600Pass() => TimeAttackCountdown() == 0 && prev(TimeAttackState()) == 0x5 && TimeAttackState() == 0x6
function TimeAttack600Quit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// Puzzle mode events
function PuzzleStart(puzzle) => Puzzle() == puzzle && prev(PuzzleState()) == 0x4 && PuzzleState() == 0x5
function PuzzlePlaying() => PuzzleState() == 0x5
function PuzzleFail(puzzle) => Puzzle() == puzzle && PuzzlesLeft() > 0 && prev(PuzzleState()) == 0x5 && PuzzleState() == 0x6
function PuzzlePass(puzzle) => Puzzle() == puzzle && PuzzlesLeft() == 0 && prev(PuzzleState()) == 0x5 && PuzzleState() == 0x6
function PuzzleQuit() => prev(MenuExit()) == 0x0 && MenuExit() == 0x1

// -- Helper Functions ----------------------------------------------------------------------------

// Convert a time span into frames
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Count the total number of skins for RP
function CountSkins() => sum_of(range(0x06B4, 0x06B8), i => bitcount(SavePointer() + i))

// Count the total number of characters for RP
function CountCharacters() {
    return  sum_of(range(0x06D4, 0x06D9), i => bitcount(SavePointer() + i)) + 
        bit0(SavePointer() + 0x06D9) 
        - 1
}

// Count the total number of puzzles for RP
function CountPuzzles() {
    return sum_of(range(0x06F4, 0x06F9), i => bitcount(SavePointer() + i)) 
        + bit0(SavePointer() + 0x06F9)
        + bit1(SavePointer() + 0x06F9) 
        + bit2(SavePointer() + 0x06F9)
        + bit3(SavePointer() + 0x06F9)
}

// Check if the player has completed a certain level in challenge mode
function CompleteLevel(level)
{
    // Enable only during challenge mode
    enable = ChallengeMode()
    
    // Measure the current level
    measure = prev(ChallengeLevel()) == level &&
        measured(ChallengeLevel() == level + 1, ChallengePlaying())
    
    return enable && measure        
}

// Check if the player has obtained a certain score in challenge mode
function ObtainScore(score)
{
    // Enable only during challenge mode
    enable = ChallengeMode()
    
    // Measure the current score
    measure = prev(ChallengeCurrentScore()) < score &&
        measured(ChallengeCurrentScore() >= score, ChallengePlaying())
    
    return enable && measure        
}

// Complete a certain number of levels staying lower than a certain height in Challenge mode
function NoHighBlocks(height, level)
{
    // Make an array for checking blocks at a certain height
    count = []
    for x in range (0,15)
    {            
        array_push(count, ChallengeBoardC1(x, height))
        array_push(count, ChallengeBoardC2(x, height))
    }
    
    // Enable only during challenge mode (and if the board pointer is valid)
    enable = ChallengeMode() && unless(ChallengeBoardPointerNull())
    
    // Start at the beginning of challenge mode
    start = once(ChallengeStart())
  
    // Cancel at the end of challenge mode or if a block detected a certain height
    cancel = never(ChallengeEnd()) &&
        never(ChallengeQuit()) &&
        never(ChallengePlaying() && sum_of(count, c => c) > 0)
    
    // Submit when complete a certain level
    submit = trigger_when(
            prev(ChallengeLevel()) == level &&
            ChallengeLevel() == level + 1
        )
    
    return enable && start && cancel && submit
}

// Complete a certain number of levels staying in the middle of the measure in Challenge mode
function MiddleOnlyBlocks(level)
{
    // Make an array for checking blocks on the 4 outside bottom blocks
    count = []
    for x in range (0,3)
    {            
        array_push(count, ChallengeBoardC1(x, 9))
        array_push(count, ChallengeBoardC1(x + 12, 9))
        array_push(count, ChallengeBoardC2(x, 9))
        array_push(count, ChallengeBoardC2(x + 12, 9))
    }
    
    // Enable only during challenge mode (and if the board pointer is valid)
    enable = ChallengeMode() && unless(ChallengeBoardPointerNull())

    // Start at the beginning of challenge mode
    start = once(ChallengeStart())
      
    // Cancel at the end of challenge mode or if a block on outside bottom blocks
    cancel = never(ChallengeEnd()) &&
        never(ChallengeQuit()) &&
        never(ChallengePlaying() && sum_of(count, c => c) > 0)
        
    // Submit when complete a certain level
    submit = trigger_when(
            prev(ChallengeLevel()) == level &&
            ChallengeLevel() == level + 1
        )
        
    return enable && start && cancel && submit
}

// Complete get all of the bottom block the same color
function SameColorBlocks()
{
    // Make two arrays for checking blocks on the bottom blocks for each color
    countC1 = []
    countC2 = []
    for x in range (0,15)
    {            
        array_push(countC1, ChallengeBoardC1(x, 9))
        array_push(countC2, ChallengeBoardC2(x, 9))
    }
    
    // Enable only during challenge mode (and if the board pointer is valid)
    enable = ChallengeMode() && unless(ChallengeBoardPointerNull())
    
    // Start at the beginning of challenge mode
    start = once(ChallengeStart())
      
    // Cancel at the end of challenge mode or if a block on outside bottom blocks
    cancel = never(ChallengeEnd()) && 
        never(ChallengeQuit())
        
    // Submit when bottom of the measure is all the same color
    submit = trigger_when(
            (sum_of(countC1, c => prev(c)) < 16 && sum_of(countC1, c => c) == 16) ||
            (sum_of(countC2, c => prev(c)) < 16 && sum_of(countC2, c => c) == 16)
        )
    
    return enable && start && cancel && submit
}

// Deleted count challenge for time attack 60s
function TimeAttack60Challenge(cleared)
{
    // Enable only during time attack 60s mode
    enable = TimeAttack60Mode()
    
    // Start at the beginning of time attack mode
    start = once(TimeAttack60Playing() &&
        prev(TimeAttackDeleted()) < cleared &&
        TimeAttackDeleted() >= cleared)
  
    // Cancel at the end of time attack mode
    cancel = never(TimeAttack60Fail()) &&
        never(TimeAttack60Quit())    
    
    // Trigger when we pass the time attack
    trigger = trigger_when(TimeAttack60Pass())
        
    return enable && start && cancel && trigger
}

// Deleted count challenge for time attack 180s
function TimeAttack180Challenge(cleared)
{
    
    // Enable only during time attack 180s mode
    enable = TimeAttack180Mode()
    
    // Start at the beginning of time attack mode
    start = once(TimeAttack180Playing() &&
        prev(TimeAttackDeleted()) < cleared &&
        TimeAttackDeleted() >= cleared)
        
    // Cancel at the end of time attack mode
    cancel = never(TimeAttack180Fail()) &&
        never(TimeAttack180Quit())    
    
    // Trigger when we pass the time attack
    trigger = trigger_when(TimeAttack180Pass())
        
    return enable && start && cancel && trigger
}

// Deleted count challenge for time attack 300s
function TimeAttack300Challenge(cleared)
{
    // Enable only during time attack 300s mode
    enable = TimeAttack300Mode()
    
    // Start after getting the cleared number of squares
    start = once(TimeAttack300Playing() &&
        prev(TimeAttackDeleted()) < cleared &&
        TimeAttackDeleted() >= cleared)
  
    // Cancel at the end of time attack mode
    cancel = never(TimeAttack300Fail()) &&
        never(TimeAttack300Quit())    
    
    // Trigger when we pass the time attack
    trigger = trigger_when(TimeAttack300Pass())
        
    return enable && start && cancel && trigger
}

// Deleted count challenge for time attack 600s
function TimeAttack600Challenge(cleared)
{
    // Enable only during time attack 600s mode
    enable = TimeAttack600Mode()
    
     // Start at the beginning of time attack mode
    start = once(TimeAttack600Playing() &&
        prev(TimeAttackDeleted()) < cleared &&
        TimeAttackDeleted() >= cleared)
  
    // Cancel at the end of time attack mode
    cancel = never(TimeAttack600Fail()) &&
        never(TimeAttack600Quit())    
    
    // Trigger when we exceed the goal number of blocks
    trigger = trigger_when(TimeAttack600Pass())
        
    return enable && start && cancel && trigger
}

// Challenge to beat a certain CPU in VS mode
function VsChallenge(id)
{
    cpu = id - 1
    
    // Enable only during VS CPU mode
    enable = VsMode()
    
    // Start at the beginning of VS CPU mode
    start = once(VsStart(cpu))
      
    // Cancel at the end of VS CPU mode or if time has expired
    cancel = never(VsLost(cpu)) && 
        never(VsQuit())
        
    // Submit when complete a certain CPU
    submit = trigger_when(VsWon(cpu))
    
    return enable && start && cancel && submit
}

// Complete a VS CPU challenge staying under a certain time limit
function FastChallenge(frames)
{
    // Enable only during challenge mode
    enable = VsMode()
    
    // Start at the beginning of challenge mode
    start = once(VsAnyStart())
      
    // Cancel at the end of challenge mode or if time has expired
    cancel = never(VsAnyLost()) &&
        never(VsQuit()) &&
        never(VsTime() > frames)
        
    // Submit when complete a certain level
    submit = trigger_when(VsAnyWon())
        
    return enable && start && cancel && submit
}


// Complete a VS CPU challenge after losing for a bit
function DividerChallenge(divider)
{
    // Enable only during challenge mode
    enable = VsMode()
    
    // Start at the beginning of challenge mode
    start = once(VsPlaying() && VsDivide() <= divider)
      
    // Cancel at the end of challenge mode or if time has expired
    cancel = never(VsAnyLost()) &&
        never(VsQuit())
        
    // Submit when complete a certain level
    submit = trigger_when(VsAnyWon())
        
    return enable && start && cancel && submit
}

// Challenge to solve a certain puzzle
function PuzzleChallenge(id)
{
    puzzle = id - 1

    // Enable only during VS CPU mode
    enable = PuzzleMode()
    
    // Start at the beginning of puzzle mode
    start = once(PuzzleStart(puzzle))
      
    // Cancel at the end of challenge mode or if time has expired
    cancel = never(PuzzleFail(puzzle)) && 
        never(PuzzleQuit())
        
    // Submit when complete a certain puzzle
    submit = trigger_when(PuzzlePass(puzzle))
    
    return enable && start && cancel && submit
}

// Challenge to get a certain bonus level in any mode
function BonusChallenge(bonus)
{
    menuSelection = MenuMode() < 3

    // Check for vs mode
    vsCheck = VsPointersValid() &&
        VsPlaying() &&
        prev(VsComboP1()) < bonus &&
        VsComboP1() >= bonus
     
     // Check for challenge mode
    challengeCheck = ChallengePointersValid() &&
        ChallengePlaying() &&
        prev(ChallengeMultiplier()) < bonus &&
        ChallengeMultiplier() >= bonus        
    
     // Check for skin mode
    skinCheck = ChallengePointersValid() &&
        SkinPlaying() &&
        prev(ChallengeMultiplier()) < bonus &&
        ChallengeMultiplier() >= bonus
        
    return menuSelection && (vsCheck || challengeCheck || skinCheck)
}

//-- Achievements ----------------------------------------------------------

// Level based challenges
achievement("Urbanization","Complete level 3 in Challenge mode", 5, CompleteLevel(3))
achievement("Round About","Complete level 7 in Challenge mode", 5, CompleteLevel(7))
achievement("Slipping","Complete level 11 in Challenge mode", 5, CompleteLevel(11))
achievement("Shake Ya Body","Complete level 15 in Challenge mode", 5, CompleteLevel(15))
achievement("Square Dance","Complete level 19 in Challenge mode", 5, CompleteLevel(19))
achievement("Talk 2 You","Complete level 23 in Challenge mode", 5, CompleteLevel(23))
achievement("Just...","Complete level 27 in Challenge mode", 5, CompleteLevel(27))
achievement("I Hear the Music in My Soul","Complete level 31 in Challenge mode", 5, CompleteLevel(31))
achievement("Darkside Beside the River","Complete level 35 in Challenge mode", 5, CompleteLevel(35))
achievement("Aback","Complete level 39 in Challenge mode", 5, CompleteLevel(39))
achievement("Working in the Hole","Complete level 43 in Challenge mode", 5, CompleteLevel(43))
achievement("Sister Walk","Complete level 47 in Challenge mode", 5, CompleteLevel(47))
achievement("Da-Di-Do","Complete level 51 in Challenge mode", 5, CompleteLevel(51))
achievement("Strangers","Complete level 55 in Challenge mode", 5, CompleteLevel(55))
achievement("Holiday in Summer","Complete level 59 in Challenge mode", 10, CompleteLevel(59))
achievement("Take a Dog Out a Walk","Complete level 64 in Challenge mode", 10, CompleteLevel(64))
achievement("Big Elpaso","Complete level 69 in Challenge mode", 10, CompleteLevel(69))
achievement("My Generation","Complete level 74 in Challenge mode", 10, CompleteLevel(74))
achievement("Meguro","Complete level 79 in Challenge mode", 10, CompleteLevel(79))
achievement("Spirits","Complete level 84 in Challenge mode", 10, CompleteLevel(84))
achievement("Get Up and Go","Complete level 89 in Challenge mode", 10, CompleteLevel(89))
achievement("Fly Into the Sky","Complete level 94 in Challenge mode", 25, CompleteLevel(94))
achievement("Lights","Complete level 99 in Challenge mode", 50, CompleteLevel(99))

// Score based challenges
achievement("Score Sensation ","Score 100,000 in Challenge mode", 5, ObtainScore(100000))
achievement("Points Powerhouse","Score 250,000 in Challenge mode", 10, ObtainScore(250000))
achievement("High Score Highness","Score 500,000 in Challenge mode", 25, ObtainScore(500000))
achievement("Luminary Legacy","Score 750,000 in Challenge mode", 50, ObtainScore(750000))
achievement("Water, Flower & Lights","Score 999,999 in Challenge mode", 100, ObtainScore(999999))

// Board area limits
achievement("Scared of Heights","Complete levels 0 through 5 staying lower than 6 blocks high in Challenge mode", 5, NoHighBlocks(3, 5))
achievement("Middle of the Road","Complete levels 0 through 5 placing using only in the middle 8 blocks of the measure in Challenge mode", 5, MiddleOnlyBlocks(5))
achievement("Laying the Groundwork","Have the bottom row of blocks all the same color in Challenge mode", 5, SameColorBlocks())

// Time attack 60s
achievement("Square Speedster ","Complete Time Attack 60s mode with 30 or more deleted squares", 2, TimeAttack60Challenge(30))
achievement("Turbo Time Tackler","Complete Time Attack 60s mode with 40 or more deleted squares", 3, TimeAttack60Challenge(40))
achievement("Ponta","Complete Time Attack 60s mode with 50 or more deleted squares", 5, TimeAttack60Challenge(50))

// Time attack 180s
achievement("Clockwork Cubic Conqueror","Complete Time Attack 180s mode with 90 or more deleted squares", 5, TimeAttack180Challenge(90))
achievement("Time Trial Titan","Complete Time Attack 180s mode with 120 or more deleted squares", 5, TimeAttack180Challenge(120))
achievement("Heart","Complete Time Attack 180s mode with 150 or more deleted squares", 10, TimeAttack180Challenge(150))

// Time attack 300s
achievement("Rapid Rectangular Raider","Complete Time Attack 300s mode with 150 or more deleted squares", 10, TimeAttack300Challenge(150))
achievement("Temporal Timekeeper","Complete Time Attack 300s mode with 200 or more deleted squares", 10, TimeAttack300Challenge(200))
achievement("Nigiri","Complete Time Attack 300s mode with 250 or more deleted squares", 25, TimeAttack300Challenge(250))

// Time attack 600s
achievement("Deletion Dynamo","Complete Time Attack 600s mode with 300 or more deleted squares", 10, TimeAttack600Challenge(300))
achievement("Block Blitz Boss","Complete Time Attack 600s mode with 400 or more deleted squares", 25, TimeAttack600Challenge(400))
achievement("Kuchi","Complete Time Attack 600s mode with 500 or more deleted squares", 50, TimeAttack600Challenge(500))

// VS CPU Challenge
achievement("Japanese Form","Complete round 1 in VS CPU mode", 5, VsChallenge(1))
achievement("Auto Mobile Industry","Complete round 2 in VS CPU mode", 5, VsChallenge(2))
achievement("Please Return My CD","Complete round 3 in VS CPU mode", 5, VsChallenge(3))
achievement("The Bird Singing in the Night","Complete round 4 in VS CPU mode", 5, VsChallenge(4))
achievement("Mekong","Complete round 5 in VS CPU mode", 5, VsChallenge(5))
achievement("Whoop-De-Do","Complete round 6 in VS CPU mode", 10, VsChallenge(6))
achievement("The Spy Loves Me","Complete round 7 in VS CPU mode", 10, VsChallenge(7))
achievement("Brash","Complete round 8 in VS CPU mode", 10, VsChallenge(8))
achievement("Chinese Restaurant","Complete round 9 in VS CPU mode", 25, VsChallenge(9))
achievement("Moon Beam","Complete round 10 in VS CPU mode", 50, VsChallenge(10))

// VS Dev Challenges
achievement("Speed of Light","Complete any round in less then 1:30 in VS CPU mode", 5, FastChallenge(TimeSpan(1,30,0)))
achievement("Don't Call it a Comeback","Complete any round in after the divider reduced your side to 5 or less squares in VS CPU mode", 5, DividerChallenge(0x5))

// Puzzle Challenge
achievement("Small Cross","Complete Small Cross in Puzzle mode", 1, PuzzleChallenge(1))
achievement("Small Square","Complete Small Square in Puzzle mode", 1, PuzzleChallenge(2))
achievement("Small Checker","Complete Small Checker in Puzzle mode", 1, PuzzleChallenge(3))
achievement("Dog","Complete Dog in Puzzle mode", 1, PuzzleChallenge(4))
achievement("A","Complete A in Puzzle mode", 1, PuzzleChallenge(5))
achievement("Giraffe","Complete Giraffe in Puzzle mode", 1, PuzzleChallenge(6))
achievement("Alligator","Complete Alligator in Puzzle mode", 1, PuzzleChallenge(7))
achievement("Create 4x4","Complete Create 4x4 in Puzzle mode", 1, PuzzleChallenge(8))
achievement("Smile","Complete Smile in Puzzle mode", 2, PuzzleChallenge(9))
achievement("Horse","Complete Horse in Puzzle mode", 2, PuzzleChallenge(10))
achievement("Arrow Up","Complete Arrow Up in Puzzle mode", 2, PuzzleChallenge(11))
achievement("Arrow Left","Complete Arrow Left in Puzzle mode", 2, PuzzleChallenge(12))
achievement("Arrow Right","Complete Arrow Right in Puzzle mode", 2, PuzzleChallenge(13))
achievement("Arrow Down","Complete Arrow Down in Puzzle mode", 2, PuzzleChallenge(14))
achievement("Inifinty","Complete Inifinty in Puzzle mode", 2, PuzzleChallenge(15))
achievement("Clear All","Complete Clear All in Puzzle mode", 2, PuzzleChallenge(16))
achievement("Big Square","Complete Big Square in Puzzle mode", 3, PuzzleChallenge(17))
achievement("Big G","Complete Big G in Puzzle mode", 3, PuzzleChallenge(18))
achievement("UFO","Complete UFO in Puzzle mode", 3, PuzzleChallenge(19))
achievement("Human","Complete Human in Puzzle mode", 3, PuzzleChallenge(20))
achievement("Snake","Complete Snake in Puzzle mode", 3, PuzzleChallenge(21))
achievement("Big Checker","Complete Big Checker in Puzzle mode", 3, PuzzleChallenge(22))
achievement("Big Cross","Complete Big Cross in Puzzle mode", 3, PuzzleChallenge(23))
achievement("Delete Over 20 Blocks","Complete Delete Over 20 Blocks in Puzzle mode", 4, PuzzleChallenge(24))
achievement("Zero to Three","Complete Zero to Three in Puzzle mode", 4, PuzzleChallenge(25))
achievement("Large 0","Complete Large 0 in Puzzle mode", 4, PuzzleChallenge(26))
achievement("Small Cross x2","Complete Small Cross x2 in Puzzle mode", 2, PuzzleChallenge(27))
achievement("Small Square x2","Complete Small Square x2 in Puzzle mode", 2, PuzzleChallenge(28))
achievement("Small Checker x2","Complete Small Checker x2 in Puzzle mode", 2, PuzzleChallenge(29))
achievement("Dog x2","Complete Dog x2 in Puzzle mode", 2, PuzzleChallenge(30))
achievement("A x2","Complete A x2 in Puzzle mode", 2, PuzzleChallenge(31))
achievement("Giraffe x2","Complete Giraffe x2 in Puzzle mode", 2, PuzzleChallenge(32))
achievement("Alligator x2","Complete Alligator x2 in Puzzle mode", 2, PuzzleChallenge(33))
achievement("Create 4x4 x2","Complete Create 4x4 x2 in Puzzle mode", 2, PuzzleChallenge(34))
achievement("Smile x2","Complete Smile x2 in Puzzle mode", 3, PuzzleChallenge(35))
achievement("Horse x2","Complete Horse x2 in Puzzle mode", 3, PuzzleChallenge(36))
achievement("Arrow Up x2","Complete Arrow Up x2 in Puzzle mode", 3, PuzzleChallenge(37))
achievement("Arrow Left x2","Complete Arrow Left x2 in Puzzle mode", 3, PuzzleChallenge(38))
achievement("Arrow Right x2","Complete Arrow Right x2 in Puzzle mode", 3, PuzzleChallenge(39))
achievement("Arrow Down x2","Complete Arrow Down x2 in Puzzle mode", 3, PuzzleChallenge(40))
achievement("Infinity x2","Complete Infinity x2 in Puzzle mode", 3, PuzzleChallenge(41))
achievement("Clear All x2","Complete Clear All x2 in Puzzle mode", 3, PuzzleChallenge(42))
achievement("Big Square x2","Complete Big Square x2 in Puzzle mode", 4, PuzzleChallenge(43))
achievement("Big G x2","Complete Big G x2 in Puzzle mode", 4, PuzzleChallenge(44))
achievement("UFO x2","Complete UFO x2 in Puzzle mode", 4, PuzzleChallenge(45))
achievement("Human x2","Complete Human x2 in Puzzle mode", 4, PuzzleChallenge(46))
achievement("Snake x2","Complete Snake x2 in Puzzle mode", 4, PuzzleChallenge(47))
achievement("Big Checker x2","Complete Big Checker x2 in Puzzle mode", 4, PuzzleChallenge(48))
achievement("Big Cross x2","Complete Big Cross x2 in Puzzle mode", 4, PuzzleChallenge(49))
achievement("Delete Over 20 Blocks x2","Complete Delete Over 20 Blocks x2 in Puzzle mode", 5, PuzzleChallenge(50))
achievement("Zero to Three x2","Complete Zero to Three x2 in Puzzle mode", 5, PuzzleChallenge(51))
achievement("Large O x2","Complete Large O x2 in Puzzle mode", 5, PuzzleChallenge(52))

// Bonus Challenges
achievement("Bonus Beginner","Get a x4 bonus in Challenge, Skin, or VS CPU mode", 5, BonusChallenge(4))
achievement("Bonus Blaze","Get a x7 bonus in Challenge, Skin, or VS CPU mode", 10, BonusChallenge(7))
achievement("Bonus Brilliance ","Get a x10 bonus in Challenge, Skin, or VS CPU mode", 25, BonusChallenge(10))

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

// -- RP Modes (no pauses) --------------------------------------------------------------

// Check that all the VS mode pointers are valid
function VsPointersValidRP()
{
    return !SavePointerNull() &&
        !MenuPointerNull() &&
        !MenuPointerChainNull() &&
        !GamePointerNull() &&
        !VsDividePointerNull() &&
        !VsPointerChainNull() &&
        !VsStatPointerNull() 
}

// Check that all the challenge mode pointers are valid
function ChallengePointersValidRP()
{
    return !SavePointerNull() &&
        !MenuPointerNull() &&
        !MenuPointerChainNull() &&
        !GamePointerNull() &&
        !ChallengePointerChainNull() &&
        !ChallengeStatPointerNull() 
}

// Check that all the puzzle mode pointers are valid
function PuzzlePointersValidRP()
{
    return !SavePointerNull() &&
        !MenuPointerNull() &&
        !MenuPointerChainNull() &&
        !GamePointerNull() &&
        !PuzzlePointerChainNull() &&
        !PuzzleStatPointerNull() 
}

// Vs CPU mode events
function VsModeRP() => MenuMode() == 2 && VsPointersValidRP()
function ChallengeModeRP() => MenuMode() == 0 && P1Mode() == 0 && ChallengePointersValidRP()
function SkinModeRP() => MenuMode() == 0 && P1Mode() == 1 && ChallengePointersValidRP()
function TimeAttack60ModeRP() => MenuMode() == 0 && P1Mode() == 2 && PuzzlePointersValidRP()
function TimeAttack180ModeRP() => MenuMode() == 0 && P1Mode() == 3 && PuzzlePointersValidRP()
function TimeAttack300ModeRP() => MenuMode() == 0 && P1Mode() == 4 && PuzzlePointersValidRP()
function TimeAttack600ModeRP() => MenuMode() == 0 && P1Mode() == 5 && PuzzlePointersValidRP()
function PuzzleModeRP() => MenuMode() == 3 && PuzzlePointersValidRP()

//-- Rich Presence --------------------------------------------------------------------

rich_presence_conditional_display(
    VsModeRP(), 
    "{0} Vs CPU {1} • Level: {2} • Time: {3} • Score: {4} • Deleted: {5} • Skins: {6}/40 • Charecters: {7}/48 • Puzzles: {8}/52 • Total Play Time: {9}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_lookup("VsOpponents", VsRound(), VsOpponents, "None"),
    rich_presence_value("Level", VsLevel()),
    rich_presence_value("Time", VsTime(), format="FRAMES"),
    rich_presence_lookup("VsDivide", VsDivide(), VsScore, "None"),
    rich_presence_value("Deleted", VsDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    ChallengeModeRP(), 
    "Character: {0} • Challenge • Level: {1} • Time: {2} • Score: {3} • Deleted: {4} • Skins: {5}/40 • Charecters: {6}/48 • Puzzles: {7}/52 • Total Play Time: {8}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("Level", ChallengeLevel()),
    rich_presence_value("Time", ChallengeTime(), format="FRAMES"),
    rich_presence_value("Score", ChallengeCurrentScore()),
    rich_presence_value("Deleted", ChallengeDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    SkinModeRP(), 
    "Character: {0} • Skin: {1} • Level: {2} • Time: {3} • Score: {4} • Deleted: {5} • Skins: {6}/40 • Charecters: {7}/48 • Puzzles: {8}/52 • Total Play Time: {9}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_lookup("Skins", Skin(), Skins, "None"),
    rich_presence_value("Level", ChallengeLevel()),
    rich_presence_value("Time", ChallengeTime(), format="FRAMES"),
    rich_presence_value("Score", ChallengeCurrentScore()),
    rich_presence_value("Deleted", ChallengeDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    TimeAttack60ModeRP(), 
    "Character: {0} • Time Attack 60s • Time: {1} • Deleted: {2} • Skins: {3}/40 • Charecters: {4}/48 • Puzzles: {5}/52 • Total Play Time: {6}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("Time", PuzzleTime(), format="FRAMES"),
    rich_presence_value("Deleted", TimeAttackDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    TimeAttack180ModeRP(), 
    "Character: {0} • Time Attack 180s • Time: {1} • Deleted: {2} • Skins: {3}/40 • Charecters: {4}/48 • Puzzles: {5}/52 • Total Play Time: {6}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("Time", PuzzleTime(), format="FRAMES"),
    rich_presence_value("Deleted", TimeAttackDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    TimeAttack300ModeRP(), 
    "Character: {0} • Time Attack 300s • Time: {1} • Deleted: {2} • Skins: {3}/40 • Charecters: {4}/48 • Puzzles: {5}/52 • Total Play Time: {6}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("Time", PuzzleTime(), format="FRAMES"),
    rich_presence_value("Deleted", TimeAttackDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    TimeAttack600ModeRP(), 
    "Character: {0} • Time Attack 600s • Time: {1} • Deleted: {2} • Skins: {3}/40 • Charecters: {4}/48 • Puzzles: {5}/52 • Total Play Time: {6}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("Time", PuzzleTime(), format="FRAMES"),
    rich_presence_value("Deleted", TimeAttackDeleted()),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_conditional_display(
    PuzzleModeRP(), 
    "Character: {0} • Puzzle: {1} • Time: {2} • Skins: {3}/40 • Charecters: {4}/48 • Puzzles: {5}/52 • Total Play Time: {6}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_lookup("Puzzles", Puzzle(), Puzzles, "None"),
    rich_presence_value("Time", PuzzleTime(), format="FRAMES"),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)
rich_presence_conditional_display(
    !SavePointerNull(),    
    "Character: {0} • Skins: {1}/40 • Charecters: {2}/48 • Puzzles: {3}/52 • Total Play Time: {4}",
    rich_presence_lookup("Characters", Character(), Characters, "None"),
    rich_presence_value("CountSkins", CountSkins(), format="VALUE"),
    rich_presence_value("CountCharacters", CountCharacters(), format="VALUE"),
    rich_presence_value("CountPuzzles", CountPuzzles(), format="VALUE"),
    rich_presence_value("TotalTime", TotalTime(), format="FRAMES")
)

rich_presence_display("Error: Incompatible pointers!")

// -- Leaderboards ---------------------------------------------------------------------

// LB for highest score in challenge mode
leaderboard(
    "Challenger Score",
    "Highest score in Challenge Mode",
    ChallengeMode() && ChallengeStart(),
    ChallengeMode() && ChallengeQuit(),
    ChallengeMode() && ChallengeEnd(),
    ChallengeCurrentScore(),
    format="VALUE",
    lower_is_better = false
)

// LB for highest level in challenge mode
leaderboard(
    "Challenger Level",
    "Highest level in Challenge Mode",
    ChallengeMode() && ChallengeStart(),
    ChallengeMode() && ChallengeQuit(),
    ChallengeMode() && ChallengeEnd(),
    ChallengeLevel(),
    format="VALUE",
    lower_is_better = false
)

// LB for highest score for each skin
for id in Skins
{
    skin = Skins[id]    
    leaderboard(
        skin,
        "Highest score on " + skin + " in single skin mode",
        SkinMode() && SkinStart(id),
        SkinMode() && SkinQuit(),
        SkinMode() && SkinEnd(id),
        ChallengeCurrentScore(),
        format="VALUE",
        lower_is_better = false
    ) 
}

// LB for most blocks for time attack 60s
leaderboard(
    "Time Attack 60s",
    "Highest number of deleted blocks in time attack 60s mode",
    TimeAttack60Mode() && TimeAttack60Start(),
    TimeAttack60Mode() && (TimeAttack60Fail() || TimeAttack60Quit()),
    TimeAttack60Mode() && TimeAttack60Pass(),
    TimeAttackDeleted(),
    format="VALUE",
    lower_is_better = false
)

// LB for most blocks for time attack 180s
leaderboard(
    "Time Attack 180s",
    "Highest number of deleted blocks in time attack 180s mode",
    TimeAttack180Mode() && TimeAttack180Start(),
    TimeAttack180Mode() && (TimeAttack180Fail() || TimeAttack180Quit()),
    TimeAttack180Mode() && TimeAttack180Pass(),
    TimeAttackDeleted(),
    format="VALUE",
    lower_is_better = false
)

// LB for most blocks for time attack 300s
leaderboard(
    "Time Attack 300s",
    "Highest number of deleted blocks in time attack 300s mode",
    TimeAttack300Mode() && TimeAttack300Start(),
    TimeAttack300Mode() && (TimeAttack300Fail() || TimeAttack300Quit()),
    TimeAttack300Mode() && TimeAttack300Pass(),
    TimeAttackDeleted(),
    format="VALUE",
    lower_is_better = false
)

// LB for most blocks for time attack 600s
leaderboard(
    "Time Attack 600s",
    "Highest number of deleted blocks in time attack 600s mode",
    TimeAttack600Mode() && TimeAttack600Start(),
    TimeAttack600Mode() && (TimeAttack600Fail() || TimeAttack600Quit()),
    TimeAttack600Mode() && TimeAttack600Pass(),
    TimeAttackDeleted(),
    format="VALUE",
    lower_is_better = false
)

// LB for fastest time for each VS CPU
for id in VsOpponents
{
    vs = VsOpponents[id]  
    leaderboard(
        "VS " + vs,
        "Fastest time to defeat the VS CPU " + vs,
        VsMode() && VsStart(id),
        VsMode() && (VsLost(id) || VsQuit()),
        VsMode() && VsWon(id),
        VsTime(),
        format="FRAMES",
        lower_is_better = true
    )
}

// LB for fastest time for each puzzle
for id in Puzzles
{
    puzzle = Puzzles[id]  
    leaderboard(
        puzzle,
        "Fastest time to solve the " + puzzle + " puzzle",
        PuzzleMode() && PuzzleStart(id),
        PuzzleMode() && (PuzzleFail(id) || PuzzleQuit()),
        PuzzleMode() && PuzzlePass(id),
        PuzzleTime(),
        format="FRAMES",
        lower_is_better = true
    )
}