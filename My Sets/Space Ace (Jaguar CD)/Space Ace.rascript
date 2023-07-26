// Space Ace
// #ID = 24063

// -- Memory Accessors -------------------------------------------------------------------------

// $5836: [16-bit BE] Scene State (Same value if reverse or not)
function State() => word_be(0x5836)

// $587B: [8-bit] Current lives
function Lives() => byte(0x587B)

// $588A: [16-bit BE] Scene Frame
function Frame() => word_be(0x588A)

// $5890: [32-bit BE] Scene ID
function SceneID() => dword_be(0x5890)

// $58E3: [8-bit] Level ID?
function LevelID() => byte(0x58E3)

// -- Scene Constants and Dictionaries --------------------------------------------------------

// Scene id's used in the dictionary
Scene_1_Start = 0
Scene_1_Space_Ace = 1
Scene_1_Dexter = 2
Scene_2_Start = 3
Scene_2_Space_Ace = 4
Scene_2_Dexter = 5
Scene_3_Start = 6
Scene_3_Space_Ace = 7
Scene_3_Dexter = 8
Scene_3_Dexter_Rev = 9
Scene_4_Start = 10
Scene_4_Space_Ace = 11
Scene_4_Dexter = 12
Scene_5_Start = 13
Scene_5_Space_Ace = 14
Scene_5_Dexter = 15
Scene_6_Start = 16
Scene_6_Space_Ace = 17
Scene_6_Dexter = 18
Scene_7_Start = 19
Scene_8_Start = 20
Scene_8_Space_Ace = 21
Scene_8_Dexter = 22
Scene_9_Start = 23
Scene_9_Space_Ace = 24
Scene_9_Dexter = 25
Scene_10_Start = 26
Scene_10_Space_Ace = 27
Scene_10_Dexter = 28
Scene_11_Start = 29
Scene_11_Space_Ace = 30
Scene_11_Dexter = 31
Scene_12_Start = 32
Scene_12_Space_Ace = 33
Scene_12_Dexter = 34
Scene_13_Start = 35
Scene_13_End = 36
Title_Scene = 37
Attract_Mode = 38
Continue_Scene = 39

// Scene dictionary [Scene name, Level ID, Scene ID, Key Frame]
SceneInfo = {
    Scene_1_Start: ["Scene 1 Start",1,0x374,0x0],
    Scene_1_Space_Ace: ["Scene 1 Space Ace",1,0x374,0x224],
    Scene_1_Dexter: ["Scene 1 Dexter",1,0x184,0x0],
    Scene_2_Start: ["Scene 2 Start",2,0x294,0x0],
    Scene_2_Space_Ace: ["Scene 2 Space Ace",2,0x294,0x252],
    Scene_2_Dexter: ["Scene 2 Dexter",2,0xe4,0x0],
    Scene_3_Start: ["Scene 3 Start",3,0x2d4,0x0],
    Scene_3_Space_Ace: ["Scene 3 Space Ace",3,0x2d4,0x1d6],
    Scene_3_Dexter: ["Scene 3 Dexter",3,0x154,0x0],
    Scene_3_Dexter_Rev: ["Scene 3 Dexter Rev",3,0x174,0x0],
    Scene_4_Start: ["Scene 4 Start",4,0x2c4,0x0],
    Scene_4_Space_Ace: ["Scene 4 Space Ace",4,0x2c4,0x180],
    Scene_4_Dexter: ["Scene 4 Dexter",4,0x124,0x0],
    Scene_5_Start: ["Scene 5 Start",5,0x284,0x0],
    Scene_5_Space_Ace: ["Scene 5 Space Ace",5,0x284,0x132],
    Scene_5_Dexter: ["Scene 5 Dexter",5,0x124,0x0],
    Scene_6_Start: ["Scene 6 Start",6,0x1c4,0x0],
    Scene_6_Space_Ace: ["Scene 6 Space Ace",6,0x1c4,0x128],
    Scene_6_Dexter: ["Scene 6 Dexter",6,0x114,0x0],
    Scene_7_Start: ["Scene 7 Start",7,0x234,0x0],
    Scene_8_Start: ["Scene 8 Start",8,0x1f4,0x0],
    Scene_8_Space_Ace: ["Scene 8 Space Ace",8,0x1f4,0x148],
    Scene_8_Dexter: ["Scene 8 Dexter",8,0xf4,0x0],
    Scene_9_Start: ["Scene 9 Start",9,0x1a4,0x0],
    Scene_9_Space_Ace: ["Scene 9 Space Ace",9,0x1a4,0x124],
    Scene_9_Dexter: ["Scene 9 Dexter",9,0x144,0x0],
    Scene_10_Start: ["Scene 10 Start",10,0x274,0x0],
    Scene_10_Space_Ace: ["Scene 10 Space Ace",10,0x274,0x150],
    Scene_10_Dexter: ["Scene 10 Dexter",10,0xe4,0x0],
    Scene_11_Start: ["Scene 11 Start",11,0x3b4,0x0],
    Scene_11_Space_Ace: ["Scene 11 Space Ace",11,0x3b4,0x1b0],
    Scene_11_Dexter: ["Scene 11 Dexter",11,0xf4,0x0],
    Scene_12_Start: ["Scene 12 Start",12,0x384,0x0],
    Scene_12_Space_Ace: ["Scene 12 Space Ace",12,0x384,0x108],
    Scene_12_Dexter: ["Scene 12 Dexter",12,0x144,0x0],
    Scene_13_Start: ["Scene 13 Start",13,0x5f4,0x0],
    Scene_13_End: ["Scene 13 End",13,0x5f4,0x7bd],
    Title_Scene: ["Title Scene",0,0xb4,0x0],
    Attract_Mode: ["Attract Mode",0,0x324,0x0],
    Continue_Scene: ["Continue Scene",100,0x114,0x0]
}

// Death id's used in the dictionary
Death_Drill_Press = 100
Death_Sarcastic_Hit = 101
Death_Sarcastic_Hit_Reversed = 102
Death_Melting = 103
Death_Melting_Reversed = 104
Death_Eaten_by_Space_Pup = 105
Death_Eaten_by_Space_Pup_Reversed = 106
Death_Shrink_Wrapped = 107
Death_Shrink_Wrapped_Reversed = 108
Death_Failure_to_Launch = 109
Death_Failure_to_Launch_Reversed = 110
Death_Groots_Death_Pact = 111
Death_Groots_Death_Pact_Reversed = 112
Death_Eaten_by_Hexter = 113
Death_Eaten_by_Hexter_Reversed = 114
Death_Motorcycle_Heaven = 115
Death_Motorcycle_Heaven_Reversed = 116
Death_Tickle_Pit_Dexter = 117
Death_Tickle_Pit_Ace = 118
Death_Tickle_Pit_Dexter_Reversed = 119
Death_Tickle_Pit_Ace_Reversed = 120
Death_Face_Smash_Kick = 121

// Death scene dictionary [Scene name, Level ID, Scene ID]
DeathInfo = {
    Death_Drill_Press: ["Death Drill Press",0x1,0x1b31d40],
    Death_Sarcastic_Hit: ["Death Sarcastic Hit",0x4,0x4b103b0],
    Death_Sarcastic_Hit_Reversed: ["Death Sarcastic Hit Reversed",0x5,0x5cd2520],
    Death_Melting: ["Death Melting",0x6,0x70fdb20],
    Death_Melting_Reversed: ["Death Melting Reversed",0x7,0x82331a0],
    Death_Eaten_by_Space_Pup: ["Death Eaten by Space Pup",0x8,0x8ff6820],
    Death_Eaten_by_Space_Pup_Reversed: ["Death Eaten by Space Pup Reversed",0x9,0x09e0c9a0],
    Death_Shrink_Wrapped: ["Death Shrink Wrapped",0xa,0xa8264f0],
    Death_Shrink_Wrapped_Reversed: ["Death Shrink Wrapped Reversed",0xb,0xb577720],
    Death_Failure_to_Launch: ["Death Failure to Launch",0xc,0xc7216b0],
    Death_Failure_to_Launch_Reversed: ["Death Failure to Launch Reversed",0xd,0xd21b120],
    Death_Groots_Death_Pact: ["Death Groots Death Pact",0x10,0xee8d500],
    Death_Groots_Death_Pact_Reversed: ["Death Groots Death Pact Reversed",0x11,0xfa53630],
    Death_Eaten_by_Hexter: ["Death Eaten by Hexter",0x12,0x10c68bd0],
    Death_Eaten_by_Hexter_Reversed: ["Death Eaten by Hexter Reversed",0x13,0x11aec820],
    Death_Motorcycle_Heaven: ["Death Motorcycle Heaven",0x14,0x12f5fa90],
    Death_Motorcycle_Heaven_Reversed: ["Death Motorcycle Heaven Reversed",0x15,0x143f0ac0],
    Death_Tickle_Pit_Dexter: ["Death Tickle Pit Dexter",0x16,0x15409440],
    Death_Tickle_Pit_Ace: ["Death Tickle Pit Ace",0x16,0x155960d0],
    Death_Tickle_Pit_Dexter_Reversed: ["Death Tickle Pit Dexter Reversed",0x17,0x16a3c4f0],
    Death_Tickle_Pit_Ace_Reversed: ["Death Tickle Pit Ace Reversed",0x17,0x16bc7f20],
    Death_Face_Smash_Kick: ["Death Face Smash Kick",0x18,0x18cda3a0],
}

// Full list of the Dexter and Space Ace scenes
DexterScenes = [Scene_1_Dexter, Scene_2_Dexter, Scene_3_Dexter, Scene_3_Dexter_Rev, Scene_4_Dexter, Scene_5_Dexter, Scene_6_Dexter,
                Scene_8_Dexter, Scene_9_Dexter, Scene_10_Dexter, Scene_11_Dexter, Scene_12_Dexter]
                
SpaceAceScenes = [Scene_1_Space_Ace, Scene_2_Space_Ace, Scene_3_Space_Ace, Scene_4_Space_Ace, Scene_5_Space_Ace, Scene_6_Space_Ace,
                  Scene_8_Space_Ace, Scene_9_Space_Ace, Scene_10_Space_Ace, Scene_11_Space_Ace, Scene_12_Space_Ace]

// Dictionary which translates the levels to the low and high level ID's (in some cases low = high)
Levels = {
    0:[0x0,0x0],
    1:[0x1,0x1],
    2:[0x2,0x3],
    3:[0x4,0x5],
    4:[0x6,0x7],
    5:[0x8,0x9],
    6:[0xa,0xb],
    7:[0xc,0xd],
    8:[0xe,0xf],
    9:[0x10,0x11],
    10:[0x12,0x13],
    11:[0x14,0x15],
    12:[0x16,0x17],
    13:[0x18,0x18],
    100:[0x64,0x64]
}

// Dictionary of all the scene names for the RP
SceneNames = {
    0x0: "Attract Mode",
    0x1: "[Scene 1] There's Borf's Ship",
    0x2: "[Scene 2] First Flight: Asteroids",
    0x3: "[Scene 2] First Flight: Asteroids (reversed)",
    0x4: "[Scene 3] Space Station: Power Cylinders / Video Guards",
    0x5: "[Scene 3] Space Station: Power Cylinders / Video Guards (reversed)",
    0x6: "[Scene 4] Space Station: Security Spheres",
    0x7: "[Scene 4] Space Station: Security Spheres (reversed)",
    0x8: "[Scene 5] Space Station: Space Pups / Robots",
    0x9: "[Scene 5] Space Station: Space Pups / Robots (reversed)",
    0xA: "[Scene 6] Space Station: Trash Masher",
    0xB: "[Scene 6] Space Station: Trash Masher (reversed)",
    0xC: "[Scene 7] Second Flight: Dogfight",
    0xD: "[Scene 7] Second Flight: Dogfight (reversed)",
    0xE: "[Scene 8] Speed Tunnel: Le Grins",
    0xF: "[Scene 8] Speed Tunnel: Le Grins (reversed)",
    0x10: "[Scene 9] Shag's Jungle",
    0x11: "[Scene 9] Shag's Jungle (reversed)",
    0x12: "[Scene 10] Hexter",
    0x13: "[Scene 10] Hexter (reversed)",
    0x14: "[Scene 11] Motorcycle Chase",
    0x15: "[Scene 11] Motorcycle Chase (reversed)",
    0x16: "[Scene 12] Maze of Madness / Water Tank",
    0x17: "[Scene 12] Maze of Madness / Water Tank (reversed)",
    0x18: "[Scene 13] Final Battle with Borf"
}

// -- Helper functions ------------------------------------------------------------

// Triggers when the level id is betweene the low and high values,
// the scene state matches the state ID, and frames transistion from the key
// frame to the next frame.
function KeyScene(scene)
{
    // Parse the info from the scene array
    info = SceneInfo[scene]
    level = info[1]
    levelArray = Levels[level]
    levelLow = levelArray[0]
    levelHigh = levelArray[1]
    stateID = info[2]
    framePrev = info[3]
    frameNext = framePrev + 1   

    // Test if level has one or two values
    if (levelLow == levelHigh)
        levelTrigger = LevelID() == levelLow            
    else
        levelTrigger = LevelID() >= levelLow &&
            LevelID() <= levelHigh
    
    return levelTrigger &&
        State() == stateID &&
        prev(Frame()) == framePrev &&
        Frame() == frameNext
}

// Triggers when the level id matches and
// the scene ID matches the scene
function DeathScene(scene)
{
    // Parse the info from the scene array
    info = DeathInfo[scene]
    levelID = info[1]
    sceneID = info[2]
    framePrev = 0
    frameNext = framePrev + 1   

    return LevelID() == levelID  &&
        SceneID() == sceneID &&
        prev(Frame()) == framePrev &&
        Frame() == frameNext
}

// Look up a key scene and return the level number for that scene
function GetLevel(scene)
{
    info = SceneInfo[scene]
    level = info[1]
    return level
}

// Triggers when the level id goes from the current level to the next
// and the frame is zero.  Note that most level have two ID's, one for the
// regular 
function CompleteScene(level)
{
    if (level == 13)
    {
        // If the last level use the end movie key frame instead
        return KeyScene(Scene_13_End)
    }
    else
    {
        // Figure the two previous levels and the two next levels
        prevLevelArray = Levels[level]
        prevLevelLow = prevLevelArray[0]
        prevLevelHigh = prevLevelArray[1]
        nextLevelArray = Levels[level + 1]
        nextlevelLow = nextLevelArray[0]
        nextlevelHigh = nextLevelArray[1]
    
        // Test if previous level has one or two values
        if (prevLevelLow == prevLevelHigh)
            prevTrigger = prev(LevelID()) == prevLevelLow            
        else
            prevTrigger = prev(LevelID()) >= prevLevelLow &&
                prev(LevelID()) <= prevLevelHigh                
                
        // Test if next level has one or two values
        if (nextlevelLow == nextlevelHigh)
            nextTrigger = LevelID() == nextlevelLow            
        else
            nextTrigger = LevelID() >= nextlevelLow &&
                LevelID() <= nextlevelHigh
    
        return prevTrigger && nextTrigger        
    }
}

// Triggers when the lives memory values decrements
function LostLife() => prev(Lives()) > Lives()

// Triggers when starting a new game
function StartGame() 
{
    // Grab the attract mode scene ID
    info = SceneInfo[Attract_Mode]
    stateID = info[2]
    
    return prev(State()) == stateID &&
        prev(LevelID()) == 0x0 && 
        LevelID() == 0x64
}

// -- Basic Level Challeneges -----------------------------------------------------------------------

// Route progression challenge
// Starts when the start scene plays
// Cancels when the opposite route plays or on death
// Submits when the level is complete
function RouteChallenge(start, cancels)
{
    // Setup the start, cancel, and submit conditions
    startScene = KeyScene(start)
    
    cancelScenes = []
    for cancel in cancels
    {
        array_push(cancelScenes,KeyScene(cancel))
    }
    cancelDeath = LostLife()
    level = GetLevel(start)
    submitComplete = CompleteScene(level)
    
    return once(startScene) &&
        all_of(cancelScenes, c => never(c)) &&
        never(cancelDeath) &&
        trigger_when(submitComplete)
}

// Basic progression challenge
// Starts when the start scene plays
// Cancels on death
// Submits when the level is complete
function LevelChallenge(start)
{
    // Setup the start, cancel, and submit conditions
    startScene = KeyScene(start)
    cancelDeath = LostLife()
    level = GetLevel(start)
    submitComplete = CompleteScene(level)
    
    return once(startScene) &&
        never(cancelDeath) &&
        trigger_when(submitComplete)
}

achievement("Bravely Ran Away","Complete Dexter route of scene 1", 2, RouteChallenge(Scene_1_Start, [Scene_1_Space_Ace]))
achievement("Cosmic Avenger","Complete Space Ace route of scene 1", 2, RouteChallenge(Scene_1_Start, [Scene_1_Dexter]))

achievement("Dodging Asteroid Pinballs","Complete Dexter route of scene 2", 3, RouteChallenge(Scene_2_Start,[Scene_2_Space_Ace]))
achievement("Meteoric Menace","Complete Space Ace route of scene 2", 3, RouteChallenge(Scene_2_Start, [Scene_2_Dexter]))

achievement("Electric Containment Pods","Complete Dexter route of scene 3", 5, RouteChallenge(Scene_3_Start, [Scene_3_Space_Ace]))
achievement("Ace of Destruction","Complete Space Ace route of scene 3", 5, RouteChallenge(Scene_3_Start, [Scene_3_Dexter, Scene_3_Dexter_Rev]))

achievement("Surfing with the Aliens","Complete Dexter route of scene 4", 5, RouteChallenge(Scene_4_Start, [Scene_4_Space_Ace]))
achievement("Jumping Juggernaut","Complete Space Ace route of scene 4", 5, RouteChallenge(Scene_4_Start, [Scene_4_Dexter]))

achievement("Release the Hounds","Complete Dexter route of scene 5", 5, RouteChallenge(Scene_5_Start, [Scene_5_Space_Ace]))
achievement("Hound Hunter","Complete Space Ace route of scene 5", 5, RouteChallenge(Scene_5_Start, [Scene_5_Dexter]))

achievement("Trash Masher","Complete Dexter route of scene 6", 5, RouteChallenge(Scene_6_Start, [Scene_6_Space_Ace]))
achievement("Swamp Stomper","Complete Space Ace route of scene 6", 5, RouteChallenge(Scene_6_Start, [Scene_6_Dexter]))

achievement("Later Space Invader","Complete scene 7", 5, LevelChallenge(Scene_7_Start))

achievement("Le Grin's Reckoning","Complete Dexter route of scene 8", 5, RouteChallenge(Scene_8_Start, [Scene_8_Space_Ace]))
achievement("Ace Marksman","Complete Space Ace route of scene 8", 5, RouteChallenge(Scene_8_Start, [Scene_8_Dexter]))

achievement("Shag's Jungle","Complete Dexter route of scene 9", 5, RouteChallenge(Scene_9_Start, [Scene_9_Space_Ace]))
achievement("Alien Annihilator","Complete Space Ace route of scene 9", 5, RouteChallenge(Scene_9_Start, [Scene_9_Dexter]))

achievement("Dexterganer","Complete Dexter route of scene 10", 5, RouteChallenge(Scene_10_Start, [Scene_10_Space_Ace]))
achievement("Giant Slayer","Complete Space Ace route of scene 10", 5, RouteChallenge(Scene_10_Start, [Scene_10_Dexter]))

achievement("Motorcycles in Space","Complete Dexter route of scene 11", 5, RouteChallenge(Scene_11_Start, [Scene_11_Space_Ace]))
achievement("Fearless Duo","Complete Space Ace route of scene 11", 5, RouteChallenge(Scene_11_Start, [Scene_11_Dexter]))

achievement("On Rocket Powered Roller Skates","Complete Dexter route of scene 12", 5, RouteChallenge(Scene_12_Start, [Scene_12_Space_Ace]))
achievement("Skating Sensation","Complete Space Ace route of scene 12", 5, RouteChallenge(Scene_12_Start, [Scene_12_Dexter]))

achievement("The Final Showdown","Complete scene 13 and beat the game", 10, LevelChallenge(Scene_13_Start))

// -- Route Whole Game Challeneges -----------------------------------------------------------------

// Takes a list of routes and cancel the challenge if the player goes on any of those routes
// Starts at the start of the game
// Cancels if any of the scene              
function GameChallenge(routes)
{
    masterReset = never(KeyScene(Title_Scene))

    start = StartGame()
    
    // Build an array of routes that will cancel the scene.
    pauseRoutes = []   
    for route in routes
    {
        // Pause when the player goes down the wrong path
        pause = KeyScene(route)
    
        // Reset the pause if the player dies on the same level as the route
        level = GetLevel(route)
        levelArray = Levels[level]
        levelLow = levelArray[0]
        levelHigh = levelArray[1]
    
        if (levelLow == levelHigh)
            resetPause = prev(LevelID()) == levelLow            
        else
            resetPause = prev(LevelID()) >= levelLow &&
                prev(LevelID()) <= levelHigh
                
        resetPause = resetPause && LostLife()
        
        // Use disable when to reset the pause if the player dies on the same level as the wrong path
        array_push(pauseRoutes, disable_when(pause, resetPause))
    }
        
    submit = CompleteScene(12)
    
    return masterReset && (
        always_false() || 
        once(start) &&
        all_of(pauseRoutes, b => b) && 
        trigger_when(submit) )
}

achievement("The Meek Shall Inherit the Universe","Complete all of the Dexter routes up to the end of scene 12 at least once in a playthrough", 25, GameChallenge(SpaceAceScenes))
achievement("Strength in Adversity","Complete all of the Space Ace routes up to the end of scene 12 at least once in a playthrough", 25, GameChallenge(DexterScenes))

// -- 1CC challenge ----------------------------------------------------------------------------------


// 1CC Challenge
// Starts at the start of the game
// Cancels on the continue scene
// Submits when beating the game
function NoContinueChallenge()
{
    start = StartGame()
    cancel = KeyScene(Continue_Scene)
    submit = CompleteScene(13)
    
    return once(start) &&
        never(cancel)  && 
        trigger_when(submit)
}

achievement("The Real Space Ace","Complete the game without using a continue", 50, NoContinueChallenge())

// -- Death scenes -----------------------------------------------------------------------------------

// Challegne to find a death scene in a certain level
// Start when the scene starts
// Cancel when the player dies
// Submit when the death scene is played
function DeathChallenge(start, deaths)
{
    // Setup the start, cancel, and submit conditions
    startScene = KeyScene(start)
    cancelDeath = LostLife()
    
    level = GetLevel(start)
    cancelNextLevel = CompleteScene(level)    
    
    deathScenes = []   
    for death in deaths
    {
        array_push(deathScenes, DeathScene(death))
    }
    
    return once(startScene) &&
        never(cancelDeath) &&
        never(cancelNextLevel) &&
        trigger_when(any_of(deathScenes, b => trigger_when(b)))
}

achievement("Drill Press","Get crushed by a drill in scene 1", 0,DeathChallenge(Scene_1_Start, [Death_Drill_Press]))
achievement("Oh Wow, I've Been Hit!","Get hit by a laser blaster in scene 3", 0,DeathChallenge(Scene_3_Start, [Death_Sarcastic_Hit, Death_Sarcastic_Hit_Reversed]))
achievement("I'm Melting","Get melted by a laser blast in scene 4", 0,DeathChallenge(Scene_4_Start, [Death_Melting, Death_Melting_Reversed]))
achievement("A Space Ace Treat","Get eaten by a space pup in scene 5", 0,DeathChallenge(Scene_5_Start, [Death_Eaten_by_Space_Pup, Death_Eaten_by_Space_Pup_Reversed]))
achievement("Vacuumed Sealed Freshness","Get shrink wrapped and launched out an air hatch in scene 6", 0,DeathChallenge(Scene_6_Start, [Death_Shrink_Wrapped, Death_Shrink_Wrapped_Reversed]))
achievement("Failure to Launch","Get burned up in a space station fire in scene 7", 0,DeathChallenge(Scene_7_Start, [Death_Failure_to_Launch, Death_Failure_to_Launch_Reversed]))
achievement("Groots Death Pact","Get thrown off a cliff with the Groots (blue cats) in scene 9", 0,DeathChallenge(Scene_9_Start, [Death_Groots_Death_Pact, Death_Groots_Death_Pact_Reversed]))
achievement("Consume Thyself","Get eaten by the disembodied head of Hexter in scene 10", 0,DeathChallenge(Scene_10_Start, [Death_Eaten_by_Hexter, Death_Eaten_by_Hexter_Reversed]))
achievement("Motorcycle Heaven","Get to motorcycle heaven with Kimberly in scene 11", 0,DeathChallenge(Scene_11_Start, [Death_Motorcycle_Heaven, Death_Motorcycle_Heaven_Reversed]))
achievement("The Tickle Pit","Get stuck in the tickle pit in scene 12", 0,DeathChallenge(Scene_12_Start, [Death_Tickle_Pit_Dexter, Death_Tickle_Pit_Ace, Death_Tickle_Pit_Dexter_Reversed, Death_Tickle_Pit_Ace_Reversed]))
achievement("Fragile Good Looks","Get kicked so hard you face falls to pieces in scene 13", 0,DeathChallenge(Scene_13_Start, [Death_Face_Smash_Kick]))

// -- Leaderboards -----------------------------------------------------------------------------------

// Leaderboard to count the number of deaths in a run
leaderboard(
    "Space Ace",
    "Least number of lives to beat the game",
    StartGame(),
    KeyScene(Title_Scene),
    KeyScene(Scene_13_End),
    measured(LostLife()),
    format = "VALUE",
    lower_is_better = true
)

// -- Rich presence -----------------------------------------------------------------------------------

// Rich presence with and without lives
rich_presence_conditional_display(Lives() == 0,
    "{0}",
    rich_presence_lookup("Stage", LevelID(), SceneNames, "Loading...")
)

rich_presence_display("{0}, {1} ❤️",
    rich_presence_lookup("Stage", LevelID(), SceneNames, "Loading..."),
    rich_presence_value("Lives", Lives())
)
