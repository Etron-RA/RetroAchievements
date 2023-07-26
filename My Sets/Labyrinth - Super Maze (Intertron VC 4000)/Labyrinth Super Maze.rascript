// Labyrinth | Super Maze
// #ID = 21640

// 0x050e [8-bit] Timer
function Timer() => byte(0x050e)

// 0x050f [8-bit] Game Type
function GameType() => byte(0x050f)

// 0x055e [BCD] Player 1 Score
function ScoreByte() => byte(0x055e)
function Score0X() => low4(0x055e)
function ScoreX0() => high4(0x055e)
function Score() => ScoreX0() * 10 + Score0X() 

// 0x0565 [8-bit] Maze Active (0x0 = Inactive, 0x1 = Active)
function GameState() => byte(0x0565)

// 0x056b [BCD] Times played (resets at 10)
function Played0X() => low4(0x056b)
function PlayedX0() => high4(0x056b)
function Played() => PlayedX0() * 10 + Played0X() 

// -- Helper functions -------------------------------------------------------
function BeatMaze(game)
{
    return GameType() == game - 1 &&
        trigger_when(
            prev(GameState()) == 0x1 &&
            GameState() == 0x0 &&
            prev(ScoreByte()) < ScoreByte()
        )
}

function ChallengeMaze(game, score)
{
    trigger = GameType() == game - 1 &&
        trigger_when(
            prev(GameState()) == 0x1 &&
            GameState() == 0x0 &&
            prev(Score()) >= score - 10 && 
            prev(Score()) < score && 
            Score() >= score
        )
        
    meassure = prev(GameState()) == 0x1 &&
        GameState() == 0x0 &&
        prev(Score()) >= score - 10 && 
        prev(Score()) < score && 
        measured(Score() >= score, GameType() == game - 1)

    return trigger || meassure
}

function StartFirstMaze(game)
{
    return GameType() == game - 1 &&
        prev(Played()) != 1 &&
        Played() == 1 
}

function EndLastMaze(game)
{
    return GameType() == game - 1 &&
        Played() == 10 &&
        prev(GameState()) == 0x1 &&
        GameState() == 0x0 
}

function MazeTimer(timeLimit)
{
    start = once(
                prev(Timer()) != 0x0 &&
                Timer() == 0x0 &&
                GameState() == 0x1
            )
            
    cancel = never(Timer() > timeLimit) &&
             never(prev(GameType()) !=  GameType()) &&
             never(
                prev(GameState()) == 0 &&
                GameState() == 0
             )
    
    submit = trigger_when( 
                 prev(GameState()) == 0x1 &&
                 GameState() == 0x0 &&
                 prev(ScoreByte()) < ScoreByte()
             )
             
    return start && cancel && submit
}

// -- Achievements -----------------------------------------------------

achievement("Maze 1","Complete a maze in game 1 before time runs out", 1, BeatMaze(1))
achievement("Maze 1 Challenge","Within 10 attempts get a total score of 60 or higher in game 1", 3, ChallengeMaze(1, 60))
achievement("Maze 3","Complete a maze in game 3 before time runs out", 1, BeatMaze(3))
achievement("Maze 3 Challenge","Within 10 attempts get a total score of 60 or higher in game 3", 5, ChallengeMaze(3, 60))
achievement("Maze 5","Complete a maze in game 5 before time runs out", 1, BeatMaze(5))
achievement("Maze 5 Challenge","Within 10 attempts get a total score of 30 or higher in game 5", 5, ChallengeMaze(5, 30))
achievement("Maze 7","Complete a maze in game 7 before time runs out", 1, BeatMaze(7))
achievement("Maze 7 Challenge","Within 10 attempts get a total score of 25 or higher in game 7", 10, ChallengeMaze(7, 25))
achievement("Maze 9","Complete a maze in game 9 before time runs out", 1, BeatMaze(9))
achievement("Maze 9 Challenge","Within 10 attempts get a total score of 30 or higher in game 9", 5, ChallengeMaze(9, 30))
achievement("Maze 11","Complete a maze in game 11 before time runs out", 2, BeatMaze(11))
achievement("Maze 11 Challenge","Within 10 attempts get a total score of 25 or higher in game 11", 10, ChallengeMaze(11, 25))
achievement("Maze 13","Complete a maze in game 13 before time runs out", 1, BeatMaze(13))
achievement("Maze 13 Challenge","Within 10 attempts get a total score of 60 or higher in game 13", 3, ChallengeMaze(13, 60))
achievement("Maze 15","Complete a maze in game 15 before time runs out", 1, BeatMaze(15))
achievement("Maze 15 Challenge","Within 10 attempts get a total score of 50 or higher in game 15", 5, ChallengeMaze(15, 50))
achievement("Maze 17","Complete a maze in game 17 before time runs out", 1, BeatMaze(17))
achievement("Maze 17 Challenge","Within 10 attempts get a total score of 30 or higher in game 17", 3, ChallengeMaze(17, 30))
achievement("Maze 19","Complete a maze in game 19 before time runs out", 1, BeatMaze(19))
achievement("Maze 19 Challenge","Within 10 attempts get a total score of 25 or higher in game 19", 5, ChallengeMaze(19, 25))
achievement("Maze 21","Complete a maze in game 21 before time runs out", 1, BeatMaze(21))
achievement("Maze 21 Challenge","Within 10 attempts get a total score of 30 or higher in game 21", 3, ChallengeMaze(21, 30))
achievement("Maze 23","Complete a maze in game 23 before time runs out", 1, BeatMaze(23))
achievement("Maze 23 Challenge","Within 10 attempts get a total score of 30 or higher in game 23", 5, ChallengeMaze(23, 30))
achievement("Maze Speedrun","Complete any maze in 10 seconds or less game time", 5, MazeTimer(10))


// -- Leaderboards -------------------------------------------------------

for maze in range(1,23,2)
{
    leaderboard(
        "Maze " + maze + " Hi Score",
        "Highest score on maze " + maze + " after 10 rounds",
        StartFirstMaze(maze),
        GameType() != maze - 1,
        EndLastMaze(maze),
        Score(),
        format = "VALUE",
        lower_is_better = false        
    )
}

// -- Rich Presence -------------------------------------------------------

rich_presence_conditional_display(
    GameState() == 0x1,
    "Maze {0} | Round {1} | Time Left {2} | Score {3}",
    rich_presence_value("VALUE", GameType() + 1),
    rich_presence_value("VALUE", Played()),
    rich_presence_value("SEC", 0x32 - Timer()),
    rich_presence_value("VALUE", Score())
)

rich_presence_display(
    "Maze {0} | Round {1} | Score {2}",
    rich_presence_value("VALUE", GameType() + 1),
    rich_presence_value("VALUE", Played()),
    rich_presence_value("VALUE", Score())
)
