// Crackpots
// #ID = 13064

// $0014: [8-bit] Number of falling pots
function falling_pots() => byte(0x0014)

// $0016: [8-bit] Game Mode
//        0x0 = 1 player
//        0x1 = 2 player
function mode() => byte(0x000016)

// $0017: [8-bit] Game State
//        0x0 = menu
//        0x1 = demo
//        * = in game (increments everytime the game resets)
function game_state() => byte(0x000017)

// $003c: [8-bit] How many bonus bugs remain (1 to 6)
function bonus() => byte(0x00003c)

// $003e: [8-bit] Last pot from the bottom (top=0x79, decreases as falls 
//                and then resets, lands at -1 the value in 0x0043)
function last_pot() => byte(0x00003e)

// $0041: [8-bit] How many bugs are remaining (0 to 12)
//                A fter level completes this goes negative by the number 
//                of bonus bugs (-5 to 0)
function bugs_remaining() => byte(0x000041)

// $0043: [8-bit] How much of the building has been eaten
function building() => byte(0x000043)
building_lookup = {   
    0x06: "brand new building", 
    0x0e: "building with one floor devoured",
    0x16: "building with two floors devoured", 
    0x1e: "building with three floors devoured",
    0x26: "building with four floors devoured", 
    0x2e: "building with five floors devoured",
    0x36: "condemned building"
}

// $005c: [8-bit] BCD Score 0000xx
function ones() => low4(0x00005c)
function tens() => high4(0x00005c)
// $005b: [8-bit] BCD Score 00xx00
function hundreds() => low4(0x00005b)
function thousands() => high4(0x00005b)
// $005a: [8-bit] BCD Score xx0000
function tenthousands() => low4(0x00005a)
function hundredthousands() => high4(0x00005a)

// $005a: [24-bit] BCD Complete Score
function score() => tbyte(0x00005a)

// $0071: [8-bit] Level/Multiplier
function multiplier() => byte(0x000071)

// $0073: [8-bit] Bug wave type 
//        0x0 = Black
//        0x1 = Blue
//        0x2 = Red
//        0x3 = Green
function bug_wave() => byte(0x000073)
bug_wave_lookup = {   
    0x0: "black", 
    0x1: "blue",
    0x2: "red", 
    0x3: "green"
}

// Macro for testing if 1 player and currently playing
function in_game() => mode() == 0 && game_state() >= 2

function start_lb()  => mode() == 0 && game_state() > 2

// Macro for resetting the hits when at the title, demo, in two player mode, 
// or if the player presses reset.
function in_menu() => never(mode() == 1) && never(game_state() < 2) 

// Macro for resetting the hits when the player presses reset
function player_reset() => never(prev(game_state()) < game_state())

// Macro for detecting when the building has become condemed
function end_game() => prev(building()) == 0x2e && building() == 0x36

// Macro for testing if the level has incremented
function completion(level) => prev(multiplier()) == level-1 && multiplier() == level

// ---------------------------------------------------------------------------
// Wave Achievements
// This group of achievements counts how many waves were completed from wave 1
// ---------------------------------------------------------------------------
function achievementWaves(name, waves, building_height, points) {
    setup = in_menu() && player_reset()
    text = "Complete " + waves + " waves!"
    
    
    if(building_height == 0xff)
    {
        // If 0xff then make it a deathless run
        setup = setup && never(prev(building()) < building())
        text = "Complete " + waves + " waves without losing a floor!"
    
    }
    else if(building_height > 0x00)
    {
        // If non zero then achievment is only achievemnt on spefic floor
        setup = setup && never(building() != building_height)
        text = "Complete " + waves + " waves while on the last floor before a game over!"
    }
        
    achievement(
        name,
        text,
        points=points,    
        trigger=
            setup &&
            measured(
                tally(
                    waves,
                    prev(bug_wave()) == 0 && bug_wave() == 1,
                    prev(bug_wave()) == 1 && bug_wave() == 2,
                    prev(bug_wave()) == 2 && bug_wave() == 3,
                    prev(bug_wave()) == 3 && bug_wave() == 0,
                    always_false()
                )
            )
    )
}
achievementWaves("Wave Novice", 10, 0, 2)
achievementWaves("Wave Expert", 20, 0, 5)
achievementWaves("Wave Master", 30, 0, 10)
achievementWaves("Wave Champion", 40, 0, 25)
achievementWaves("Hobby Gardener", 5, 0xff, 3)
achievementWaves("Green Thumb", 10, 0xff, 5)
achievementWaves("Landscaper", 15, 0xff,10)
achievementWaves("Horticulturist", 20, 0xff, 25)
achievementWaves("Groundskeeper", 5, 0x2e, 5)

// ---------------------------------------------------------------------------
// Bug Hunter Achievements
// This group of achievements are for tracking the hidden multipier which 
// increments when you complete 4 waves in a row and decrements when you lose
// a floor. The multipier caps at 8x however, in testing this was difficult
// to achieve so it only tracks up to 5x.
// ---------------------------------------------------------------------------
function achievementBugHunter(name, level, points) {
    achievement(
        name,
        "Get a " + level + "x multiplier! Beat all four bug waves to " + 
        "increase a multiplier, losing a floor will decrease a multiplier.", 
        points=points,    
        trigger=
            in_game() && 
            completion(level-1)
    )
}
achievementBugHunter("Rookie Bug Hunter", 2, 3)
achievementBugHunter("Expert Bug Hunter", 3, 5)
achievementBugHunter("Master Bug Hunter", 4, 5)
achievementBugHunter("Champion Bug Hunter", 5, 10)

// ---------------------------------------------------------------------------
// Bug Exterminator Achievements
// This group of achievements are for surviving a wave of each colour bug
// without allowing any of the bugs into the building.
// ---------------------------------------------------------------------------
function achievementBugExterminator(name, bug, points) {
    if(bug == "black") wave = 0
    else if(bug == "blue") wave = 1
    else if(bug == "red") wave = 2
    else if(bug == "green") wave = 3
    
    achievement(
        name,
        "Survive a wave of " + bug + " bugs without losing a bonus bug!", 
        points=points,    
        trigger=
            in_game() &&
            prev(bugs_remaining()) == 0xfb &&
            bugs_remaining() == 0xfa &&
            bug_wave() == wave
    )
}
achievementBugExterminator("Black Bug Exterminator", "black", 2)
achievementBugExterminator("Blue Bug Exterminator", "blue", 5)
achievementBugExterminator("Red Bug Exterminator", "red", 10)
achievementBugExterminator("Green Bug Exterminator", "green", 10)

// ---------------------------------------------------------------------------
// Bug Combo Achievements
// This group of achievements checks how many bugs are squashed in a combo. 
// Combos are active while pots are still falling and the combo count is
// incremented by score changes. If two bugs are squashed in one frame it 
// would be counted as one. Since the score of each bug is dependent on the 
// bug colour and multiplier it would require many alts to cover all the 
// possiblilties. In testing it didn't look like double kills counting as
// one was an issue since each pot is dropped at a different time.
// ---------------------------------------------------------------------------
function achievementCombo(name, combo, points) {
    achievement(
        name,
        "Squash " + combo + " bugs in a combo! Combos end when all the " + 
        "pots have been reset.", 
        points=points,    
        trigger=
            in_game() &&
            never(last_pot() == 0x79) &&
            repeated(combo, score() != prev(score()))
    )
}
achievementCombo("Two for One", 2, 2)
achievementCombo("Triple Play", 3, 3)
achievementCombo("Five in a Row", 5, 5)
achievementCombo("Seven in One Blow", 7, 10)

// ---------------------------------------------------------------------------
// Score Achievements
// This group of achievements are for when the score goes above the passed 
// variables, only tests the thousands and ten thousands column.
// ---------------------------------------------------------------------------
function achievementScore(name, x10000, x1000, points) {
    achievement(
        name,
        "Score "+ x10000 + "" + x1000 + ",000 points without losing the game!", 
        points=points,    
        trigger=
            in_game() &&
            tenthousands() >= x10000 && tenthousands() <= 9 &&
            thousands() >= x1000 && thousands() <= 9
    )
}
achievementScore("Pest Control", 2, 5, 5)
achievementScore("Rooftop Defender", 5, 0, 10)
achievementScore("Activision Crackpot", 7, 5, 25)

// ---------------------------------------------------------------------------
// Dynamic Rich Presence
// ---------------------------------------------------------------------------
rich_presence_conditional_display(game_state() == 0, "In Menu")
rich_presence_conditional_display(game_state() == 1, "Watching Demo")
rich_presence_display("Multiplier {0}x | Score {1} | Potsy is on top of a {2}, " +
        "fighting an infestation of {3} bugs.",
    rich_presence_value("Multiplier", multiplier() + 1),
    rich_presence_value("Score",
        bcd(ones()) + 
        bcd(tens()) * 10 + 
        bcd(hundreds()) * 100 +
        bcd(thousands()) * 1000 + 
        bcd(tenthousands()) * 10000 +
        bcd(hundredthousands()) * 100000),
    rich_presence_lookup("Building", building(), building_lookup),
    rich_presence_lookup("Bugs", bug_wave(), bug_wave_lookup)
)

// ---------------------------------------------------------------------------
// Leaderboards
// ---------------------------------------------------------------------------
leaderboard(
    "Highest Score",
    "Starting from wave 1, highest score before the building is condemned!",
    start_lb(),
    always_false(),
    end_game(),
        bcd(ones()) + 
        bcd(tens()) * 10 +
        bcd(hundreds()) * 100 +
        bcd(thousands()) * 1000 + 
        bcd(tenthousands()) * 10000 + 
        bcd(hundredthousands()) * 100000    
)
leaderboard(
    "Highest Wave",
    "Starting from wave 1, most number of waves completed before the building is condemned!",
    start_lb(),
    always_false(),
    end_game(),
    player_reset() &&
    measured(
        tally(
            0,
            prev(bug_wave()) == 0 && bug_wave() == 1,
            prev(bug_wave()) == 1 && bug_wave() == 2,
            prev(bug_wave()) == 2 && bug_wave() == 3,
            prev(bug_wave()) == 3 && bug_wave() == 0,
            always_false()
        )
    )
)