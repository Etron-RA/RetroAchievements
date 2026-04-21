// Mad City
// #ID = 5536

// $001F: [8-bit] Training Shoot 'Em End (0x0 to 0xf when all enemies shot)
function ShootEmUpTrainingEnd() => byte(0x00001F)

// $0020: [8-bit] Game State (0x0 = Title, 0x1 = Title Menu, 0x2 = Demo, 0x3-0x4= Starting Game, 0x5 = In Game)
function GameState() => byte(0x000020)

// $002A: [8-bit] Select Mode (0 = Game A, 1 = Game B, 2 = Training, 3 = Sound Select, 4= Quiz)
function SelectMode() => byte(0x00002A)

// $0034: [8-bit] Level State (0x0 = Stage X, 0x1 = In Stage, 0x2 = Complete Stage, 0x5 = Ending)
function LevelState() => byte(0x000034)

// $0035: [8-bit] Stage Sequence (Shooting Start = 0x2 -> 0x3, Easy ending starts at 0x6, Other endings text start at 0x2)
function StageSequence() => byte(0x000035)

// $0036: [8-bit] Stage Type (0x0 = Fighting Stages, 0x1 = Shooting Stages, 0x​​​​​​2 = Driving Stages)
function StageType() => byte(0x000036)

// $0039: [8-bit] Lives (gameover = 0xff)
function Lives() => byte(0x000039)

// $003A: [8-bit] Loop (0x0 = 1st, 0x1 = 2nd,  0x2 = 3rd, etc...)
function Loop() => byte(0x00003A)

// $0042: [8-bit] Quiz Scene (starts at 0x0 goes to 0xa)
function QuizScene() => byte(0x000042)

// $0048: [8-bit] Enemy Spawn Counter (used to figure out what enemy to spawn next)
function EnemySpawnCounter() => byte(0x000048)

// $003A: [8-bit] Driving Distance 
//        Training starts at 0x03 and ends at 0x93
//        Level 4 starts at 0x03 and ends at 0x94
//        Level 5 starts at 0x03 and ends at 0x98
function DrivingDistance() => byte(0x004e)

// $0050: [8-bit] System Bitflags
//        Bit 0 = Beat 'Em Up/Driving Active
//        Bit 1 = Shoot 'Em Up Boss
//        Bit 2 = Beat 'Em Up Intro
//        Bit 3 = Shoot 'Em Active
function SystemBitflags() => byte(0x000050)
function DrivingIntro() => bit0(0x000050)
function BeatEmUpActive() => bit0(0x000050)
function ShootEmUpBoss() => bit1(0x000050)
function BeatEmUpIntro() => bit2(0x000050)

// $0059: [8-bit] Oil slick timer, when > 0 drive stearing is slippy
function OilSlickTimer() => byte(0x000059)

// $0051: [8-bit] Scene ID (0x0 = Good Ending, 0x1 = Kansai-ben Ending, 0x2 = Jerkass Ending)
function SceneId() => byte(0x00005c)

// $005D: [8-bit] Shoot Em' Up Gauntlet (0 = no, 1 = yes)
function ShootEmUpGauntlet() => byte(0x00005D)

// $005F: [8-bit] Shoot Em' Up Kill Counter (resets at gauntlet)
function ShootEmUpKillCounter() => byte(0x00005F)

// $006A: [8-bit] Shoot 'Em Up Hourglass Counter
function HourglassCounter() => byte(0x00006A)

// $006B: [8-bit] Shoot 'Em Up Vest Counter
function VestCounter() => byte(0x00006B)

// $00ED: [8-bit] Display Mode (0x0 = Beat ' em Up, 0x2 = Shooter, 0x4 = Driving, 0x6 = Cutscene)
function DisplayMode() => byte(0x0000ED)

// $00FB: [8-bit] Stage (0 = Stage 1, 1 = Stage 2, 2 = Stage 3, 3 = Stage 4, 4 = Stage 5, 5 = Stage 6, 6 = Stage 7, 7 = Stage 8, 8 = Stage 9)
function Stage() => byte(0x0000FB)

// $0300: [8-bit] Animation Frame - Sprite index 0-15
function AnimationFrameSprite(index) => byte(0x000300 + index)

// $0320: [8-bit] Invincibility Timer - Sprite index 0-15
function InvincibilityTimerSprite(index) => byte(0x000320 + index)

// $0330: [8-bit] Relative Y - Sprite index 0-15
function RelativeYSprite(index) => byte(0x000330 + index)

// $0350: [8-bit] Relative X - Sprite index 0-15
function RelativeXSprite(index) => byte(0x000350 + index)

// $0417: [8-bit] Speed High Byte
function SpeedHighByte() => byte(0x000417)

// $0427: [8-bit] Speed Low Byte
function SpeedLowByte() => byte(0x000427)

// $0430: [8-bit] Driving Item Hit (0 = no, 1 = yes)
function DrivingItemHit() => byte(0x000430)

// $0434 [8-bit] Projectile Cooldown (0x6->0x5 for knife kill, 0x1->0x0 for bullet kill)
function ProjectileCountdown() => byte(0x000434)

// $044C: [8-bit] Shooter Game A Bullet Countdown (0xf countdown to 0x0)
function BulletCountdown() => byte(0x00044C)

// $0460: [8-bit] Beat 'Em Up Attack (0x1 = Punch, 0x2 = Kick, 0x3 = Whip, 0x4 = Jump Kick, 0x5 = Stick, 0x6 = Bite)
function BillyAttack() => byte(0x000460)
function AttackSprite(index) => byte(0x000460 + index)

// $04B0: [8-bit] Shoot Em Up State - Sprite index 0-15
function StateSprite(index) => byte(0x0004B0 + index)

// $04C0: [8-bit] Type - Sprite index 0-15
function TypeSprite(index) => byte(0x0004C0 + index)
function EnemyGroup() => tbyte(0x04c1)

// $04C0: [8-bit] Shoot Em Up Hit - Sprite index 0-15
function HitSprite(index) => byte(0x0004D0 + index)

// $0500: [8-bit] Health - Sprite index 0-15
function HealthSprite(index) => byte(0x000500 + index)

// $0510: [8-bit] Armor - Sprite #0
function PartialHealthSprite(index) => byte(0x000510 + index)

// $0530: [8-bit] Beat 'Em Up Jumping (0 = none, 1 = jumping)
function Jumping() => byte(0x000530)

// $07B9: [8-bit] Training Mode Selected (0 = Street Fighting Game, 1 = Action Driving Game, 2 = Shoot-'Em-Up Game A, 3 = Shoot-'Em-Up Game B)
function TrainingModeSelected() => byte(0x0007B9)

// $07BB: [8-bit] Practice Mode Rewards (Bit 0 = Meatball from Street Fighting Game, Bit 1 = Extra Life from Action Driving Game, Bit 2 = Extra Bullets from Shoot-'Em-Up Games A and B)
function TrainingModeRewards() => byte(0x0007BB)
function MeatBall() => bit0(0x0007BB)
function ExtraLife() => bit1(0x0007BB)
function ExtraBullets() => bit2(0x0007BB)

// $07BD: [8-bit] Quiz Mode Revealed (0 = no, 1 = yes)
function QuizModeRevealed() => byte(0x0007BD)

// $07C0: [8-bit] Bullets
function Bullets() => byte(0x0007C0)

// $07C1: [8-bit] Weapons (0 = none, 1 = pistol, 2 = knife, 3 = stick, 5 = whip)
function Weapons() => byte(0x0007C1)

// $07C5: [8-bit] Health Squares (7 Full - 0 Dead)
function HealthFull() => byte(0x0007C5)

// $07C6: [16-bit] Horizontal scrolling progress
function HorizontalScrolling() => word(0x0007C6)

// $07C8: [8-bit] Health Partial (1/265 of a square)
function HealthPartial() => byte(0x0007C8)

// $07CE: [8-bit] Bulletproof Vest in Beat'em up (0x0 = none, 0x8 = obtained)
function BeatEmUpBulletproofVest() => byte(0x0007CE)

// $07DB: [16-bit] Driving Stages Timer
function DrivingStagesTimer() => word(0x0007DB)

// $07DE: [8-bit] Credits Used (0 = None, 1 = 1st Continue, 2 = 2nd Continue, 3 = 3rd Continue, 4 = Game Over)
function Credits() => byte(0x0007DE)

// $07E0: [bcd] Hi Score 
function HiScore() => bcd(tbyte(0x0007E0))

// $07E4: [bcd] Current Score 
function CurrentScore() => bcd(tbyte(0x0007E4))

// $07F3: [8-bit] Training Mode Completion (Bit 0 = Street Fighting Game, Bit 1 = Action Driving Game, Bit 2 = Shoot-'Em-Up Games A and B)
function TrainingModeCompletion() => byte(0x0007F3)

// Helper Functions /////////////////////////////////////////////////////////////////////

// Test if we are currently in game
function InGame() => GameState() == 0x5
function Demo() => GameState() == 0x2
function TitleScreen() => GameState() == 0x1
function ActivelyPlaying() => GameState() >= 0x3

// Test if a credit was used
function GameOver() => prev(Lives()) == 0x0 && Lives() == 0xff

// Test if a credit was used
function CreditUsed() => prev(Credits()) + 1 == Credits()

// Test if game has looped
function Looped() => prev(Loop()) < Loop()

// Test if we are curretly in a stage
function InStage() => LevelState() == 0x1
function InTraining() => LevelState() == 0x7
function EasyEnding() => LevelState() == 0x5 && prev(StageSequence()) == 0x00 && StageSequence() == 0x06
function NormalEnding(ending) => SceneId() == ending && LevelState() == 0x5 && prev(StageSequence()) == 0x01 && StageSequence() == 0x02
function NotEnding(ending) =>  LevelState() == 0x5 && StageSequence() == 0x02 && SceneId() == ending

// Test for the transition from end of the level to the bonus
function Bonus() => prev(LevelState()) == 0x1 && LevelState() == 0x2
function EndTraining() => prev(StageSequence()) == 0x5 && StageSequence() == 0x7

// The starting sequence for a shoot em when the player gains control
function ShootingStartSequence() => prev(StageSequence()) == 0x2 && StageSequence() == 0x3

// Event of Billy taking damage
function DamageTaken() => prev(HealthFull()) > HealthFull() || prev(HealthPartial()) > HealthPartial() 
function DamageHealed() => prev(HealthFull()) < HealthFull()

// Event Losing Life
function LostLife() => prev(Lives()) > Lives()

// Event using rewards
function NoTraining() => TrainingModeCompletion() == 0x0
function TrainingRewards() => TrainingModeCompletion() != 0x0
function UsedMeatball() => prev(MeatBall()) > MeatBall()
function UsedExtraLife() => prev(ExtraLife()) > ExtraLife()

// The three game types
function BeatEmUpMode() => StageType() == 0x0
function ShootEmUpMode() => StageType() == 0x1
function DrivingMode() => StageType() == 0x2

// Various Game Modes
function MainGame() => SelectMode() <= 0x1
function GameA() => SelectMode() == 0x0
function GameB() => SelectMode() == 0x1
function Training() => SelectMode() == 0x2
function Quiz() => SelectMode() == 0x4

// Various TrainingModes
function TrainingBeatEmUp() => TrainingModeSelected() == 0x0
function TrainingDriving() => TrainingModeSelected() == 0x1
function TrainingShootEmUpA() => TrainingModeSelected() == 0x2
function TrainingShootEmUpB() => TrainingModeSelected() == 0x3
function TrainingShootEmUp() => TrainingModeSelected() >= 0x2 && TrainingModeSelected() <= 0x3

// Converts time to frames
function TimeSpan(minutes, seconds, milliseconds) => minutes * 3600 + seconds * 60 + milliseconds


// Billy Attack Constants /////////////////////////////////////////////////////////////

Punching = 0x1
Kicking = 0x2
Whipping = 0x3
JumpKicking = 0x4
Sticking = 0x5

// Enemy Attack Constants /////////////////////////////////////////////////////////////
GatorBite = 0x6
GordonGrab = 0x6
MartinGrab = 0x7
KalihnikovShooting = 0x85
TheAcceleratorShooting = 0xf2
VitoLangoloShooting = 0xbd
ProjectileExplosion = 0x94
KnifeThrown = 0xcc
StevenBaroneShooting = 0xe5
WildBillYonderShooting = 0xb4
WhirlibirdShooting = 0x84

// Billy Animation Constants //////////////////////////////////////////////////////////

Walk1 = 0x01
Walk2 = 0x02
Walk3 = 0x03
Punch = 0x04
Kick = 0x05
JumpKick = 0x06
ShootingGun = 0x07
Whip1 = 0x08
Whip2 = 0x09
Stick1 = 0x0a
Stick2 = 0x0b
Hurt = 0x0c
Dead = 0x0d
UpsideDown = 0x18

// Sprite Type Constants /////////////////////////////////////////////////////////////

// Beat Em' Up Sprite Type
Dead=0x1
Bullet=0x02
Knife=0x03
EnemyBullet=0x04
BrenWrestler = 0x04
Crocodile = 0x05
DiverMan = 0x06
WilliamDave = 0x07
ThousandBird = 0x08
MatthewBirch = 0x09
CarlosOlson = 0x0a
GeorgeSnyman = 0x0b
VernonTaylor = 0x0c
TomOgawa = 0x0d
Dog = 0x0e
JohnMartin = 0x0f
GrantMartin = 0x10
RobertGordon = 0x11
AnnabelleLuna = 0x13
GeorgeSnymanA = 0x15
GeorgeSnymanB = 0x16
RayHarrisA = 0x17
RayHarrisB = 0x18
RayHarrisC = 0x19
Bird = 0x1b

// Shoot Em' Up Sprite Types
Kalihnikov = 0x00
VitoLangolo = 0x00
BulletsItem = 0x01
StarItem = 0x02
OneUpItem = 0x03
HourglassItem = 0x04
ShooterBulletproofVestItem = 0x05
TNT = 0x09
Missle = 0x0a
MrTNT = 0x0b
MartyGraw = 0x0b
FallingSoldier = 0x0c
Whirlibird = 0x0d
WildBillYonder = 0x0e
TheAccelerator = 0x10
StevenBarone = 0x15
LightningRod = 0x16
ThrowingKnife = 0x17
SchwartzNEiger = 0x18

// Driving Sprite Types
GordonsCar = 0x01
Tree = 0x02
Dynamite = 0x03
Oil = 0x04
BlueTruck = 0x05
Rock = 0x06
Puddle = 0x07
Helicopter = 0x08
Bomb = 0x09
Explosion = 0x0a
RedCar = 0x0b
GasCan = 0x0c
LifeCan = 0x0d
Plane = 0x0e
RedJeep = 0x0f
GreenTruck = 0x10

// Endings
GoodEnding = 0x00
JerkassEnding = 0x02
KansaiBenEnding = 0x01

// Array Functions ///////////////////////////////////////////////////////////////////////////

// Concat two arrays together as one big array
function Concat(array1, array2)
{
    newArray = []
    
    for item in array1
        array_push(newArray, item)
        
    for item in array2
        array_push(newArray, item)
       
    return newArray
        
}

// Apply a condition to each itm in the arrays with &&'s
function Apply(condition, array)
{
    newArray = []
    for item in array
        array_push(newArray, condition && item)
        
    return newArray
}

// Beat Em' Up Events ////////////////////////////////////////////////////////////////////////

// The Starting Event of a Trainging Beat Em' up Stage
function TrainingBeatEmUpStart()
{
    return Training() && 
        TrainingBeatEmUp() && 
        InGame() &&
        InTraining() &&
        BeatEmUpMode() &&
        HorizontalScrolling() == 0 &&
        prev(BeatEmUpIntro()) > BeatEmUpIntro()
}

// The Starting Event of a Main Game Beat Em' up Stage
function MainBeatEmUpStart(stage)
{
    return MainGame() &&
        Stage() == stage - 1 && 
        BeatEmUpStart()
}

// The Starting Event of a Main Game Beat Em' up Stage
function GameABeatEmUpStart(stage)
{
    return GameA() &&
        Stage() == stage - 1 && 
        BeatEmUpStart()
}

// The Starting Event of a Main Game Beat Em' up Stage
function GameBBeatEmUpStart(stage)
{
    return GameB() &&
        Stage() == stage - 1 && 
        BeatEmUpStart()
}

// General starting events of any Beat Em' up Stage
function BeatEmUpStart()
{
    return InGame() &&
        InStage() &&
        BeatEmUpMode() &&
        HorizontalScrolling() == 0 &&
        prev(BeatEmUpIntro()) > BeatEmUpIntro()
}

// Return an array of logic for detecting a death on each possible sprite location
function BeatEmUpSpawn(character)
{
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array,prev(TypeSprite(index)) == 0 && TypeSprite(index) > Dead)
        else
            array_push(array,prev(TypeSprite(index)) != character && TypeSprite(index) == character)
    }
    return array   
}

// Return an array of logic for detecting a death on each possible sprite location
function BeatEmUpDeath(character = 0)
{
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array,TypeSprite(index) > Dead && prev(HealthSprite(index)) > 0 && HealthSprite(index) == 0)
        else
            array_push(array,TypeSprite(index) == character && prev(HealthSprite(index)) > 0 && HealthSprite(index) == 0)
    }
    return array 
}


// Return an array of logic for detecting a damage on each possible sprite location
function BeatEmUpDamage(character = 0)
{
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array,TypeSprite(index) > Dead && prev(InvincibilityTimerSprite(index)) != 0x10 && InvincibilityTimerSprite(index) == 0x10)
        else
            array_push(array,TypeSprite(index) == character && prev(InvincibilityTimerSprite(index)) != 0x10 && InvincibilityTimerSprite(index) == 0x10)
    }
    
    return array 
}

// Return an array of logic for detecting an enemy bullet deflection on each possible sprite location
function BeatEmUpEnemyBulletDeflected()
{
    array = []    
    for index in range(5,7)
    {
        array_push(array,TypeSprite(index) == EnemyBullet && prev(RelativeYSprite(index)) >= 0x60 && RelativeYSprite(index) < 0x60)
    }    
    return array 
}


// Beat 'em up punch kill event
function BeatEmUpPunchKill(character = 0)
{
    thisFrame = Apply(BillyAttack() == Punching, BeatEmUpDeath(character))
    lastFrame = Apply(prev(BillyAttack()) == Punching && BillyAttack() != Punching, BeatEmUpDeath(character))
    return Concat(thisFrame, lastFrame)
}

// Beat 'em up kick kill event
function BeatEmUpKickKill(character = 0)
{
    thisFrame = Apply(BillyAttack() == Kicking, BeatEmUpDeath(character))
    lastFrame = Apply(prev(BillyAttack()) == Kicking && BillyAttack() != Kicking, BeatEmUpDeath(character))
    return Concat(thisFrame, lastFrame)
}

// Beat 'em up jump kick kill event
function BeatEmUpJumpKickKill(character = 0)
{
    thisFrame = Apply(BillyAttack() == JumpKicking, BeatEmUpDeath(character))
    lastFrame = Apply(prev(BillyAttack()) == JumpKicking && BillyAttack() != JumpKicking, BeatEmUpDeath(character))
    return Concat(thisFrame, lastFrame)
}

// Beat 'em up stick kill event
function BeatEmUpStickKill(character = 0)
{
    thisFrame = Apply(BillyAttack() == Sticking, BeatEmUpDeath(character))
    lastFrame = Apply(prev(BillyAttack()) == Sticking && BillyAttack() != Sticking, BeatEmUpDeath(character))
    return Concat(thisFrame, lastFrame)
}

// Beat 'em up whip kill event
function BeatEmUpWhipKill(character = 0)
{
    thisFrame = Apply(BillyAttack() == Whipping, BeatEmUpDeath(character))
    lastFrame = Apply(prev(BillyAttack()) == Whipping && BillyAttack() != Whipping, BeatEmUpDeath(character))
    return Concat(thisFrame, lastFrame)
}

// Beat 'em up knife kill event
function BeatEmUpKnifeKill(character = 0)
{
    return Apply(TypeSprite(4) == Knife && ProjectileCountdown() == 0x0, BeatEmUpDeath(character))
}


// Beat 'em up knife kill event
function BeatEmUpKnifeHit(character = 0)
{
    return Apply(TypeSprite(4) == Knife && ProjectileCountdown() == 0x0, BeatEmUpDamage(character))
}

// Beat 'em up bullet kill event
function BeatEmUpBulletKill(character = 0)
{
    bulletAppeared = Apply(prev(TypeSprite(4)) == Bullet, BeatEmUpDeath(character))
    stillShooting = Apply(prev(TypeSprite(4)) == 0x0 && BillyAttack() == 0 && Weapons() == 1, BeatEmUpDeath(character))
    return Concat(bulletAppeared, stillShooting)
}

// Look for both John and Grant Martins' death
function DefeatAllBosses()
{
    killCount = []
    killCount = Concat(killCount, BeatEmUpDeath(JohnMartin))
    killCount = Concat(killCount, BeatEmUpDeath(GrantMartin))
    killCount = Apply(Stage() == 8 , killCount)
    
    // Only count while ingame on the last level
    return never(!InGame()) && never(!BeatEmUpMode()) && never(LostLife()) && tally(2, killCount)
}

// Events when Billy attacks with a weapon
function WeaponUsed()
{
    return BillyAttack() == Sticking ||
        BillyAttack() == Whipping ||
        AnimationFrameSprite(0) == ShootingGun ||
        TypeSprite(4) == Knife
}

// Events when a Crocodile bites Billy
function Bitten()
{
    array = []    
    for index in range(1,3)
    {
        array_push(array,TypeSprite(index) == Crocodile && AttackSprite(index) == GatorBite && prev(HealthFull()) > HealthFull()) 
        array_push(array,TypeSprite(index) == Crocodile && AttackSprite(index) == GatorBite && prev(HealthPartial()) > HealthPartial())
    }
    return array 
}

// Event when one of the final bosses grab Billy
function BossGrab()
{
    array = []    
    for index in range(1,3)
    {
        array_push(array,TypeSprite(index) == RobertGordon && StateSprite(index) == GordonGrab)
        array_push(array,TypeSprite(index) == JohnMartin && StateSprite(index) == MartinGrab) 
        array_push(array,TypeSprite(index) == GrantMartin && StateSprite(index) == MartinGrab) 
    }    
    return array 
}

// Event when all enemies have died
function AllEnemiesDead() => prev(EnemyGroup()) != 0 && EnemyGroup() == 0

// Shoot Em' Up Events ////////////////////////////////////////////////////////////////////////

// The Starting Event of a Traning Shoot Em' up Stage
function TrainingShootEmUpStart()
{
    return Training() && 
        TrainingShootEmUp() &&
        ShootEmUpTrainingStart()
}

// The Starting Event of a Traning Game A Shoot Em' up Stage
function TrainingAShootEmUpStart()
{
    return Training() && 
        TrainingShootEmUpA() &&
        ShootEmUpTrainingStart()
}

// The Starting Event of a Traning Game B Shoot Em' up Stage
function TrainingBShootEmUpStart()
{
    return Training() && 
        TrainingShootEmUpB() &&
        ShootEmUpTrainingStart()
}

// The Starting Event of a Main Shoot Em' up Stage
function MainShootEmUpStart(stage)
{
    return MainGame() &&
        Stage() == stage - 1 &&
        ShootEmUpStart()
}

// The Starting Event of a Game A Shoot Em' up Stage
function GameAShootEmUpStart(stage)
{
    return GameA() &&
        Stage() == stage - 1 &&
        ShootEmUpStart()
}

// The Starting Event of a Game A Shoot Em' up Stage
function GameBShootEmUpStart(stage)
{
    return GameB() &&
        Stage() == stage - 1 &&
        ShootEmUpStart()
}


// General starting events of any Shoot Em' up Stage
function ShootEmUpTrainingStart()
{
    return InGame() &&
        InTraining() &&
        ShootEmUpMode() &&
        HorizontalScrolling() == 0 &&
        ShootingStartSequence()
}

// General starting events of any Shoot Em' up Stage
function ShootEmUpStart()
{
    return InGame() &&
        InStage() &&
        ShootEmUpMode() &&
        HorizontalScrolling() == 0 &&
        ShootingStartSequence()
}

// Return an array of logic for detecting a death on each possible sprite location
function ShootEmUpSpawn(character)
{
    array = []    
    for index in range(1,5)
    {
        if (character == 0) 
            array_push(array,prev(StateSprite(index)) < StateSprite(index))
        else
            array_push(array,TypeSprite(index) == character && prev(StateSprite(index)) < StateSprite(index))
    }
    return array   
}

// Return an array of logic for detecting a death on each possible sprite location
function ShootEmUpDeath(character = 0)
{
    array = []    
    for index in range(1,5)
    {
        if (character == 0) 
            array_push(array, prev(HitSprite(index)) < HitSprite(index))
        else
            array_push(array,TypeSprite(index) == character && prev(HitSprite(index)) < HitSprite(index))
    }
    return array 
}

// Shoot 'em up bullet kill event
function ShootEmUpEnemyDeath()
{
    array = []    
    for index in range(1,5)
    {
        array_push(array, TypeSprite(index) == 0 && prev(HitSprite(index)) < HitSprite(index))
        array_push(array, TypeSprite(index) >= MrTNT && prev(HitSprite(index)) < HitSprite(index))
    }
    return array 
}

// Animation frames when the player takes damage in the shoot 'em up
function ShootEmUpDamage()
{
    array = []    
    for index in range(1,5)
    {
        array_push(array, TypeSprite(index) == Kalihnikov && AnimationFrameSprite(index) == KalihnikovShooting)
        array_push(array, TypeSprite(index) == Whirlibird && AnimationFrameSprite(index) == WhirlibirdShooting)
        array_push(array, TypeSprite(index) == WildBillYonder && AnimationFrameSprite(index) == WildBillYonderShooting)
        array_push(array, TypeSprite(index) == VitoLangolo && AnimationFrameSprite(index) == VitoLangoloShooting)
        array_push(array, TypeSprite(index) == TheAccelerator && AnimationFrameSprite(index) == TheAcceleratorShooting)
        array_push(array, TypeSprite(index) == StevenBarone && AnimationFrameSprite(index) == StevenBaroneShooting)
    }
    array_push(array, TypeSprite(5) == TNT && AnimationFrameSprite(5) == ProjectileExplosion)
    array_push(array, TypeSprite(5) == Missle && AnimationFrameSprite(5) == ProjectileExplosion)
    array_push(array, TypeSprite(5) == ThrowingKnife && AnimationFrameSprite(5) == KnifeThrown)
    return array 
}


// Event when the a Shot Em Up Gauntlet is done
function GauntletComplete()
{
    return ShootEmUpGauntlet() == 1 &&
        prev(ShootEmUpKillCounter()) == 0x11 &&
        ShootEmUpKillCounter() == 0x12
}

// Driving Events ////////////////////////////////////////////////////////////////////////

// The Starting Event of a Driving Stage
function TrainingDrivingStart()
{
    return Training() && 
        TrainingDriving() && 
        InGame() &&
        InTraining() &&
        DrivingMode() &&
        prev(DrivingDistance()) == 0 &&
        DrivingDistance() == 0x3
}

// The Starting Event of a Driving Stage
function MainDrivingStart(stage)
{
    return MainGame() &&
        Stage() == stage - 1 && 
        DrivingStart()
}

// The Starting Event of a Driving Stage
function DrivingStart()
{
    return InGame() &&
        InStage() &&
        DrivingMode() &&
        prev(DrivingDistance()) == 0 &&
        DrivingDistance() == 0x3
}

// Return an array of logic for detecting a death on each possible sprite location
function VechicalSpawn(character)
{
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array,prev(TypeSprite(index)) == 0 && TypeSprite(index) > Dead)
        else
            array_push(array,prev(TypeSprite(index)) != character && TypeSprite(index) == character)
    }
    return array   
}


// Return an array of logic for detecting a death on each possible sprite location
function VechicalExit(character)
{
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array,prev(TypeSprite(index)) > Dead && TypeSprite(index) == 0)
        else
            array_push(array,prev(TypeSprite(index)) == character && TypeSprite(index) != character)
    }
    return array   
}

// Generic Driving death for vechicals
function VechicalDeath(character = 0)
{    
    array = []    
    for index in range(1,3)
    {
        if (character == 0) 
            array_push(array, prev(TypeSprite(index)) != Bomb && prev(TypeSprite(index)) != Dynamite && prev(TypeSprite(index)) != Explosion && TypeSprite(index) == Explosion)
        else
            array_push(array, prev(TypeSprite(index)) == character && TypeSprite(index) == Explosion)
    }
    return array 
}

// Generic Driving hit for vechicals
function VechicalHit(character)
{    
    array = []    
    for index in range(1,3)
        array_push(array, prev(TypeSprite(index)) == character && prev(HealthSprite(index)) > HealthSprite(index))
    return array 
}

// Generic Driving hit for vechicals
function VechicalFlee(character)
{    
    array = []    
    for index in range(1,3)
        array_push(array, prev(TypeSprite(index)) == character && prev(HealthSprite(index)) == 0x8 &&  HealthSprite(index) == 0x7)
    return array 
}

// Return an array of logic for detecting plane blowing up
function PlaneDeath() => VechicalDeath(Plane)

// Return an array of logic for detecting helicopter blowing up
function HelicopterDeath() => VechicalDeath(Helicopter)

// Return an array of logic for detecting a standard car blowing up
function CarDeath() 
{
    blueTruckArray = VechicalDeath(BlueTruck)
    redCarArray = VechicalDeath(RedCar)
    redJeepArray = VechicalDeath(RedJeep)
    greenTruckArray = VechicalDeath(GreenTruck)
    combo1 = Concat(blueTruckArray,redCarArray)
    combo2 = Concat(redJeepArray,greenTruckArray)
    return Concat(combo1,combo2)
}

// The collision events
function CollectItem(item) => RelativeYSprite(0) < 0xe0 && prev(TypeSprite(0)) == item && TypeSprite(0) == 0 
function GasPickUp() => CollectItem(GasCan)
function LifePickUp() => CollectItem(LifeCan)
function HitPuddle() => TypeSprite(0) == Puddle && prev(DrivingItemHit()) < DrivingItemHit()
function HitOil() => TypeSprite(0) == Oil && prev(OilSlickTimer()) < OilSlickTimer()

// Shared Events ////////////////////////////////////////////////////////////////////////

// The Ending Event of any Stage
function StageEnd()
{
    return MainGame() &&
        InGame() &&
        Bonus()
}

// The Ending Event of a beat em up Training Stage
function TrainingBeatEmUpStageEnd()
{
    return Training() &&
        EndTraining()
}

// The Ending Event of a driving Training Stage
function TrainingDrivingStageEnd(distance)
{
    return Training() &&
        prev(DrivingDistance()) == distance - 1 &&
        DrivingDistance() == distance
}

// The Ending Event of a driving Training Stage
function TrainingShootEmUpStageEnd()
{
    return Training() &&
        ShootEmUpGauntlet() == 0x1 &&
        prev(ShootEmUpTrainingEnd()) == 0x0 &&
        ShootEmUpTrainingEnd() == 0xf
}

// The Ending Event of a driving Training Stage
function DrivingStageEnd(distance)
{
    return MainGame() &&
        InGame() &&
        prev(DrivingDistance()) == distance - 1 &&
        DrivingDistance() == distance
}

// Training Achievment Functions ////////////////////////////////////////////////////////

// Completing beat em' up training level without using a weapon
function TrainingNoWeapons(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || 
        WeaponUsed()
    submit = info[2]

    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete the training level without dying or healing
function TrainingNoHeal(name)
{    
    info = Stages[name]
    start = info[0]
    cancel = info[1] || 
        LostLife() ||
        DamageHealed()
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete the training race with certain amount of time left
function TrainingRace(name, timeLeft)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] 
    submit = info[2]
    prime = DrivingStagesTimer() > timeLeft
    return once(start) && never(cancel) && prime && trigger_when(submit)
}

// Complete the training race without dying
function TrainingDeathlessRace(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        LostLife() ||
        DamageHealed()
    submit = info[2]
    return once(start) && never(cancel) && trigger_when(submit)
}


// Complete the training race without taking damage or hitting an obstacle
function TrainingDamagelessRace(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        LostLife() ||
        DamageTaken() ||
        HitPuddle()
    submit = info[2]
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete the training shoot em' up without dying or healing with a first aid kit
function TrainingDeathlessShootEmUp(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || 
        LostLife() ||
        DamageHealed()
    submit = info[2]
    return once(start) && never(cancel) && trigger_when(submit)
}

// During the training shoot em' up kill a certain number of emenies without missing
function TrainingNoMissShootEmUp(name,consecutiveKills)
{
    active = Training() && 
        TrainingShootEmUp() &&
        InTraining() &&
        ShootEmUpMode()
    reset = never(prev(Bullets()) > Bullets())
    count = measured(tally(consecutiveKills, ShootEmUpEnemyDeath()), active)
    return active && reset && count
}

// During the training shoot em' up complete the gauntlet with a certain mount of time
function TrainingGauntletShootEmUp(name,time)
{
    info = Stages[name]
    start = Training() && 
        TrainingShootEmUp() &&
        InTraining() &&
        ShootEmUpMode() && 
        prev(ShootEmUpGauntlet()) < ShootEmUpGauntlet()
    cancel = never(!InGame()) &&
        never(LostLife()) &&
        never(once(start) && repeated(time, always_true()))
    submit = info[2]
    return once(start) && cancel && trigger_when(submit)
}

// Check if all of the training rewards have been awarded
function AllTrainingComplete()
{
    return InGame() &&
        Training() && 
        prev(TrainingModeCompletion()) < 7 &&
        TrainingModeCompletion() == 7
}

// Main Achievment Functions /////////////////////////////////////////////////////////

// Complete a stage
function CompleteStage(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1]
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete a stage without dying, healing, or using a reward
function Deathless(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        LostLife() ||
        UsedMeatball() ||
        UsedExtraLife() 
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Defeat a certain number of enemies with a weapon
function ShootEmUpKillCount(name, killEvent, count)
{
    info = Stages[name]
    stage = info[3]
    
    active = InStage() &&
        ShootEmUpMode() &&
        MainGame()
        
    cancel = !InGame() || 
        Stage() != stage ||
        LostLife() ||
        UsedExtraLife() 
        
    submit = tally(count, killEvent)    
    
    return never(cancel) && measured(submit,active)
}


// Defeat a certain number of enemies with a weapon
function DrivingKillCount(name, killEvent, count)
{
    info = Stages[name]
    stage = info[3]
    
    active = InStage() &&
        DrivingMode() && 
        MainGame()
        
    cancel = !InGame() || 
        Stage() != stage ||
        LostLife() ||
        UsedExtraLife() 
        
    submit = tally(count, killEvent)    
    
    return never(cancel) && measured(submit,active)
}


// Defeat a certain number of enemies with a weapon
function BeatEmUpKillCount(killEvent, count)
{
    active = InStage() &&
        HorizontalScrolling() > 0x0 &&        
        MainGame()
        
    cancel = !InGame() ||
        TitleScreen()
    
    killEvent = Apply(BeatEmUpMode() , killEvent)
    submit = tally(count, killEvent)    
    
    return never(cancel) && measured(submit,active)
}

// Defeat a certain number of enemies with a weapon
function KillCount(name, killEvent, count)
{
    info = Stages[name]
    stage = info[3]

    active = InStage() &&
        BeatEmUpMode() && 
        MainGame()
        
    cancel = !InGame() || 
        Stage() != stage ||
        LostLife() ||
        UsedExtraLife() 
    
    killEvent = Apply(BeatEmUpMode() , killEvent)
    
    submit = tally(count, killEvent)    
    
    return never(cancel) && measured(submit,active)
}

// Complete a level within a time limit
function Speedrun(name, time)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
             ( 
                once(start) &&
                repeated(time, InStage() )
             )
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Kill crocodial without getting bitten
function CrocKiller(name, count)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || 
        Bonus() ||
        any_of(Bitten(), b => b)
    submit = tally(count, BeatEmUpDeath(Crocodile))
    
    return once(start) && never(cancel) && (trigger_when(submit) || measured(submit, once(start)))
}

// Kill count while a timer is active
function TimerKillCount(name1, name2, count, timer)
{
    info = Stages[name1]
    stage1 = info[3]
    info = Stages[name2]
    stage2 = info[3]

    start = InGame() &&
        InStage() &&
        ShootEmUpMode() &&
        (Stage() == stage1 || Stage() == stage2) &&
        prev(timer) == 0 &&
        timer > 0
        
    cancel = !InGame() ||
        timer == 0
        
    submit = tally(count, ShootEmUpEnemyDeath())
    
    return once(start) && never(cancel) && (trigger_when(submit) || measured(submit, once(start)))
}

// No kills while a timer is active
function NoDamageTimer(name1, name2, count, timer)
{
    info = Stages[name1]
    stage1 = info[3]
    info = Stages[name2]
    stage2 = info[3]

    start = InGame() &&
        InStage() &&
        ShootEmUpMode() &&
        (Stage() == stage1 || Stage() == stage2) &&
        prev(timer) == 0 &&
        timer > 0
        
    cancel = !InGame() ||
        tally(1, ShootEmUpDamage())
        
    submit = timer == 0
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Kill count for TNT and Missles in a Shoot 'Em Up
function ExplosiveKillCount(name, count)
{
        info = Stages[name]
    start = info[0]
    cancel = info[1] || 
        Bonus()
    submit = tally(count, Concat(ShootEmUpDeath(TNT), ShootEmUpDeath(Missle)))
    
    return once(start) && never(cancel) && (trigger_when(submit) || measured(submit, once(start)))
}

// Check if the boss of a shoot 'em up stage has been kill in under the time limit
function QuickKillBoss(name,time,enemies)
{
    info = Stages[name]
    stage = info[3]

    start = InGame() &&
        InStage() &&
        ShootEmUpMode() &&
        Stage() == stage &&
        ShootEmUpBoss() == 1 &&
        prev(ShootEmUpGauntlet()) < ShootEmUpGauntlet() 
        
    cancel = !InGame() ||
        LostLife() ||
        ( 
            once(start) &&
            repeated(time, InStage())
        )
    
    //create an array of all the possible enemy deathes
    enemyArray = []
    for enemy in enemies
    {
        killArray = ShootEmUpDeath(enemy)        
        for kill in killArray
            array_push(enemyArray, kill)
    }
    
    submit = tally(length(enemies),enemyArray)
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Starts at the start of a stage, ends at level complete, cancels when a weapon is 
function CompleteNoWeapons(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || WeaponUsed()
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Starts when you get to the boss and ends when th boss is beaten without being thrown.
function NoThrows(name, progress)
{
    info = Stages[name]
    stage = info[3]

    start = InGame() &&
        InStage() &&
        BeatEmUpMode() &&
        Stage() == stage &&
        prev(HorizontalScrolling()) < progress &&
        HorizontalScrolling() >= progress
        
    cancel = !InGame() || 
        AnimationFrameSprite(0) == UpsideDown
    
    submit = tally(1,BeatEmUpDeath(MatthewBirch))
    
    return once(start) && never(cancel) && trigger_when(submit)    
}

// Counts the number of knife hits on a enemy
function KnifeHits(name, enemy, count)
{
    info = Stages[name]
    stage = info[3]
    
    active = InStage() &&
        MainGame()
        
    cancel = !InGame() || 
        Stage() != stage ||
        LostLife() ||
        UsedExtraLife() 
        
    submit = tally(count, BeatEmUpKnifeHit(enemy))    
    
    return never(cancel) && measured(submit,active)
}

// Complete a driving stage without dying or collecting pick ups
function DeathlessDriver(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        LostLife() ||
        GasPickUp() ||
        LifePickUp()
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete a driving stage without taking damage or hitting obsctales
function DamagelessDriver(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        LostLife() ||
        DamageTaken() ||
        HitPuddle() ||
        HitOil()
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete a level within a time limit
function SpeedrunDriver(name, time)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || 
             DrivingStagesTimer() == 0 ||
             prev(Stage()) < Stage()
    active = DrivingStagesTimer() >= time
    submit = info[2]
    
    return once(start) && never(cancel) && active && trigger_when(submit)
}

// Do enough amage to Gordon car to cause him to flee
function MakeGordonFlee()
{
    spawn = VechicalSpawn(GordonsCar)

    initial = InGame() &&
        InStage() &&
        DrivingMode() && 
        Stage() >= 3 && 
        Stage() <= 4
        
    start =  tally(1, Apply(initial, VechicalSpawn(GordonsCar)))
        
    cancle = !InGame() || any_of(VechicalExit(GordonsCar), b => b)
    submit = tally(1, VechicalFlee(GordonsCar))
    
    return start && never(cancle) && trigger_when(submit)
}

// Beat a stage with only kicks
function KicksOnly(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] ||
        WeaponUsed() ||
        BillyAttack() == Punching        
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)    
}

// Event start when the enemy spawn, cancel if damaged, and submit when everyone in the screen is dead
function DamagelessEnemy(name, enemy)
{    
    info = Stages[name]
    stage = info[3]
    
    initial = InGame() &&
        InStage() &&
        BeatEmUpMode() &&
        Stage() == stage
    
    start = tally(1, Apply(initial, BeatEmUpSpawn(enemy)))
        
    cancel = !InGame() ||
        LostLife() ||
        DamageTaken()
        
    submit = AllEnemiesDead()
    
    return start && never(cancel) && trigger_when(submit)   
}

function NoGrabbing(name)
{
    info = Stages[name]
    start = info[0]
    cancel = info[1] || any_of(BossGrab(), b => b)
    submit = info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Start at the last level with training rewards, cancle on game over or another ending, submit when ending occurs 
function CompleteEasyEnding()
{
    info = Stages["The Perilous Plantation Parlor"]
    
    start = TrainingRewards() && info[0]        
    cancel = info[1]
    submit = EasyEnding()
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Start at the last level without training rewards, cancle on game over or another ending, submit when ending occurs 
function CompleteNormalEnding(ending)
{
    info = Stages["The Perilous Plantation Parlor"]
    
    start = NoTraining() && info[0]
   
    // Cancel if not the selected ending
    cancel = info[1]
    if (ending != GoodEnding) cancel = cancel  || NotEnding(GoodEnding)
    if (ending != JerkassEnding) cancel = cancel  || NotEnding(JerkassEnding)
    if (ending != KansaiBenEnding) cancel = cancel  || NotEnding(KansaiBenEnding)
    
    submit = NormalEnding(ending)
    
    return once(start) && never(cancel) && trigger_when(submit)
}

// Complete game with additional conditions
function CompleteGame(addStart, addCancel, addSubmit)
{
    // Use the Speedrun split as the the wole game split
    // Add the additional pass conditions to each
    info = Stages["Mad City Speedrun"]
    start = all_of(addStart, a => a) && info[0]
    cancel = any_of(addCancel, a => a) || info[1]
    submit = all_of(addSubmit, a => a) && info[2]
    
    return once(start) && never(cancel) && trigger_when(submit)
}

function CompleteQuiz()
{
    active = Quiz() && QuizModeRevealed() == 0x1
    submit = prev(QuizScene()) == 0x9 &&
        QuizScene() == 0xa
    return active && trigger_when(submit)
}

// Stage Splits ////////////////////////////////////////////////////////////////////////

// Array of events [start event, cancle event, submit event, stage #]]
Stages = {
    "Mad City Speedrun": [MainBeatEmUpStart(1), TitleScreen(), DefeatAllBosses(),0],
    "Training Beat Em' Up": [TrainingBeatEmUpStart(), TitleScreen(), TrainingBeatEmUpStageEnd(),0],
    "Training Shoot Em' Up": [TrainingShootEmUpStart(), TitleScreen(), TrainingShootEmUpStageEnd(),0],
    "Training Shoot Em' Up A": [TrainingAShootEmUpStart(), TitleScreen(), TrainingShootEmUpStageEnd(),0],
    "Training Shoot Em' Up B": [TrainingBShootEmUpStart(), TitleScreen(), TrainingShootEmUpStageEnd(),0],
    "Training Driving": [TrainingDrivingStart(), TitleScreen(), TrainingDrivingStageEnd(0x93),0],
    "Bayou's Backyard": [MainBeatEmUpStart(1), TitleScreen(), StageEnd(),0],
    "Deep in the Heart of the Dixie Swamp": [MainShootEmUpStart(2), TitleScreen(), StageEnd(),1],
    "Deep in the Heart of the Dixie Swamp Game A": [GameAShootEmUpStart(2), TitleScreen(), StageEnd(),1],
    "Deep in the Heart of the Dixie Swamp Game B": [GameBShootEmUpStart(2), TitleScreen(), StageEnd(),1],
    "Gator Alley": [MainBeatEmUpStart(3), TitleScreen(), StageEnd(),2],
    "I-10, the Road to New Orleans": [MainDrivingStart(4), TitleScreen(), StageEnd(),3],
    "Superdome Drive": [MainDrivingStart(5), TitleScreen(), StageEnd(),4],
    "The French Quarter": [MainBeatEmUpStart(6), TitleScreen(), StageEnd(),5],
    "Gordon's Gateway": [MainShootEmUpStart(7), TitleScreen(), StageEnd(),6],
    "Gordon's Gateway Game A": [GameAShootEmUpStart(7), TitleScreen(), StageEnd(),6],
    "Gordon's Gateway Game B": [GameBShootEmUpStart(7), TitleScreen(), StageEnd(),6],
    "Hitman's Yard": [MainBeatEmUpStart(8), TitleScreen(), StageEnd(),7],
    "The Perilous Plantation Parlor": [MainBeatEmUpStart(9), TitleScreen(), DefeatAllBosses(),8]
}

// Training Achievements ///////////////////////////////////////////////////////////////

achievement("Meat Your Match","Earn the Meatball reward from Street Fighting Training", 2, CompleteStage("Training Beat Em' Up"), type="", id=602928)
achievement("Fists of the Bayou","Complete the Street Fighting Training without using a weapon", 2, TrainingNoWeapons("Training Beat Em' Up"), type="", id=602929)
achievement("Lean and Mean","Complete the Street Fighting Training without dying or healing with raw meat", 5, TrainingNoHeal("Training Beat Em' Up"), type="", id=602930)
achievement("Cajun Cruise Control","Earn the Extra Life reward from Action Driving Training", 2, CompleteStage("Training Driving"), type="", id=602931)
achievement("Life in the Fast Lane","Complete the Action Driving Training with 500 or more time left", 3, TrainingRace("Training Driving", 500), type="", id=602932)
achievement("True Grit in Transit","Complete the Action Driving Training without dying or healing with a life can", 3, TrainingDeathlessRace("Training Driving"), type="", id=602933)
achievement("Swamp Drift Champion","Complete the Action Driving Training without hitting an obstacle or taking damage", 5, TrainingDamagelessRace("Training Driving"), type="", id=602934)
achievement("Locked and Loaded","Win the Extra Bullets reward from Shoot 'Em Up Training A or B", 3, CompleteStage("Training Shoot Em' Up"), type="", id=602935)
achievement("Bulletproof in the Bayou","Complete Shoot 'Em Up Training A or B without dying or healing with a first aid kit", 5, TrainingDeathlessShootEmUp("Training Shoot Em' Up"), type="", id=602936)
achievement("Quick Shot","Complete the final gauntlet within 20s on the screen stoping in Shoot 'Em Up Training A or B", 5, TrainingGauntletShootEmUp("Training Shoot Em' Up", TimeSpan(0,20,0)), type="", id=602937)
achievement("Strong as Gordon","Earn all three training rewards", 5, AllTrainingComplete(), type="", id=602938)

// Stage 1 Achievements /////////////////////////////////////////////////////////////////

achievement("First Blood in the Bayou","Complete Stage 1", 2, CompleteStage("Bayou's Backyard"), type="progression", id=602939)
achievement("City Folk Wouldn’t Last a Minute","Complete Stage 1 without dying or eating the meatball reward", 5, Deathless("Bayou's Backyard"), type="", id=602940)
achievement("Swamp Speedrun","Clear Stage 1 in under 3:00 minutes", 5, Speedrun("Bayou's Backyard", TimeSpan(3,00,0)), type="", id=602941)
achievement("Crocodile Dundamageless","Defeat 6 crocodiles in Stage 1 without being bitten", 5, CrocKiller("Bayou's Backyard", 6), type="", id=602942)
achievement("Never Knew What Hit 'Em","Defeat 12 enemies with a stick in Stage 1, count resets on death", 5, KillCount("Bayou's Backyard", BeatEmUpStickKill(), 12), type="", id=602943)

// Stage 2 Achievements /////////////////////////////////////////////////////////////////

achievement("Swampfire Showdown","Complete Stage 2 in Game A", 2, CompleteStage("Deep in the Heart of the Dixie Swamp Game A"), type="", id=602944)
achievement("Got a Permit for That?","Complete Stage 2 in Game B", 2, CompleteStage("Deep in the Heart of the Dixie Swamp Game B"), type="", id=602945)
achievement("Bulletproof Bushman","Complete Stage 2 without dying", 5, Deathless("Deep in the Heart of the Dixie Swamp"), type="", id=602946)
achievement("Spray and Pray","Defeat 10 enemies while the hourglass is active during Stage 2 or 7", 5, TimerKillCount("Deep in the Heart of the Dixie Swamp", "Gordon's Gateway", 10, HourglassCounter()), type="", id=602947)
achievement("Didn't Even Need It","Don't take damage while the bulletproof vest is active during Stage 2 or 7", 5, NoDamageTimer("Deep in the Heart of the Dixie Swamp", "Gordon's Gateway", 5, VestCounter()), type="", id=602948)
achievement("Boomstick Banisher","Destroy 6 incoming missiles or dynamite in Stage 2", 5, ExplosiveKillCount("Deep in the Heart of the Dixie Swamp", 6), type="", id=602949)
achievement("Life in the Bayou","Find the 1up in Stage 2", 5,  ShootEmUpKillCount("Deep in the Heart of the Dixie Swamp", ShootEmUpDeath(OneUpItem), 1), type="", id=602950)
achievement("Torn Rotator Blade","Defeat the Stage 2 helicopter within 30 seconds", 5, QuickKillBoss("Deep in the Heart of the Dixie Swamp",TimeSpan(0,30,0),[Whirlibird]), type="", id=602951)

// Stage 3 Achievements /////////////////////////////////////////////////////////////////

achievement("Bayou Ironhide","Complete Stage 3", 3, CompleteStage("Gator Alley"), type="progression", id=602952)
achievement("Hard to Swallow","Complete Stage 3 without dying or eating the meatball reward", 5, Deathless("Gator Alley"), type="", id=602953)
achievement("Slice of the Bayou","Damage Matthew Brich 4 times with a knife in Stage 3, count resets on death", 5, KnifeHits("Gator Alley", MatthewBirch, 4), type="", id=602954)
achievement("No Roughhousing","Defeat Matthew Brich without being thrown in Stage 3", 5, NoThrows("Gator Alley", 0x21F), type="", id=602955)

// Stage 4 Achievements /////////////////////////////////////////////////////////////////

achievement("Bayou Burnout","Complete Stage 4", 2, CompleteStage("I-10, the Road to New Orleans"), type="progression", id=602956)
achievement("Gumbo-Fueled Getaway","Complete Stage 4 without dying or picking up items", 5, DeathlessDriver("I-10, the Road to New Orleans"), type="", id=602957)
achievement("No Worries on the I-10","Complete Stage 4 without hitting an obstacle or taking damage", 5, DamagelessDriver("I-10, the Road to New Orleans"), type="", id=602958)
achievement("Crikey, Look at That Drift","Complete Stage 4 with 500 or more time left without the timer hitting zero", 5, SpeedrunDriver("I-10, the Road to New Orleans", 500), type="", id=602959)
achievement("Bodywork Wrecker","Land enough hits on Gordon's car to force him to fle in either Stage 4 or 5", 5, MakeGordonFlee(), type="", id=602960)
achievement("Sky Sweeper","Defeat 6 planes in Stage 4, count resets on death", 5, DrivingKillCount("I-10, the Road to New Orleans", PlaneDeath(), 6), type="", id=602961)

// Stage 5 Achievements /////////////////////////////////////////////////////////////////

achievement("Bourbon Street Racer","Complete Stage 5", 3, CompleteStage("Superdome Drive"), type="progression", id=602962)
achievement("Bushman Driver’s License","Complete Stage 5 without dying or picking up items", 5, DeathlessDriver("Superdome Drive"), type="", id=602963)
achievement("That’s Not a Road… This Is a Road!","Complete Stage 5 without hitting an obstacle or taking damage", 5, DamagelessDriver("Superdome Drive"), type="", id=602964)
achievement("Faster Than a Gator Snap","Complete Stage 5 with 500 or more time left without the timer hitting zero", 5, SpeedrunDriver("Superdome Drive", 500), type="", id=602965)
achievement("Heli Hunter","Defeat 8 helicopters in Stage 8, count resets on death", 5, DrivingKillCount("Superdome Drive", HelicopterDeath(), 8), type="", id=602966)

// Stage 6 Achievements /////////////////////////////////////////////////////////////////

achievement("Creole Combat","Complete Stage 6", 5, CompleteStage("The French Quarter"), type="progression", id=602967)
achievement("French Quarter Finalist","Complete Stage 6 without dying or eating the meatball reward", 5, Deathless("The French Quarter"), type="", id=602968)
achievement("Street Performer","Complete Stage 6 using only kicks and jump kicks", 5, KicksOnly("The French Quarter"), type="", id=602969)
achievement("Billy Belmont","Defeat 12 enemies with a whip in Stage 6, count resets on death", 5, KillCount("The French Quarter", BeatEmUpWhipKill(), 12), type="", id=602970)

// Stage 7 Achievements /////////////////////////////////////////////////////////////////

achievement("Bayou Blockade","Complete Stage 7 in Game A", 3, CompleteStage("Gordon's Gateway Game A"), type="", id=602971)
achievement("Gordon's Gauntlet","Complete Stage 7 in Game B", 3, CompleteStage("Gordon's Gateway Game B"), type="", id=602972)
achievement("Shoot First, Ask No Questions","Complete Stage 7 without dying", 5, Deathless("Gordon's Gateway"), type="", id=602973)
achievement("Helmet Crackin’ Time","Defeat 3 bikers in Stage 7, count resets on death", 5, ShootEmUpKillCount("Gordon's Gateway", ShootEmUpDeath(TheAccelerator), 3), type="", id=602974)
achievement("Life on the Streets","Find the 1up in Stage 7", 5,  ShootEmUpKillCount("Gordon's Gateway", ShootEmUpDeath(OneUpItem), 1), type="", id=602975)
achievement("Quickdraw Showdown","Defeat the both bosses in Stage 7 within 20 seconds of them entering the screen", 5, QuickKillBoss("Gordon's Gateway",TimeSpan(0,20,0),[LightningRod,StevenBarone]), type="", id=602976)

// Stage 8 Achievements //////////////////////////////////////////////////////////////////

achievement("No Where Left to Run Gordon","Complete Stage 8", 5, CompleteStage("Hitman's Yard"), type="progression", id=602977)
achievement("You Hit Like a Tourist","Complete Stage 8 without dying or eating the meatball reward", 5, Deathless("Hitman's Yard"), type="", id=602978)
achievement("Bite the Bullet","Defeat 5 enemies with a bullet in Stage 8, dogs do not add to count and count resets on death", 5, KillCount("Hitman's Yard", BeatEmUpBulletKill(), 5), type="", id=602979)
achievement("Dog Whisperer","Defeat Tom Ogawa and any spawned dogs in Stage 8 without taking damage", 5, DamagelessEnemy("Hitman's Yard", TomOgawa), type="", id=602980)

// Stage 9 Achievements //////////////////////////////////////////////////////////////////

//achievement("Just These Hands","Complete Stage 9 without using a weapon", 5, CompleteNoWeapons("The Perilous Plantation Parlor"), type="")
achievement("Parlor of Pain","Complete Stage 9 without dying or eating the meatball reward", 5, Deathless("The Perilous Plantation Parlor"), type="", id=602981)
achievement("Slippery as a Gator","Complete Stage 9 without being grabbed by Gordon, John Martin, or Grant Martin", 5, NoGrabbing("The Perilous Plantation Parlor"), type="", id=602982)
achievement("Not a Scratch","Defeat Gordon without taking damage", 5, DamagelessEnemy("The Perilous Plantation Parlor", RobertGordon), type="", id=602983)
achievement("Cajun Crime Bros.","Defeat John and Grant Martin without taking damage", 10, DamagelessEnemy("The Perilous Plantation Parlor", JohnMartin), type="", id=602984)

// Endings Achievements ///////////////////////////////////////////////////////////////////

achievement("Big Easy","Get the Easy Ending by beating the game with training rewards", 5, CompleteEasyEnding(), type="", id=602985)
achievement("North American","Get the Normal Ending by beating the game without any training rewards and save Annabelle", 10, CompleteNormalEnding(GoodEnding), type="win_condition", id=602986)
achievement("Hard to Catch","Get the Jerkass Ending by beating the game without any training rewards and avoiding Annabelle", 10, CompleteNormalEnding(JerkassEnding), type="win_condition", id=602987)
achievement("Cajun Kansai Code","Get the Kansai-ben Ending by beating the game without any training rewards and hold Up + Select while hugging Annabelle", 10, CompleteNormalEnding(KansaiBenEnding), type="win_condition", id=602988)

// Whole Game Achievements ////////////////////////////////////////////////////////////////

achievement("Bayou Combat","Beat the game without using a weapon in the beat 'em up stages", 25, CompleteGame([], [BeatEmUpMode() && WeaponUsed(), Looped()], []), type="", id=602989)
achievement("Mad City Godfather","Beat the game without any training items or using a continue", 25, CompleteGame([NoTraining()], [CreditUsed(), Looped()], []), type="", id=602990)
achievement("Return to the Bayou","Beat the game a second time without any training items", 25, CompleteGame([NoTraining()], [Loop()==0x0, Looped()],[]), type="", id=602991)

// Misc Achievements //////////////////////////////////////////////////////////////////////

achievement("I Am Rubber and You Are Glue","Deflect 5 bullets in Beat Em' Up mode", 1, BeatEmUpKillCount(BeatEmUpEnemyBulletDeflected(), 5), type="", id=602992)
achievement("Bayou Brainiac","Complete the Quiz", 0, CompleteQuiz(), type="", id=602993)

// Rich Presence /////////////////////////////////////////////////////////////////////////
StageRP = {
    0x0: "in Bayou's Backyard",
    0x1: "Deep in the Heart of the Dixie Swamp",
    0x2: "in Gator Alley",
    0x3: "on I-10, the Road to New Orleans",
    0x4: "on Superdome Drive",
    0x5: "in the French Quarter",
    0x6: "in Gordon's Gateway",
    0x7: "in Hitman's Yard",
    0x8: "in the Perilous Plantation Parlor"
}

RewardsRP = {
    0x0: "no rewards",
    0x1: "packing a meatball",
    0x2: "packing an extra life",
    0x3: "packing a meatball & extra life",
    0x4: "packing extra bullets",
    0x5: "packing a meatball & extra bullets",
    0x6: "packing an extra life & bullets",
    0x7: "fully loaded: meatball, life & bullets"
}

WeaponsRP = {
    0x0: "Billy is settling it the old-fashioned way",
    0x1: "Billy is packing heat",
    0x2: "Billy is cutting to the chase",
    0x3: "Billy is fighting dirty with a stick",
    0x5: "Billy is cracking the whip"    
}

rich_presence_conditional_display(TitleScreen(), "Billy’s stuck on the title screen like a gator in the reeds.")
rich_presence_conditional_display(Demo(), "Billy’s spectatin’ like it’s Mardi Gras.")
rich_presence_conditional_display(ActivelyPlaying() && QuizModeRevealed() == 0x1 && Quiz(), "Billy is guessing wildly on the quiz.")
rich_presence_conditional_display(ActivelyPlaying() && Training() && BeatEmUpMode(), "Billy’s learnin’ how to wrestle gators and punks.")
rich_presence_conditional_display(ActivelyPlaying() && Training() && ShootEmUpMode(), "Billy’s trainin’ his eyes on swamp critters.")
rich_presence_conditional_display(ActivelyPlaying() && Training() && DrivingMode(), "Billy’s practicin’ high-speed Cajun drifts.")
rich_presence_conditional_display(ActivelyPlaying() && BeatEmUpMode(), "{0} {1}, {2} lives left, score {3}, loop {4}, {5}.", 
    rich_presence_lookup("Weapon", Weapons(), WeaponsRP),
    rich_presence_lookup("Stage", Stage(), StageRP),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("Score", CurrentScore(), "VALUE"),
    rich_presence_value("Loop", Loop() + 1, "VALUE"),
    rich_presence_lookup("Rewards", TrainingModeCompletion(), RewardsRP)
)
rich_presence_conditional_display(ActivelyPlaying() && ShootEmUpMode(), "Billy is blasting everything in sight {0}, {1} lives left, score {2}, loop {3}, {4}.", 
    rich_presence_lookup("Stage", Stage(), StageRP),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("Score", CurrentScore(), "VALUE"),
    rich_presence_value("Loop", Loop() + 1, "VALUE"),
    rich_presence_lookup("Rewards", TrainingModeCompletion(), RewardsRP)
)
rich_presence_conditional_display(ActivelyPlaying() && DrivingMode(), "Billy is chasing Gordon through traffic {0}, {1} lives left, score {2}, loop {3}, {4}.", 
    rich_presence_lookup("Stage", Stage(), StageRP),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("Score", CurrentScore(), "VALUE"),
    rich_presence_value("Loop", Loop() + 1, "VALUE"),
    rich_presence_lookup("Rewards", TrainingModeCompletion(), RewardsRP)
)
rich_presence_display("Billy is getting ready for trouble.")

// Leaderboard Functions /////////////////////////////////////////////////////////////////

function SpeedrunLB(name, trainingModeAllowed = true)
{
    info = Stages[name]
    startEvent = info[0]
    cancelEvent = info[1]
    submitEvent = info[2]
    description = "Fastest time to complete " + name
    
    if (trainingModeAllowed == false)
    {
        startEvent = TrainingModeCompletion() == 0 && startEvent
        description = description + " without training rewards"
    }
        
    leaderboard(name, description, startEvent, cancelEvent, submitEvent, always_true(), lower_is_better = true, format = "FRAMES") 
}

SpeedrunLB("Mad City Speedrun", false)
SpeedrunLB("Training Beat Em' Up")
SpeedrunLB("Training Shoot Em' Up A")
SpeedrunLB("Training Shoot Em' Up B")
SpeedrunLB("Training Driving")
SpeedrunLB("Bayou's Backyard", false)
SpeedrunLB("Deep in the Heart of the Dixie Swamp Game A", false)
SpeedrunLB("Deep in the Heart of the Dixie Swamp Game B", false)
SpeedrunLB("Gator Alley", false)
SpeedrunLB("I-10, the Road to New Orleans", false)
SpeedrunLB("Superdome Drive", false)
SpeedrunLB("The French Quarter", false)
SpeedrunLB("Gordon's Gateway Game A", false)
SpeedrunLB("Gordon's Gateway Game B", false)
SpeedrunLB("Hitman's Yard", false)
SpeedrunLB("The Perilous Plantation Parlor", false)

leaderboard("High Score Game A", "Highest Score in Game A",  TrainingModeCompletion() == 0 && GameABeatEmUpStart(1), always_false(), GameOver(), CurrentScore(), lower_is_better = false, format = "VALUE") 
leaderboard("High Score Game B", "Highest Score in Game B",  TrainingModeCompletion() == 0 && GameBBeatEmUpStart(1), always_false(), GameOver(), CurrentScore(), lower_is_better = false, format = "VALUE")
    


