// Streets of Rage 2
// #ID = 13237

//------------------------------------------------------------------
// Variable Macros

// $036A [8-bit] Game Mode (1 = sega, 2 = intro, 3 = menus 4 = player select,
//                          5 = in game, 6 = won game, 7 = game over)
function GameMode() => byte(0x36A)

// $0383: [8-bit] Stage
function Stage() => byte(0x383)

// $0385: [8-bit] Substage
function Substage() => byte(0x385)

// $0386: [8-bit] Subsection of Substage
function Subsection() => byte(0x386)

// $0387: [8-bit] Difficulty Mode (0=easy, 1=medium, 2=hard)
function Difficulty() => byte(0x387)

// $0389: [bit-0] Immortality Cheat (0 = not active, 1 = active)
function Immortality() => bit0(0x389)

// $038A: [8-bit] Starting lives (>= 5 cheat activated)
function StartingLives() => byte(0x38A)

// $03BF: [8-bit] Character Selected (0x0 - Axel, 0x1 - Blaze, 0x2 - Skate)
function Character() => byte(0x3BF)

// $0738: [4-bit] Time left BCD 0X
function SecondsOnes() => low4(0x738)
// $0739: [4-bit] Time left BCD X0
function SecondsTens() => low4(0x739)
function time() => SecondsOnes() + SecondsTens() * 10 

// $097D: [8-bit] Holding Weapon (0 - none, 1 - knife, 2 - bar)
function Weapon() => byte(0x97D)

// $0986: [8-bit] Player Health (Full heath 0x17 - Dead if negative ie. bit-7 = 1)
function PlayerHealth() => byte(0x986)

// $098A: [4-bit] Score BCD 00000X
function ScoreOnes() => low4(0x98A)
// $098B: [4-bit] Score BCD 0000X0
function ScoreTens() => low4(0x98B)
// $098C: [4-bit] Score BCD 000X00
function ScoreHundreds() => low4(0x98C)
// $098D: [4-bit] Score BCD 00X000
function ScoreThousands() => low4(0x98D)
// $098E: [4-bit] Score BCD 0X0000
function ScoreTenThousands() => low4(0x98E)
// $098F: [4-bit] Score BCD X00000
function ScoreHundredThousands() => low4(0x98F)

// $09A6: [8-bit] Lives
function Lives() => byte(0x9A6)

// $09A7: [8-bit] Continues
function Continues() => byte(0x9A7)

// $09B3: [8-bit] Special Count
function Specials() => byte(0x9B3)

// $0D0B [8-bit] Enemy 1 State (0 = stand, 1 = down, 2, = dead)
function Enemy1State() => bit1(0xD0B)
// $0D3D: [8-bit] Enemy 1 Type
function Enemy1Type() => byte(0xD3D)
// $0D4A: [8-bit] Enemy 1 Health (Dead if negative ie. bit-7 = 1)
function Enemy1Health() => byte(0xD4A)
function Enemy1Dead() => bit7(0xD4A)
// $0D4B: [bit-0] Enemy 1 Down (0 - Stand, 1 - Down)
function Enemy1Down() => bit0(0xD4B)

// $0D7B [8-bit] Enemy 2 State (0 = stand, 1 = down, 2, = dead)
function Enemy2State() => bit1(0xD7B)
// $0DAD: [8-bit] Enemy 2 Type (see 0xd3d for list of types)
function Enemy2Type() => byte(0xDAD)
// $0DBA: [8-bit] Enemy 2 Health (Dead if negative ie. bit-7 = 1)
function Enemy2Health() => byte(0xDBA)
function Enemy2Dead() => bit7(0xDBA)
// $0DBB: [bit-0] Enemy 2 Down (0 - Stand, 1 - Down)
function Enemy2Down() => bit0(0xDBB)

// $0DEB [8-bit] Enemy 3 State (0 = stand, 1 = down, 2, = dead)
function Enemy3State() => bit1(0xDEB)
// $0E1D: [8-bit] Enemy 3 Type (see 0xd3d for list of types)
function Enemy3Type() => byte(0xE1D)
// $0E2A: [8-bit] Enemy 3 Health (Dead if negative ie. bit-7 = 1)
function Enemy3Health() => byte(0xE2A)
function Enemy3Dead() => bit7(0xE2A)
// $0E2B: [bit-0] Enemy 3 Down (0 - Stand, 1 - Down)
function Enemy3Down() => bit0(0xE2B)

// $0E80: [8-bit] Item 1 Status (bit-7 is visible, bit-3 is weapon)
function Item1Status() => bit7(0xE80)
// $0E82: [8-bit] Item 1 Type
function Item1Type() => byte(0xE82)
// $0E8C: [8-bit] Item 1 X-Axis (Off Screen when 0x1f)
function Item1X() => byte(0xE8C)

// $0EC0: [8-bit] Item 2 Status (bit-7 is visible, bit-3 is weapon)
function Item2Status() => bit7(0xEC0)
// $0EC2: [8-bit] Item 2 Type (see 0xe82 for types)
function Item2Type() => byte(0xEC2)
// $0ECC: [8-bit] Item 2 X-Axis (Off Screen when 0x1f)
function Item2X() => byte(0xECC)

// $0F00: [8-bit] Item 3 Status (bit-7 is visible, bit-3 is weapon)
function Item3Status() => bit7(0xF00)
// $0F02: [8-bit] Item 3 Type (see 0xe82 for types)
function Item3Type() => byte(0xF02)
// $0F0C: [8-bit] Item 3 X-Axis (Off Screen when 0x1f)
function Item3X() => byte(0xF0C)

// $0F40: [8-bit] Item 4 Status (bit-7 is visible, bit-3 is weapon)
function Item4Status() => bit7(0xF40)
// $0F42: [8-bit] Item 4 Type (see 0xe82 for types)
function Item4Type() => byte(0xF42)
// $0F4C: [8-bit] Item 4 X-Axis (Off Screen when 0x1f)
function Item4X() => byte(0xF4C)

// $131B: [4-bit] Background Music (BGM) Selected (BCD 0X)
function BGMOnes() => low4(0x131B)
// $131C: [4-bit] Background Music (BGM) Selected (BCD X0)
function BGMTens() => low4(0x131C)
function BGM() => BGMOnes() + BGMTens() * 10 

// $131D: [4-bit] Sound Effect (SE) Selected (BCD 0X)
function SEOnes() => low4(0x131B)
// $131E: [4-bit] Sound Effect (SE) Selected (BCD X0)
function SETens() => low4(0x131C)
function SE() => SEOnes() + SETens() * 10 

// $137B: [bit-0] Player Select Menu (0 - closed, 1 - shown)
function PlayerSelect() => bit0(0x137B)

//------------------------------------------------------------------
// Lookups and reverse lookups

// Dictionary of the difficultly levels
DifficultlyLookup = {
    0x00: "Easy",
    0x01: "Normal",
    0x02: "Hard"
}

// Dictionary of the weapon type values
CharacterLookup = {
    0x00: "Axel",
    0x01: "Blaze",
    0x02: "Skate"
}

// Dictionary of the weapon type values
WeaponLookup = {
    0x00: "Bare Knuckel",
    0x01: "Knife",
    0x02: "Bar"
}

// Dictionary of the enemy types
EnemyLookup = {
    0x01: "Spiker riding a motorcycle",
    0x07: "Spiker",
    0x17: "Thug",
    0x1b: "Armed Thug",
    0x1f: "Bald Punk",
    0x29: "Old Ninja",
    0x31: "Demolition Droid",
    0x33: "Armed Knife Punk",
    0x3B: "Knife Punk",
    0x43: "Electra",
    0x75: "Bouncer",
    0x4d: "Ninja",
    0x81: "Jet",
    0x57: "Knife Ninja",
    0x5f: "Armed Knife Ninja",
    0x8f: "Zamza",
    0x0f: "Teleporter",
    0x67: "Fat Burner",
    0x9d: "Boxer",
    0xa9: "Robot",
    0xe3: "Shiva",
    0xfb: "Mr. X",
}

// Dictionary of the item types
ItemLookup = {
    0x00: "Knife",
    0x01: "Bar",
    0x02: "Apple",
    0x03: "Meat",
    0x04: "1up",
    0x06: "Gold Bar",
    0x07: "Gold Star"
}

//------------------------------------------------------------------
// Helper Macros

// ReverseLookup
function ReverseLookup(dictionary,value)
{
    result = 0
    for key in dictionary 
    {
        if(dictionary[key] == value) result = key
    }
    return result
}

// Game State Shortcuts
function StartGame() => prev(GameMode()) == 4 && GameMode() == 5
function InGame() => GameMode() == 5
function WonGame() => GameMode() == 6
function GameOver() => GameMode() == 7

// Check who the play is
function SelectedCharacter(character) => Character() == ReverseLookup(CharacterLookup,character)

// Make sure that the player starts on stage 1, with 5 or less lives, and no immortality
function NoCheats() => StartingLives() <= 0x5 && Immortality() == 0 && Stage() == 0 && StartGame()

// Make sure that the player starts with 5 or less lives and no immortality
function AllowLevelSelect() => StartingLives() <= 0x5 && Immortality() == 0 && StartGame()

// Checks if the player used a continue
function ContinueUsed() => prev(Continues()) > Continues()

// Checks if the player lost a life
function LiveLost() => prev(Lives()) > Lives()

// Macros to set the minimum level of difficulty 
function Easy() => Difficulty() <= 2
function Normal() => Difficulty() >= 1 && Difficulty() <= 2
function Hard() => Difficulty() == 2

// Checks if any enemy in slot 1/3 was knocked out
function KnockOut1() => prev(Enemy1Dead()) < Enemy1Dead()
function KnockOut2() => prev(Enemy2Dead()) < Enemy2Dead()
function KnockOut3() => prev(Enemy3Dead()) < Enemy3Dead()

function Armed(weapon) => Weapon() == ReverseLookup(WeaponLookup,weapon)

// Checks if a specfic enemy in slot 1/3 was knocked out
function KnockOutEnemy1(enemy) => Enemy1Type() == ReverseLookup(EnemyLookup,enemy) && KnockOut1()
function KnockOutEnemy2(enemy) => Enemy2Type() == ReverseLookup(EnemyLookup,enemy) && KnockOut2()
function KnockOutEnemy3(enemy) => Enemy3Type() == ReverseLookup(EnemyLookup,enemy) && KnockOut3()
function KnockOutEnemy(enemy) => KnockOutEnemy1(enemy) || KnockOutEnemy2(enemy) || KnockOutEnemy3(enemy)

// Checks if an item in slot 1/4 was picked up
function PickUpItem1(item) => Item1Type() == ReverseLookup(ItemLookup,item) && prev(Item1Status()) > Item1Status() && Item1X() > 0x1f
function PickUpItem2(item) => Item2Type() == ReverseLookup(ItemLookup,item) && prev(Item2Status()) > Item2Status() && Item2X() > 0x1f
function PickUpItem3(item) => Item3Type() == ReverseLookup(ItemLookup,item) && prev(Item3Status()) > Item3Status() && Item3X() > 0x1f
function PickUpItem4(item) => Item4Type() == ReverseLookup(ItemLookup,item) && prev(Item4Status()) > Item4Status() && Item4X() > 0x1f
function PickUpItem(item) => PickUpItem1(item) || PickUpItem2(item) || PickUpItem3(item) || PickUpItem4(item)

// Stage, substage and subsection complete
function StageComplete(stage) => prev(Stage()) == stage - 1 && Stage() == stage
function SubstageComplete(stage, substage) => Stage() == stage - 1 && prev(Substage()) == substage - 1 && Substage() == substage
function SubsectionComplete(stage, substage, subsection) => Stage() == stage - 1 &&  Substage() == substage - 1 && prev(Subsection()) == subsection - 1 && Subsection() == subsection

// Convert the score to a value
function score() =>
    ScoreOnes()  + 
    ScoreTens() * 10 + 
    ScoreHundreds() * 100 +
    ScoreThousands() * 1000 + 
    ScoreTenThousands() * 10000 +
    ScoreHundredThousands() * 100000
    
//------------------------------------------------------------------
// Test Achievements

achievement("NoCheats", "Player starts on stage 1, with 5 or less lives, and no immortality", 0, NoCheats())
achievement("AllowLevelSelect", "Player starts with 5 or less lives and no immortality", 0, AllowLevelSelect())
achievement("ContinueUsed", "Player used a continue", 0, InGame() && ContinueUsed())
achievement("LiveLost", "Player lost a life", 0, InGame() && LiveLost())
achievement("GameOver", "Game Over Screen", 0, GameOver())
achievement("WonGame", "Win the Game", 0, WonGame())

achievement("Axel", "No Cheats Axel", 0, NoCheats() && SelectedCharacter("Axel"))
achievement("Blaze", "No Cheats Blaze", 0, NoCheats() && SelectedCharacter("Blaze"))
achievement("Skate", "No Cheats Skate", 0, NoCheats() && SelectedCharacter("Skate"))

achievement("Easy", "No Cheats easy or higher difficulty", 0, NoCheats() && Easy())
achievement("Normal", "No Cheats normal or higher difficulty", 0, NoCheats() && Normal())
achievement("Hard", "No Cheats hard difficulty", 0, NoCheats() && Hard())

achievement(
    "Knock Out Count", 
    "Counts all the knockouts to 1000", 0,
    InGame() &&
    measured(
        tally(
            1000,
            KnockOut1(),
            KnockOut2(),
            KnockOut3(),
            always_false()
        )
    ),0
)

achievement(
    "Knock Out Count with a Knife", 
    "Counts all the knockouts with a knife to 1000", 0,
    InGame() &&
    measured(
        tally(
            1000,
            Armed("Knife") && KnockOut1(),
            Armed("Knife") && KnockOut2(),
            Armed("Knife") && KnockOut3(),
            always_false()
        )
    ),0
)

achievement(
    "Knock Out Count with a Bar", 
    "Counts all the knockouts with a bar to 1000", 0,
    InGame() &&
    measured(
        tally(
            1000,
            Armed("Bar") && KnockOut1(),
            Armed("Bar") && KnockOut2(),
            Armed("Bar") && KnockOut3(),
            always_false()
        )
    ),0
)

name = "empty"
for enemy in EnemyLookup 
{
    enemyText = EnemyLookup[enemy]
    name = "Knock out a " + enemyText
    achievement(name, name, 0, InGame() && KnockOutEnemy(enemyText))
}

achievement(
    "Food1234",
    "Counts all food to 1000", 0,
    InGame() &&
    measured(
        tally(
            1000,
            PickUpItem1("Apple"),
            PickUpItem2("Apple"),
            PickUpItem3("Apple"),
            PickUpItem4("Apple"),
            PickUpItem1("Meat"),
            PickUpItem2("Meat"),
            PickUpItem3("Meat"),
            PickUpItem4("Meat"),
            always_false()
        )
    )
)

achievement("Treasure1234", "Counts all treasure to 1000", 0,
    InGame() &&
    measured(
        tally(
            1000,
            PickUpItem1("Gold Bar"),
            PickUpItem2("Gold Bar"),
            PickUpItem3("Gold Bar"),
            PickUpItem4("Gold Bar"),
            PickUpItem1("Gold Star"),
            PickUpItem2("Gold Star"),
            PickUpItem3("Gold Star"),
            PickUpItem4("Gold Star"),
            always_false()
        )
    )
)

for item in ItemLookup 
{
    itemText = ItemLookup[item]
    achievement(itemText, "Pick up an " + itemText, 0, InGame() && PickUpItem(itemText))
}

scores = [50000, 100000, 150000, 200000, 300000, 400000]
for score in scores 
{
    name = "Score over " + score / 1000 + "K"
    achievement(name, name, 0, InGame() && score() >= score)
}
stage = 1
substage = 1
subsection = 1
for stage in range(1, 6) 
{
    name = "Complete stage " + stage    
    achievement(name, name, 0, StageComplete(stage))
    for substage in range(1, 4) 
    {
        name = "Complete substage " + stage + "-" + substage    
        achievement(name, name, 0, SubstageComplete(stage,substage))
        
        for subsection in range(1, 4) 
        {
            name = "Complete subsection " + stage + "-" + substage + "-" + subsection 
            achievement(name, name, 0, SubsectionComplete(stage,substage,subsection))
        }
    }
}


