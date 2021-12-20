// Dracula
// #ID = 5947

// $0520: Animation?
//        00 = Vampire
//        08 = Bat
function Animation() => bit3(0x520)
AnimationState = {
    0x0: "🧛‍",
    0x1: "🦇"
}
// $067C: Horizontal Position. Changes to FF on flying to coffin
// $06D0: Difficulty / Night
// $06D8: [8-bit] Game State (0 = Playing, 5 = New Game/Dead)
function GameState() => byte(0x6D8)
// $06DC: [8-bit] Time Minutes
function Minutes() => byte(0x6DC)
Padding = {
    0x0: "0",
    0x1: "0",
    0x2: "0",
    0x3: "0",
    0x4: "0",
    0x5: "0",
    0x6: "0",
    0x7: "0",
    0x8: "0",
    0x9: "0"
}
// $06FC: [8-bit] Time Hours
function Hours() => byte(0x6FC)
// $0704: [bit-0] Two Player No Zombie Mode (0 = No, 1 = Yes)
function TwoPlayerNoZombie() => bit0(0x704)
// $0708: [bit-0] Current Player (0 = Player 1, 1 = Player 2)
function CurrentPlayer() => bit0(0x708)
Player = {
    0x0: "Player 1",
    0x1: "Player 2"
}
// $070C: [bit-0] Two Player Zombie Mode (0 = No, 1 = Yes)
function TwoPlayerZombie() => bit0(0x708)
Modes = {
    0x0: "Single Player",
    0x1: "Two Player Zombie",
    0x2: "Two Player No Zombie"
}
// $0710: Goal Kills Left
function KillsLeft() => byte(0x710)
// $0714: Difficulty / Night (Normal starts you at 03, Hard at 05)
//        00 = Night 1
//        01 = Night 2
function Night() => byte(0x714)
// $0718: Difficulty
//        00 = Easy
//        03 = Normal
//        05 = Hard
function Difficulty1() => byte(0x718)
// $0724: [8-bit] Blood Tank (0xff = full, 0x0 = empty)
function Blood() => byte(0x724)
// $072C: Difficulty
//        00 = Easy
//        03 = Normal
//        05 = Hard
function Difficulty2() => byte(0x72C)
// $0C58: [16bit] Score
//        1388 = 5000
function Score() => word(0xC58)

rich_presence_conditional_display(GameState() == 0 && 
    Difficulty1() == 0 && 
    Difficulty2() == 0,
    "{0} Easy Mode | {1} {2} | 🌜 {3} | ⏲ {4}:{5}{6} | 💯 {7} | 💀 {8} | 🩸 {9}/255",
    rich_presence_lookup("Modes", TwoPlayerNoZombie() + TwoPlayerZombie(), Modes),
    rich_presence_lookup("Animation", Animation(), AnimationState),
    rich_presence_lookup("Player", CurrentPlayer(), Player),
    rich_presence_value("Digit", Night()+1),
    rich_presence_value("Digit", Hours()),
    rich_presence_lookup("Padding", Minutes(), Padding),
    rich_presence_value("Digit", Minutes()),
    rich_presence_value("Digit", Score()),
    rich_presence_value("Digit", KillsLeft()),
    rich_presence_value("Digit", Blood())
)

rich_presence_conditional_display(GameState() == 0 && 
    Difficulty1() == 3 && 
    Difficulty2() == 3,
    "{0} Normal Mode | {1} {2} | 🌜 {3} | ⏲ {4}:{5}{6} | 💯 {7} | 💀 {8} | 🩸 {9}/255",
    rich_presence_lookup("Modes", TwoPlayerNoZombie() + TwoPlayerZombie(), Modes),
    rich_presence_lookup("Animation", Animation(), AnimationState),
    rich_presence_lookup("Player", CurrentPlayer(), Player),
    rich_presence_value("Digit", Night()-2),
    rich_presence_value("Digit", Hours()),
    rich_presence_lookup("Padding", Minutes(), Padding),
    rich_presence_value("Digit", Minutes()),
    rich_presence_value("Digit", Score()),
    rich_presence_value("Digit", KillsLeft()),
    rich_presence_value("Digit", Blood())
)

rich_presence_conditional_display(GameState() == 0 && 
    Difficulty1() == 5 && 
    Difficulty2() == 5,
    "{0} Hard Mode | {1} {2} | 🌜 {3} | ⏲ {4}:{5}{6} | 💯 {7} | 💀 {8} | 🩸 {9}/255",
    rich_presence_lookup("Modes", TwoPlayerNoZombie() + TwoPlayerZombie(), Modes),
    rich_presence_lookup("Animation", Animation(), AnimationState),
    rich_presence_lookup("Player", CurrentPlayer(), Player),
    rich_presence_value("Digit", Night()-4),
    rich_presence_value("Digit", Hours()),
    rich_presence_lookup("Padding", Minutes(), Padding),
    rich_presence_value("Digit", Minutes()),
    rich_presence_value("Digit", Score()),
    rich_presence_value("Digit", KillsLeft()),
    rich_presence_value("Digit", Blood())
)

rich_presence_display("In Menu")
