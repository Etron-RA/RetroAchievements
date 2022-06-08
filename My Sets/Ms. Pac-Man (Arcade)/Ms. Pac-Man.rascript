// Ms. Pac-Man
// #ID = 11800

// $0530: [8-bit] Ms Pac-Man Direction (0x0 = right, 0x1 = down, 0x2 = left, 0x3 = up)
function MsPacManDirection() => byte(0x000530)
MsPacManRight = 0x0
MsPacManDown = 0x1
MsPacManLeft = 0x2
MsPacManUp = 0x3

// $05D0: [8-bit] Ghost bonus (0-4 how many ghosts eaten in a row)
function GhostBonus() => byte(0x0005D0)

// $05D2: [8-bit] Fruit Y (top 0x14 to bottom 0xf4)
function FruitY() => byte(0x0005D2)

// $05D3: [8-bit] Fruit X (right 0x0c to left 0xf4)
function FruitX() => byte(0x0005D3)

// $05D4: [8-bit] Food
//        0x00 = None
//        0x06 = Cherries
//        0x07 = Strawberry
//        0x08 = Orange
//        0x09 = Pretzel
//        0x0a = Apple
//        0x0b = Pear
//        0x0c = Banana
function FruitType() => byte(0x0005D4)
None = 0x0
Cherries = 0x6
Strawberry = 0x7
Orange = 0x8
Pretzel = 0x09
Apple = 0x0a
Pear = 0x0b
Banana = 0xc
AnyFruit = 0xf

// $0602: [8-bit] Intro State
//        0x3-0xf = Intro Scene
//        0x10 = Demo
function DemoMode() => byte(0x000602)
Demo = 0x10

// $0604: [8-bit] Game State
//        0x0 = None
//        0x2 = Ready!
//        0x3 = In Game
//        0x7 = Game Over
//        0xA = Dead
//        0xC -> 0xD = Maze Complete
//        0xE = Rack Skip Cheat
function GameState() => byte(0x000604)
Title = 0x0
StartGame = 0x1
Ready = 0x2
InGame = 0x3
GameOver = 0x7
Dead = 0xA
MazeComplete = 0xD
RackSkipCheat = 0xE
NextMaze = 0x24

// $0613: [8-bit] Maze
function Maze() => byte(0x000613)

// $0614: [8-bit] Lives Internal
function Lives() => byte(0x000614)

// $066F: [8-bit] Starting Lives (DIP settings 1, 2, 3, or 5)
function StartingLives() => byte(0x00066F)

// $0671: [8-bit] Bonus Life (DIP setting 0x10 = 10k, 0x15 = 15k, 0x20 = 20k, 0xff = none)
function StartingBonus() => byte(0x000671)

// $0673: [8-bit] Difficulty (DIP setting 0x68 = Normal, 0x72 = Hard)
function Difficulty() => byte(0x000673)
Normal = 0x68
Hard = 0x7D

// $0680: [8-bit] Score (BCD)
function Score00000X() => low4(0x000680)
function Score0000X0() => high4(0x000680)
function Score000X00() => low4(0x000681)
function Score00X000() => high4(0x000681)
function Score0X0000() => low4(0x000682)
function ScoreX00000() => high4(0x000682)
function Score()
{
    return ScoreX00000() * 100000 +
        Score0X0000() * 10000 +
        Score00X000() * 1000 +
        Score000X00() * 100 +
        Score0000X0() * 10 +
        Score00000X()
}

// --------------------------------------------------------
// Helper Functions

// Game state functions
function GameStart() => DemoMode() != Demo && prev(GameState()) == StartGame && GameState() == Ready
function MazeStart() => DemoMode() != Demo && prev(GameState()) == NextMaze && GameState() == InGame
function InGame() => DemoMode()  != Demo && GameState() == InGame
function GameOver() => GameState() == GameOver
function Dead() => GameState() == Dead

// Dip settings functions
function RackSkipCheat() => GameState() == RackSkipCheat
function DefaultSettings() => StartingLives() <= 0x3
function Normal() => Difficulty() == Normal
function Hard() => Difficulty() == Hard

// Ghost combo counter
function Completion(varible, goal) => prev(varible) == goal -1 && varible == goal
function GhostEaten() => InGame() && prev(GhostBonus()) < GhostBonus()
function GhostCombo(combo) => InGame() && Completion(GhostBonus(), combo)

// Test if the player has completed the current maze
function MazeComplete(maze)
{
   return DemoMode() != Demo &&
       GameState() == MazeComplete &&
       Maze() == maze 
} 

// Test is a food item was eaten instand of leaving the side of the screen
// If no food item is specified then the default is for any type of food
function FoodEaten(type = 0xf)
{
    trigger = InGame() &&
         FruitX() != 0xc &&
         FruitX() != 0xf4 &&
         FruitType() == None
         
    if (type == AnyFruit)
        trigger = trigger && prev(FruitType()) >= Cherries && prev(FruitType()) <= Banana
    else
        trigger = trigger && prev(FruitType()) == type
    
    return trigger
}

// --------------------------------------------------------
// Achievements

// Track how many mazes have been completed from maze 1 to the passed maze
function Progress(startMaze, endMaze)
{
    start = once(InGame() && Maze() == startMaze - 1)
    
    cancel = never(GameOver()) && never(RackSkipCheat())

    maze_array = []
    for index in range(startMaze, endMaze)
        array_push(maze_array, once(MazeComplete(index - 1)))
        
    mazeTally = tally(endMaze - startMaze + 1, maze_array)
    return start && cancel && (measured(mazeTally) || trigger_when(mazeTally))
        
}

achievement("They Meet","Finish mazes 1 and 2", 5, Progress(1, 2))
achievement("The Chase","Finish mazes 3, 4, and 5", 5, Progress(3, 5))
achievement("Junior","Finish mazes 6, 7, 8, and 9", 10, Progress(6, 9))
achievement("Junior the 2nd","Finish mazes 10, 11, 12, and 13", 25, Progress(10, 13))
achievement("Junior the 3rd","Finish mazes 14, 15, 16, and 17", 25, Progress(14, 17))

// Check if the play has eaten a certain type of food

achievement("Cherries Jubilee","Eat a cherry", 1, FoodEaten(Cherries))
achievement("Strawberry Short Cake","Eat a strawberry", 2, FoodEaten(Strawberry))
achievement("Orange Marmalade","Eat an orange", 3, FoodEaten(Orange))
achievement("Hot Buttered Soft Pretzels","Eat a pretzel", 4, FoodEaten(Pretzel))
achievement("Apple Pie","Eat an apple", 5, FoodEaten(Apple))
achievement("Pear Cobbler","Eat a pear", 5, FoodEaten(Pear))
achievement("Banana Split","Eat a banana", 5, FoodEaten(Banana))

// Check if the play has a certain number of any food items in a maze, cancel if the rack skip is detected
function FoodCountNoSkip(count)
{
    return never(MazeStart()) &&
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        repeated(count,FoodEaten())
}
achievement("Back for Seconds","Eat any two food items in the same maze", 5, FoodCountNoSkip(2))

// Count if the total number of ghost eaten is equal to the count, cancel if the rack skip is detected
function GhostEatenNoSkip(count)
{
    return once(GameStart()) &&
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        measured(repeated(count, GhostEaten()))
}

achievement("Paranormal Consumption ","Eat 10 ghosts in a single game", 5, GhostEatenNoSkip(10))
achievement("Phantom Potluck","Eat 20 ghosts in a single game", 10, GhostEatenNoSkip(20))
achievement("Poltergeist Banquet ","Eat 40 ghosts in a single game", 25, GhostEatenNoSkip(40))

// Count how many ghost combos the players gets on a maze, option to eating 2 food items, cancel if the rack skip is detected
function GhostComboNoSkip(count, plusFood = 0)
{
    ghost_array = [
        repeated(count, GhostCombo(1)),
        repeated(count, GhostCombo(2)),
        repeated(count, GhostCombo(3)),
        repeated(count, GhostCombo(4))        
    ]
    
    total = count * 4
    if plusFood > 0
    {
        array_push(ghost_array, repeated(plusFood, FoodEaten()))
        total = total + plusFood
    }

    return never(MazeStart()) &&
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        measured(tally(total, ghost_array))
}

achievement("Specter Snack","Eat all the ghost with one power pill in the same maze", 5, GhostComboNoSkip(1))
achievement("Wraith Cuisine","Eat all the ghost with two power pills in the same maze", 10, GhostComboNoSkip(2))
achievement("Ethereal Feast","Eat any food item plus all the ghost with three power pills in the same maze", 25, GhostComboNoSkip(3, 1))
achievement("Ghost Buster Parfait","Eat any two food items plus all the ghost with four power pills in the same maze", 50, GhostComboNoSkip(4, 2))

// Obtain the high score while the score is within the buffer range previously
achievement("Ms. Bonus","Gain a life", 5, InGame() && prev(Lives()) < Lives())

// Challenge to complete a maze without dying on normal on hard, cancel if the rack skip is detected
function DeathlessMaze(difficulty)
{
    return never(Dead()) && 
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        never(!difficulty) &&
        trigger_when(GameState() == MazeComplete) &&
        (
            once(GameStart() && difficulty) ||
            once(MazeStart() && difficulty) 
        )
}

achievement("Ms. Elusive","Complete any maze on normal without dying", 5, DeathlessMaze(Normal()))
achievement("Ms. Untouchable","Complete any maze on hard without dying", 10, DeathlessMaze(Hard()))

// Challenge to complete a maze without eating a ghost on normal on hard, cancel if the rack skip is detected
function PacifistMaze(difficulty)
{
    return never(GhostEaten()) && 
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        never(!difficulty) &&
        trigger_when(GameState() == MazeComplete) &&
        (
            once(GameStart() && difficulty) ||
            once(MazeStart() && difficulty) 
        )
}

achievement("Ms. Passive","Complete any maze on normal without eating a ghost", 5, PacifistMaze(Normal()))
achievement("Ms. Pacifist","Complete any maze on hard without eating a ghost", 10, PacifistMaze(Hard()))

// Challenge to complete a maze without reversing direction on normal on hard, cancel if the rack skip is detected
function NoReverseMaze(difficulty)
{
    return never(InGame() && prev(MsPacManDirection()) == MsPacManRight && MsPacManDirection() == MsPacManLeft) && 
        never(InGame() && prev(MsPacManDirection()) == MsPacManLeft && MsPacManDirection() == MsPacManRight) && 
        never(InGame() && prev(MsPacManDirection()) == MsPacManUp && MsPacManDirection() == MsPacManDown) && 
        never(InGame() && prev(MsPacManDirection()) == MsPacManDown && MsPacManDirection() == MsPacManUp) && 
        never(GameOver()) && 
        never(RackSkipCheat()) &&
        never(!difficulty) &&
        trigger_when(GameState() == MazeComplete) &&
        (
            once(GameStart() && difficulty) ||
            once(MazeStart() && difficulty) 
        )
}

achievement("Ms. No Turning Back","Complete any maze on normal without reversing", 10, NoReverseMaze(Normal()))
achievement("Ms. Full Speed Ahead","Complete any maze on hard without reversing", 25, NoReverseMaze(Hard()))

// --------------------------------------------------------
// Rich Presence
rich_presence_conditional_display(DemoMode() == Demo, "Ms. Pac-Man is watching the demo")
rich_presence_conditional_display(GameState() == Title, "Ms. Pac-Man is at the title screen")
rich_presence_display("Ms. Pac-Man is devouring maze {0} with {1} lives and {2} score",
    rich_presence_value("Maze", Maze() + 1),
    rich_presence_value("Lives", Lives()),
    rich_presence_value("Score", Score())
)
    
// --------------------------------------------------------
// Leaderboards

leaderboard(
    "Ms. Normal Score",
    "Highest score on normal (3 lives start or less)",
    GameStart() && DefaultSettings() && Normal(),
    always_false(),
    GameOver(),
    Score()
)

leaderboard(
    "Ms. Elusive",
    "Highest score on normal in one life",
    once(DemoMode() != Demo && Dead() && Normal()) && never(GameOver()),
    always_false(),
    always_true(),
    Score()
)

leaderboard(
    "Ms. Hard Score",
    "Highest score on hard (3 lives start or less)",
    GameStart() && DefaultSettings() && Hard(),
    always_false(),
    GameOver(),
    Score()
)


leaderboard(
    "Ms. Untouchable",
    "Highest score on hard in one life",
    once(DemoMode() != Demo && Dead() && Hard()) && never(GameOver()),
    always_false(),
    always_true(),
    Score()
)


leaderboard(
    "Ms. Ghost Buster",
    "Most ghosts eaten (3 lives start or less)",
    GhostEaten() && DefaultSettings(),
    always_false(),
    GameOver(),
    repeated(0,GhostEaten())
)

leaderboard(
    "Ms. Insatiable",
    "Most food eaten (3 lives start or less)",
    FoodEaten() && DefaultSettings(),
    always_false(),
    GameOver(),
    repeated(0,FoodEaten())
)

leaderboard(
    "Ms. Amazing",
    "Highest maze reached (3 lives start or less)",
    GameStart() && DefaultSettings(),
    RackSkipCheat(),
    GameOver(),
    Maze() + 1
)