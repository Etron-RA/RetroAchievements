// Crackpots
// #ID = 13064

// $0016: [8bit] Game Mode
//        0x0 = 1 player
//        0x1 = 2 player
function mode() => byte(0x000016)

// $0017: [8bit] Game State
//        0x0 = menu
//        0x1 = demo
//        * = in game
function game_state() => byte(0x000017)

// $003c: [8bit] How many bonus bugs remain (1 to 6)
function bonus() => byte(0x00003c)

// $0041: [8bit] How many bugs are remaining (0 to 12)
//               After level completes this goes negative by the number of bonus bugs (-5 to 0)
function bugs_remaining() => byte(0x000041)

// $0043: [8bit] How much of the building has been eaten
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

// $005c: [8bit] BCD Score 0000xx
function ones() => low4(0x00005c)
function tens() => high4(0x00005c)
// $005c: [8bit] BCD Score 00xx00
function hundreds() => low4(0x00005b)
function thousands() => high4(0x00005b)
// $005c: [8bit] BCD Score xx0000
function tenthousands() => low4(0x00005a)
function hundredthousands() => high4(0x00005a)

// $0071: [8bit] Level/Multiplier
function multiplier() => byte(0x000071)

// $0073: [8bit] Bug wave type 
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
function ingame() => mode() == 0 && game_state() >= 2

// Macro for testing if the level has incremented
function completion(level) => prev(multiplier()) == level && multiplier() == level+1

achievement(
    "Rookie Bug Hunter",
    "Get a 2x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=5,    
    trigger=
        ingame() &&
        completion(1)   
)
achievement(
    "Competent Bug Hunter",
    "Get a 3x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=5,    
    trigger=
        ingame() &&
        completion(2)   
)
achievement(
    "Proficient Bug Hunter",
    "Get a 4x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=5,    
    trigger=
        ingame() &&
        completion(3)   
)
achievement(
    "Seasoned Bug Hunter",
    "Get a 5x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=10,    
    trigger=
        ingame() &&
        completion(4)   
)
achievement(
    "Advanced Bug Hunter",
    "Get a 6x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=10,    
    trigger=
        ingame() &&
        completion(5)   
)
achievement(
    "Expert Bug Hunter",
    "Get a 7x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=10,    
    trigger=
        ingame() &&
        completion(6)   
)
achievement(
    "Champion Bug Hunter",
    "Get a 8x Multiplier! (Beat all four bug waves to increase a mutliplier, losing a floor will decrease a mutliplier)", 
    points=25,    
    trigger=
        ingame() &&
        completion(7)   
)
achievement(
    "Wave Novice",
    "Complete 10 Waves!", 
    points=5,    
    trigger=
        ingame() &&
        repeated(
            10,
            bug_wave() == 1 && prev(bug_wave()) == 0 ||
            bug_wave() == 2 && prev(bug_wave()) == 1 ||
            bug_wave() == 3 && prev(bug_wave()) == 2 ||
            bug_wave() == 0 && prev(bug_wave()) == 3
        )
)
achievement(
    "Black Bug Exterminator",
    "Survive a wave of black bugs without losing a bonus bug!", 
    points=5,    
    trigger=
        ingame() &&
        prev(bugs_remaining()) == 0xfb &&
        bugs_remaining() == 0xfa &&
        bug_wave() == 0     
)
achievement(
    "Blue Bug Exterminator",
    "Survive a wave of blue bugs without losing a bonus bug!", 
    points=5,    
    trigger=
        ingame() &&
        prev(bugs_remaining()) == 0xfb &&
        bugs_remaining() == 0xfa &&
        bug_wave() == 1      
)
achievement(
    "Red Bug Exterminator",
    "Survive a wave of red bugs without losing a bonus bug!", 
    points=10,    
    trigger=
        ingame() &&
        prev(bugs_remaining()) == 0xfb &&
        bugs_remaining() == 0xfa &&
        bug_wave() == 2           
)
achievement(
    "Green Bug Exterminator",
    "Survive a wave of green bugs without losing a bonus bug!", 
    points=10,    
    trigger=
        ingame() &&
        prev(bugs_remaining()) == 0xfb &&
        bugs_remaining() == 0xfa &&
        bug_wave() == 3         
)
achievement(
    "Pest Control",
    "Score 25,000 points without losing the game!", 
    points=5,    
    trigger=
        ingame() &&
        tenthousands() >= 2 &&
        thousands() >= 5
)
achievement(
    "Rooftop Defender",
    "Score 50,000 points without losing the game!", 
    points=10,    
    trigger=
        ingame() &&
        tenthousands() >= 5
)
achievement(
    "Activision Crackpot",
    "Score 75,000 points without losing the game!", 
    points=25,    
    trigger=
        ingame() &&
        tenthousands() >= 7 &&
        thousands() >= 5
)
//======RP=====
rich_presence_conditional_display(game_state() == 0, "In Menu")
rich_presence_conditional_display(game_state() == 1, "Watching Demo")
rich_presence_display("Multiplier {0} | Score {1} | Potsy is on top of a {2} fighting an infestation of {3} bugs",
rich_presence_value("Multiplier", multiplier() + 1),
rich_presence_value("Score", bcd(ones()) + bcd(tens()) * 10 + bcd(hundreds()) * 100 + bcd(thousands()) * 1000 + bcd(tenthousands()) * 10000 + bcd(hundredthousands()) * 100000),
rich_presence_lookup("Building", building(), building_lookup),
rich_presence_lookup("Bugs", bug_wave(), bug_wave_lookup)
)
//=====LB=====
leaderboard(
    "Highest Score",
    "Starting from wave 1, highest score before the building is condemned.",
    ingame() && multiplier() == 0 && building() == 0x06,
    always_false(),
    prev(building()) == 0x2e && building() == 0x36,
    bcd(ones()) + bcd(tens()) * 10 + bcd(hundreds()) * 100 + bcd(thousands()) * 1000 + bcd(tenthousands()) * 10000 + bcd(hundredthousands()) * 100000    
)
leaderboard(
    "Highest Wave",
    "Starting from wave 1, most number of waves completed before the building is condemned.",
    ingame() && multiplier() == 0 && building() == 0x06,
    always_false(),
    prev(building()) == 0x2e && building() == 0x36,
    always_false() // count number of waves
)