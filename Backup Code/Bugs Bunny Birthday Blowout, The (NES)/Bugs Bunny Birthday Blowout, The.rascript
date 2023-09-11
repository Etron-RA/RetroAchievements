// Bugs Bunny Birthday Blowout, The
// #ID = 1596

// $00AC: Playable vs. Demo flag? (00 = Title Screen and Demo, FF = Rest of the game)
function Playable() => byte(0x0000AC)
function InGame() => Playable() == 0xff

// $041B: Useful for stage endings? (value = 29 when big carrot falls, value = 37 after picking up big carrot)
function EndStage() => byte(0x00041B)

// $0420: Stage (0 = Stage 1, 1 = Stage 2, 2 = Stage 3, 3 = Stage 4, 4 = Stage 5, 5 = Stage 6)
function Stage() => byte(0x000420)
function Level() => word(0x000420)

// $0421: Round (0 = Round 1, 1 = Round 2, 2 = Round 3, 3 = Round 4)
function Round() => byte(0x000421)

// $0428: Player's health
function Health() => byte(0x000428)

// $0429: Extra Lives (00 = Last Life, FF = Game Over)
function Lives() => byte(0x000429)
function GameOver() => Lives() == 0xff

// $042A: Carrots address 1
function Carrots() => byte(0x00042A)

// $0702: [8-bit] Weasel game status (0x0 -> 0x85 = start, 0x85 -> 0x86 = end)
function WeaselStatus() => byte(0x000702)

// $7a8a: Willy The Weasel Game Score address (use this for Willy the Weasel achievements)
function WeaselScore() => byte(0x007a8a)

// Event when starting a level
function LevelStart(stage, round)
{
    return InGame() && 
        Stage() == stage - 1 &&
        Round() == round -1 &&
        prev(EndStage()) == 0x17 &&
        EndStage() == 0x27
}

// Event when beating a level
function LevelEnd(stage, round)
{
    return InGame() && 
        Stage() == stage - 1 &&
        Round() == round -1 &&
        prev(EndStage()) == 0x29 &&
        EndStage() == 0x37
}

// Carrot collection data
// [stage + 1, round + 1, carrots, points]
CarrotCollectors = [
    [1,1,35,5],
    [1,2,46,5],
    [1,3,49,5],
    [1,4,47,5],
    [2,1,24,5],
    [2,2,28,5],
    [2,3,50,5],
    [2,4,39,5],
    [3,1,47,5],
    [3,2,44,5],
    [3,3,48,5],
    [3,4,52,5],
    [4,1,46,5],
    [4,2,51,5],
    [4,3,39,5],
    [4,4,54,5],
    [5,1,48,5],
    [5,2,59,10],
    [5,3,62,10],
    [5,4,61,10],
    [6,1,40,5],
    [6,2,53,5],
    [6,3,49,5]    
]

// Create a carrot collecting achievement for each level
for index in range (0,22)
{
    collector = CarrotCollectors[index]
    stage = collector[0]
    round = collector[1]
    carrots = collector[2]
    cheevoPoints = collector[3]
    
    achievement(
        title = "Crazy Carrot Collector " + index + 1,
        points = cheevoPoints,
        description = "Collect " + carrots + " carrots in Stage " + stage + " Round " + round + " without dying",
        id = 65749 + index, 
        trigger = measured(
                      repeated(carrots, 
                          Stage() == stage - 1 &&
                          Round() == round -1 &&
                          Carrots() > prev(Carrots())
                      )
                  ) &&
                  never(Lives() < prev(Lives()))&&
                  never(Lives() == 0xff)
    )
}

// Create progress achievements for each world
achievement(
        title = "Grasslands",
        points = 5,
        description = "Beat stage 1 round 4",
        trigger = LevelEnd(1, 4)
)

achievement(
        title = "Desert",
        points = 5,
        description = "Beat stage 2 round 4",
        trigger = LevelEnd(2, 4)
)

achievement(
        title = "Mountains",
        points = 5,
        description = "Beat stage 3 round 4",
        trigger = LevelEnd(3, 4)
)

achievement(
        title = "Caves",
        points = 10,
        description = "Beat stage 4 round 4",
        trigger = LevelEnd(4, 4)
)

achievement(
        title = "Forest",
        points = 10,
        description = "Beat stage 5 round 4",
        trigger = LevelEnd(5, 4)
)

// Create speedrun leaderboard for the whole game
leaderboard(    
    "Speedrun",
    "Fastest time to beat the game",
    LevelStart(1,1),
    GameOver(),
    LevelEnd(6,4),
    always_true(),
    format="FRAMES",
    lower_is_better = true
)

// Create speedrun leaderboard for each world
for stage in range(1,6)
{
    leaderboard(    
        "World " + stage + " Speedrun",
        "Fastest time to beat the game",
        LevelStart(stage,1),
        GameOver(),
        LevelEnd(stage,4),
        always_true(),
        format="FRAMES",
        lower_is_better = true
    )
}

// Create speedrun leaderboard for each level
for stage in range(1,6)
{
    for round in range(1,4)
    {
        leaderboard(    
            "Stage " + stage + "-" + round + " Speedrun",
            "Fastest time to beat the game",
            LevelStart(stage,round),
            GameOver(),
            LevelEnd(stage,round),
            always_true(),
            format="FRAMES",
            lower_is_better = true
        )
    }
}

// Create collector leaderboard for collecting carrots without dying
leaderboard(    
    "Carrot Collector",
    "Most carrots collected without dying",
    InGame() && prev(Carrots()) < Carrots(),
    always_false(),
    prev(Lives()) > Lives() || GameOver(),
    prev(Carrots()) < Carrots(),
    format="VALUE",
    lower_is_better = false
)


// Create collector leaderboard for collecting carrots without dying
leaderboard(    
    "Weasel Wacker",
    "Most weasles hit in the Willy The Weasel bonus game",
    InGame() && prev(WeaselStatus()) == 0 && WeaselStatus() == 0x85,
    always_false(),
    prev(WeaselStatus()) == 0x85 && WeaselStatus() == 0x86,
    WeaselScore(),
    format="VALUE",
    lower_is_better = false
)