// ~Hack~ Teenage Super Ninja Plumbers
// #ID = 20561

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
function EnemyType(index) => byte(0x0000016 + index)
Green_Koopa = 0x00
Koopa_Shell = 0x01
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
function EnemyState(index) => byte(0x000001e + index)
EnemyTransform = 0x1
EnemyUpsideDown = 0x3
EnemyStomped = 0x4
EnemyKnockOut = 0x20
EnemyFireStarKill = 0x22
BowserKill = 0x23
BowserFalling = 0x40
KoopaUpsidedDownFalling= 0xC3
KoopaUpsidedDownSliding = 0x83
KoopaStomppedFalling = 0xC4
KoopaStomppedSliding = 0x84

// $0033: [8-bit] Player facing, 00=not on screen, 01=right, 02=left
function PlayerFacing() => byte(0x000033)
function PlayerFacingRight() => PlayerFacing() == 1
function PlayerFacingLeft() => PlayerFacing() == 2

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

// $0110: [8-bit] 0x110-0x114 enemy ko multiplier
function EnemyMultiplier(index) => byte(0x000110 + index)

// $0115: [8-bit] 6 = when picking up any power up
//        b = when picking up 1-up
function WhenPickingUpAnyPowerUp() => byte(0x000115)

// $0483: [8-bit] Bowser Health
function BowserHealth() => byte(0x000483)

// $06D7: [8-bit] Number of Fireworks
function NumberOfFireworks() => byte(0x0006D7)

// $0704: [8-bit] Can swim flag
function CanSwimFlag() => byte(0x000704)

// $071A: [8-bit] Screen Offset
function ScreenOffset() => byte(0x00071A)

// $074A: [8-bit] Controller Input, Bits are:
//        0, 1, 2, 3, 4, 5, 6, 7
//        R, L, D, U, Start, Select, B, A
function LeftButton() => bit1(0x00074A)

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
function PowerDown() => prev(PowerUpState()) > PowerUpState()
PowerUpSmallMario = 0
PowerUpBigMario = 1
PowerUpFireMario = 2

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
function GameOver() => GameplayMode() == 0

// $0773: [8-bit] Level Palette (0x00 - 0x04)
//        00 - Normal
//        01 - Underwater
//        02 - Night
//        03 - Underground
//        04 - Castle
function LevelPalette() => byte(0x00773)
Levels = {
    0: "overworld",
    1: "water",
    2: "city streets",
    3: "sewers",
    4: "turtles lair"
}

// $0776: [8-bit] Pause: 00=normal 81=pausing 01=paused 80=unpausing
function Pause() => byte(0x000776)

// $077A: [8-bit] Single Player Mode = 00
//        Two Player Mode = 01
function SinglePlayerMode() => byte(0x00077A)
Players = {
    0: "Mario",
    1: "Luigi"
}

// $079D: [8-bit] Timer: Multi-coin block
function MulticoinTimer() => byte(0x00079d)

// $079F: [8-bit] Invulnerability Counter: starts at 23, counts to 0, 0=normal
function Invulnerability() => byte(0x00079F)

// $07B1: [8-bit] player ko flag
function PlayerKoFlag() => bit0(0x0007B1)
function PlayerKo() => prev(PlayerKoFlag()) < PlayerKoFlag()

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
function Time() {
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

Transforms = [
    [Green_Paratroopa_Jump, Green_Koopa],
    [Red_Paratroopa, Red_Koopa],
    [Green_Paratroopa_Fly, Green_Koopa]
]

KillList = [
    [Green_Koopa, KoopaUpsidedDownSliding],
    [Green_Koopa, KoopaUpsidedDownFalling],
    [Green_Koopa, KoopaStomppedSliding],
    [Green_Koopa, KoopaStomppedFalling],
    [Green_Koopa, EnemyFireStarKill],
    [Koopa_Shell, KoopaUpsidedDownSliding],
    [Koopa_Shell, KoopaUpsidedDownFalling],
    [Koopa_Shell, KoopaStomppedSliding],
    [Koopa_Shell, KoopaStomppedFalling],
    [Koopa_Shell, EnemyFireStarKill],
    [Buzzy_Beetle, KoopaUpsidedDownSliding],
    [Buzzy_Beetle, KoopaUpsidedDownFalling],
    [Buzzy_Beetle, KoopaStomppedSliding],
    [Buzzy_Beetle, KoopaStomppedFalling],
    [Buzzy_Beetle, EnemyFireStarKill],
    [Red_Koopa, KoopaUpsidedDownSliding],
    [Red_Koopa, KoopaUpsidedDownFalling],
    [Red_Koopa, KoopaStomppedSliding],
    [Red_Koopa, KoopaStomppedFalling],
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
    [Bowser,BowserKill],
    [Bowser,EnemyKnockOut],
    [Bowser,EnemyFireStarKill],
    [Bowser,BowserFalling]
]

Goombas = [
    [Goomba, EnemyStomped],
    [Goomba, EnemyFireStarKill]
]

BuzzyBeetles = [
    [Buzzy_Beetle, KoopaUpsidedDownSliding],
    [Buzzy_Beetle, KoopaUpsidedDownFalling],
    [Buzzy_Beetle, KoopaStomppedSliding],
    [Buzzy_Beetle, KoopaStomppedFalling],
    [Buzzy_Beetle, EnemyFireStarKill],
]

CheepCheeps = [
    [Grey_Cheep_Cheep, EnemyFireStarKill],
    [Red_Cheep_Cheep, EnemyFireStarKill]
]

Koopas = [
    [Green_Koopa, KoopaUpsidedDownSliding],
    [Green_Koopa, KoopaUpsidedDownFalling],
    [Green_Koopa, KoopaStomppedSliding],
    [Green_Koopa, KoopaStomppedFalling],
    [Green_Koopa, EnemyFireStarKill],
    [Koopa_Shell, KoopaUpsidedDownSliding],
    [Koopa_Shell, KoopaUpsidedDownFalling],
    [Koopa_Shell, KoopaStomppedSliding],
    [Koopa_Shell, KoopaStomppedFalling],
    [Koopa_Shell, EnemyFireStarKill],
    [Red_Koopa, KoopaUpsidedDownSliding],
    [Red_Koopa, KoopaUpsidedDownFalling],
    [Red_Koopa, KoopaStomppedSliding],
    [Red_Koopa, KoopaStomppedFalling],
    [Red_Koopa, EnemyFireStarKill],
    [Green_Paratroopa_Jump, EnemyFireStarKill],
    [Red_Paratroopa, EnemyFireStarKill],
    [Green_Paratroopa_Fly, EnemyFireStarKill],
]

HammerBros = [
    [Hammer_Bro, EnemyKnockOut],
    [Hammer_Bro, EnemyFireStarKill]
]

BulletBills = [
    [Bullet_Bill_FrenzyVar, EnemyKnockOut],
    [Bullet_Bill_FrenzyVar, EnemyFireStarKill],
    [Bullet_Bill_CannonVar, EnemyKnockOut]
]

Lakitus = [
    [Lakitu, EnemyKnockOut],
    [Lakitu, EnemyFireStarKill]
]

Spinys = [
    [Spiny, EnemyFireStarKill]
]

PiranhaPlants = [
    [Piranha_Plant, EnemyFireStarKill]
]

Bloopers = [
    [Blooper, EnemyFireStarKill]
]

Bowser = [
    [Bowser,BowserKill],
    [Bowser,EnemyKnockOut],
    [Bowser,EnemyFireStarKill]
]

EndLevel = [2, 2, 2, 2, 1, 0, 0, 0]

// Helper function that converts time to frames
function TimeSpan(minutes, seconds, frames) => (minutes * 3600) + (seconds * 60) + frames

// Conditions to test if currently on a level
function OnLevel(world, act)
{
    return World() == world - 1 &&
        Act() == act - 1 &&
        SinglePlayerMode() == 0 &&
        GameplayMode() == 1
}

// Event when starting a level
function LevelStart(world, act)
{
    unique_level = (world - 1) * 0x10 + (act - 1)
    if (unique_level == 0)
    {
        return World() == world - 1 &&
            Act() == act - 1 &&
            ScreenOffset() == 0 && 
            SinglePlayerMode() == 0 &&
            prev(GameplayMode()) == 0 &&
            GameplayMode() == 1
    }
    
    return  SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        prev(UniqueLevel()) != unique_level &&
        UniqueLevel() == unique_level
}

// Event when beating a level
function LevelBeat(world, act)
{
    trigger = World() == world - 1 &&
        Act() == act - 1
        
    if (EndLevel[world - 1] == act - 1)
    {
        trigger = trigger &&
            SinglePlayerMode() == 0 &&
            ScreenOffset() != 0 && 
            prev(GameplayMode()) == 1 && 
            GameplayMode() == 2
    }
    else
    {
        trigger = trigger &&
            SinglePlayerMode() == 0 &&
            GameplayMode() == 1 &&
            ScreenOffset() != 0 && 
            prev(FlagpoleOffset()) == 0xb0 &&
            FlagpoleOffset() == 0xae
    }
    return trigger
}

// Event when getting a power up
function ObtainPowerUp(powerUp)
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        PowerUpState() == powerUp
}

// Event when collecting a 1up mushroom
function Collect1up()
{    
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        PowerUpWhenOnScreen() == 3 &&
        WhenPickingUpAnyPowerUp() == 0xb
}

// Event when the invincible timer is on
function Invincible()
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        Invulnerability() > 0
}

// Event when Mario is underwater
function Underwater()
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        LevelPalette() == 0x1
}

// Event when collecting x coins from a multiblock
function Multiblock(coins)
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        never(MulticoinTimer() == 0) &&
        measured(repeated(coins, prev(Coins()) != Coins()))
}

// Event when collecting 100 coins
function Coins1up()
{
	// Handle the cases of collecting 2 coins at once
	coinArray = [
            prev(Coins()) == 99 && Coins() == 0,
            prev(Coins()) == 98 && Coins() == 0,
            prev(Coins()) == 99 && Coins() == 1
	]
	
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 && 
		any_of(coinArray, c => c)
}

// Event when getting a 1up from a life combo
function LifeCombo()
{
    multipliers = []
    for index in range(0,4)
        array_push(multipliers, EnemyMultiplier(index) >= 0xb)
        
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 && 
        any_of(multipliers, m => m)
}

// Event when hitting the top of a flag at the end of level
function Flagpole()
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        AmountWonOnFlag() == 0 &&
        prev(PlayerState()) == 4 &&
        PlayerState() == 5
}

// Event when lives reachs a certain value
function LifeCollector(lives)
{
   return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        prev(Lives()) == lives - 2 && 
        measured(Lives() + 1 == lives)
}

// Challenge to complete a level without pressing left
function RightOnly(world, act)
{
    start = once(LevelStart(world, act))
    
    cancel =  never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&   
        never(prev(LeftButton()) < LeftButton()) 
        
    submit = trigger_when(LevelBeat(world, act))
    
    return start && cancel && submit
}

// Event when the warpzone is revealed
function WarpZone()
{
    return SinglePlayerMode() == 0 &&
        GameplayMode() == 1 &&
        World() == 0 &&
        Act() == 1 && 
        prev(ScreenOffset()) == 0xe &&
        ScreenOffset() == 0xf
}

// Challenge to beat a level without taking damage or dying
function Damageless(world, act)
{
    start = once(LevelStart(world, act))
    
    cancel =  never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&    
        never(PowerDown()) &&
        never(PlayerKo())
        
    submit = trigger_when(LevelBeat(world, act))
    
    return start && cancel && submit
}

// Collect a certain number of coins on a level without dying
function CoinCollector(world, act, coins)
{
    start = once(SinglePlayerMode() == 0 &&
                GameplayMode() == 1 &&
                World() == world - 1 &&    
                Act() == act - 1)
    
    cancel = never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&
        never(PlayerKo())
    
    // Handles the cases for collecting two coins at once
    coinCounter = [
        prev(Coins()) + 1 <= Coins(),        
        prev(Coins()) + 2 <= Coins(),
        prev(Coins()) == 99 && Coins() == 0,
        prev(Coins()) == 98 && Coins() == 0,
        prev(Coins()) == 99 && Coins() == 1 
    ]
    
    measure = measured(
            tally(coins, coinCounter),
            World() == world - 1 && 
			Act() == act - 1
        )
        
    trigger = trigger_when(tally(coins, coinCounter))
    
    return start && cancel && (measure || trigger)
}

// Challenge to collect a invincibility item while invincible
function DoubleInvincible(world, act)
{
    start = once(
            World() == world - 1 &&
            Act() == act - 1 &&
            SinglePlayerMode() == 0 &&
            GameplayMode() == 1 && 
            prev(Invulnerability()) == 0 && 
            Invulnerability() == 0x23
        )
        
    cancel = never(GameOver()) &&
        never(PlayerKo()) && 
        never(World() != world - 1) &&    
        never(Invulnerability() == 0)
        
    submit = trigger_when(
            prev(Invulnerability()) > 0 && 
            prev(Invulnerability()) < 0x23 && 
            Invulnerability() == 0x23
        )
        
    return start && cancel && submit
}

// Challenge to beat the game with out using the warp pipes
function Warpless()
{
    start = once(LevelStart(1,1))
    
    cancel = never(GameOver()) && 
        never(WarpZone())
    
    submit = trigger_when(LevelBeat(4,3))
        
    return start && cancel && submit    
}

// Challenge to beat the game with out using the warp pipes
function GameSpeedrun(timespan)
{
    start = once(LevelStart(1,1))
    
    cancel = never(GameOver()) &&
        never(start && repeated(timespan, always_true()))   
    
    submit = trigger_when(LevelBeat(4,3))
        
    return start && cancel && submit    
}


// Challenge to beat a bowser with a power
function BeatWithPowerUp(world, act, power)
{
    start = once(
            World() == world - 1 &&
            SinglePlayerMode() == 0 &&
            GameplayMode() == 1 && 
            PowerUpState() == power
        )
    
    cancel = never(GameOver()) &&
        never(World() != world - 1) &&
        never(PowerUpState() != power) &&
        never(LevelBeat(world, EndLevel[world - 1] + 1))
    
    hitList = StateArray(Bowser)
    
    submit = trigger_when(tally(1,hitList))
    
    return start && cancel && submit
}

// Challenge to beat a certain world while small
function BeatWorldSmall(world)
{
    start = once(LevelStart(world,1))
    
    cancel = never(GameOver()) &&
        never(World() != world - 1) &&
        never(PowerUpState() != 0)
    
    submit = trigger_when(LevelBeat(world, EndLevel[world - 1] + 1))
    
    return start && cancel && submit
}

// Creates an array of enemy states to look for (expects and array of [enemy_type, enemy_state] data pairs)
function StateArray(list)
{
    state_array = []
    for pair in list
    {
        enemy_type = pair[0]
        enemy_state = pair[1]
        
        for index in range (0,4)
        {
        
            if ((enemy_type == Green_Koopa || 
                enemy_type == Buzzy_Beetle || 
                enemy_type == Red_Koopa) && 
               (enemy_state == KoopaStomppedFalling ||
                enemy_state == KoopaStomppedSliding || 
                enemy_state == KoopaUpsidedDownFalling || 
                enemy_state == KoopaUpsidedDownSliding))
            {  
                // If koopa of beetle then add extra check to prevent double count
                state_test = prev(EnemyLoaded(index)) == 1 &&
                    prev(EnemyType(index)) == enemy_type &&                
                    prev(EnemyState(index)) == enemy_state &&
                    EnemyLoaded(index) == 0
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
    
    return state_array
}

// Creates an array of enemy type to look for (expects and array of [enemy_start, enemy_end] data pairs)
function TransformArray(list)
{
    transform_array = []
    for pair in list
    {
        enemy_start = pair[0]
        enemy_end = pair[1]
        
        for index in range (0,4)
        {
            // If enemy transformed while active
            transform_test = prev(EnemyLoaded(index)) == 1 &&
                EnemyLoaded(index) == 1 &&
                prev(EnemyType(index)) == enemy_start && 
                EnemyType(index) == enemy_end
        
            array_push(transform_array, transform_test)
        }
    }
    
    return transform_array
}

// Challenge to beat a level while not harming any enemies
function BeatPacifist(world, act)
{
    start = once(LevelStart(world, act))
    
    cancel = never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&
        all_of(StateArray(HarmList), p => never(p)) &&
        all_of(TransformArray(Transforms), p => never(p))
        
    
    submit = trigger_when(LevelBeat(world, act))
    
    return start && cancel && submit
}

// Challenge to a certain number of enemies on a level
function HitList(world, act, count, list, only2ndQuest = false)
{
    // Add 2nd quest conditions if needed
    startConditions = OnLevel(world, act)
    if (only2ndQuest == true) 
        startConditions = startConditions && SecondQuest()
    
    //
    start = once(startConditions)
    
    cancel =  never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&
        never(PlayerKo())
        
    // Add 2nd quest conditions if needed
    measureConditions = World() == world - 1 && Act() == act - 1
    if (only2ndQuest == true) 
        measureConditions = measureConditions && SecondQuest()
    
    // Generate the state hit list
    hitList = StateArray(list)
    
    measure = measured(
            tally(count, hitList),
            measureConditions
        )
    
    trigger = trigger_when(tally(count, hitList))
    
    return start && cancel && (measure || trigger)
}

// Challenge to beat a certain level within the specified amount of time
function Speedrun(world, act, timespan)
{
    start = once(LevelStart(world, act))
    
    cancel = never(GameOver()) &&
        never(World() != world - 1) &&    
        never(Act() != act - 1) &&
        never(start && repeated(timespan, always_true()))
    
    submit = trigger_when(LevelBeat(world, act))
    
    return start && cancel && submit
}


achievement("Pizza Power-Up!","Obtain the growth pizza", 1, ObtainPowerUp(PowerUpBigMario), id = 306306)
achievement("Fiery Ninja Arsenal!","Obtain the flaming ninja stars", 1, ObtainPowerUp(PowerUpFireMario), id = 306307)
achievement("Lifeline Lunch!","Obtain the 1up pizza", 1, Collect1up(), id = 306308)
achievement("Invincible Whirlwind!","Obtain the super nunchucks to become in invincible", 1, Invincible(), id = 306309)
achievement("Aquatic Adventurer!","Go swimming", 1, Underwater(), id = 306310)
achievement("Bountiful Block Breaker!","Get 12 coins or more from a multicoin block", 3, Multiblock(12), id = 306311)
achievement("Turtle Treasure Trove!","Collect 100 coins to get a 1up", 2, Coins1up(), id = 306312)
achievement("Flagpole Finesse!","Earn a 5000 Point Bonus by touching the top of the flagpole", 2, Flagpole(), id = 306313)
achievement("Plumber's Life Reserve!","Have 15 lives at once", 5, LifeCollector(15))

achievement("The Origin is Told!","Beat World 1-3 on the 1st Quest", 5, FirstQuest() && LevelBeat(1, 3))
achievement("Dude, Where's My Princess?","Beat World 2-3 on the 1st Quest", 5, FirstQuest() && LevelBeat(2, 3))
achievement("Dining on Turtle Soup!","Beat World 3-3 on the 1st Quest", 5, FirstQuest() && LevelBeat(3, 3))
achievement("Saved the Damsel!","Beat World 4-3 on the 1st Quest", 10, FirstQuest() && LevelBeat(4, 3))
achievement("Always at Night!","Beat World 1-3 on the 2nd Quest", 5, SecondQuest() && LevelBeat(1, 3))
achievement("Heroes in a Half-Shell Conqueror!","Beat World 2-3 on the 2nd Quest", 5, SecondQuest() && LevelBeat(2, 3))
achievement("Legion of Doom!","Beat World 3-3 on the 2nd Quest", 10, SecondQuest() && LevelBeat(3, 3))
achievement("The Enemy of my Enemy is my Bro!","Beat World 4-3 on the 2nd Quest", 25, SecondQuest() && LevelBeat(4, 3))
achievement("Master of the Turtle Lair!","Beat World 5-2 on the 2nd Quest", 5, SecondQuest() && LevelBeat(5, 2))
achievement("Shell Showdown Supremacy!","Beat World 6-1 on the 2nd Quest", 5, SecondQuest() && LevelBeat(6, 1))
achievement("Ninja-Proof Hero!","Beat World 7-1 on the 2nd Quest", 5, SecondQuest() && LevelBeat(7, 1))
achievement("Totally Hacked!","Beat World 8-1 on the 2nd Quest", 5, SecondQuest() && LevelBeat(8, 1))

achievement("Righteous Adventurer!","Complete world 1-1 without pressing left", 5, RightOnly(1, 1))

achievement("Sewer Speedrun!","Complete world 1-2 in under 50s", 5, Speedrun(1, 2, TimeSpan(0,50,0)))
achievement("Warp Navigator!","Find the warp zone in level 1-2", 3, WarpZone())
achievement("Save the Dam!","Complete world 2-1 without losing a powerup or dying", 10, Damageless(2, 1))
achievement("Save the Turtles!","Complete world 2-2 without harming any enemies", 10, BeatPacifist(2, 2))
achievement("Hazard Pay!","Collect 37 or more coins on world 3-1 without dying", 10, CoinCollector(3, 1, 37))
achievement("Spiny Speedrun!","Complete world 4-1 in under 40s", 10, Speedrun(4, 1, TimeSpan(0,40,0)))
achievement("Double Nunchucks Dynamo!","In world 4-2 get a second super nunchucks before the invincibility of the first one runs out", 10, DoubleInvincible(4, 2))
achievement("Sunken Treasure!","Collect 27 or more coins on world 5-1 without dying", 10, CoinCollector(5, 1, 27))

achievement("No Pipe, No Problem!","Finish the game completing every level from World 1 to 4 (no warp pipes)", 25, Warpless())
achievement("The Tortoise and the Ninja!","Finish the game in under 5 minutes", 25, GameSpeedrun(TimeSpan(5,0,0)))

achievement("Blazing Shell Slayer!","Defeat the Ninja Turtle boss on World 1-3 with flaming ninja stars", 10, BeatWithPowerUp(1,3,PowerUpFireMario))
achievement("Inferno Ninja Nemesis!","Defeat the Ninja Turtle boss on World 2-3 with flaming ninja stars", 10, BeatWithPowerUp(2,3,PowerUpFireMario))
achievement("Pyro Turtle Annihilator!","Defeat the Ninja Turtle boss on World 3-3 with flaming ninja stars", 10, BeatWithPowerUp(3,3,PowerUpFireMario))
achievement("Firestorm Ninja Vanquisher!","Defeat the Ninja Turtle boss on World 4-3 with flaming ninja stars", 10, BeatWithPowerUp(4,3,PowerUpFireMario))

achievement("Tiny Titan!","Beat World 1 without powering up", 10, BeatWorldSmall(1))
achievement("Unyielding Underdog!","Beat World 2 without powering up", 25, BeatWorldSmall(2))
achievement("The Little Legend!","Beat World 3 without powering up", 25, BeatWorldSmall(3))
achievement("Small Size, Big Success!","Beat World 4 without powering up", 25, BeatWorldSmall(4))

achievement("Reptilian Rampage!","Kill 13 or more Tiny Turtles (Goombas) on world 1-1 without dying", 5, HitList(1, 1, 13, Goombas))
achievement("The Mutant Menace!","Kill 6 or more Koopas or Paratroopas on world 1-2 without dying (shelled enemies need to be knocked out or kicked of the screen)", 5, HitList(1, 2, 6, Koopas))
achievement("Buzzy Beetle Bane!","Kill 7 or more Buzzy Turtles (Buzzy Beetles) on world 1-2 without dying (2nd Quest, shelled enemies need to be knocked out or kicked of the screen)", 10, HitList(1, 2, 7, BuzzyBeetles, true))
achievement("Dam Demolition Diffuser!","Kill 15 or more grey or red Missles (Cheep Cheeps) on world 2-1 without dying", 5, HitList(2, 1, 15, CheepCheeps))
achievement("Blooper Buster!","Kill 3 or more Bloopers on world 2-1 without dying (2nd Quest)", 10, HitList(2, 1, 3, Bloopers, true))
achievement("Shell Slaughterer!","Kill 10 or more Koopas or Paratroopas on world 2-2 without dying (shelled enemies need to be knocked out or kicked of the screen)", 5, HitList(2, 2, 10, Koopas))
achievement("Turtle Bro Terminator!","Kill 3 or more Turtle Bros (Hammer Bros) on world 3-1 without dying", 10, HitList(3, 1, 3, HammerBros))
achievement("Missile Bill Massacre!","Kill 15 or more Missle Bills (Bullets Bills) on world 3-2 without dying", 5, HitList(3, 2, 15, BulletBills))
achievement("Krang Crusher!","Kill 3 or more Lakitus on world 4-1 without dying", 5, HitList(4, 1, 3, Lakitus))
achievement("Spiny Smackdown!","Kill 15 or more Spiny Turtles on world 4-1 without dying", 5, HitList(4, 1, 15, Spinys))
achievement("Vegetation Vendetta!","Kill 11 or more Piranha Plants on world 4-2 without dying", 10, HitList(4, 2, 11, PiranhaPlants))

// Rich Presence ////////////////////////////////////////////////////////////////////////////////////

rich_presence_conditional_display(
    GameplayMode() > 0, 
    "{0} has {1} lives and {2} points on level {3}-{4} keeping the {5} safe",
    rich_presence_lookup("Players", SinglePlayerMode(), Players),
    rich_presence_value("Lives", Lives() + 1),
    rich_presence_value("Score", Score()),
    rich_presence_value("World", World() + 1),
    rich_presence_value("Act", Act() + 1),
    rich_presence_lookup("Levels", LevelPalette(), Levels, "overworld")
)
rich_presence_display("Mario is waiting in the menu!")

// Leaderboards ////////////////////////////////////////////////////////////////////////////////////

leaderboard(
    "Speedrun 1st Quest Any %",
    "Fastest time to complete the game",
    FirstQuest() && LevelStart(1, 1),
    GameOver(),
    LevelBeat(4, 3),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    "Speedrun 2nd Quest Any %",
    "Fastest time to complete the game",
    SecondQuest() && LevelStart(1, 1),
    GameOver(),
    LevelBeat(4, 3),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)


leaderboard(
    "Speedrun Warpless",
    "Fastest time to complete the game with out warps",
    LevelStart(1, 1),
    GameOver() || WarpZone(),
    LevelBeat(4, 3),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

for world in range(1,5)
{
    lastLevel = EndLevel[world - 1] + 1   
    leaderboard(
        "Speedrun World " + world,
        "Fastest time to complete world " + world,
        LevelStart(world, 1),
        GameOver() || World() != world - 1,
        LevelBeat(world, lastLevel),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}


for world in range(1,8)
{
    lastLevel = EndLevel[world - 1] + 1   
    for act in range(1,lastLevel)
    {
    
        leaderboard(
            "Speedrun " + world + "-" + act,
            "Fastest time to complete " + world + "-" + act,
            LevelStart(world, act),
            GameOver() || World() != world - 1 || Act() != act - 1,
            LevelBeat(world, act),
            always_true(),
            lower_is_better = true,
            format = "FRAMES"
        )
    }
}

leaderboard(
    "Shell Slayer",
    "Most enemies killed (shelled enemies need to be knocked out or kicked of the screen).",
    LevelStart(1, 1),
    always_false(),
    GameOver() || LevelBeat(4, 3),
    tally(0, StateArray(KillList)),
    lower_is_better = false,
    format = "VALUE"
)