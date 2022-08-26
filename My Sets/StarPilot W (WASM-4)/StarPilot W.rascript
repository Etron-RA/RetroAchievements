// StarPilot W
// #ID = 20381

// $88e0: [32-bit] Astroids Active
function AstroidsActive() => dword(0x0088E0)

// $93AC: [8-bit] Gates Left  (0 = Destroy, 1 >= Avoid)
function Gates() => byte(0x0093AC)

// $942D: [8-bit] Ship Health
function Health() => byte(0x00942D)

// $943C: [8-bit] Boost (0 = none, 1 = boost)
function Boost() => byte(0x00943C)

// $9584: [32-bit] Score
function Score() => dword(0x009584)

// $95AA: [16-bit] Stage
function Stage() => word(0x0095AA)

// Game event shortcuts
function StartGame() => prev(Health()) < 0x64 && Health() == 0x64
function EndGame() => prev(Health()) != 0 && Health() == 0
function DestroyMode() => Gates() == 0
function AvoidMode() => AstroidsActive() == 0

// Achievement for completing a stage
function StageComplete(stage)
{
    return Health() != 0 &&
        prev(Stage()) == stage &&
        Stage() == stage + 1
}
achievement("Cadet","Complete stage 10", 2, StageComplete(10))
achievement("Second Officer","Complete stage 20", 3, StageComplete(20))
achievement("First Officer","Complete stage 30", 5, StageComplete(30))
achievement("Senior Officer","Complete stage 40", 5, StageComplete(40))
achievement("Captain ","Complete stage 50", 10, StageComplete(50))

// Damageless achievement for not getting until completing the passed stage parameter
function Damageless(stage)
{
    start = once(StartGame())
    cancel = never(EndGame()) && never(prev(Health()) > Health())
    submit = trigger_when(StageComplete(stage))
    
    return start && cancel && submit
}
achievement("Ace Pilot","Complete stage 10 without taking damage", 5, Damageless(10))

// Achievement to count how many astroids in a stage
function DestroyAstroids(count)
{
    return never(EndGame()) && 
        never(prev(Stage()) < Stage()) &&
        measured(
            repeated(
                count, 
                DestroyMode() && prev(Score()) < Score()
            )
        )
}
achievement("Asteroid Destroyer","Destroy 25 or more asteroids in a single stage", 2, DestroyAstroids(25))
achievement("Asteroid Obliterator ","Destroy 50 or more asteroids in a single stage", 3, DestroyAstroids(50))
achievement("Asteroid Annihilator","Destroy 100 or more asteroids in a single stage", 5, DestroyAstroids(100))

// Test if the player is boosted when passing through a gate
function GateBoost()
{
    return AvoidMode() &&
        Boost() == 1 &&
        prev(Score()) < Score()
}

// Achievement to count how many gates the player passes through while boosted.
function GateBoostChallenge(count)
{        
    return never(EndGame()) && 
        measured(repeated(count,GateBoost()))
}
achievement("Learning to Fly","Boost through 10 gates in one life", 2, GateBoostChallenge(10))
achievement("Straighten Up and Fly Right","Boost through 25 gates in one life", 3, GateBoostChallenge(25))
achievement("Thread the Needle","Boost through 50 gates in one life", 5, GateBoostChallenge(50))

// Rich Presence
rich_presence_conditional_display(
    Health() != 0 && AvoidMode(), 
    "Star Pilot W is avoiding obstacles with {0} points on stage {1}",
    rich_presence_value("SCORE", Score()),
    rich_presence_value("STAGE", Stage())
)
rich_presence_conditional_display(
    Health() != 0 && DestroyMode(), 
    "Star Pilot W is destroying asteroids with {0} points on stage {1}",
    rich_presence_value("SCORE", Score()),
    rich_presence_value("STAGE", Stage())
)
rich_presence_display("Star Pilot W is ready to start the mission")

// Score Leaderboard
leaderboard(
    "Highest Score",
    "Highest score (submits on death)",
    StartGame(),
    always_false(),
    EndGame(),
    Score(),
    lower_is_better=false
)

// Boost Leaderboard
leaderboard(
    "Gate Booster",
    "Most gates passed through while boosted (submits on death)",
    StartGame(),
    always_false(),
    EndGame(),
    measured(GateBoost()),
    lower_is_better=false
)