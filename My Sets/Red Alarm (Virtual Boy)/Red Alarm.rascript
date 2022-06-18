// Red Alarm
// #ID = 13079

// $006b: [8-bit] Menu Shown (0 = In Game, 0 != Menu Shown)
function Menu() => byte(0x6B)

// $02CF: [bit 1] Pause (0 = Active, 1 = Paused)
function Pause() => bit1(0x2CF)

// $02D0: [16-bit] Stage Counter
function Counter() => word(0x2D0)

// $02D2: [8-bit] Stage (1-6, 7 is results)
function Stage() => byte(0x2D2)

// $02D4: [8-bit] Zone
function Zone() => byte(0x2D4)
DangerZones = [0, 3, 1, 1, 10, 1, 0]

// $02E2: [16-bit] Fuel Left (XXXX00 first 4 digits)
function Fuel() => word(0x2E2) * 100
function FuelRaw() => word(0x2E2)


// $02E4: [8-Bit] Difficulty (0 = Easy, 1 = Normal, 2 = Hard)
function Difficulty() => byte(0x2E4)
DifficultyLookup = {
    0x0: "easy",
    0x1: "normal",
    0x2: "hard"
}

// $02F4: [8-Bit] Continues (0 to 3)
function Continues() => byte(0x2F4)

// $02f8: [bit 0] Cutscene (0 = None, 1 = Cutscene)
function Cutscene() => bit0(0x2F8)

// $71B8: [32-bit] Stage Objects starting at $71B8 every 4 bytes (16 max) 
// List of address locations where an object might appear
ObjectAddress = [0x71B8, 0x71C0, 0x71C8, 0x71D0, 0x71D8, 0x71E0, 0x71E8, 0x71F0,
                 0x71F8, 0x7200, 0x7208, 0x7210, 0x7218, 0x7220, 0x7228, 0x7230]

// List of hidden object pointers values
HiddenMax = 15
HiddenObjects = {
  0x07068190: "Gameboy",               // Stage 1
  0x070681A8: "Grabber",               // Stage 1
  0x07068210: "Virtual Boy Controller",// Stage 1
  0x07068228: "Virtual Boy Console",   // Stage 1
  0x0706A31C: "House",                 // Stage 1
  0x0708B74C: "Fish",                  // Stage 2
  0x0708B734: "Bikini Woman",          // Stage 2
  0x070A2DE4: "Hermit Crab",           // Stage 3
  0x070BD878: "Fox Face 1",            // Stage 4
  0x070BD890: "Fox Face 2",            // Stage 4
  0x070BD8A8: "Fox Face 3",            // Stage 4
  0x070BD8C0: "Fox Face 4",            // Stage 4
  0x070BD848: "Flower 1",              // Stage 4
  0x070BD860: "Flower 2",              // Stage 4
  0x070BE370: "Fox Statue 3",          // Stage 4
  0x070BE388: "Fox Statue 4",          // Stage 4
  0x070DA79C: "Man Waving Flag",       // Stage 5
  0x070EC4DC: "Woman Holding Final",   // Stage 6
  0x070EBAE4: "Free Alien"             // Stage 6
}

// $8220: [16-bit] Game State (0x0 = Menu, 0x0 > In Game)
function GameState() => word(0x8220)

// $87A6: [16-bit] Plane X-Axis
function PlaneX() => word(0x87A6)

// $87AA: [16-bit] Plane Z-Axis
function PlaneZ() => word(0x87AA)

// $87AE: [16-bit] Plane Y-Axis
function PlaneY() => word(0x87AE)

// $87C8: [8-bit] Sheilds (0 to 10)
function Sheilds() => byte(0x87C8)

// $87DE: [8-bit] Dodge Offset (dodge pattern 2,1,0)
function Dodge() => byte(0x87DE)

// $887D: [16-bit] Speed Display (absolute decimal)
function Speed() => word(0x887C)

// $887E: [16-bit] Speed Setting (0x0 = Reverse, 0x40 = Stopped, 0xa0 = 1, 0x100 = 2)
function Gear() => word(0x887E)

// $889E: [16-bit] Score (XXXX00 first 4 digits)
function Score() => word(0x889E) * 100

// $88A0: [8-bit] Booster (0 to 4)
function Booster() => byte(0x88A0)

// $88A2: [8-bit] Homing Missles (2 to 6)
function Missles() => byte(0x88A2)

// $8A20/$91A0: Enemy data starting at 0x8A20 every 0x80 bytes (16 max) 
// +0x08: [8-bit] Enemy 1 Type (see dictionary of enemies)
// +0x10: [16-bit] Enemy 1 Health (0xFFFF = Dead)
// +0x12: [16-bit] Enemy 1 X-Axis
// +0x1A: [16-bit] Enemy 1 Z-Axis
// +0x22: [16-bit] Enemy 1 Y-Axis
// +0x48: [8-bit] Item 1 (If enemy type = 0x47 then 0 = Borrow, 1 = Mirow)
// +0x49: [bit-0] Item Visible 1 (0 = Invisible, 1 = Visible)
                
// Memory addresses for all the enemy/item data
EnemyMax = 15
EnemyBase =   [0x8A20, 0x8AA0, 0x8B20, 0x8BA0, 0x8C20, 0x8CA0, 0x8D20, 0x8DA0, 0x8E20, 0x8EA0,
               0x8F20, 0x8FA0, 0x9020, 0x90A0, 0x9120, 0x91A0, 0x9020, 0x90A0, 0x9120, 0x91A0]
EnemyType =   []
EnemyHealth = []
EnemyX =      []
EnemyZ =      []
EnemyY =      []
ItemType =    []
ItemVisible = []

for address in EnemyBase
{
    array_push(EnemyType, address + 0x8)
    array_push(EnemyHealth, address + 0x10)
    array_push(EnemyX, address + 0x12)
    array_push(EnemyZ, address + 0x1A)
    array_push(EnemyY, address + 0x22)
    array_push(ItemType, address + 0x48)
    array_push(ItemVisible, address + 0x49)
}

// Dictionary of enemies
Enemies = {
  0x11: "Walker",
  0x12: "Fighter Plane",
  0x13: "Lawn Mower",
  0x14: "Spider Turret",
  0x16: "Mech Warrior",
  0x17: "Little Face",        // Stage 1 mini boss
  0x18: "Multiface",          // Stage 1 mini boss
  0x19: "Spy Pods",           // Hoppers
  0x1a: "Hork Lander",        // Stage 1 boss
  0x1b: "Spinner",
  0x1c: "Space Bats",
  0x1d: "Crystal Turret",
  0x1e: "Mosquito Mech",
  0x1f: "Demon Hand",
  0x20: "Baby Dragon",
  0x21: "Dragon",              // Stage 2 mini boss
  0x22: "Baby Kangaroo",
  0x23: "Kangaroo",
  0x24: "Dragon Mech",
  0x25: "Mini Barabary",       // Stage 2 boss minion
  0x26: "Barabary",            // Stage 2 boss
  0x27: "Fish",
  0x28: "Crab",
  0x29: "Eel",
  0x2a: "Jelly Fish",
  0x2b: "Cave Mite",
  0x2c: "Sea Horse",           // Stage 3 boss minion
  0x2d: "Gaint Crab",          // Stage 3 boss
  0x2e: "Scarab",
  0x2f: "Pyramid Turret",
  0x30: "Eagle Turret",
  0x31: "Beetle",
  0x32: "Loctus",
  0x33: "Guardian",           // Stage 4 Midboss
  0x34: "Frogman",            // Stage 4 Midboss
  0x35: "Totem",              // Stage 4 Boss
  0x36: "Energy Beam",
  0x37: "Angel Mech",
  0x38: "Space Mine",
  0x39: "Missile Turret",
  0x3a: "Laser Turret",
  0x3b: "Fire Turret",
  0x3c: "Wasps",              // Stage 5 enemy that leads you through the maze
  0x3d: "Clam Turret",
  0x3e: "Battle Angel Mech",  // Stage 5 boss
  0x41: "KAOS",               // Stage 6 boss
  0x42: "KAOS",               // Stage 6 boss
  0x43: "KAOS",               // Stage 6 boss
  0x44: "KAOS",               // Stage 6 boss
  0x45: "KAOS",               // Stage 6 boss
  0x46: "KAOS Core"                // Stage 6 boss (core)
}

// $9230/$99B0: Projectile data starting at 0x9230 every 0x80 bytes (16 max) 
// +0x00: [16-bit] Projectile 1 Type (0x0 = Active, 0x8000 = Hit, 0xFFFF = Dead)
// +0x0A: [16-bit] Projectile 1 X-Axis
// +0x0E: [16-bit] Projectile 1 Z-Axis
// +0x12: [16-bit] Projectile 1 Y-Axis

// Memory addresses for all the projectile data
ProjectileMax = 15
ProjectileBase = [0x9230, 0x92B0, 0x9330, 0x93B0, 0x9430, 0x94B0, 0x9530, 0x95B0,
                  0x9630, 0x96B0, 0x9730, 0x97B0, 0x9830, 0x98B0, 0x9930, 0x99B0]
ProjectileType = []
ProjectileX =   []
ProjectileZ =   []
ProjectileY =   []

for address in ProjectileBase
{
    array_push(ProjectileType, address)
    array_push(ProjectileX, address + 0xA)
    array_push(ProjectileZ, address + 0xE)
    array_push(ProjectileY, address + 0x12)
}

// $BE3E: [8-bit] Debug counter (0x3C = Debug Active)
function Debug() => byte(0xBE3E)

// --------------------------------------------------------------------------------------
// Helper functions

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

// To check if we've completed a stage
function Complete(variable,check) => prev(variable) == check - 1 && variable == check

// No Cheating EVER!
function Cheats() => Debug() == 0x3c

// Macro always different game states
function DebugOn() => Debug() == 0x3c
function StartGame() => prev(Menu()) != 0 && Menu() == 0
function InMenu() => Menu() != 0
function GameOver() => prev(Menu()) == 0 && Menu() != 0
function WonGame() => Stage() == 0x6 && prev(Cutscene()) < Cutscene()
function ContinueUsed() => prev(Continues()) > Continues() 

// Macros to set the minimum level of difficulty 
function Easy() => Difficulty() <= 2
function Normal() => Difficulty() >= 1 && Difficulty() <= 2
function Hard() => Difficulty() == 2

// Check if the plane is within the radius (3D boundry box)
function CloseProximty(ObjectX, ObjectY, ObjectZ, Radius)
{
    trigger = PlaneX() >= (ObjectX - Radius) &&
        PlaneX() <= (ObjectX + Radius) &&
        PlaneY() >= (ObjectY - Radius) &&
        PlaneY() <= (ObjectY + Radius) &&
        PlaneZ() >= (ObjectZ - Radius) &&
        PlaneZ() <= (ObjectZ + Radius)
    return trigger
}

// Check if the plane is close to a projectile
function DodgeProjectile(index, distance)
{
    trigger = prev(Dodge()) == 2 &&
        Dodge() == 1 &&
        word(ProjectileType[index]) == 0 &&
        CloseProximty(
          word(ProjectileX[index]), 
          word(ProjectileY[index]), 
          word(ProjectileZ[index]), 
          distance
        )
    return trigger
}

// Tracks if player destroyed any enemy by an index
function DestroyAnyEnemy(index)
{
    trigger = byte(EnemyType[index]) >= 0x10 &&
        byte(EnemyType[index]) <= 0x46 &&
        prev(bit(15, EnemyHealth[index])) < bit(15, EnemyHealth[index])
    return trigger
}

// Tracks if player destroyed any enemy by an index
function DestroyDragon(index)
{
    trigger = byte(EnemyType[index]) >= 0x21 &&
        prev(word(EnemyHealth[index])) > 0 &&
        word(EnemyHealth[index]) == 0
    return trigger
}

// Tracks any enemy spawns by an index
function SpawnAnyEnemy(index)
{
    trigger = prev(byte(EnemyType[index])) == 0 &&
        byte(EnemyType[index]) >= 0x10 &&
        byte(EnemyType[index]) <= 0x46
    return trigger
}

// Tracks if player destroyed a certian enemy by an index
function DestroyEnemy(index, enemy)
{   
    trigger = byte(EnemyType[index]) == enemy
    if enemy == 0x21
    {
        // Dragon go to 0 not 0xffff
        trigger = trigger &&
            prev(word(EnemyHealth[index])) > 0 &&
            word(EnemyHealth[index]) == 0
    }
    else
    {
        trigger = trigger &&
            prev(bit(15, EnemyHealth[index])) < bit(15, EnemyHealth[index])
    }
    return trigger
}

// Tracks if the player found a Bowwow by an index
function FindBowwow(index)
{
    trigger = byte(ItemType[index]) == 0 &&
        byte(EnemyType[index]) == 0x47 &&
        prev(bit0(ItemVisible[index])) < bit0(ItemVisible[index])
    return trigger
}

// Tracks if the player found a Mirow by an index
function FindMirow(index)
{
    trigger = byte(ItemType[index]) == 1 &&
        byte(EnemyType[index]) == 0x47 &&
        prev(bit0(ItemVisible[index])) < bit0(ItemVisible[index])
    return trigger
}

// Tracks if the player found a hidden object by an index
function FindObject(index, hidden)
{
    return dword(ObjectAddress[index]) == hidden
}

// Tracks if the player found any hidden object by an index
function FindAnyObject(index)
{
    trigger = prev(dword(ObjectAddress[index])) == 0xFFFFFFFF &&
              dword(ObjectAddress[index]) != 0xFFFFFFFF
    return trigger
}

// --------------------------------------------------------------------------------------
// Stage completion achievements

// Complete stage from start to finish
function CompleteStage(stage)
{
    if (stage == 6)
        end = WonGame()
    else
        end = Complete(Stage(), stage + 1)

    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() && 
           end
}

achievement("Docking Bay","Complete stage 1 (on easy+ difficulty)", 2, CompleteStage(1))
achievement("Underground Cave","Complete stage 2 (on easy+ difficulty)", 2, CompleteStage(2))
achievement("Underwater Passage","Complete stage 3 (on easy+ difficulty)", 3, CompleteStage(3))
achievement("Ancient Temple","Complete stage 4 (on easy+ difficulty)", 3, CompleteStage(4))
achievement("Fortress Defenses","Complete stage 5 (on easy+ difficulty)", 5, CompleteStage(5))
achievement("Mainframe","Complete stage 6 (on easy+ difficulty)", 10, CompleteStage(6))

// Challenge stage from start to finish without dying
function ChallengeStage(stage)
{   
    if (stage == 1)
        start = StartGame()
    else
        start = Complete(Stage(), stage)
        
        if (stage == 6)
        end = WonGame()
    else
        end = Complete(Stage(), stage + 1)

    return never(GameOver()) &&
           never(ContinueUsed()) &&
           unless(Cheats()) &&
           Hard() && 
           once(start) &&
           trigger_when(
                end
           )
}
achievement("Docking Bay Ace","Complete stage 1 without dying (on hard difficulty)", 10, ChallengeStage(1))
achievement("Underground Cave Ace","Complete stage 2 without dying (on hard difficulty)", 10, ChallengeStage(2))
achievement("Underwater Passage Ace","Complete stage 3 without dying (on hard difficulty)", 10, ChallengeStage(3))
achievement("Ancient Temple Ace","Complete stage 4 without dying (on hard difficulty)", 25, ChallengeStage(4))
achievement("Fortress Defenses Ace","Complete stage 5 without dying (on hard difficulty)", 50, ChallengeStage(5))
achievement("Mainframe Ace","Complete stage 6 without dying (on hard difficulty)", 25, ChallengeStage(6))

// Challenge game from start to finish without dying
function ChallengeGame(difficulty)
{   
    return never(GameOver()) &&
           never(ContinueUsed()) &&
           unless(Cheats()) &&
           difficulty && 
           once(StartGame()) &&
           trigger_when(WonGame())
}
achievement("Easy Game Ace","Complete the game without dying (on easy+ difficulty)", 10, ChallengeGame(Easy()))
achievement("Normal Game Ace","Complete the game without dying (on normal+ difficulty)", 25, ChallengeGame(Normal()))
//achievement("Hard Game Ace","Complete the game without dying (on hard difficulty)", 50, ChallengeGame(Hard()))

// --------------------------------------------------------------------------------------
// Enemies/Boss achievements

// Count how many enemies of any type were destroyed
function EnemiesDestroyed(count)
{   

    enemies = []
    for index in range (0,EnemyMax)
    {
        array_push(enemies, DestroyAnyEnemy(index))
    }
    

    return unless(InMenu()) &&
           unless(Cheats()) &&
           Normal() &&
           measured(
              tally(count, enemies)
          )
}

achievement("Bronze Star Medal","Destroy 100 Enemies (on normal+ difficulty, resets on new session)", 2, EnemiesDestroyed(100))
achievement("Silver Star Medal","Destroy 250 Enemies (on normal+ difficulty, resets on new session)", 3, EnemiesDestroyed(250))
achievement("Distinguished Flying Cross","Destroy 500 Enemies (on normal+ difficulty, resets on new session)", 5, EnemiesDestroyed(500))
achievement("Medal of Honor","Destroy 1000 Enemies (on normal+ difficulty, resets on new session)", 10, EnemiesDestroyed(1000))

// Count how many enemies of any type were destroyed
function BossDestroyed(count, boss)
{   
    type = ReverseLookup(Enemies,boss)
    
    bosses = []    
    for index in range (0,EnemyMax)
    {
        array_push(bosses, DestroyEnemy(index, type))
    }
    
    return never(GameOver()) &&
           never(ContinueUsed()) &&
           unless(Cheats()) &&
           Normal() &&
           measured(
                tally(count, bosses)
           )
}

achievement("Man-E-Faces ","Beat the multi-faced mini boss in stage 1 (on normal+ difficulty)", 5, BossDestroyed(1, "Multiface"))
achievement("Heilong ","Beat the dragon mini boss in stage 2 (on normal+ difficulty)", 5, BossDestroyed(1, "Dragon"))
achievement("Temple Guardian","Beat the guardian mini boss in stage 4 (on normal+ difficulty)", 5, BossDestroyed(1, "Guardian"))
achievement("Hork Lander","Beat stage 1 boss (on normal+ difficulty)", 10, BossDestroyed(1, "Hork Lander"))
achievement("Barabary","Beat stage 2 boss (on normal+ difficulty)", 10, BossDestroyed(1, "Barabary"))
achievement("Karkinos","Beat stage 3 boss (on normal+ difficulty)", 10, BossDestroyed(3, "Gaint Crab"))
achievement("Mechatotem","Beat stage 4 boss (on normal+ difficulty)", 10, BossDestroyed(4, "Totem"))
achievement("Battle Angel Mech","Beat stage 5 boss (on normal+ difficulty)", 10, BossDestroyed(1, "Battle Angel Mech"))
achievement("KAOS","Beat stage 6 boss (on normal+ difficulty)", 10, BossDestroyed(1, "KAOS Core"))

// --------------------------------------------------------------------------------------
// Score achievements

// Test if the score went from between the low and high score to over the high score
function ScoreRange(lowScore, highScore)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           measured(
               prev(Score()) > lowScore &&
               prev(Score()) < highScore &&
               Score() >= highScore
           )
}
        
achievement("Space Cadet","Score 100k or higher (on normal+ difficulty, resets on new game)", 5, ScoreRange(10000, 100000))
achievement("Warrant Officer","Score 200k or higher (on normal+ difficulty, resets on new game)", 5, ScoreRange(100000, 200000))
achievement("Lieutenant","Score 300k or higher (on normal+ difficulty, resets on new game)", 10, ScoreRange(200000, 300000))
achievement("Squadron Leader","Score 400k or higher (on normal+ difficulty, resets on new game)", 10, ScoreRange(300000, 400000))
achievement("Wing Commander","Score 500k or higher (on normal+ difficulty, resets on new game)", 25, ScoreRange(400000, 500000))

// --------------------------------------------------------------------------------------
// Bonus achievements

// Find the Bowwows/Mirows in a level
function Bonus(stage, bowwows, mirows)
{
    bonus = []
    for index in range (0,EnemyMax)
    {
        if bowwows > 0 { array_push(bonus, FindBowwow(index)) } 
        if mirows > 0 { array_push(bonus, FindMirow(index)) } 
    }

    return never(GameOver()) &&
           never(ContinueUsed()) &&
           never(Stage() != stage) &&
           unless(Cheats()) &&
           Normal() &&
           measured(
               tally(bowwows + mirows, bonus)
            )
}


achievement("Puppy Bonus","Find a Bowwow in stage 1 (on normal+ difficulty, resets on new game)", 5, Bonus(1, 1, 0))
achievement("Kitty Bonus","Find a Bowwow and a Mirow in stage 2 (on normal+ difficulty, resets on new game)", 5, Bonus(2, 1, 1))
achievement("Seapuppies Bonus","Find two Bowwows and a Mirow in stage 3 (on normal+ difficulty, resets on new game)", 10, Bonus(3, 2, 1))
achievement("Cat's Eye Bonus","Find a Bowwow and two Mirows in stage 4 (on normal+ difficulty, resets on new game)", 10, Bonus(4, 1, 2))
achievement("Guard Dog Bonus","Find three Bowwows and two Mirows in stage 5 (on normal+ difficulty, resets on new game)", 10, Bonus(5, 3, 2))
achievement("Final Bonus","Find three Bowwows and three Mirows in stage 6 (on normal+ difficulty, resets on game)", 10, Bonus(6, 3, 3))

// Find a list of objects hidden in the level
function FindHidden(objects)
{       
    // Loop through every object
    found = []
    for object in objects
    {
        // Get the address for the hidden object and add it to each object location
        address = ReverseLookup(HiddenObjects, object)
        for index in range(0, HiddenMax)
        {
            array_push(found, once(FindObject(index, address)))
        }
    }
    return never(GameOver()) &&
           never(ContinueUsed()) &&
           unless(Cheats()) &&
           Normal() &&
           measured(
               tally(length(objects), found)
           )
}

// The list of objects
stage1objects = ["Gameboy",  "Grabber", "Virtual Boy Controller", "Virtual Boy Console", "House"]
stage2objects = ["Fish", "Bikini Woman"]
stage3objects = ["Hermit Crab"]
stage4objects = ["Fox Face 1", "Fox Face 2", "Fox Face 3", "Fox Face 4", "Flower 1", "Flower 2", "Fox Statue 3", "Fox Statue 4"]
stage5objects = ["Man Waving Flag"]
stage6objects = ["Woman Holding Final", "Free Alien"]

achievement("Little House on the Docking Bay","Find a hidden miniature house, grabber, Game Boy, Virtual Boy, and VB controller in stage 1 (on normal+ difficulty, resets on new game)", 5, FindHidden(stage1objects))
achievement("Upstream Battle","Find a hidden fish and bikini woman in stage 2 (on normal+ difficulty, resets on new game)", 5, FindHidden(stage2objects))
achievement("Under da Sea","Find a hidden hermit crab in stage 3 (on normal+ difficulty, resets on new game)", 5, FindHidden(stage3objects))
achievement("Clan McCloud","Find four fox busts, two flowers, and two fox statues in stage 4 (on normal+ difficulty, resets on new game)", 10, FindHidden(stage4objects))
achievement("Down the Homestretch","Find the hidden man with a flag in stage 5 (on normal+ difficulty, resets on new game)", 5, FindHidden(stage5objects))
achievement("Extra Terrestrial","Find the bikini woman and free the alien in stage 6 (on normal+ difficulty, resets on new game)", 10, FindHidden(stage6objects))

// --------------------------------------------------------------------------------------
// Item achievements

// Check when the booster reach a certian level
function BoosterUpgrade(boosters)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           Complete(Booster(), boosters)
}
achievement("Booster Upgrade","Get a booster upgrade (on easy+ difficulty)", 1, BoosterUpgrade(1))
achievement("Super Booster Upgrade","Have four booster upgrades at once (on easy+ difficulty)", 10, BoosterUpgrade(4))

// 
function FullSpeed()
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           prev(Speed()) >= 40 &&
           prev(Speed()) < 79 &&
           Speed() >= 60
}
achievement("Need for Speed","Go turbo speed (on easy+ difficulty)", 2, FullSpeed())

// Check when the missles reach a certian level
function MissleUpgrade(missles)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           Complete(Missles(), missles)
}
achievement("Missile Upgrade","Get a missile upgrade (on easy+ difficulty)", 5, MissleUpgrade(3))
achievement("Full Missile Upgrade","Have four missile upgrades at once (on easy+ difficulty)", 10, MissleUpgrade(6))

// Check when the shields have been restore by 1 of 2 levels
function PowerRestored()
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           Fuel() != 999900 &&
           (prev(Sheilds()) + 1 == Sheilds() ||
           prev(Sheilds()) + 2 == Sheilds())
}
achievement("Power Restored!","Restore your sheilds (on easy+ difficulty)", 2, PowerRestored())

// Check how many shields the player has when beating a level
function ShieldsBeat(shields)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           prev(Sheilds()) == shields &&
           prev(Stage()) + 1 == Stage()
}
achievement("Skin of your teeth!","Beat a boss with no sheilds remaining (on easy+ difficulty)", 5, ShieldsBeat(0))
achievement("Untouchable!","Beat a boss with 10 sheilds remaining (on easy+ difficulty)", 10, ShieldsBeat(10))

// --------------------------------------------------------------------------------------
// Fuel achievements

// Check if the player has a certain fuel level or greater when beating a stage
function SpeedRun(stage, fuel)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           Complete(Stage(), stage + 1) &&
           Fuel() >= fuel
}
achievement("Stage 1 Speed Run","Beat stage 1 with 500,000 or more fuel remainging (on easy+ difficulty)", 5, SpeedRun(1, 500000))

// Check if the player has a certain fuel level or less when beating a stage
function LowFuel(fuel)
{
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           prev(Stage()) + 1 == Stage() &&
           Fuel() <= fuel
    
}
achievement("Running on Fumes","Beat any stage with 100,000 or less fuel remainging (on easy+ difficulty)", 5, LowFuel(100000))

// Check if the player has use less than X fuel during the game
function ConserveFuel(fuel)
{
    rawFuel = fuel / 100
    return never(GameOver()) &&
           unless(Cheats()) &&
           Easy() &&
           once(StartGame()) &&
           (
               (
                   // This alt pauses the achievement if fuel consumption is greater than the max
                   trigger_when(WonGame()) &&
                   never(
                       tally(
                           rawFuel,
                           FuelRaw() + 1 <= prev(FuelRaw()),
                           FuelRaw() + 2 <= prev(FuelRaw())
                       )
                   )
               ) || (
                   // This alt is used to show a measure of how close the fuel consumption is to the max
                   WonGame() &&
                   measured(
                       tally(
                           rawFuel,
                           FuelRaw() + 1 <= prev(FuelRaw()),
                           FuelRaw() + 2 <= prev(FuelRaw())
                       )
                   ) 
               )
           )
           
}
achievement("Fuel Conservationist","Consume less than 4,000,000 fuel in a game (on easy+ difficulty, resets on new game)", 25, ConserveFuel(4000000))

// --------------------------------------------------------------------------------------
// Dodge achievements

function DodgeCount(count, distance)
{
    dodges = []
    for index in range (0,ProjectileMax)
    {
        array_push(dodges, DodgeProjectile(index, distance))
    }
    return unless(InMenu()) &&
           unless(Cheats()) &&
           Easy() &&
           measured(
              tally(count, dodges)
          )
}

achievement("Bullet Time","Dodge 25 projectiles (on easy+ difficulty, resets on new session)", 2, DodgeCount(25, 80))
achievement("Slippery Tactics","Dodge 50 projectiles (on easy+ difficulty, resets on new session)", 3, DodgeCount(50, 80))
achievement("Evasive Maneuvers","Dodge 100 projectiles (on easy+ difficulty, resets on new session)", 5, DodgeCount(100, 80))
achievement("Impossible to Pin Down","Dodge 250 projectiles (on easy+ difficulty, resets on new session)", 10, DodgeCount(250, 80))

// ---------------------------------------------------------------------------
// Dynamic Rich Presence
rich_presence_conditional_display(
    Menu() == 0 && 
    Debug() == 0x3c,
    "Tech-Wing Fighter is the cheating, achievements locked!"
) 

rich_presence_conditional_display(
    Menu() == 0 && 
    Stage() == 7, 
    "Tech-Wing Fighter beat KAOS!"
) 
    
rich_presence_conditional_display(
    Menu() == 0 && 
    Stage() >= 1 &&
    Stage() <= 6, 
    "🚩 {0} | ✈ {1} | 💯 {2} | ⛽ {3} | 🛡 {4} | 💨 {5} | 🚀 {6}",
    rich_presence_value("Value", Stage()),
    rich_presence_value("Value", Continues()),
    rich_presence_value("Value", Score()),
    rich_presence_value("Value", Fuel()),
    rich_presence_value("Value", Sheilds()),
    rich_presence_value("Value", Booster()),
    rich_presence_value("Value", Missles()-2)   
) 
    
rich_presence_display("In Menu")

// ---------------------------------------------------------------------------
// Leaderboards


// All the highest score leaderboards for each difficulty
function LeaderboardScore(title, difficulty)
{
    condition = Difficulty() == ReverseLookup(DifficultyLookup,difficulty)
    leaderboard(
        title,
        "Starting from stage 1 on " + difficulty + " difficulty, highest score before using a continue, a game over, or winning the game (no cheats)",
        StartGame() && !Cheats() && condition,
        always_false(),
        ContinueUsed() || GameOver() || WonGame(),
        Score() 
    )
}
LeaderboardScore("Highest Score Easy", "easy")
LeaderboardScore("Highest Score Normal", "normal")
LeaderboardScore("Highest Score Hard", "hard")

// All the lowest time leaderboards for each level
function LeaderboardTime(title, stage, difficulty)
{
    if (stage == 1)
        start = StartGame()
    else
        start = Complete(Stage(), stage)
    
    if (stage == 6)
        end = WonGame()
    else
        end = Complete(Stage(), stage + 1)
    
    
    leaderboard(
        title,
        "Most fuel remaining after completing stage " + stage + " on normal+",
        start && !Cheats() && difficulty,
        GameOver(),
        end,
        Fuel()
    )
}
LeaderboardTime("Fuel Remaining Stage 1", 1, Normal())
LeaderboardTime("Fuel Remaining Stage 2", 2, Normal())
LeaderboardTime("Fuel Remaining Stage 3", 3, Normal())
LeaderboardTime("Fuel Remaining Stage 4", 4, Normal())
LeaderboardTime("Fuel Remaining Stage 5", 5, Normal())
LeaderboardTime("Fuel Remaining Stage 6", 6, Normal())