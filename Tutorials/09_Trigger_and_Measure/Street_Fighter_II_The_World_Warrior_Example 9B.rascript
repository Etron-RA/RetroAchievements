// Street Fighter II: The World Warrior
// #ID = 11808

// $8008: Event
//        0a=during fight
function Event() => byte(0x008008)

// $82DB: Attract mode flag
function AttractMode() => byte(0x0082DB)
function AttractActive() => AttractMode() == 1

// $83F1: P1 KO flag
function Player1Flag() => byte(0x0083F1)
function Player1KO() => Player1Flag() == 255

// $8547: P1 attack buffer (Honda and Blanka)
function Player1AttackBuffer() => byte(0x8547)

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

// $86F0: P2 HP
function Player2Health() => byte(0x0086F0)

// $86F1: P2 KO flag
function Player2Flag() => byte(0x0086F1)
function Player2KO() => Player2Flag() == 255

// $8955: P2 Status (1 = Active)
function Player2Status() => byte(0x008955)
function Player2Active() => Player2Status() == 1

// $8AE2: P1 number of attacks done during the round (except Zangief)
function Player1Attacks() => byte(0x008AE2)

// Challenge to hit the oponent 4 times with Hundred Hand Slap and nothing else
function Kimarite()
{
    // Start at the begining of a round when the fight event changes to 0xa and the player has no hits
    start = once(Player1Attacks() == 0 &&
        prev(Event()) != 0xa &&
        Event() == 0xa)

    // Cancel if the attract demo is on, player 2 starts, player 1 is not E-Honda,
    // either player has been knocked out, or the player has landed an attack other than Hundred Hand Slaps
    cancel = never(AttractActive()) &&
        never(Player2Active()) && 
        never(Player1Character() != EHonda) &&
        never(Player1KO()) &&
        never(Player2KO()) &&
        never(
            prev(Player2Health()) > Player2Health() &&
            Player1AttackBuffer() != 51 && 
            Player1AttackBuffer() != 52 && 
            Player1AttackBuffer() != 53
        )
    
    // The goal is reaching 4 Hundred Hand Slaps without using any other attack
    goal = repeated(4, prev(Player2Health()) > Player2Health())
    
    // Trigger when the player reaches the goal
    submit = trigger_when(goal)
        
    // Measure how close the player is to the goal
    value = measured(goal)
    
    return start && cancel && (submit || value)
}

achievement(
    title = "Example #9B: Kimarite", 
    description = "Succesfully hit the opponent 4 times with Hundred Hand Slap and nothing else", 
    points = 5,
    trigger = Kimarite()
)
