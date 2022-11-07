// Street Fighter II: The World Warrior
// #ID = 11808

// $82DB: Attract mode flag
function AttractMode() => byte(0x0082DB)
function AttractActive() => AttractMode() == 1

// $8655: P1 Status (1 = Active)
function Player1Status() => byte(0x008655)
function Player1Active() => Player1Status() == 1

// $8656: P1 Character
function Player1Character() => byte(0x008656)
Ryu = 0
EHonda = 1
Blanka = 2
Guile = 3
Ken = 4
ChunLi = 5
Zangief = 6
Dhalsim = 7

// $8955: P2 Status (1 = Active)
function Player2Status() => byte(0x008955)
function Player2Active() => Player2Status() == 1

// $89CC: Defeated CPU opponents 0b=ending
function DefeatedOpponents() => byte(0x0089CC)

// Challenge to beat the game with a certain character
function CharacterBeat(character)
{
    // Start when player 1 starts the 1st fight
    start = once(Player1Active() && 
        DefeatedOpponents() == 0)
        
    // Cancel if the attract demo is on, player 2 starts, or player 1 is not the correct character
    cancel = never(AttractActive()) && 
        never(Player2Active()) && 
        never((Player1Character() != character && 
            Player1Active()))
        
    // The goal is to beat all 12 fighters
    goal = DefeatedOpponents() == 0xb
    
    // Trigger when the player reaches the goal
    submit = trigger_when(goal)
        
    // Measure how close the player is to the goal
    value = measured(goal)
    
    return start && cancel && (submit || value)
}

achievement(
    title = "Example #9C: Already Seeking The Next Challenge",
    description = "Beat the game using Ryu only.",
    points = 10,
    trigger = CharacterBeat(Ryu)
)
