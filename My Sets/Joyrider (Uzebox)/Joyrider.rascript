// Joyrider
// #ID = 24744

// $0422: [8-bit] Camera X
// $0424: [8-bit] Camera Y
function CameraX() => byte(0x000422)
function CameraY() => byte(0x000424)
function Block() => high4(0x000422) * 0xf + high4(0x000424)

// $0426: [8-bit] Wanted level 0-4
function WantedLevel() => byte(0x000426)

// $0427: [8-bit] Car Health
function CarHealth() => byte(0x000427)

// $0D89: [8-bit] Input Flags #1
//        bit 0 = A
//        bit 1 = X
//        bit 2 = Select
//        bit 3 = Start
//        bit 4 = Up
//        bit 5 = Down
//        bit 6 = Left
//        bit 7 = Right
// $0D8A: [8-bit] Input Flags #2
//        bit 0 = B
//        bit 1 = Y
//        bit 2 = L
//        bit 3 = R
function Select() => bit2(0x0D89)

// $0DC1: [8-bit] Game State
//        0 = Init/Restart
//        1 = Main Menu
//        2 = Playing
//        3 = Paused
function GameState() => byte(0x000DC1)
function Restart() => GameState() == 0x0
function MainMenu() => GameState() == 0x1
function Playing() => GameState() == 0x2
function Paused() => GameState() == 0x3

// $0dc2: [8-bit] Sprite Frame Animation (bits 0 to 5)
// $0DCC: [16-bit] Timer Seconds (Display rolls at 4:16)
function Timer() => word(0x000DCC)
function TimeToCatch() {
    return word(0x000DCC) * 60 +
        bit5(0xdc2) * 31 + 
        bit4(0xdc2) * 15 + 
        bit3(0xdc2) * 7 + 
        bit2(0xdc2) * 3 +
        bit1(0xdc2) * 2 +
        bit0(0xdc2)
}

// $0F15: [16-bit] Start Mission Pointer
function StartMissionPointer() => word(0x000F15)

// $0F17: [16-bit] Last Mission Pointer
function LastMissionPointer() => word(0x000F17)

// $0F19: [16-bit] Current Mission Pointer
//        0x7856 = Mission Failed
function CurrentMissionPointer() => word(0x000F19)

// Mission pointer constants [start pointer, current pointer]
Missions = {
    "Bank Job": [0x78d6,0x78df],
    "Collector": [0x795a,0x7963],
    "Street Race": [0x7a11,0x7a23],
    "Free Roam": [0x7857,0x7860],
    "Survival P1": [0x7869,0x7872],
    "Pursuit P1": [0x7884,0x789c],
    "Pursuit P2": [0x78b1,0x78c6]    
}

MissionLookup = {
    0x78d6: "Bank Job",
    0x795a: "Collector",
    0x7a11: "Street Race",
    0x7857: "Free Roam",
    0x7869: "Survival",
    0x7884: "Pursuit",
    0x78b1: "Pursuit (Two Player)"
}

// $0F1E: [8-bit] Mission Flags #1
//        bit 0 - Did Yield
//        bit 1 - Input Blocked
//        bit 2 - CarIsObjective
//        bit 3 - Marker Is Objective
//        bit 4 - Waiting For Mission Car
//        bit 5 - Timer Counting Up
//        bit 6 - Player Is Cop
//        bit 7 - In End Menu
function InputBlocked() => bit1(0x000F1E) == 1
function InputAllowed() => bit1(0x000F1E) == 0
function TimerCounting() => bit5(0x000F1E) == 1

// $0F1F: [8-bit] Mission Flags #2
//        bit 0 - Mission Complete
//        bit 1 - Is Race
//        bit 2 - Fail If Lose Mission Car;
//        bit 3 - Block NPC Spawning
//        bit 4 - Player Immunity
//        bit 5 - Player Invincible
//        bit 6 - Demo
function Complete() => bit0(0x000F1F)

// Race location format [name,x1,y1,x2,y2]
Shortcuts = [
    ["Shortcut #1",0x18,0x11,0x1b,0x16],
    ["Shortcut #2",0x99,0xa1,0x9a,0xa6]    
]

Bridges = [
    ["Bridge #1",0xa9,0x38,0xab,0x3f],
    ["Bridge #2",0x66,0x7a,0x6d,0x7c],
    ["Bridge #3",0x49,0x88,0x4b,0x8f],
    ["Bridge #4",0x76,0xc9,0x7d,0xcb],
    ["Bridge #5",0x89,0xd8,0x8b,0xdf]
]

ParkingLots =[
    ["Parking Lot #1",0x02,0x27,0x11,0x2f],    
    ["Parking Lot #2",0x02,0x97,0x11,0x9f],    
    ["Parking Lot #3",0x22,0xc7,0x31,0xcf],    
    ["Parking Lot #4",0x72,0x27,0x81,0x2f],
    ["Parking Lot #5",0x72,0x57,0x81,0x5f],
    ["Parking Lot #6",0xa2,0x07,0xb1,0x0f],
    ["Parking Lot #7",0xb2,0x87,0xc1,0x8f],
    ["Parking Lot #8",0xc2,0xc7,0xd1,0xcf]
]

// Helper functions -----------------------------------------------------------------------------------

// Convert a time span into frames
function TimeSpan(minutes, seconds, milliseconds)
{
    return minutes * 3600 +
        seconds * 60 +
        milliseconds
}

// Conditions for starting a mission
function MissionStart(mission)
{   
    missionArray = Missions[mission]
    missionStart = missionArray[0]
    missionCurrent = missionArray[1]
    return Playing() && 
        StartMissionPointer() == missionStart &&
        prev(CurrentMissionPointer()) == missionCurrent &&
        CurrentMissionPointer() != missionCurrent 
}

// Conditions for completing a mission
function MissionComplete(mission)
{
    missionArray = Missions[mission]
    missionStart = missionArray[0]
    return Playing() && 
        StartMissionPointer() == missionStart &&
        prev(Complete()) < Complete()
}

// Conditions for when the mission has failed
function MissionFailed()
{
    return Playing() &&     
        prev(CurrentMissionPointer()) != 0x7856 &&
        CurrentMissionPointer() == 0x7856
}

// Conditions for when the car is wrecked
function Wrecked()
{
    return Playing() &&
        prev(CarHealth()) > 0 &&
        CarHealth() == 0
}

// Conditions for completing a mission in a certain time
function MissionTimed(mission, timeout)
{
    start = once(MissionStart(mission))
    
    cancel = never(
                start &&
                repeated(timeout,always_true())
             ) &&
             never(MissionFailed()) &&
             never(Wrecked()) &&
             never(Restart()) &&
             never(MainMenu())
             
     submit = trigger_when(MissionComplete(mission))
     
     return start && cancel && submit
}

// Conditions for completing all the missions in a certain time
function AllMissionsTimed(timeout)
{
    start = once(MissionStart("Bank Job"))
    
    cancel = never(
                start &&
                repeated(timeout,always_true())
             ) &&
             never(MainMenu())
             
    submit = trigger_when(MissionComplete("Street Race"))
     
    return start && cancel && submit
}


// Conditions for completing all without failing any
function AllMissionsPerfect()
{
    start = once(MissionStart("Bank Job"))
    
    cancel = never(MissionFailed()) &&
             never(Wrecked()) &&
             never(Restart()) &&
             never(MainMenu())
             
    submit = trigger_when(MissionComplete("Street Race"))
     
    return start && cancel && submit
}

// Test if a car is in a certain location
function InArea(locationArray)
{
    x1 = locationArray[1]
    y1 = locationArray[2]
    x2 = locationArray[3]
    y2 = locationArray[4]
    
    return CameraX() >= x1 &&
        CameraX() <= x2 &&
        CameraY() >= y1 &&
        CameraY() <= y2
}


// Test if a car is in a certain location (previous frame)
function PrevInArea(locationArray)
{
    x1 = locationArray[1]
    y1 = locationArray[2]
    x2 = locationArray[3]
    y2 = locationArray[4]
    
    return prev(CameraX()) >= x1 &&
        prev(CameraX()) <= x2 &&
        prev(CameraY()) >= y1 &&
        prev(CameraY()) <= y2
}

// Conditions for if a player visit all hte checkpoints before a timeout
function TimedRace(mission, locations, timeout)
{
    missionArray = Missions[mission]
    mode = missionArray[0]

    // Create goal array for when the player has been in all the checkpoints
    // Create timeout array to timeout challenege after 1st checkpoint has be hit
    goalArray = []
    timeoutArray = []
    for location in locations
    {
        array_push(goalArray,once(InArea(location)))
        
        array_push(timeoutArray,
            once(InArea(location)) &&
            repeated(timeout,always_true())
        )
    }
    
    // start when player is in one checkpoint
    start = tally(1,goalArray)
    
    // Cancel when input is blocked, wrecked, while restarting, on main menu or select is pressed
    cancel = never(InputBlocked()) &&
        never(Wrecked()) &&
        never(Restart()) &&
        never(MainMenu()) &&
        never(prev(Select()) < Select()) &&
        never(StartMissionPointer() != mode) &&
        all_of(timeoutArray, t => never(t))
    
    // Measure how many checkpoint have ben reached
    measure = measured(tally(length(locations),goalArray))
    
    // Trigger when all checkpoints have been reached
    trigger = trigger_when(tally(length(locations),goalArray)) 
        
    return start && cancel && (measure || trigger)
}

// Get a certain wanted level in the passed mission
function MostWanted(mission, stars)
{
    missionArray = Missions[mission]
    mode = missionArray[0]

    return Playing() &&
        StartMissionPointer() == mode &&
        prev(WantedLevel()) == stars - 1 &&
        WantedLevel() == stars
}

// Survive for more then the timeout
function SurvivalTime(timeout)
{
    start = once(MissionStart("Survival P1"))
    
    cancel = never(Wrecked()) &&
             never(MissionFailed()) &&
             never(Restart()) &&
             never(MainMenu())
             
     submit = trigger_when(TimeToCatch() > timeout)
     
     return start && cancel && submit
}

// Survive for more then the timeout
function SurvivalBlocks(coverage)
{
    missionArray = Missions["Survival P1"]
    survivalStart = missionArray[0]
    
    start = once(MissionStart("Survival P1"))
    
    cancel = never(StartMissionPointer() != survivalStart) &&
             never(Wrecked()) &&
             never(MissionFailed()) &&
             never(Restart()) &&
             never(MainMenu())
             
    // Count which block the car is in
    blockArray = []
    for block in range(0,0xff)
    {
        array_push(blockArray,once(Block() == block && InputAllowed()))
    }
    
    // Measure how many blocks have been covered
    measure = measured(tally(coverage,blockArray))
    
    // Trigger when all blocks have been covered
    trigger = trigger_when(tally(coverage,blockArray))
     
    return start && cancel && (measure || trigger)
}


// Catch the crimal in under the timeout
function PursuitTime(timeout)
{
    start = once(MissionStart("Pursuit P1"))
    
    cancel = never(
                start &&
                TimeToCatch() > timeout
             ) &&
             never(MissionFailed()) &&
             never(Restart()) &&
             never(MainMenu())
             
     submit = trigger_when(Wrecked())
     
     return start && cancel && submit
}

function PursuitDamageless(timeout)
{
    start = once(MissionStart("Pursuit P1"))
    
    cancel = never(prev(CarHealth()) > CarHealth()) &&
             never(MissionFailed()) &&
             never(Restart()) &&
             never(MainMenu())
             
     submit = trigger_when(TimeToCatch() > timeout)
     
     return start && cancel && submit
}

// Achievements -----------------------------------------------------------------------------------

achievement("Getaway Driver","Complete the Bank Job mission", 1, MissionComplete("Bank Job"))
achievement("Escape Artist","Complete the Bank Job mission in under 50s", 3, MissionTimed("Bank Job", TimeSpan(0,50,0)))

achievement("The Clean Sweep","Complete the Collector mission", 1, MissionComplete("Collector"))
achievement("Payback Time","Complete the Collector mission in under 50s", 3, MissionTimed("Collector", TimeSpan(0,50,0)))

achievement("Street King","Complete the Street Race mission", 2, MissionComplete("Street Race"))
achievement("Fast & Furious","Complete the Street Race mission in under 30s", 3, MissionTimed("Street Race", TimeSpan(0,30,0)))

achievement("Steadfast Driving","Complete all three story missions without failing or restarting (exit to main menu and start on Bank Job to reset challenge)", 5, AllMissionsPerfect())
achievement("Swift and Steady","Complete all three story missions in under 2m30s (exit to main menu and start on Bank Job to reset challenge)", 10, AllMissionsTimed(TimeSpan(2,30,0)))

achievement("I Know a Shortcut","Cross both shortcuts in under 20s in free roam mode (press select to reset challenge)", 3, TimedRace("Free Roam", Shortcuts, TimeSpan(0,20,0)))
achievement("Bridge Racer","Cross all five bridges in under 25s in free roam mode (press select to reset challenge)", 5, TimedRace("Free Roam", Bridges, TimeSpan(0,25,0)))
achievement("Travelling Salesman","Visit all eight parking lots in under 1m30s in free roam mode (press select to reset challenge)", 10, TimedRace("Free Roam", ParkingLots, TimeSpan(1,30,0)))

achievement("Most Wanted","Get 4 wanted stars at once in free roam mode", 5, MostWanted("Free Roam", 4))

achievement("Hot Pursuit","Avoid capture by the police for 30s in survival mode", 2, SurvivalTime(TimeSpan(0,30,0)))
achievement("The Great Escape","Avoid capture by the police for 60s in survival mode", 5, SurvivalTime(TimeSpan(0,60,0)))

achievement("Wild Goose Chase","Cover 75 unique city blocks during a single race in survival mode", 5, SurvivalBlocks(75))

achievement("Criminal Catcher","Capture by the criminal in under 40s in pursuit mode", 2, PursuitTime(TimeSpan(0,40,0)))
achievement("Swift Justice","Capture by the criminal in under 20s in pursuit mode", 5, PursuitTime(TimeSpan(0,20,0)))

achievement("Put a Tail on Him","Follow the criminal without damaging them for 60s in pursuit mode", 5, PursuitDamageless(TimeSpan(0,60,0)))

// Leaderboards -------------------------------------------------------------------------------------

// Leaderboard for a story mission
function LeaderboardMission(name, description, mission)
{
    start = MissionStart(mission)
    
    cancel = MissionFailed() ||
             Wrecked() ||
             Restart() ||
             MainMenu()
             
    submit = MissionComplete(mission)
    
    leaderboard(
        name,
        description,
        start,
        cancel,
        submit,
        always_true(),
        lower_is_better = true,
        format="FRAMES"
    )
}

// Leaderboard for mutliple story missions
function LeaderboardMutliMissions(name, description, startMission, endMission)
{
    start = MissionStart(startMission)
    
    cancel = MainMenu()
             
    submit = MissionComplete(endMission)
    
    leaderboard(
        name,
        description,
        start,
        cancel,
        submit,
        always_true(),
        lower_is_better = true,
        format="FRAMES"
    )
}

// Leaderboard for checkpoint race
function LeaderboardRace(name, description, locations)
{
    missionArray = Missions["Free Roam"]
    freeRoam = missionArray[0]
    
    // Create start array for detect when player is in one checkpoint
    // Create goal array for when the player has been in all the checkpoints
    startArray = []
    goalArray = []
    prevArray = []
    for location in locations
    {
        array_push(startArray, InArea(location))        
        array_push(goalArray,once(InArea(location)))   
        array_push(prevArray,once(PrevInArea(location)))
    }
    
    // start when player is in one checkpoint
    start = StartMissionPointer() == freeRoam && 
        Playing() && 
        InputAllowed() && 
        any_of(startArray, s => s)
    
    // Cancel when wrecked, while restarting, on main menu or select is pressed
    cancel = Wrecked() ||
             Restart() ||
             MainMenu() ||
             prev(Select()) < Select()
    
    // Submit when all the checkpoints have been reacheded
    submit = never(Wrecked()) &&
        never(Restart()) &&
        never(MainMenu()) &&
        never(prev(Select()) < Select()) &&
        never(tally(length(locations),prevArray)) &&
        tally(length(locations),goalArray)
    
    leaderboard(
        name,
        description,
        start,
        cancel,
        submit,
        always_true(),
        lower_is_better = true,
        format="FRAMES"
    )
}

// Leaderboard for an arcade mission
function LeaderboardArcade(name, description, mission, lower)
{
    start = MissionStart(mission)
    
    cancel = MissionFailed() ||
             Restart() ||
             MainMenu()
             
    submit = Wrecked()
    
    leaderboard(
        name,
        description,
        start,
        cancel,
        submit,
        TimeToCatch(),
        lower_is_better = lower,
        format="FRAMES"
    )
}

// Drive the most blocks in one
function LeaderboardBlocks(name, description)
{
    start = MissionStart("Survival P1")
    
    cancel = MissionFailed() ||
             Restart() ||
             MainMenu()
             
    submit = Wrecked()
    
    
    // Count which block the car is in
    blockArray = []
    for block in range(0,0xff)
    {
        array_push(blockArray,InputAllowed() && once(Block() == block))
    }
    
    // Measure how many blocks have been covered
    measure = measured(tally(255,blockArray))
         
    leaderboard(
        name,
        description,
        start,
        cancel,
        submit,
        measure,
        lower_is_better = false,
        format="VALUE"
    )
}

LeaderboardMission("Bank Job","Fastest time to complete Bank Job mission","Bank Job")
LeaderboardMission("Collector","Fastest time to complete Collect mission","Collector")
LeaderboardMission("Street Race","Fastest time to complete Street Race mission","Street Race")
LeaderboardMutliMissions("Story Mode","Fastest time to complete all three story missions (exit to main menu and start on Bank Job to reset leaderboard)","Bank Job","Street Race")
LeaderboardRace("Shortcut","Fastest time to cross both shortcuts in free roam mode (press select to cancel race)",Shortcuts)
LeaderboardRace("Bridge Racer","Fastest time to cross all five bridges in free roam mode (press select to cancel race)",Bridges)
LeaderboardRace("Travelling Salesman","Fastest time to visit all parking lots in free roam mode (press select to cancel race)",ParkingLots)
LeaderboardArcade("Survivalist","Longest time without getting wrecked in survival mode","Survival P1", false)
LeaderboardBlocks("Wild Goose Chase","Most unique city blocks covered without getting wrecked in survival mode")
LeaderboardArcade("Pursuer","Fastest time to catch the criminal in pursuit mode","Pursuit P1", true)

// Rich Presence ------------------------------------------------------------------

rich_presence_conditional_display(
    Playing() && TimerCounting(), 
    "Mission: {0} | ❤ {1} | ⏲ {2}",
    rich_presence_lookup("Mission", StartMissionPointer(), MissionLookup),
    rich_presence_value("Health", CarHealth()),
    rich_presence_value("Time", TimeToCatch(), "FRAMES")
)
rich_presence_conditional_display(
    Playing(), 
    "Mission: {0} | ❤ {1}",
    rich_presence_lookup("Mission", StartMissionPointer(), MissionLookup),
    rich_presence_value("Health", CarHealth())
)
rich_presence_conditional_display(Paused(), "Joyriding paused!")
rich_presence_display("Getting ready to joyride!")