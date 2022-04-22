// Tetris DX
// #ID = 4939

// $AC0A: 0=marathon  1=ultra
//        2=40lines   3=vs.com
function GameType() => byte(0x00AC0A)

// $AC24: Number of lines completed
function Lines() => byte(0x00AC24)

// $DB10: speed level in 40 lines
function Speed() => byte(0x00DB10)

// $DB11: high-level
function HighLevel() => byte(0x00DB11)

// Create a forty lines mode achievements with starting high-level, speed conditions, or both
function FortyLines(title, description, points, highLevel, speed)
{
    // Always check for game mode 40 lines and
    // if previous lines was between 36 to 39 and the current lines is 40 or more
    trigger = GameType() == 2 && 
        prev(Lines()) >= 36 && 
        prev(Lines()) <= 39 &&
        Lines() >= 40
    
    // If the high level setting is greater than zero then add the high level condition
    if (highLevel > 0) 
        trigger = trigger && HighLevel() == highLevel        
       
    // If the speed setting is greater than zero then add the speed condition
    if (speed > 0) 
        trigger = trigger && Speed() == speed
        
    achievement(title, description, points, trigger)
}

// Create seven forty lines mode achievements using variations of the same function
FortyLines("Example 6A: One-High", "Beat [40 Lines] mode on 1-High.", 2, 1, 0)
FortyLines("Example 6A: Two-High", "Beat [40 Lines] mode on 2-High.", 3, 2, 0)
FortyLines("Example 6A: Three-High", "Beat [40 Lines] mode on 3-High.", 5, 3, 0)
FortyLines("Example 6A: Four-High", "Beat [40 Lines] mode on 4-High.", 5, 4, 0)
FortyLines("Example 6A: Five-High", "Beat [40 Lines] mode on 5-High.", 10, 5, 0)
FortyLines("Example 6A: Mach 40", "Beat [40 Lines] mode on Speed Level 9.", 5, 0, 9)
FortyLines("Example 6A: Light Speed", "Beat [40 Lines] mode on 5-High and Speed Level 9.", 10, 5, 9)