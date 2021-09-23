// Streets of Rage 2
// #ID = 13237

//------------------------------------------------------------------
// Variable Macros

// $036A: [8-bit] Game Mode (1 = sega, 2 = intro, 3 = menus 4 = player select,
//                          5 = in game, 6 = won game, 7 = game over)
function GameMode() => byte(0x36A)

// $036b: [8-bit] Submenu (0x1 = main, 0x2 = options)
function Submenu() => byte(0x36B)

// $037d: [8-bit] Game Paused (0x00 = playing otherwise paused)
function Pause() => byte(0x37D)

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

// $0961: [8-bit] Playe Animations
// Animation Sequences (each charector has a moveset see notes)
// Axel
//---
//0x88<->92 - Idle
//0x9e<->a8 - Walk
//0xbd->de - Thrown to recovery
//0x35 - Grab
//0x99->a5 - Knee
//0x5e->6c->7c - Flip Over

//Blaze
//---
//0xad - Idle
// ->d7 - Walk
// 0xec->0d - Thrown to recovery
// 0x64 - Grab
// 0xd2->de - Knee
// 0x8d->9b->ab - Flip Over

//Skate
//---
// 0x88<->92 - Idle
// 0x9e->a8->b2->bc - Walk
// 0xd3->f3 - Thrown to recovery
// 0x4a - Grab
// 0xda->eb - Knee (headbutt)
// 0x73->81->92 - Flip Over
function Moves() => byte(0x961)

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

// $09a9: [8-bit] Special Animation (0x8a = Axel, 0x8b = Blaze, 0x8c = Skate)
function SpecialStatus() => byte(0x9A9)
function SpecialActive() => bit7(0x9A9)

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

// $131D: [4-bit] Sound Effect (SE) Selected (BCD 0X)
function SEOnes() => low4(0x131B)
// $131E: [4-bit] Sound Effect (SE) Selected (BCD X0)
function SETens() => low4(0x131C)

// $137B: [bit-0] Player Select Menu (0 - closed, 1 - shown)
function PlayerSelect() => bit0(0x137B)

//------------------------------------------------------------------
// Lookups and reverse lookups

// Dictionary of the difficultly levels
DifficultyLookup = {
    0x00: "easy",
    0x01: "normal",
    0x02: "hard"
}

// Dictionary of the difficultly text
DifficultyTextLookup = {
    "easy": "on any difficulty",
    "normal": "on normal difficulty or higher",
    "hard": "on hard difficulty"
}

// Dictionary of the weapon type values
CharacterLookup = {
    0x00: "Axel",
    0x01: "Blaze",
    0x02: "Skate"
}

// Dictionary of the weapon type values
WeaponLookup = {
    0x00: "bare knuckels",
    0x01: "a knife",
    0x02: "a bar"
}

// Dictionary of the enemy types
StageLookup = {
    0x00: "Downtown",
    0x01: "Amusement Park",
    0x02: "Alien Adventure",
    0x03: "Marine Mayhem",
    0x04: "Munitions Plant",
    0x05: "Syndicate Stronghold",
}

// Dictionary of the enemy types
EnemyLookup = {
    0x01: "a Motorcycle Spiker",
    0x07: "a Spiker",
    0x17: "a Thug",
    0x1b: "an Armed Thug",
    0x1f: "a Bald Punk",
    0x29: "an Old Ninja",
    0x31: "a Demolition Droid",
    0x33: "an Armed Knife Punk",
    0x3B: "a Knife Punk",
    0x43: "Electra",
    0x75: "Barbon",
    0x4d: "Hakuyo",
    0x81: "Rocket",
    0x57: "a Knife Ninja",
    0x5f: "an Armed Knife Ninja",
    0x8f: "Zamza",
    0x0f: "a Teleporter",
    0x67: "Big Ben",
    0x9d: "Rocky Bear",
    0xa9: "a Robot",
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
    0x05: "Gold Coin",
    0x06: "Gold Bar",
    0x07: "Star"
}

//------------------------------------------------------------------
// Helper Macros

// Reverse Lookup to lookup dictionaries by value and returns thekey or -1 if an error
function ReverseLookup(dictionary,value)
{
    result = -1
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
function GameReset() => GameMode() < 5

// Check who the play is
function SelectedCharacter(character) => Character() == ReverseLookup(CharacterLookup,character)

// Make sure that the player starts on stage 1, with 5 or less lives, and no immortality
function NoCheats() => StartingLives() <= 0x5 && Immortality() == 0 && Stage() == 0 && StartGame()

// Make sure that player starts with 5 or less lives and no immortality (level select allowed)
function Challenge() => StartingLives() <= 0x5 && Immortality() == 0 && Hard()

// Stage, substage, and subsection are currently active conditions
function StageActive(stage) => Stage() == stage - 1
function SubstageActive(stage, substage) => StageActive(stage) && Substage() == substage - 1
function SubsectionActive(stage, substage, subsection) {
    return SubstageActive(stage, substage) && Subsection() == subsection - 1
}

// Stage, substage, and subsection complete conditions
function Complete(variable,check) => prev(variable) == check - 1 && variable == check
function StageComplete(stage) => Complete(Stage(), stage)
function SubstageComplete(stage, substage) 
{
    return StageActive(stage) && Complete(Substage(), substage)
}
function SubsectionComplete(stage, substage, subsection) 
{
    return SubstageActive(stage, substage) && Complete(Subsection(), subsection)
} 

// Challenge a sub stage or subsection
function ChallengeSubStage(stage, substage) 
{
    return once(Challenge() && SubstageComplete(stage, substage-1)) &&
        trigger_when(Complete(Substage(), substage))
}
function ChallengeSubsection(stage, substage, subsection)
{
    return once(Challenge() &&  SubsectionComplete(stage, substage, subsection-1)) &&
        trigger_when(Complete(Subsection(), subsection))
}

// Shortcuts of various stage
function CompletedStage1() => SubsectionComplete(1,3,2)
function CompletedStage2() => SubsectionComplete(2,4,3)
function CompletedStage3() => SubsectionComplete(3,3,4)
function CompletedStage4() => SubsectionComplete(4,3,3)
function CompletedStage5() => SubsectionComplete(5,3,2)
function CompletedStage6() => SubsectionComplete(6,3,2)
function CompletedGame() => SubsectionComplete(6,3,2)

// Checks if the player used a continue
function ContinueUsed() => prev(Continues()) > Continues()

// Checks if the player lost health
function HealthLost() => prev(PlayerHealth()) > PlayerHealth()

// Checks if the player lost a life
function LifeLost() => prev(Lives()) > Lives()

// Macros to set the minimum level of difficulty 
function Easy() => Difficulty() <= 2
function Normal() => Difficulty() >= 1 && Difficulty() <= 2
function Hard() => Difficulty() == 2

// Checks if any enemy in slot 1/3 was knocked out
function KnockOut1() => prev(Enemy1Dead()) < Enemy1Dead()
function KnockOut2() => prev(Enemy2Dead()) < Enemy2Dead()
function KnockOut3() => prev(Enemy3Dead()) < Enemy3Dead()

// What weapon is the player carrying
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

// Convert the score to a value
function Score()
{
    return ScoreHundredThousands() * 100000 + 
        ScoreTenThousands() * 10000 +
        ScoreThousands() * 1000 + 
        ScoreHundreds() * 100 +
        ScoreTens() * 10 + 
        ScoreOnes()
}    
// Special Types
function SpecialAxel() => SpecialStatus() == 0x8a
function SpecialBlaze() => SpecialStatus() == 0x8b
function SpecialSkate() => SpecialStatus() == 0x8C

// The time remaining in the stage
function Time() => SecondsTens() * 10 + SecondsOnes() 
    
// The currently selected background music
function BGM() => BGMTens() * 10 + BGMOnes()

// The currently selected sound effect
function SE() => SETens() * 10 + SEOnes()
   
// ---------------------------------------------------------------------------
// Stage Progression Achievements
function CompletionAchievement(name, stage, difficulty, points)
{
    description = "Complete stage " + stage + " (" + DifficultyTextLookup[difficulty] + ")"
    
    trigger = once(NoCheats()) && never(GameReset())
    
    // Add condition for the passed stage
    if (stage == 1) trigger = trigger && CompletedStage1()
    elseif (stage == 2) trigger = trigger && CompletedStage2()
    elseif (stage == 3) trigger = trigger && CompletedStage3()
    elseif (stage == 4) trigger = trigger && CompletedStage4()
    elseif (stage == 5) trigger = trigger && CompletedStage5()
    elseif (stage == 6) trigger = trigger && CompletedStage6()
    
    // Add condition for the difficulty level
    if (difficulty == "easy") trigger = trigger && Easy()
    elseif (difficulty == "normal") trigger = trigger && Normal()
    elseif (difficulty == "hard") trigger = trigger && Hard()
    
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Character Progression Achievements
function CharacterAchievement(name, character, points)
{
    description = "Beat game with " + character + " (no swapping, on normal or higher difficulty)"
    trigger = once(NoCheats()) &&
              never(GameReset()) &&
              CompletedGame() && 
              Normal() &&
              never(!SelectedCharacter(character))
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Score Progression Achievements
function ScoreAchievement(name, score, lower, points)
{
    description = "Score higher than " + score / 1000 + "K (on any difficulty)"
    trigger = once(NoCheats()) &&
              never(GameReset()) && 
              Easy() && 
              prev(Score()) >= lower && 
              prev(Score()) < score && 
              Score() >= score
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Knockout Enemy Achievements
function KnockoutAchievement(name, count, weapon, points)
{
    description = "Knock out " + count + " number of enemies with " + weapon + " (on normal or higher difficulty)"

    trigger = once(NoCheats()) && 
        never(GameReset()) && 
        Normal() &&
        measured(
            tally(
                count,
                Armed(weapon) && KnockOut1(),
                Armed(weapon) && KnockOut2(),
                Armed(weapon) && KnockOut3(),
                always_false()
            )
        )
    achievement(name, description, points, trigger)
}

// Knock out an enemy
function KnockoutEnemyAchievement(name, enemy, points)
{
    description = "Knock out " + enemy + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && never(GameReset()) && Normal() && KnockOutEnemy(enemy)
    achievement(name, description, points, trigger)
}

// Knock out an boss
function KnockoutBossAchievement(name, boss, endcondition, points)
{
    description = "Knock out the " + boss + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && never(GameReset()) && Normal() && endcondition 
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Challenges Achievement
function ChallengeAchievement(name, challenge, start, cancel, points)
{
    description = challenge + "on hard difficulty, level select allowed)"
    trigger = start &&  
        never(GameReset()) && 
        never(cancel) 
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Collection & Special Achievements

// Triggers when the plays collects the 1st item passed
function CollectOneAchievement(name, description, item, points)
{
    description = description + " (on any difficulty)"
    trigger = once(NoCheats()) &&
              never(GameReset()) &&
              Easy() &&
              PickUpItem(item)
    achievement(name, description, points, trigger)
}

// Triggered when health goes from below the lower value and the user picks up meat
// while the lives remain the same
function HealAchievement(name, description, lower, points)
{
    description = description + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && 
        never(GameReset()) &&
        Normal() &&
        prev(PlayerHealth()) <= lower &&
        PickUpItem("Meat")     
    achievement(name, description, points, trigger)
}

// Triggers when the player collects the passed count of any two items
function CollectCountAchievement(name, description, item1, item2, count, points)
{
    description = description + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && 
        never(GameReset()) &&
        Normal() &&
        measured(
            tally(
                count,
                PickUpItem1(item1),
                PickUpItem2(item1),
                PickUpItem3(item1),
                PickUpItem4(item1),
                PickUpItem1(item2),
                PickUpItem2(item2),
                PickUpItem3(item2),
                PickUpItem4(item2),
                always_false()
            )
        )
    achievement(name, description, points, trigger)
}

// Triggers after the last level if the player does not collect the two passed items
function NoCollectAchievement(name, description, item1, item2, points)
{
    description = description + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && 
        never(GameReset()) &&
        never(PickUpItem1(item1)) &&
        never(PickUpItem2(item1)) &&
        never(PickUpItem3(item1)) &&
        never(PickUpItem4(item1)) &&
        never(PickUpItem1(item2)) &&
        never(PickUpItem2(item2)) &&
        never(PickUpItem3(item2)) &&
        never(PickUpItem4(item2)) &&
        Normal() && 
        trigger_when(CompletedGame())
    achievement(name, description, points, trigger)
}

// Triggers when a players stats (live, specials, etc...) reachs the passed count
function StatCountAchievement(name, description, stat, count, points)
{
    description = description + " (on normal or higher difficulty)"
    trigger = once(NoCheats()) && 
        never(GameReset()) &&
        Normal() && 
        prev(stat) == count - 1 &&
        stat == count
    achievement(name, description, points, trigger)
}

// Triggered when one of the characters uses a special
function SpecialAchievement(name, description, condition, points)
{
    description = description + " (on any difficulty)"
    trigger = once(NoCheats()) &&
              never(GameReset()) &&
              Easy() &&
              condition
    achievement(name, description, points, trigger)
}

function AirRecovery(name, description, points)
{
    description = description + " (on any difficulty)"
    trigger = StartingLives() <= 5 && 
        Immortality() == 0 && 
        Easy() &&
        (SelectedCharacter("Axel") && prev(Moves()) == 0xbd && Moves() == 0xde ||        
        SelectedCharacter("Blaze") && prev(Moves()) == 0xec && Moves() == 0x0d ||        
        SelectedCharacter("Skate") && prev(Moves()) == 0xd3 && Moves() == 0xf3)
    achievement(name, description, points, trigger)
}

// ---------------------------------------------------------------------------
// Extra Achievements

// Triggers when time is below the lower value and goes to the upper while the player is still alive
function TimeAchievement(name, description, lower, points)
{
    description = description + " (on any difficulty)"
    trigger = once(NoCheats()) &&
        never(GameReset()) &&
        Easy() &&        
        prev(Time()) <= lower && (
            Stage() > prev(Stage()) ||
            Substage() > prev(Substage()) ||
            Subsection() > prev(Subsection())
        )
        
    achievement(name, description, points, trigger)
}
function EasyCompletionAchievements()
{
    // Easy Progress Achievements
    CompletionAchievement("Downtown", 1, "easy", 2)
    CompletionAchievement("Amusement Park", 2, "easy", 3)
    CompletionAchievement("Alien Adventure", 3, "easy", 5)
    CompletionAchievement("Marine Mayhem", 4, "easy", 5)
    CompletionAchievement("Munitions Plant", 5, "easy", 10)
    CompletionAchievement("Syndicate Stronghold", 6, "easy", 10)
}
EasyCompletionAchievements()
function NormalCompletionAchievements()
{
    // Normal Progress Achievements
    CompletionAchievement("Downtown Normal", 1, "normal", 2)
    CompletionAchievement("Amusement Park Normal", 2, "normal", 3)
    CompletionAchievement("Alien Adventure Normal",  3, "normal", 5)
    CompletionAchievement("Marine Mayhem Normal", 4, "normal", 5)
    CompletionAchievement("Munitions Plant Normal", 5, "normal", 10)
    CompletionAchievement("Syndicate Stronghold Normal", 6, "normal", 10)
}
function HardCompletionAchievements()
{
    // Hard Progress Achievements
    CompletionAchievement("Downtown Hard", 1, "hard", 5)
    CompletionAchievement("Amusement Park Hard", 2, "hard", 5)
    CompletionAchievement("Alien Adventure Hard", 3, "hard", 5)
    CompletionAchievement("Marine Mayhem Hard", 4, "hard", 10)
    CompletionAchievement("Munitions Plant Hard", 5, "hard", 10)
    CompletionAchievement("Syndicate Stronghold Hard", 6, "hard",  25)
}

// Stage Challenges
ChallengeAchievement("Gimme a Glass of Milk... in a Dirty Glass!",
    "Survive a bar brawl without dying (complete stage 1-2 ", 
    ChallengeSubStage(1,2), LifeLost(), 5)
ChallengeAchievement("Look Out Above!",
    "Survive the ambush in the Amusement Park without dying (complete stage 2-3 ", 
    ChallengeSubStage(2,3), LifeLost(), 5)
ChallengeAchievement("Into the Maw of Madness!",
    "Survive the second spiker attack without taking damage (middle of stage 3-2 ", 
    ChallengeSubsection(3,2,3), HealthLost(), 5)
ChallengeAchievement("All Hands on Deck!",
    "Survive the lower decks without dying (complete stage 4-2 ", 
    ChallengeSubStage(4,2), LifeLost(), 10)
ChallengeAchievement("It’s Always Good to Know Where the Emergency Exit Is!",
    "Fight through the factory without dying (complete stage 5-2 ", 
    ChallengeSubStage(5,2), LifeLost(), 10)
ChallengeAchievement("Elevator of Doom!",
    "Survive the elevator gauntlet without dying (complete stage 6-2 ", 
    ChallengeSubStage(6,2), LifeLost(), 25)


// Character Specfic Challeneges
CharacterAchievement("Mr. Jack-of-All-Stats", "Axel", 10)
CharacterAchievement("Ms. Fanservice", "Blaze", 10)
CharacterAchievement("Kid Speedster", "Skate", 10)

// Special Emeny Achievments
KnockoutEnemyAchievement("You Call That a Knife?", "a Knife Punk", 1)
KnockoutEnemyAchievement("Hold Me Closer Tiny Dancer", "Electra", 2)
KnockoutEnemyAchievement("Everyone was Kung Fu Fighting", "Hakuyo", 2)
KnockoutEnemyAchievement("Rocketeer", "Rocket", 3)
KnockoutEnemyAchievement("Now You Realize the Powers I Possess!", "Zamza", 4)
KnockoutEnemyAchievement("Heart Burn", "Big Ben", 4)
KnockoutEnemyAchievement("The Right Hand", "Shiva", 5)

// Boss Achievements
KnockoutBossAchievement("Barbon Battle Strip!", "stage 1 boss, the Bouncer", CompletedStage1(), 2)
KnockoutBossAchievement("Cut You for Real!", "stage 2 bosses, the Knife Ninjas", CompletedStage2(), 3)
KnockoutBossAchievement("Here, There, and Everywhere!", "stage 3 boss, the Teleporter", CompletedStage3(), 4)
KnockoutBossAchievement("Put Up Your Dukes!", "stage 4 boss, Rocky Bear", CompletedStage4(), 5)
KnockoutBossAchievement("Strong Flesh, Weak Steel!", "stage 5 bosses, Particle and Molecule", CompletedStage5(), 5)
KnockoutBossAchievement("The X Factor!", "stage 6 boss, Mr. X", CompletedStage6(), 10)

// Boss Challenges
ChallengeAchievement("Barbon Bounced!",
    "Knock out the stage 1 boss, the Bouncer, without taking damage (", 
    ChallengeSubsection(1, 3, 2), HealthLost(), 5)
ChallengeAchievement("Twin Shinobi!",
    "Knock out the stage 2 bosses, the Knife Ninjas, without taking damage (", 
    ChallengeSubsection(2, 4, 3), HealthLost(), 5)
ChallengeAchievement("The Yautja!",
    "Knock out the stage 3 boss, the Teleporter, without taking damage (", 
    ChallengeSubsection(3, 3, 4), HealthLost(), 5)
ChallengeAchievement("I Need a Montage!",
    "Knock out the stage 4 boss, Rocky Bear, without taking damage (", 
    ChallengeSubsection(4, 3, 3), HealthLost(), 10)
ChallengeAchievement("We Robots!",
    "Knock out the stage 5 bosses, Particle and Molecule, without taking damage (", 
    ChallengeSubsection(5, 3, 2), HealthLost(), 10)
ChallengeAchievement("X minus One!",
    "Knock out the stage 6 boss, Mr. X, without dying (", 
    ChallengeSubsection(6, 3, 2), LifeLost(), 25)

// Knockout Weapon Counts Achievements
KnockoutAchievement("Hand to Hand Combat", 50, "bare knuckels", 2)
KnockoutAchievement("Mixed Martial Arts", 100, "bare knuckels", 3)
KnockoutAchievement("Bare Knuckle Brawler", 200, "bare knuckels", 5)
KnockoutAchievement("Knifes Out", 10, "a knife", 2)
KnockoutAchievement("Twist the Knife", 25, "a knife", 3)
KnockoutAchievement("Cut Above the Rest", 50, "a knife", 5)
KnockoutAchievement("Pipe Down", 10, "a bar", 2)
KnockoutAchievement("Setting the Bar", 25, "a bar", 3)
KnockoutAchievement("Carry a Big Stick", 50, "a bar", 5)


// Score Achievments
ScoreAchievement("Neighbourhood Watch", 50000, 10000, 2)
ScoreAchievement("Street Cleaner", 100000, 50000, 3)
ScoreAchievement("Self-Styled Vigilante", 150000, 100000, 5)
ScoreAchievement("City Watchdog", 200000, 150000, 5)
ScoreAchievement("Stalwart Defender", 300000, 200000, 10)
ScoreAchievement("Guardian of the Streets", 400000, 300000, 10)

// Collection Achievements
CollectOneAchievement("An Apple a Day", "Eat an apple", "Apple", 1)
CollectOneAchievement("Street Meat", "Eat some meat", "Meat", 2)
HealAchievement("Instant Recovery", "Recover health from 10% or less to greater than 90%", 4, 4)
NoCollectAchievement("I’m Not Hunger", "Beat the game with out eating any food", "Apple", "Meat", 10)
CollectOneAchievement("Get a Life", "Pick up an new life", "1up", 2)
StatCountAchievement("Cats of Rage", "Have 9 lives at once", Lives(), 9, 10)
CollectCountAchievement("Street Looter", "Collect 5 treasures", "Gold Coin", "Gold Bar", 5, 2)
CollectCountAchievement("Golden Rewards", "Collect 10 treasures", "Gold Coin", "Gold Bar", 10, 3)
CollectCountAchievement("Treasure Hunter", "Collect 15 treasures", "Gold Coin", "Gold Bar", 15, 5)
NoCollectAchievement("I’m Not Doing This for the Money", "Beat the game with out picking up any treasure", "Gold Coin", "Gold Bar", 10)

// Special Achievements
CollectOneAchievement("Combat Specialist", "Pick up a special", "Star", 2)
StatCountAchievement("I Feel So Special", "Build-up 5 specials at once", Specials(), 5, 10)
SpecialAchievement("Soul Striker", "Perform Axel's special attack", SpecialAxel(), 1)
SpecialAchievement("Whirlwind Attack", "Perform Blaze's special attack", SpecialBlaze(), 1)
SpecialAchievement("Pinball Assault", "Perform Skate's special attack", SpecialSkate(), 1)
AirRecovery("Air Recovery", "Escape a throw (on normal or higher difficulty)", 2)
TimeAchievement("Nick of Time", "Reset the stage timer with 5 or less seconds remaining",5, 2)

function TestAchivements()
{
    KnockoutAchievement("Test Counter Knife", 1000, "a knife", 0)
    KnockoutAchievement("Test Counter Bare Knuckels", 1000, "bare knuckels", 0)
    KnockoutAchievement("Test Counter Bar", 1000, "a bar", 0)
    CollectCountAchievement("Test Counter Gold", "Collect 1000 treasures", "Gold Coin", "Gold Bar", 1000, 0)
    CollectCountAchievement("Test Counter Food", "Collect 1000 food", "Apple", "Meat", 1000, 0)
    ScoreAchievement("Test Counter Score", 999999, 10000, 0)
}
//TestAchivements()

// ---------------------------------------------------------------------------
// Dynamic Rich Presence
rich_presence_conditional_display(GameMode() <= 4, "In Menu")
rich_presence_conditional_display(
    StartingLives() > 5 || Immortality() == 1,
    "{0} is the cheating, achivements locked",
    rich_presence_lookup("Character", Character(), CharacterLookup)
) 
    
rich_presence_conditional_display(WonGame(), "{0} beat the Game",
    rich_presence_lookup("Character", Character(), CharacterLookup))
rich_presence_conditional_display(GameReset(), "Game Over")

// If we detect all three enemies are active then include them all
rich_presence_conditional_display(
    Enemy1Type() != 0 && Enemy1Dead() == 0 && 
    Enemy2Type() != 0 && Enemy2Dead() == 0 &&
    Enemy3Type() != 0 && Enemy3Dead() == 0,
    "{0} has {1} points in Stage {2}: {3} on {4} difficulty fighting {5}, {6}, and {7} with {8} ",
    rich_presence_lookup("Character", Character(), CharacterLookup),
    rich_presence_value("Score", Score()),
    rich_presence_value("Value", Stage()+1),
    rich_presence_lookup("Stage", Stage(), StageLookup),
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_lookup("Enemy", Enemy1Type(), EnemyLookup),
    rich_presence_lookup("Enemy", Enemy2Type(), EnemyLookup),
    rich_presence_lookup("Enemy", Enemy3Type(), EnemyLookup),
    rich_presence_lookup("Weapon", Weapon(), WeaponLookup)
)

// If we detect two of three enemies are active then include them
function TwoEnemies(enemyAtype, enemyAdead, enemyBtype, enemyBdead)
{
    rich_presence_conditional_display(
        enemyAtype != 0 && enemyAdead == 0 &&
        enemyBtype != 0 && enemyBdead == 0,
        "{0} has {1} points in Stage {2}: {3} on {4} difficulty fighting {5} and {6} with {7} ",
        rich_presence_lookup("Character", Character(), CharacterLookup),
        rich_presence_value("Score", Score()),
        rich_presence_value("Value", Stage()+1),
        rich_presence_lookup("Stage", Stage(), StageLookup),
        rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
        rich_presence_lookup("Enemy", enemyAtype, EnemyLookup),
        rich_presence_lookup("Enemy", enemyBtype, EnemyLookup),
        rich_presence_lookup("Weapon", Weapon(), WeaponLookup)
    )
}
TwoEnemies(Enemy1Type(), Enemy1Dead(), Enemy2Type(), Enemy2Dead())
TwoEnemies(Enemy1Type(), Enemy1Dead(), Enemy3Type(), Enemy3Dead())
TwoEnemies(Enemy2Type(), Enemy2Dead(), Enemy3Type(), Enemy3Dead())

// If we detect only one enemy is active then include that enemy
function OneEnemy(enemyType, enemyDead)
{
    rich_presence_conditional_display(
        enemyType != 0 && enemyDead == 0,
        "{0} has {1} points in Stage {2}: {3} on {4} difficulty fighting {5} with {6} ",
        rich_presence_lookup("Character", Character(), CharacterLookup),
        rich_presence_value("Score", Score()),
        rich_presence_value("Value", Stage()+1),
        rich_presence_lookup("Stage", Stage(), StageLookup),
        rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
        rich_presence_lookup("Enemy", enemyType, EnemyLookup),
        rich_presence_lookup("Weapon", Weapon(), WeaponLookup)
    )
}
OneEnemy(Enemy1Type(), Enemy1Dead())
OneEnemy(Enemy2Type(), Enemy2Dead())
OneEnemy(Enemy3Type(), Enemy3Dead())

// If noe enemies are on the screen then show the clock
rich_presence_display("{0} has {1} points in Stage {2}: {3} on {4} difficulty fighting the clock with {5}s remaining",
    rich_presence_lookup("Character", Character(), CharacterLookup),
    rich_presence_value("Score", Score()),
    rich_presence_value("Value", Stage()+1),
    rich_presence_lookup("Stage", Stage(), StageLookup),
    rich_presence_lookup("Difficulty", Difficulty(), DifficultyLookup),
    rich_presence_value("Value", Time())
)

// ---------------------------------------------------------------------------
// Leaderboards

// All the lowest time leaderboards for each level
function LeaderboardTime(title, difficulty)
{
    condition = Difficulty() == ReverseLookup(DifficultyLookup,difficulty)
    leaderboard(
        title,
        "Starting from stage 1 on " + difficulty + " difficulty, lowest time to win the game (no cheats)",
        NoCheats() && condition,
        GameReset(),
        CompletedGame(),
        measured(Pause() == 0)
    )
}
LeaderboardTime("Fastest Time Easy", "easy")
LeaderboardTime("Fastest Time Normal", "normal")
LeaderboardTime("Fastest Time Hard", "hard")

// All the highest score leaderboards for each level
function LeaderboardScore(title, difficulty)
{
    condition = Difficulty() == ReverseLookup(DifficultyLookup,difficulty)
    leaderboard(
        title,
        "Starting from stage 1 on " + difficulty + " difficulty, highest score before using a continue, a game over, or winning the game (no cheats)",
        NoCheats() && condition,
        always_false(),
        InGame() && ContinueUsed() || GameReset() || prev(GameMode()) == 5 && GameMode() == 6,
        Score() 
    )
}
LeaderboardScore("Highest Score Easy", "easy")
LeaderboardScore("Highest Score Normal", "normal")
LeaderboardScore("Highest Score Hard", "hard")


