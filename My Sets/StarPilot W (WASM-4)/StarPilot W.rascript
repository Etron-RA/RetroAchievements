// StarPilot W
// #ID = 20381

// $88e0: [32-bit] Astroids Active
function AstroidsActive() => dword(0x0088E0)

// $93D4: [float] Ship X-Axis (bounds -32.0 to 32.0)
function XAxis() => float(0x0093D4)

// $93D8: [float] Ship Y-Axis (bounds -32.0 to 32.0)
function YAxis() => float(0x0093D8)

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

// Reset if out of bounds check
function OutOfBoundsReset(buffer = 900){
    return never(repeated(buffer, XAxis() < -32.0)) &&
        never(repeated(buffer, XAxis() > 32.0)) &&
        never(repeated(buffer, YAxis() < -32.0)) &&
        never(repeated(buffer, YAxis() > 32.0))
}

// Reset if out of bounds check (LB Logic)
function OutOfBoundsResetLB(buffer = 900)
{
    return repeated(buffer, XAxis() < -32.0) ||
        repeated(buffer, XAxis() > 32.0) ||
        repeated(buffer, YAxis() < -32.0) ||
        repeated(buffer, YAxis() > 32.0)
}

// Achievement for completing a group of stages
function StageComplete(startStage, endStage, damageless = false)
{
    // Start when the player starts the startStage
    start = once(
        Health() != 0 &&
        prev(Stage()) == startStage &&
        Stage() == startStage + 1
    )
    
    // Cancel on game over or if players leaves the the bounds
    cancel = never(EndGame()) && 
        OutOfBoundsReset()
    
    // If the start stage is 0 then use the start game event
    if (startStage == 0)
        start = once(StartGame())
    else
        cancel = cancel && never(Stage() <= startStage)
    
    
    // Add damageless condition if applicable 
    if (damageless == true)
        cancel = cancel && never(prev(Health()) > Health())

    //  Submit when the player completes the endStage
    submit = trigger_when(Health() != 0 &&
        prev(Stage()) == endStage &&
        Stage() == endStage + 1)

    return start && cancel && submit
}

// Progression Achievements
achievement("Cadet","Complete stages 0 to 10, going out of bounds resets achievement", 1, StageComplete(0, 10), id=243129)
achievement("Second Officer","Complete stages 11 to 20, going out of bounds resets achievement", 2, StageComplete(10, 20), id=243130)
achievement("First Officer","Complete stages 21 to 30, going out of bounds resets achievement", 3, StageComplete(20, 30), id=243131)
achievement("Senior Officer","Complete stages 31 to 40, going out of bounds resets achievement", 4, StageComplete(30, 40), id=243132)
achievement("Captain ","Complete stages 41 to 50, going out of bounds resets achievement", 5, StageComplete(40, 50), id=243133)
achievement("Major","Complete stages 51 to 75, going out of bounds resets achievement", 10, StageComplete(50, 75), id=244112)
achievement("Colonel","Complete stages 75 to 100, going out of bounds resets achievement", 25, StageComplete(75, 100), id=244113)

// Damageless Achievements
achievement("Flight Specialist","Complete stages 0 to 10 without taking damage, going out of bounds resets achievement", 2, StageComplete(0,10,true),id=243134)
achievement("Aerial Acrobat","Complete stages 0 to 20 without taking damage, going out of bounds resets achievement", 3, StageComplete(0,20,true), id=244109)
achievement("Ace Pilot","Complete stages 0 to 30 without taking damage, going out of bounds resets achievement", 5, StageComplete(0,30,true), id=244110)

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
achievement("Asteroid Destroyer","Destroy 25 or more asteroids in a single stage", 2, DestroyAstroids(25), id=243135)
achievement("Asteroid Obliterator ","Destroy 50 or more asteroids in a single stage", 3, DestroyAstroids(50), id=243136)
achievement("Asteroid Annihilator","Destroy 100 or more asteroids in a single stage", 5, DestroyAstroids(100), id=243137)

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
        OutOfBoundsReset() &&
        measured(repeated(count,GateBoost()))
}
achievement("Learning to Fly","Boost through 10 gates in one life, going out of bounds resets achievement", 2, GateBoostChallenge(10), id=243138)
achievement("Straighten Up and Fly Right","Boost through 25 gates in one life, going out of bounds resets achievement", 3, GateBoostChallenge(25), id=243139)
achievement("Thread the Needle","Boost through 50 gates in one life, going out of bounds resets achievement", 5, GateBoostChallenge(50),id=243140)

// Check if the player is out of bounds in one direction
function OutOfBoundsDirection(direction, buffer = 900)
{
    return direction && 
        trigger_when(
            repeated(
                buffer, 
                Health() != 0 && direction
            )
        )
}

// Prime the achievement for when the players is out of bounds
function OutOfBoundsIndicator(buffer = 900)
{
    return Health() != 0 && never(EndGame()) && (
        OutOfBoundsDirection(XAxis() < -32.0, buffer) ||
        OutOfBoundsDirection(XAxis() > 32.0, buffer) ||
        OutOfBoundsDirection(YAxis() < -32.0, buffer) ||
        OutOfBoundsDirection(YAxis() > 32.0, buffer)
    )
}
achievement("Out of Bounds","Go out of bounds for an accumulative 15 second, cancels other achievements and leaderboards", 0, OutOfBoundsIndicator(), id=244111)

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
    "Highest score, cancels if player goes out of bounds, submits on death",
    StartGame(),
    OutOfBoundsResetLB(),
    EndGame(),
    Score(),
    id=42087,
    lower_is_better=false
)

// Boost Leaderboard
leaderboard(
    "Gate Booster",
    "Most gates passed through while boosted, cancels if player goes out of bounds, submits on death",
    StartGame(),
    OutOfBoundsResetLB(),
    EndGame(),
    measured(GateBoost()),
    id=42088,
    lower_is_better=false
)