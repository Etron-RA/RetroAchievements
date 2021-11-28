// Picross 3D
// #ID = 9617

// $0FA9C2: (European)
//          
//          What screen you are on
//          
//          81 type select
//          01 select screen
//          c in the puzzle
function Screen() => byte(0x0FA9C2)

// $0FEE90: [8-bit] (EU) Game menu selection (0 = puzzles, 1 = gallery, 2 = my picross, 3 = settings)
function GameMenu() => byte(0x0FEE90)

// $0FEEEC: [8-bit] (EU) Main menu selection (0 = tutorial, 1 = easy, 2 = normal, 3 = hard)
function MainMenu() => byte(0x0FEEEC)

// $0FEEF0: [8-bit] (EU) Sub-menu selection (starts at 0)
function SubMenu() => byte(0x0FEEF0)

// $0FF0F3: [8-bit] (EU) Puzzle selection (0-7 = puzzle A-H, 8 = silver, 9 = gold)
function PuzzleMenu() => byte(0x0FF0F3)

// $0FF125: [8-bit] (EU) Number of Strikes in current puzzle
function Strikes() => byte(0x0FF125)

// $0FF126: [8-bit] (EU) Current puzzle's time (minutes)
function Minutes() => byte(0x0FF126)

// $0FF126: [8-bit] (EU)  Current puzzle's time (seconds)
function Seconds() => byte(0x0FF127)

function Time() => byte(0x0FF127) + byte(0x0FF126) * 60

MainSelection = {
    0x0: "Tutorial",
    0x1: "Easy",
    0x2: "Normal",
    0x3: "Hard" 
}
TutorialSubMenu = {
    0x0: "How to Play",
    0x1: "Circle Hints",
    0x2: "Level 01",
    0x3: "Techniques",
    0x4: "Level 02",
    0x5: "Bonuses",
    0x6: "Level 03",
    0x7: "Large Puzzles",
    0x8: "Level 04",
    0x9: "Square Hints",
    0xA: "Level 05",
    0xB: "One-Chance Challenge",
}

TutorialPuzzleMenu = {
    0x00: "Basics",
    0x01: "Solving",
    0x02: "Examples",
    0x03: "Puzzle A",
    0x04: "Puzzle B",
    0x05: "Puzzle C",
    
    0x10: "Hints",
    0x11: "Examples",
    0x12: "Rules",
    0x13: "Puzzle A",
    0x14: "Puzzle B",
    0x15: "Puzzle C",
    
    0x20: "Puzzle A",
    0x21: "Puzzle B",
    0x22: "Puzzle C",
    0x23: "Puzzle D",
    0x24: "Puzzle E",
    
    0x30: "Techniques 1",
    0x31: "Techniques 2",
    0x32: "Puzzle A",
    0x33: "Puzzle B",
    0x34: "Puzzle C",
    
    0x40: "Puzzle A",
    0x41: "Puzzle B",
    0x42: "Puzzle C",
    0x43: "Puzzle D",
    0x44: "Puzzle E",
    
    0x50: "Stars",
    
    0x60: "Puzzle A",
    0x61: "Puzzle B",
    0x62: "Puzzle C",
    0x63: "Puzzle D",
    0x64: "Silver Puzzle",
    
    0x70: "Slicers",
    0x71: "Puzzle A",
    0x72: "Puzzle B",
    
    0x80: "Puzzle A",
    0x81: "Puzzle B",
    0x82: "Puzzle C",
    0x83: "Puzzle D",
    0x84: "Silver Puzzle",
    
    0x90: "Square Hints",
    0x91: "Examples",
    0x92: "Puzzle A",
    0x93: "Puzzle B",
        
    0xA0: "Puzzle A",
    0xA1: "Puzzle B",
    0xA2: "Puzzle C",
    0xA3: "Puzzle D",
    0xA4: "Silver Puzzle",
    
    0xB0: "Challenge-A",
}

LevelSubMenu = {
    0x0: "Level 01",
    0x1: "Level 02",
    0x2: "One-Chance Challenge",
    0x3: "Level 03",
    0x4: "Level 04",
    0x5: "Time Challenge",
    0x6: "Level 05",
    0x7: "Level 06",
    0x8: "One-Chance Challenge",
    0x9: "Level 07",
    0xA: "Level 08",
    0xB: "Time Challenge",
    0xC: "Level 09",
    0xD: "Level 10",
    0xE: "Construction Challenge"
}
LevelPuzzleMenu = {
    0x0: "Puzzle A",
    0x1: "Puzzle B",
    0x2: "Puzzle C",
    0x3: "Puzzle D",
    0x4: "Puzzle E",
    0x5: "Puzzle F",
    0x6: "Puzzle G",
    0x7: "Puzzle H",
    0x8: "Silver Puzzle",
    0x9: "Gold Puzzle"
}

function CompletePuzzles(array)
{
    pause = unless(Screen() == 129)
    
    completed = always_true()
    almost = always_true()
    i = 0
    for address in array 
    {
        if (i == 0) 
        {
           completed = word(address) > 0x8000
           almost = prev(word(address)) <= 0x8000
        }
        else 
        {
           completed = completed && word(address) > 0x8000
           almost = almost || prev(word(address)) <= 0x8000
        }
        i = i + 1
    }
    
    trigger = pause && completed && (almost)
    return trigger
}

function CountStars(dict)
{
    count = always_true()
    i = 0
    for address in dict
    {
        if (i == 0) 
        {
           count = byte(address)
        }
        else 
        {
           count = count + byte(address)
        }
        i = i + 1
    }
    return count
}


// $116696: (EU)This is if you complete the Training How to play Basics
// $116698: (EU)This is if you complete the Training How to play Solving
// $11669A: (EU)This is if you complete the Training How to play Examples
// $11669C: (EU)This is if you complete the Training How to play Puzzle A
// $11669E: (EU)This is if you complete the Training How to play Puzzle B
// $1166A0: (EU)This is if you complete the Training How to play Puzzle C
HowToPlay = [0x116696, 0x116698, 0x11669A, 0x11669C, 0x11669E, 0x1166A0]

achievement(
    title = "A New Type of Picross", description = "Complete the Beginner How to play", points = 1,
    id = 105439, badge = "142193", published = "2020-03-30 7:52:30 PM", modified = "2020-10-14 3:43:30 AM",
    trigger = CompletePuzzles(HowToPlay)
)

// $1166B2: (EU)This is if you complete the Training Circle Hints Hits tutorial
// $1166B4: (EU)This is if you complete the Training Circle Hints Example tutorial
// $1166B6: (EU)This is if you complete the Training Circle Hints A Puzzle
// $1166B8: (EU)This is if you complete the Training Circle Hints B Puzzle
// $1166BA: (EU)This is if you complete the Training Circle Hints C Puzzle
// $1166BC: (EU)This is if you complete the Training Circle Hints Rules tutorial
CircleHints = [0x1166B2, 0x1166B4, 0x1166B6, 0x1166B8, 0x1166BA, 0x1166BC]

achievement(
    title = "New Rules", description = "Complete the Beginner Circle Hints", points = 3,
    id = 105440, badge = "142194", published = "2020-03-30 7:52:35 PM", modified = "2020-10-14 3:44:32 AM",
    trigger = CompletePuzzles(CircleHints)
)

// $1166F2: (EU)This is if you complete the Training Larger Puzzles Slicers
// $1166F4: (EU)This is if you complete the Training Larger Puzzles Puzzle A
// $1166F6: (EU)This is if you complete the Training Larger Puzzles Puzzle B
LargerPuzzles = [0x1166F2, 0x1166F4, 0x1166F6]

achievement(
    title = "Larger than Life", description = "Complete the Beginner Larger Puzzles", points = 2,
    id = 105445, badge = "142199", published = "2020-03-30 7:52:55 PM", modified = "2020-10-14 3:47:10 AM",
    trigger = CompletePuzzles(LargerPuzzles)
)

// $1166CC: (EU)This is if you complete the Training Techniques Techniques 1
// $1166CE: (EU)This is if you complete the Training Techniques Techniques 2
// $1166D0: (EU)This is if you complete the Training Techniques Puzzle A
// $1166D2: (EU)This is if you complete the Training Techniques Puzzle B
// $1166D4: (EU)This is if you complete the Training Techniques Puzzle C
Techniques = [0x1166CC, 0x1166CE, 0x1166D0, 0x1166D2, 0x1166D4]

achievement(
    title = "Additional Rules", description = "Complete the Beginner Techniques", points = 2,
    id = 105442, badge = "142196", published = "2020-03-30 7:52:43 PM", modified = "2020-10-14 3:45:07 AM",
    trigger = CompletePuzzles(Techniques)
)

// $116706: (EU)This is if you complete the Training Square Hints Square Hints
// $116708: (EU)This is if you complete the Training Square Hints Examples
// $11670A: (EU)This is if you complete the Training Square Hints Puzzle A
// $11670C: (EU)This is if you complete the Training Square Hints Puzzle B
SquareHints = [0x116706, 0x116708, 0x11670A, 0x11670C]

achievement(
    title = "Squares are real", description = "Complete the Beginner Square Hints", points = 2,
    id = 105447, badge = "142201", published = "2020-03-30 7:53:02 PM", modified = "2020-10-14 3:47:15 AM",
    trigger = CompletePuzzles(SquareHints)
)

// $11683C: (European)This indicates Normal Level 4 Puzzle A is beaten
// $11683E: (European)This indicates Normal Level 4 Puzzle B is beaten
// $116840: (European)This indicates Normal Level 4 Puzzle C is beaten
// $116842: (European)This indicates Normal Level 4 Puzzle D is beaten
// $116844: (European)This indicates Normal Level 4 Puzzle E is beaten
// $116846: (European)This indicates Normal Level 4 Puzzle F is beaten
// $116848: (European)This indicates Normal Level 4 Puzzle G is beaten
// $11684A: (European)This indicates Normal Level 4 Puzzle H is beaten
// $11684C: (European)This indicates Normal Level 4 Silver Puzzle is beaten
// $11684E: (European)This indicates Normal Level 4 Gold Puzzle is beaten
NormalLevel4 = [0x11683C, 0x11683E, 0x116840, 0x116842, 0x116844, 0x116846, 0x116848, 0x11684A, 0x11684C, 0x11684E]
achievement(
    title = "Normal Level 4", description = "Complete the Normal Level 4", points = 10,
    id = 106677, badge = "142217", published = "2020-04-11 7:45:24 PM", modified = "2020-10-14 3:54:12 AM",
    trigger = CompletePuzzles(NormalLevel4)
)

// $116854: (European)This indicates Normal Level 5 Puzzle A is beaten
// $116856: (European)This indicates Normal Level 5 Puzzle B is beaten
// $116858: (European)This indicates Normal Level 5 Puzzle C is beaten
// $11685A: (European)This indicates Normal Level 5 Puzzle D is beaten
// $11685C: (European)This indicates Normal Level 5 Puzzle E is beaten
// $11685E: (European)This indicates Normal Level 5 Puzzle F is beaten
// $116860: (European)This indicates Normal Level 5 Puzzle G is beaten
// $116862: (European)This indicates Normal Level 5 Puzzle H is beaten
// $116864: (European)This indicates Normal Level 5 Silver Puzzle is beaten
// $116866: (European)This indicates Normal Level 5 Gold Puzzle is beaten
NormalLevel5 = [0x116854, 0x116856, 0x116858, 0x11685A, 0x11685C, 0x11685E, 0x116860, 0x116862, 0x116864, 0x116866]

achievement(
    title = "Normal Level 5", description = "Complete the Normal Level 5", points = 10,
    id = 106678, badge = "142218", published = "2020-04-11 7:45:27 PM", modified = "2020-10-14 3:54:13 AM",
    trigger = CompletePuzzles(NormalLevel5)
)

// $116868: (European)This indicates Normal Level 6 Puzzle A is beaten
// $11686A: (European)This indicates Normal Level 6 Puzzle B is beaten
// $11686C: (European)This indicates Normal Level 6 Puzzle C is beaten
// $11686E: (European)This indicates Normal Level 6 Puzzle D is beaten
// $116870: (European)This indicates Normal Level 6 Puzzle E is beaten
// $116872: (European)This indicates Normal Level 6 Puzzle F is beaten
// $116874: (European)This indicates Normal Level 6 Puzzle G is beaten
// $116876: (European)This indicates Normal Level 6 Puzzle H is beaten
// $116878: (European)This indicates Normal Level 6 Silver Puzzle is beaten
// $11687A: (European)This indicates Normal Level 6 Gold Puzzle is beaten
NormalLevel6 = [0x116868, 0x11686A, 0x11686C, 0x11686E, 0x116870, 0x116872, 0x116874, 0x116876, 0x116878, 0x11687A]
achievement(
    title = "Normal Level 6", description = "Complete the Normal Level 6", points = 10,
    id = 106679, badge = "142219", published = "2020-04-11 7:45:30 PM", modified = "2020-10-14 3:54:33 AM",
    trigger = CompletePuzzles(NormalLevel6)
)

// $116894: (European)This indicates Normal Level 8 Puzzle A is beaten
// $116896: (European)This indicates Normal Level 8 Puzzle B is beaten
// $116898: (European)This indicates Normal Level 8 Puzzle C is beaten
// $11689A: (European)This indicates Normal Level 8 Puzzle D is beaten
// $11689C: (European)This indicates Normal Level 8 Puzzle E is beaten
// $11689E: (European)This indicates Normal Level 8 Puzzle F is beaten
// $1168A0: (European)This indicates Normal Level 8 Puzzle G is beaten
// $1168A2: (European)This indicates Normal Level 8 Puzzle H is beaten
// $1168A4: (European)This indicates Normal Level 8 Silver Puzzle is beaten
// $1168A6: (European)This indicates Normal Level 8 Gold Puzzle is beaten
NormalLevel8 = [0x116894, 0x116896, 0x116898, 0x11689A, 0x11689C, 0x11689E, 0x1168A0, 0x1168A2, 0x1168A4, 0x1168A6]

achievement(
    title = "Normal Level 8", description = "Complete the Normal Level 8", points = 10,
    id = 106681, badge = "142221", published = "2020-04-11 7:49:21 PM", modified = "2020-10-14 3:55:49 AM",
    trigger = CompletePuzzles(NormalLevel8)
)

// $1168AC: (European)This indicates Normal Level 9 Puzzle A is beaten
// $1168AE: (European)This indicates Normal Level 9 Puzzle B is beaten
// $1168B0: (European)This indicates Normal Level 9 Puzzle C is beaten
// $1168B2: (European)This indicates Normal Level 9 Puzzle D is beaten
// $1168B4: (European)This indicates Normal Level 9 Puzzle E is beaten
// $1168B6: (European)This indicates Normal Level 9 Puzzle F is beaten
// $1168B8: (European)This indicates Normal Level 9 Puzzle G is beaten
// $1168BA: (European)This indicates Normal Level 9 Puzzle H is beaten
// $1168BC: (European)This indicates Normal Level 9 Silver Puzzle is beaten
// $1168BE: (European)This indicates Normal Level 9 Gold Puzzle is beaten
NormalLevel9 = [0x1168AC, 0x1168AE, 0x1168B0, 0x1168B2, 0x1168B4, 0x1168B6, 0x1168B8, 0x1168BA, 0x1168BC, 0x1168BE]
achievement(
    title = "Normal Level 9", description = "Complete the Normal Level 9", points = 10,
    id = 106682, badge = "142222", published = "2020-04-11 7:49:26 PM", modified = "2020-10-14 3:55:51 AM",
    trigger = CompletePuzzles(NormalLevel9)
)


// $1168C0: (European)This indicates Normal Level 10 Puzzle A is beaten
// $1168C2: (European)This indicates Normal Level 10 Puzzle B is beaten
// $1168C4: (European)This indicates Normal Level 10 Puzzle C is beaten
// $1168C6: (European)This indicates Normal Level 10 Puzzle D is beaten
// $1168C8: (European)This indicates Normal Level 10 Puzzle E is beaten
// $1168CA: (European)This indicates Normal Level 10 Puzzle F is beaten
// $1168CC: (European)This indicates Normal Level 10 Puzzle G is beaten
// $1168CE: (European)This indicates Normal Level 10 Puzzle H is beaten
// $1168D0: (European)This indicates Normal Level 10 Silver Puzzle is beaten
// $1168D2: (European)This indicates Normal Level 10 Gold Puzzle is beaten
NormalLevel10 = [0x1168C0, 0x1168C2, 0x1168C4, 0x1168C6, 0x1168C8, 0x1168CA, 0x1168CC, 0x1168CE, 0x1168D0, 0x1168D2]

achievement(
    title = "Normal Level 10", description = "Complete the Normal Level 10", points = 10,
    id = 106683, badge = "142223", published = "2020-04-11 7:49:29 PM", modified = "2020-10-14 3:55:54 AM",
    trigger = CompletePuzzles(NormalLevel10)
)

// $214AEE: Number of stars in Tutorial/Beginner - Level 3 [8-bit]
// $214AFE: Number of stars in Tutorial/Beginner - Level 4 [8-bit]
// $214B0E: Number of stars in Tutorial/Beginner - Level 5 [8-bit]
// $214B26: Number of stars in Easy - Level 1 [8-bit]
// $214B2E: Number of stars in Easy - Level 2 [8-bit]
// $214B3E: Number of stars in Easy - Level 3 [8-bit]
// $214B46: Number of stars in Easy - Level 4 [8-bit]
// $214B56: Number of stars in Easy - Level 5 [8-bit]
// $214B5E: Number of stars in Easy - Level 6 [8-bit]
// $214B6E: Number of stars in Easy - Level 7 [8-bit]
// $214B76: Number of stars in Easy - Level 8 [8-bit]
// $214B86: Number of stars in Easy - Level 9 [8-bit]
// $214B8E: Number of stars in Easy - Level 10 [8-bit]
// $214BAE: Number of stars in Normal - Level 1 [8-bit]
// $214BB6: Number of stars in Normal - Level 2 [8-bit]
// $214BC6: Number of stars in Normal - Level 3 [8-bit]
// $214BCE: Number of stars in Normal - Level 4 [8-bit]
// $214BDE: Number of stars in Normal - Level 5 [8-bit]
// $214BE6: Number of stars in Normal - Level 7 [8-bit]
// $214BF6: Number of stars in Normal - Level 7 [8-bit]
// $214BFE: Number of stars in Normal - Level 8 [8-bit]
// $214C0E: Number of stars in Normal - Level 9 [8-bit]
// $214C16: Number of stars in Normal - Level 10 [8-bit]
// $214CDE: Number of stars in Hard - Level 1 [8-bit]
// $214CE6: Number of stars in Hard - Level 2 [8-bit]
// $214CF6: Number of stars in Hard - Level 3 [8-bit]
// $214CFE: Number of stars in Hard - Level 4 [8-bit]
// $214D0E: Number of stars in Hard - Level 5 [8-bit]
// $214D16: Number of stars in Hard - Level 6 [8-bit]
// $214D26: Number of stars in Hard - Level 7 [8-bit]
// $214D2E: Number of stars in Hard - Level 8 [8-bit]
// $214D3E: Number of stars in Hard - Level 9 [8-bit]
// $214D46: Number of stars in Hard - Level 10 [8-bit]
Stars = {
    0x214AEE: 12,
    0x214AFE: 12,
    0x214B0E: 12, 
    0x214B26: 24, 
    0x214B2E: 24,
    0x214B3E: 24,
    0x214B46: 24,
    0x214B56: 24,
    0x214B5E: 24,
    0x214B6E: 24,
    0x214B76: 24,
    0x214B86: 24,
    0x214B8E: 24,
    0x214BAE: 24,
    0x214BB6: 24,
    0x214BC6: 24,
    0x214BCE: 24,
    0x214BDE: 24,
    0x214BE6: 24,
    0x214BF6: 24,
    0x214BFE: 24,
    0x214C0E: 24,
    0x214C16: 24,
    0x214CDE: 24,
    0x214CE6: 24,
    0x214CF6: 24,
    0x214CFE: 24,
    0x214D0E: 24,
    0x214D16: 24,
    0x214D26: 24,
    0x214D2E: 24,
    0x214D3E: 24,
    0x214D46: 24
}

achievement(
    title = "Star of the game", description = "Obtain all Stars in the game. ", points = 50,
    id = 106874, badge = "142225", published = "2020-04-12 5:43:49 PM", modified = "2020-10-14 3:56:39 AM",
    trigger = unless(Screen() == 129) &&
        measured(CountStars(Stars) == 756) &&
        prev(CountStars(Stars)) >= 753 &&
        prev(CountStars(Stars)) <= 755
)

// Tutorial Mode
rich_presence_conditional_display(
    Screen() == 0xc && 
    GameMenu() == 1 && 
    MainMenu() == 0,
    "Tutorial - {0} - {1} | ⏱ {2} | 💥 {3} | ⭐ {4}/756" ,
    rich_presence_lookup("TutorialSubMenu", SubMenu(), TutorialSubMenu),
    rich_presence_lookup("TutorialPuzzleMenu", SubMenu() * 0x10 + PuzzleMenu(), TutorialPuzzleMenu),
    rich_presence_value("Time", Time(), "SECS"),
    rich_presence_value("Strikes", Strikes(), "VALUE"),
    rich_presence_value("Stars", CountStars(Stars), "VALUE")
)

// Puzzle Mode
rich_presence_conditional_display(
    Screen() == 0xc && 
    GameMenu() == 1 && 
    MainMenu() >= 1 &&
    MainMenu() <= 3,
    "{0} - {1} - {2} | ⏱ {3} | 💥 {4} | ⭐ {5}/756" ,
    rich_presence_lookup("MainSelection", MainMenu(), MainSelection),
    rich_presence_lookup("LevelSubMenu", SubMenu(), LevelSubMenu),
    rich_presence_lookup("LevelPuzzleMenu", PuzzleMenu(), LevelPuzzleMenu),
    rich_presence_value("Time", Time(), "SECS"),
    rich_presence_value("Strikes", Strikes(), "VALUE"),
    rich_presence_value("Stars", CountStars(Stars), "VALUE")
)

// Gallery Mode
rich_presence_conditional_display(
    Screen() != 129 && 
    GameMenu() == 1,
    "Selecting a Puzzle"
)

// Gallery Mode
rich_presence_conditional_display(
    Screen() != 129 && 
    GameMenu() == 2,
    "Viewing the Gallery"
)

// My Picross Mode
rich_presence_conditional_display(
    Screen() != 129 && 
    GameMenu() == 3,
    "Creating New Picross Puzzles"
)

// Options Menu
rich_presence_conditional_display(
    Screen() != 129 && 
    GameMenu() == 4,
    "Changing the Settings"
)

rich_presence_display("In Menu")

