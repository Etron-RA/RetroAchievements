// Joyrider
// #ID = 24744

// $0422: [8-bit] Camera X
function CameraX() => byte(0x000422)

// $0424: [8-bit] Camera Y
function CameraY() => byte(0x000424)

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


// $0dc2: [8-bit] Sprite Frame Animation (bits 0 to 5)
// $0DCC: [16-bit] Timer Seconds (Display rolls at 4:16)
function Timer() => word(0x000DCC)


function TimeToCatch() {
    return word(0x000DCC) * 60 +
        bit5(0xdc2) * 30 + 
        bit4(0xdc2) * 15 + 
        bit3(0xdc2) * 7 + 
        bit2(0xdc2) * 4 +
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


// $0F1F: [8-bit] Mission Flags #2
//        bit 0 - Mission Complete
//        bit 1 - Is Race
//        bit 2 - Fail If Lose Mission Car;
//        bit 3 - Block NPC Spawning
//        bit 4 - Player Immunity
//        bit 5 - Player Invincible
//        bit 6 - Demo
function Complete() => bit0(0x000F1F)

function TimeSpan(minutes, seconds, milliseconds)
{
    return minutes * 3600 +
        seconds * 60 +
        milliseconds
}

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

function MissionComplete(mission)
{
    missionArray = Missions[mission]
    missionStart = missionArray[0]
    return Playing() && 
        StartMissionPointer() == missionStart &&
        prev(Complete()) < Complete()
}

function Wrecked()
{
    return Playing() &&
        prev(CarHealth()) > 0 &&
        CarHealth() == 0
}

function MissionFailed()
{
    return Playing() &&     
    prev(CurrentMissionPointer()) != 0x7856 &&
    CurrentMissionPointer() == 0x7856
}

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


function TimedRace(locations, timeout)
{
    missionArray = Missions["Free Roam"]
    freeRoam = missionArray[0]

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
        never(StartMissionPointer() != freeRoam) &&
        all_of(timeoutArray, t => never(t))
    
    // Measure how many checkpoint have ben reached
    measure = measured(tally(length(locations),goalArray))
    
    // Trigger when all checkpoints have been reached
    trigger = trigger_when(tally(length(locations),goalArray)) 
        
    return start && cancel && ( measure  || trigger)
}

function LeaderboardRace(name, description, locations)
{
    missionArray = Missions["Free Roam"]
    freeRoam = missionArray[0]
    
    // Create start array for detect when player is in one checkpoint
    // Create goal array for when the player has been in all the checkpoints
    startArray = []
    goalArray = []
    for location in locations
    {
        array_push(startArray, InArea(location))        
        array_push(goalArray,once(InArea(location)))
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
for mission in Missions
{
    achievement("Start " + mission + " mission", "Start " + mission + " mission", 0, MissionStart(mission))
    achievement("Complete " + mission + " mission", "Complete " + mission + " mission", 0, MissionComplete(mission))
}

for Locations in [Shortcuts, Bridges, ParkingLots]
{
    for location in Locations
    {
        name = location[0]
        achievement(name, name, 0, Playing() && InArea(location))
    }
}

achievement("Wrecked!", "Wrecked!", 0, Wrecked())
achievement("Main Menu", "Main Menu", 0, MainMenu())
achievement("Mission Failed", "Mission Failed", 0, MissionFailed())

achievement("Shortcut Race","Shortcut Race", 0, TimedRace(Shortcuts, TimeSpan(0,60,0)))
achievement("Bridge Race","Bridge Race", 0, TimedRace(Bridges, TimeSpan(3,0,0)))
achievement("Parking Lot Race","Parking Lot Race", 0, TimedRace(ParkingLots, TimeSpan(5,0,0)))

LeaderboardMission("Bank Job","Fastest time to complete Bank Job mission","Bank Job")
LeaderboardMission("Collector","Fastest time to complete Collect mission","Collector")
LeaderboardMission("Street Race","Fastest time to complete Street Race mission","Street Race")
LeaderboardMutliMissions("Story Mode","Fastest time to complete all three story missions","Bank Job","Street Race")
LeaderboardRace("Shortcut","Fastest time to cross both shortcuts bridges in free roam mode (press select to cancel race)",Shortcuts)
LeaderboardRace("Bridge Racer","Fastest time to cross all five bridges in free roam mode (press select to cancel race)",Bridges)
LeaderboardRace("Travelling Salesman","Fastest time to visit all parking lots in free roam mode (press select to cancel race)",ParkingLots)
LeaderboardArcade("Survivalist","Longest time with getting wrecked in survivial mode","Survival P1", false)
LeaderboardArcade("Pursuer","Fastest time to catch the criminal in prusuit mode","Pursuit P1", true)