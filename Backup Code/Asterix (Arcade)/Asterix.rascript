// Asterix
// #ID = 11984

// $4098: Looping Frame Counter
function Frames() => word(0x004098)
// $40b3: Credits
function Credits() => byte(0x0040b3)
// $40D2: Act ID
//        01 = 1 (Village)
//        02 = 2 (Egypt)
//        03 = 3 (Britain)
//        04 = 4 (Spain)
//        05 = 5 (Spain)
//        06 = 6 (Magic Carpet, India)
//        07 = 7 (Asterix vs Caesar @ Colosseum)
function ActID() => byte(0x0040D2)
// $40D9: SceneID
//        Starts at 00 each act.
function SceneID() => byte(0x0040D9)
// $4102: Act Status
//        01->02->03 = loading act
//        04 = act started
//        05 = act completed
//        06 = bonus stage started
//        07 = bonus stage complete
//        00 = transitions
function ActStatus() => byte(0x004102)
// $42AB: Boss Fight Started
//        01 = Yes
//        00 = No
//        
//        NB. Only works in acts 1-4 & 6
function BossFight() => byte(0x0042AB)
// $44AE: Game State
//        01 = Active Gameplay
//        00 = Attractmode, Continue Screen, Act Transition etc
function GameState() => byte(0x0044AE)
// $4605: Lives
//        01 = 1 Life
//        00 = Dead
function Lives() => byte(0x004605)
// $507F: Player 2 Movement/Action
//        01/02 = Stand/Walk on ground
//        03 = Jumping
//        04 = Running
//        09 = Powerpunch loaded
//        0a = Powerpunch loaded walking
//        89/8a = Powerpunch
//        0b/0d = Grab
//        18 = Kiss by Panacea
//        19 = Powerup
//        21/22 = Stand/Swim in Water
//        12 = Falling thru hole
//        30 = Hit by enemy
//        32 = Knockback
//        33 = Hit by enemy in air
//        38 = Electrocuted
//        3a = Woof / Oink
//        3c = Squished by stone
//        40 = Dead
//        45 = Falling off carpet
//        46 = Falling into water from carpet
//        83 = Hanging from Vine
function Player2Moves() => byte(0x00507F)
// $7F96: Dipswitch: Lives 00-08 (Default 02)
function DipswitchLives() => byte(0x007F96)
// $7F99: Dipswitch: Difficulty 00-07 (Default 04)
function DipswitchDifficulty() => byte(0x007F99)
// $7F9D: Dipswitch: Race Select (Default 00)
function DipswitchRace() => byte(0x007F9D)

// Common flags that will cancel boss run
function Deathless()
{
    trigger = never(DipswitchLives() != 0) &&
              never(DipswitchDifficulty() != 0) &&
              never(DipswitchRace() != 0) && 
              never(Player2Moves() > 1) &&
              never(prev(Lives()) > Lives()) &&
              never(prev(Credits()) > Credits())
    return trigger
}

// Test that a scene was complete without the player dying
// act = act number that scene is in
// scene = the scene to be completed
function DeathlessScene(act, scene)
{
    trigger = once(
                  ActID() == act &&
                  prev(SceneID()) == scene - 1 &&
                  SceneID() == scene
              ) &&
              trigger_when(
                  prev(ActStatus()) == 4 &&
                  ActStatus() == 5
              ) &&
              Deathless()
    return trigger
}

// Test that boss was killed without the player dying
// act = act number that boss is in
// scene = the sene that the boss is in
function DeathlessBoss(act, scene)
{
    trigger = once(
                  ActID() == act &&
                  SceneID() == scene && 
                  prev(BossFight()) == 0 &&
                  BossFight() == 1 
              ) &&
              trigger_when(
                  prev(BossFight()) == 1 &&
                  BossFight() == 0 
              ) &&
              Deathless()
    return trigger
}

// Timed scene that must be completed before the timer expires
// act = the current act being timed
// scene = the current scene being timed
// last = "true" if last scene otherwise "false"
// minutes = the time for the scene in minutes
// seconds = the time for the scene in minutes
function TimedScene(act, scene, last, minutes, seconds)
{
    if (scene == 0)
    {
        start = prev(ActStatus()) == 3 &&
                ActStatus() == 4  &&
                ActID() == act &&
                SceneID() == scene
    }
    else
    {
        start = ActID() == act &&
                prev(SceneID()) == scene - 1 &&
                SceneID() == scene
    }
    
    if (last == "true")
    {
        end = prev(ActStatus()) == 4 &&
              ActStatus() == 5
    }
    else
    {
        end = prev(SceneID()) == scene &&
              SceneID() == scene + 1
    }
    
    trigger = once(start) &&
              trigger_when(end) &&
              never(DipswitchLives() != 0) && 
              never(DipswitchDifficulty() != 0) && 
              never(DipswitchRace() != 0) && 
              never(Player2Moves() > 1) &&
              never(
                  repeated((minutes * 60 + seconds) * 60, 
                      GameState() == 1 &&
                      ActID() == act && 
                      SceneID() == scene && 
                      prev(Frames()) != Frames()
                  )
              )
    return trigger
}

achievement(
    title = "Mastered: Hoodunnit and Owzat", description = "Defeat carpet riding Hoodunnit and Owzat without losing a life.", points = 25,
    id = 129671, badge = "142596", published = "10/16/2020 9:11:15 PM", modified = "11/7/2020 2:00:23 PM",
    trigger = DeathlessBoss(6, 3)
)

achievement(
    title = "Mastered: Mountain Bandit", description = "Defeat the bandit on the top of the mountain without losing a life.", points = 25,
    id = 129672, badge = "142597", published = "10/16/2020 9:11:17 PM", modified = "11/7/2020 2:00:25 PM",  
    trigger = DeathlessBoss(4, 0)
)

achievement(
    title = "Mastered: Slaves", description = "Defeat both slaves on the boat without losing a life.", points = 25,
    id = 129673, badge = "142598", published = "10/16/2020 9:11:19 PM", modified = "11/7/2020 2:00:26 PM",
    trigger = DeathlessBoss(3, 0)
)

achievement(
    title = "Mastered: Iris", description = "Defeat Iris in Egypt without losing a life.", points = 25,
    id = 129674, badge = "142599", published = "10/16/2020 9:11:21 PM", modified = "11/7/2020 2:00:28 PM",
    trigger = DeathlessBoss(2, 3)
)

achievement(
    title = "Mastered: Square Formation Army", description = "Defeat the square formation army in the village without losing a life.", points = 25,
    id = 129675, badge = "142600", published = "10/16/2020 9:11:22 PM", modified = "11/7/2020 2:00:29 PM",
    trigger = DeathlessBoss(1, 0)
)

achievement(
    title = "Mastered: Bull", description = "Defeat the bull in the spanish arena without losing a life.", points = 25,
    id = 129676, badge = "142601", published = "10/16/2020 9:11:24 PM", modified = "11/7/2020 2:00:32 PM",
    trigger = DeathlessScene(5, 1)
)

achievement(
    title = "Spain (Express)", description = "Complete section 1 in act 5 within 4 minutes.", points = 10,
    id = 129670, badge = "142561", published = "10/16/2020 9:11:14 PM", modified = "11/7/2020 2:00:21 PM",
    trigger = TimedScene(5, 0, "false", 4, 0)
)

achievement(
    title = "Village (Express)", description = "Complete act 1 by defeating the square formation army within 2 minutes and 30 seconds.", points = 10,
    id = 129657, badge = "142543", published = "10/16/2020 9:10:47 PM", modified = "11/7/2020 2:00:00 PM",
    trigger = TimedScene(1, 0, "true", 2, 30)
)

achievement(
    title = "Egypt: Section 1 (Express)", description = "Complete section 1 in act 2 within 1 minute 50 seconds.", points = 10,
    id = 129664, badge = "142544", published = "10/16/2020 9:11:02 PM", modified = "11/7/2020 2:00:13 PM",
    trigger = TimedScene(2, 0, "false", 1, 50)
)

achievement(
    title = "Egypt: Section 2 (Express)", description = "Complete section 2 in act 2 within 1 minute 17 seconds.", points = 10,
    id = 129665, badge = "142545", published = "10/16/2020 9:11:04 PM", modified = "11/7/2020 2:00:15 PM",
    trigger = TimedScene(2, 1, "false", 1, 17)
)

achievement(
    title = "Egypt: Section 3 (Express)", description = "Complete section 3 in act 2 within 15 seconds.", points = 10,
    id = 129666, badge = "142546", published = "10/16/2020 9:11:06 PM", modified = "11/7/2020 2:00:16 PM",
    trigger = TimedScene(2, 2, "false", 0, 15)
)

achievement(
    title = "Egypt: Section 4 (Express)", description = "Complete section 4 in act 2 within 2 minute 10 seconds.", points = 10,
    id = 129667, badge = "142547", published = "10/16/2020 9:11:08 PM", modified = "11/7/2020 2:00:17 PM",
    trigger = TimedScene(2, 3, "true", 2, 10)
)

achievement(
    title = "Britain (Express)", description = "Complete act 3 within 3 minutes.", points = 10,
    id = 129668, badge = "142548", published = "10/16/2020 9:11:09 PM", modified = "11/7/2020 2:00:18 PM",
    trigger = TimedScene(3, 0, "true", 3, 0)
)

achievement(
    title = "Mountain (Express)", description = "Complete section 1 in act 4 within 3 minutes.", points = 10,
    id = 129669, badge = "142549", published = "10/16/2020 9:11:12 PM", modified = "11/7/2020 1:59:55 PM",
    trigger = TimedScene(4, 0, "false", 3, 0)
)

achievement(
    title = "India: Palace (Express)", description = "Complete the last palace section in act 6 within 2 minutes.", points = 10,
    id = 129677, badge = "142562", published = "10/16/2020 9:11:28 PM", modified = "11/7/2020 2:00:31 PM",
    trigger = TimedScene(6, 3, "true", 2, 0)
)

achievement(
    title = "Rome: Streets (Express)", description = "Complete the streets section in act 7 within 1 minutes 10 seconds.", points = 10,
    id = 129678, badge = "142603", published = "10/16/2020 9:11:30 PM", modified = "11/7/2020 2:00:34 PM",
    trigger = TimedScene(7, 0, "false", 1, 10)
)