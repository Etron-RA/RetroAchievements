// ~Hack~ Teenage Super Ninja Plumbers
// #ID = 20561

// $000B: [8-bit] Input
function Input() => byte(0x00000B)

// $000E: [8-bit] Player's State:
//        0=lives screen/loading
//        1=Vine Warp
//        2=Entering Pipe (sides)
//        3=Enter Pipe (bottom)
//        4=Flag Pole
//        5=Autoscroll/area complete
//        6=Game Over
//        7=Transition into area
//        8=Normal
//        9=Growing
//        A=Shrinking
//        B=Dying (Going Up and Down)
//        C=Flowering
function PlayerState() => byte(0x00000E)

// $000F: [8-bit] Enemy 1-5 Loaded flag
function EnemyLoaded(index) => byte(0x00000F + index)

// $0014: [8-bit] Powerup: Loaded
function PowerupLoaded() => byte(0x000014)

// $0016: [8-bit] Enemy 1-5: Type
// *00 = Koopa Troopa
// *01 = Deteated flying up-down Koopa Troopa
// *02 = Beetle
// *03 = Red Turtle
// x04 = Another Kooopa Troopa
// *05 = Hammer Bros
// *06 = Goomba
// 07 = Blooper
// *08 = Bullet
// 0A = Green fish
// 0B = Red fish
// 0D = Piranha Plant
// *0E = Jumping Koopa Troopa
// *0F = Flying up-down Koopa Troopa
// 10 = Flying left-right Koopa Troopa
// 11 = Lakitu
// *12 = Red spikes by Lakitu
// *14 = Flying Fish
// 33 = Bullet Bill CannonVar
function EnemyType(index) => byte(0x0000016 + index)
Green_Koopa = 0x00
Buzzy_Beetle = 0x02
Red_Koopa = 0x03
Hammer_Bro = 0x05
Goomba = 0x06
Blooper = 0x07
Bullet_Bill_FrenzyVar = 0x08
Grey_Cheep_Cheep = 0x0a
Red_Cheep_Cheep = 0x0b
Piranha_Plant = 0x0d
Green_Paratroopa_Jump = 0x0e
Red_Paratroopa = 0x0f
Green_Paratroopa_Fly = 0x10
Lakitu = 0x11
Spiny = 0x12
Flying_Cheep_Cheep = 0x14
BBill_CCheep_Frenzy = 0x17
Bullet_Bill_CannonVar = 0x33
Bowser = 0x2d

// $001B: [8-bit] Power-up: "Type"
function PowerUpType() => byte(0x00001B)

// $001D: [8-bit] Fallstate - 00 = on solid ground, 01 = last jumped, 02 = falling off a platform, 03=sliding down flagpole
function Fallstate() => byte(0x00001D)

// $001e: [8-bit] Enemy 1-5 State
// 0x00 - Does _not_ mean they don't exist
// 0x01 - falling_enemy or Bullet_Bill drawn(not killed yet).
// 0x04 - Enemy Stomped
// 0x20 - BulletBill / CheepCheep / hammer_bro stomped
// 0x22 - killed with fire or star
// 0x23 - bowser_killed
// 0xC4 - koopa stomped falling
// 0x84 - koopa or buzzyBeetle Stomped and moving;
// 0xFF - Will kill them off (like getting hit by a star)
function EnemyState(index) => byte(0x000001e + index)
EnemyUpsideDown = 0x3
EnemyStomped = 0x4
EnemyKnockOut = 0x20
EnemyFireStarKill = 0x22
BowserKill = 0x23
BowserFalling = 0x40
KoopaStomppedFalling = 0xC4
KoopaStomppedSliding = 0x84

// $0039: [8-bit] Power Up (when on screen): 0=Mushroom, 1=Flower, 2=Star, 3=1 Up
function PowerUpWhenOnScreen() => byte(0x000039)

// $004B: [8-bit] Power Up's direction: 1=Right, 2=Left
function PowerUpSDirection() => byte(0x00004B)

// $00A5: [8-bit] 1-up spawned already?
function UpSpawnedAlready() => byte(0x0000A5)

// $00E7: [8bit] Level Layout
function LevelLayout() => byte(0x0000E7)

// $010D: [8-bit] Flapole offset 1, set to 0x36 => 0x34 when at end of animation
function FlagpoleOffset() => byte(0x00010D)

// $010F: [8-bit] Amount won on flag:
//        00=5000, 01=2000, 02=800, 03=400, 04=100
function AmountWonOnFlag() => byte(0x00010F)

// $0115: [8-bit] 6 = when picking up any power up
//        b = when picking up 1-up
function WhenPickingUpAnyPowerUp() => byte(0x000115)

// $0483: [8-bit] Bowser Health
function BowserHealth() => byte(0x000483)

// $0500: [416 bytes] Title sprite (from 0x500 to 0x69F)
//        0x10 = Warp Pipe Vertical
//        0x1c = Warp Pipe Horizontal
//        0x55 = Hidden Powerup
//        0x56 = Hidden Vine
//        0x57 = Hidden Invincible
//        0x58 = Hidden Multi Coin
//        0x59 = Hidden 1up
//        0x5A = Block Powerup
//        0x5B = Block Vine
//        0x5C = Block Invincible
//        0x5D = Block Multi Coin
//        0x5E = Block 1up
//        0x5F = Block Coin
//        0x60 = Block 1up
//        0xc0 = Question Block One Coin
//        0xc1 = Question Block Powerup
//        0xc2 = Above Ground Coin
//        0xc3 = Underwater Coin
function Map(index) => byte(0x500 + index)

WarpPipeVertical = [0x10]
WarpPipeHorizontal = [0x1c]
Vines = [0x56, 0x5B]
Invincibilty = [0x57, 0x5C]
Powerups = [0x55, 0x5A, 0xC1]
ExtraLives = [0x59, 0x5E, 0x60]
Coins = [0x5f, 0xc0, 0xc2, 0xc3]
Multicoins = [0x58, 0x5d]

// $06D7: [8-bit] Number of Fireworks
function NumberOfFireworks() => byte(0x0006D7)

// $0704: [8-bit] Can swim flag
function CanSwimFlag() => byte(0x000704)

// $071A: [8-bit] Screen Offset
function ScreenOffset() => byte(0x00071A)

// $0748: [8-bit] Coins collected this phase
function CoinsCollectedThisPhase() => byte(0x000748)

// $0750: [8-bit] Area ID Loaded
function AreaIdLoaded() => byte(0x000750)

// $0752: [8-bit] Starting location:
//        0 = normal/undergroud/underwater
//        1 = falling from/to bonus
//        2 = returning from pipe/acsending the vine
function StartingLocation() => byte(0x000752)

// $0756: [8-bit] Set to 01 when large mario, 02 when fire-flower mario
function PowerUpState() => byte(0x000756)

// $0757: [8-bit] Showing Player Lives Screen =01
function ShowingPlayerLivesScreen() => byte(0x000757)

// $0759: [8-bit] time up flag
function TimeUpFlag() => byte(0x000759)

// $075A: [8-bit] Mario Number of Lives, set to ff when game over
function Lives() => byte(0x00075A)

// $075C: [8-bit] Act Number (0 based)
function Act() => byte(0x00075C)

// $075D: [8-bit] Hidden 1 Up flag
function Hidden1UpFlag() => byte(0x00075D)

// $075E: [8-bit] Current Coin Count
function Coins() => byte(0x00075E)

// $075F: [8-bit] World (0 based)
function World() => byte(0x00075F)
function UniqueLevel() => World() * 0x10 + Act()

// $0760: [8-bit] Level (0 based)
function Level() => byte(0x000760)

// $0770: [8-bit] Gameplay Mode, 00=demo/menu, 01=playing,
//        02=end of level NB. Set to 02 and wait to advance a world
function GameplayMode() => byte(0x000770)

// $0776: [8-bit] Pause: 00=normal 81=pausing 01=paused 80=unpausing
function Pause() => byte(0x000776)

// $077A: [8-bit] Single Player Mode = 00
//        Two Player Mode = 01
function SinglePlayerMode() => byte(0x00077A)

// $079F: [8-bit] Invulnerability Counter: starts at 23, counts to 0, 0=normal
function Invulnerability() => byte(0x00079F)

// $07B1: [8-bit] player ko flag
function PlayerKoFlag() => byte(0x0007B1)

// $07DD: [8-bit] P1 Score: X,000,000
// $07DE: [8-bit] P1 Score: 0,X00,000
// $07DF: [8-bit] P1 Score: 0,0X0,000
// $07E0: [8-bit] P1 Score: 0,00X,000
// $07E1: [8-bit] P1 Score: 0,000,X00
// $07E2: [8-bit] P1 Score: 0,000,0X0
function ScoreX000000() => byte(0x0007DD)
function Score0X00000() => byte(0x0007DE)
function Score00X0000() => byte(0x0007DF)
function Score000X000() => byte(0x0007E0)
function Score0000X00() => byte(0x0007E1)
function Score00000X0() => byte(0x0007E2)
function Score() {
    return ScoreX000000() * 1000000 + 
        Score0X00000() * 100000 + 
        Score00X0000() * 10000 + 
        Score000X000() * 1000 + 
        Score0000X00() * 100 + 
        Score00000X0() * 10 
}

// $07F8: [8-bit] Timer: X00
// $07F9: [8-bit] Timer: 0X0
// $07FA: [8-bit] Timer: 00X
function TimerX00() => byte(0x0007F8)
function Timer0X0() => byte(0x0007F9)
function Timer00X() => byte(0x0007FA)
function Score() {
    return TimerX00() * 100 + 
        Timer0X0() * 10 +
        Timer00X()
}


// $07FC: [8-bit] Second Quest enabled = 01
function Quest() => byte(0x0007FC)
function FirstQuest() => Quest() == 0
function SecondQuest() => Quest() == 1

// $081D: 00=Touching Ground
//        01=Jumping
//        02=Falling
//        03=Flag touching
function TouchingFlag() => byte(0x00081D)

KillList = [
    [Green_Koopa, EnemyStomped],
    [Green_Koopa, EnemyFireStarKill],
    [Buzzy_Beetle, EnemyStomped],
    [Buzzy_Beetle, EnemyFireStarKill],
    [Red_Koopa, EnemyStomped],
    [Red_Koopa, EnemyFireStarKill],
    [Hammer_Bro, EnemyKnockOut],
    [Hammer_Bro, EnemyFireStarKill],
    [Goomba, EnemyStomped],
    [Goomba, EnemyFireStarKill],
    [Blooper, EnemyFireStarKill],
    [Bullet_Bill_FrenzyVar, EnemyKnockOut],
    [Bullet_Bill_FrenzyVar, EnemyFireStarKill],
    [Grey_Cheep_Cheep, EnemyFireStarKill],
    [Red_Cheep_Cheep, EnemyFireStarKill],
    [Piranha_Plant, EnemyFireStarKill],
    [Green_Paratroopa_Jump, EnemyFireStarKill],
    [Red_Paratroopa, EnemyFireStarKill],
    [Green_Paratroopa_Fly, EnemyFireStarKill],
    [Lakitu, EnemyKnockOut],
    [Lakitu, EnemyFireStarKill],
    [Spiny, EnemyFireStarKill],
    [Flying_Cheep_Cheep, EnemyKnockOut],
    [Flying_Cheep_Cheep, EnemyFireStarKill],
    [BBill_CCheep_Frenzy, EnemyKnockOut],
    [BBill_CCheep_Frenzy, EnemyFireStarKill],
    [Bullet_Bill_CannonVar, EnemyKnockOut],
    [Bullet_Bill_CannonVar, EnemyFireStarKill],
    [Bowser, BowserKill], 
    [Bowser, BowserFalling]
]

HarmList = [
    [Green_Koopa, EnemyStomped],
    [Green_Koopa, EnemyFireStarKill],
    [Buzzy_Beetle, EnemyStomped],
    [Buzzy_Beetle, EnemyFireStarKill],
    [Red_Koopa, EnemyStomped],
    [Red_Koopa, EnemyFireStarKill],
    [Hammer_Bro, EnemyKnockOut],
    [Hammer_Bro, EnemyFireStarKill],
    [Goomba, EnemyStomped],
    [Goomba, EnemyFireStarKill],
    [Blooper, EnemyFireStarKill],
    [Bullet_Bill_FrenzyVar, EnemyKnockOut],
    [Bullet_Bill_FrenzyVar, EnemyFireStarKill],
    [Grey_Cheep_Cheep, EnemyFireStarKill],
    [Red_Cheep_Cheep, EnemyFireStarKill],
    [Piranha_Plant, EnemyFireStarKill],
    [Green_Paratroopa_Jump, EnemyStomped],
    [Green_Paratroopa_Jump, EnemyFireStarKill],
    [Red_Paratroopa, EnemyStomped],
    [Red_Paratroopa, EnemyFireStarKill],
    [Green_Paratroopa_Fly, EnemyStomped],
    [Green_Paratroopa_Fly, EnemyFireStarKill],
    [Lakitu, EnemyKnockOut],
    [Lakitu, EnemyFireStarKill],
    [Spiny, EnemyFireStarKill],
    [Flying_Cheep_Cheep, EnemyKnockOut],
    [Flying_Cheep_Cheep, EnemyFireStarKill],
    [BBill_CCheep_Frenzy, EnemyKnockOut],
    [BBill_CCheep_Frenzy, EnemyFireStarKill],
    [Bullet_Bill_CannonVar, EnemyKnockOut]
]

Enemies = {
    Green_Koopa: ["Green Koopa", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Buzzy_Beetle: ["Buzzy Beetle", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Red_Koopa: ["Red Koopa", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Hammer_Bro: ["Hammer Bro", [EnemyKnockOut, EnemyFireStarKill]],
    Goomba: ["Goomba", [EnemyStomped, EnemyFireStarKill]],
    Blooper: ["Blooper", [EnemyFireStarKill]],
    Bullet_Bill_FrenzyVar: ["Bullet Bill Frenzy", [EnemyKnockOut, EnemyFireStarKill]],
    Grey_Cheep_Cheep: ["Grey Cheep Cheep", [EnemyFireStarKill]],
    Red_Cheep_Cheep: ["Red Cheep Cheep", [EnemyFireStarKill]],
    Piranha_Plant: ["Piranha Plant", [EnemyFireStarKill]],
    Green_Paratroopa_Jump: ["Jumping Green Paratroopa", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Red_Paratroopa: ["Red Paratroopa", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Green_Paratroopa_Fly: ["Flying Green Paratroopa", [EnemyUpsideDown, EnemyStomped, EnemyFireStarKill]],
    Lakitu: ["Lakitu", [EnemyKnockOut, EnemyFireStarKill]],
    Spiny: ["Spiny", [EnemyUpsideDown, EnemyFireStarKill]],
    Flying_Cheep_Cheep: ["Flying Cheep Cheep", [EnemyKnockOut, EnemyFireStarKill]],
    BBill_CCheep_Frenzy: ["Bullet Bill Cheep Cheep Frenzy", [EnemyKnockOut, EnemyFireStarKill]],
    Bullet_Bill_CannonVar: ["Bullet Bill Cannon", [EnemyKnockOut, EnemyFireStarKill]],
    Bowser: ["Bowser", [EnemyFireStarKill]]
}

EndLevel = [2, 2, 2, 2, 1, 0, 0, 0]

function StateCount(list, count)
{
    state_array = []
    for pair in list
    {
        enemy_type = pair[0]
        enemy_state = pair[1]
        
        for index in range (0,4)
        {
        
            if (enemy_type == Green_Koopa ||
                enemy_type == Buzzy_Beetle ||
                enemy_type == Red_Koopa)
            {  
                // If koopa of beetle then add extra check to prevent double count
                state_test = EnemyLoaded(index) == 1 &&
                    EnemyType(index) == enemy_type &&                
                    prev(EnemyState(index)) != enemy_state &&
                    prev(EnemyState(index)) != KoopaStomppedFalling &&
                    prev(EnemyState(index)) != KoopaStomppedSliding &&
                    EnemyState(index) == enemy_state 
            }
            else
            {
                // If regular enemy check for stompped of fireball state
                state_test = EnemyLoaded(index) == 1 &&
                    EnemyType(index) == enemy_type &&                
                    prev(EnemyState(index)) != enemy_state &&
                    EnemyState(index) == enemy_state 
            }
        
            array_push(state_array, state_test)
        }
    }
    
    return measured(tally(count, state_array))
}

// achievement("Kill Test","Test of how many enemies you've killed",0,StateCount(KillList, 10000))

function SpawnTest(enemy_type, count)
{
    spawn_array = []
    for index in range (0,4)
    {   
        state_test = prev(EnemyLoaded(index)) == 0 &&
            EnemyLoaded(index) == 1 &&
            EnemyType(index) == enemy_type            
            
        array_push(spawn_array, state_test)
    }
    return measured(tally(count, spawn_array))
}

for enemy in Enemies
{   
    enemy_type = enemy
    enemy_name = Enemies[enemy][0]
    achievement("Spawned " + enemy_name,"Test of how many " + enemy_name + " have spawned",0,SpawnTest(enemy_type, 10000))
}

function KillTest(enemy_type, enemy_info, count)
{
    list = []
    for enemy_state in enemy_info
    {
        array_push(list, [enemy_type, enemy_state])
    }
    return StateCount(list, count)
}

for enemy in Enemies
{   
    enemy_type = enemy
    enemy_name = Enemies[enemy][0]
    enemy_states = Enemies[enemy][1]
    achievement("Killed " + enemy_name,"Test of how many " + enemy_name + " have spawned",0,KillTest(enemy_type, enemy_states, 10000))
}

function BlockSpawn(type, count)
{
    spawn_array = []
    for index in range (0,415)
    {   
        spawn_test = prev(Map(index)) != type &&
            Map(index) == type            
            
        array_push(spawn_array, spawn_test)
    }
    return measured(tally(count, spawn_array))
}

function BlockCount(coinmap, count)
{
    spawn_array = []
    for coin in coinmap
    {
        for index in range (0,415)
        {   
            spawn_test = prev(Map(index)) != coin &&
                Map(index) == coin            
            
            array_push(spawn_array, spawn_test)
        }
    }
    return unless(GameplayMode() != 1) && measured(tally(count, spawn_array))
}

WarpPipeVertical = [0x10]
WarpPipeHorizontal = [0x1c]
Vines = [0x56, 0x5B]
Invincibilty = [0x57, 0x5C]
Powerups = [0x55, 0x5A, 0xC1]
ExtraLives = [0x59, 0x5E, 0x60]
Coins = [0x5f, 0xc0, 0xc2, 0xc3]
Multicoins = [0x58, 0x5d]

achievement("Approximate vertical warp pipes count","The approximate number of horizontal warp pipes spawned",0, BlockCount(WarpPipeVertical, 10000))
achievement("Approximate horizontal warp pipes count","The approximate number of horizontal warp pipes spawned",0, BlockCount(WarpPipeHorizontal, 10000))
achievement("Approximate vines count","The approximate number of vines spawned",0, BlockCount(Vines, 10000))
achievement("Approximate star count","The approximate number of star spawned",0, BlockCount(Invincibilty, 10000))
achievement("Approximate powerups count","The approximate number of powerups spawned",0, BlockCount(Powerups, 10000))
achievement("Approximate lives count","The approximate number of lives spawned",0, BlockCount(ExtraLives, 10000))
achievement("Approximate coin count","The approximate number of coins spawned",0, BlockCount(Coins, 10000))
achievement("Approximate multicoin count","The approximate number of multicoin blocks spawned",0, BlockCount(Multicoins, 10000))

function LevelStart(world, act)
{
    unique_level = world * 0x10 + act
    if (unique_level == 0)
    {
        return World() == world &&
        Act() == act &&
        ScreenOffset() == 0 && 
        prev(GameplayMode()) == 0 &&
        GameplayMode() == 1
    }
    
    return  GameplayMode() == 1 &&
        prev(UniqueLevel()) != unique_level &&
        UniqueLevel() == unique_level
}

for world in range(0,7)
{
    for act in range(0,EndLevel[world])
    {
       text = "Start "+ world + 1 + "-" + act + 1
       achievement(text,text,0,LevelStart(world, act))
    }
}

function LevelBeat(world, act)
{
    trigger = World() == world &&
        Act() == act
        
    if (EndLevel[world] == act)
    {
        trigger = trigger &&
            ScreenOffset() != 0 && 
            prev(GameplayMode()) == 1 && 
            GameplayMode() == 2
    }
    else
    {
        trigger = trigger &&
            GameplayMode() == 1 &&
            ScreenOffset() != 0 && 
            prev(FlagpoleOffset()) == 0x36 &&
            FlagpoleOffset() == 0x34
    }
    return trigger
}

for world in range(0,7)
{
    for act in range(0,EndLevel[world])
    {
        text = "Beat "+ world + 1 + "-" + act + 1
        achievement(text,text,0,LevelBeat(world, act))
    }
}

leaderboard(
    "Speedrun 1st Quest",
    "Fastest time to beat 1st quest",
    LevelStart(0, 0) && FirstQuest(),
    GameplayMode() == 0,
    LevelBeat(3, 2),
    always_true(),
    lower_is_better = true
)

leaderboard(
    "Speedrun 2nd Quest",
    "Fastest time to beat 2nd quest",
    LevelStart(0, 0) && SecondQuest(),
    GameplayMode() == 0,
    LevelBeat(3, 2),
    always_true(),
    lower_is_better = true
)

for world in range(0,7)
{
    for act in range(0,EndLevel[world])
    {
        title = "Speedrun "+ world + 1 + "-" + act + 1
        text = "Fastest time to beat  "+ world + 1 + "-" + act + 1
        leaderboard(
            title,
            text,
            LevelStart(world, act),
            GameplayMode() == 0,
            LevelBeat(world, act),
            always_true(),
            lower_is_better = true
        )
    }
}

