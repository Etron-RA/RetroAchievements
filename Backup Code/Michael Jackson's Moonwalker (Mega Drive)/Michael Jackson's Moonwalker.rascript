// Michael Jackson's Moonwalker
// #ID = 263

// $C38A: Number of people dancing with Michael during a dance 2
function DanceParty() => byte(0x00C38A)

// $C51E: 01 = Robot
function Robot() => byte(0x00C51E)
function RobotMode() => Robot() == 1

// $DE03: [8-bit] Controller Input
//        bit0: Up
//        bit1: Down
//        bit2: Left
//        bit3: Right
//        bit4: B
//        bit5: C
//        bit6: A
//        bit7: Start
function Controller() => byte(0x00DE03)
function UpButton() => bit0(0x00DE03)
function DownButton() => bit1(0x00DE03)
function LeftButton() => bit2(0x00DE03)
function RightButton() => bit3(0x00DE03)

// $DE01: [8-bit] Game Mode
//        0x00 = Title Screen
//        0x0c = In Game
//        0x14 = Fading
//        0x24 = Game Over
//        0x34 = End Credits
//        0x3c = Intro Movie
//        0x50 = Demo 
//        0x5c = End Round results
//        0x60 = Final Stage
function GameMode() => byte(0x00DE01)
function Title() => GameMode() == 0x00
function InGame() => GameMode() == 0xc
function WasFading() => prev(GameMode()) == 0x14
function MainMenu() => prev(GameMode()) == 0x18
function GameOver() => GameMode() == 0x24
function EndCredits() => GameMode() == 0x34
function Introduction() => GameMode() == 0x3C
function EndRound() => GameMode() == 0x5c
function FinalStage() => GameMode() == 0x60

// $DE40: Stage Value (Not Counting Sub Sections)
function Stage() => byte(0x00DE40)

// $DE42: Stage ID, 03=stage 2-1
function Round() => byte(0x00DE42)
function StageID(stage, round) => (stage - 1) * 3 + round - 1

// $DE4E: Children left on stage
function ChildrenLeft() => word(0x00DE4E)

// $de54: [16-bit] Bitmask of children found (bit 1 is the star child  between stages 2-1 and 5-2)
function ChildrenBitmask() => word(0x00de54)

// $DE11: Set to 10 when paused
function Pause() => byte(0x00DE11)

// $DE44: Lives
function Lives() => byte(0x00DE44)

// $DE46: MJ's HP
function Health() => byte(0x00DE46)

// $DE4A: [8-bit] Score: 00XX0000
// $DE4B: [8-bit] Score: XX000000
// $DE4C: [8-bit] Score: 000000XX
// $DE4D: [8-bit] Score: 0000XX00
function ScoreX0000000() => high4(0x00DE4B)
function Score0X000000() => low4(0x00DE4B)
function Score00X00000() => high4(0x00DE4A)
function Score000X0000() => low4(0x00DE4A)
function Score0000X000() => high4(0x00DE4D)
function Score00000X00() => low4(0x00DE4D)
function Score000000X0() => high4(0x00DE4C)
function Score0000000X() => low4(0x00DE4C)
function Score() {
    return ScoreX0000000() * 10000000 +
        Score0X000000() * 1000000 +
        Score00X00000() * 100000 +
        Score000X0000() * 10000 +
        Score0000X000() * 1000 +    
        Score00000X00() * 100 +
        Score000000X0() * 10 +
        Score0000000X()
}

// $DE4E: Children left on stage
function Childern() => byte(0x00DE4E)

// $DE54: [16-bit] Bitmask of children (finding star child 1st spawns a shooting star)
//        Star Child 2-1: bit 1
//        Star Child 2-2: bit 1
//        Star Child 2-3: bit 1
//        Star Child 3-1: bit 5
//        Star Child 3-2: bit 8
//        Star Child 3-3: bit 7
//        Star Child 4-1: bit 10
//        Star Child 4-2: bit 3
//        Star Child 4-3: bit 7
//        Star Child 5-1: bit 1
//        Star Child 5-2: bit 5
function ChildenBitflag() => word(0x00DE54)
StarChild = {
    3: 0x0002,  // Streets 2-1 - bit 1
    4: 0x0002,  // Streets 2-2 - bit 1
    5: 0x0002,  // Streets 2-3 - bit 1
    6: 0x0020,  // Woods 3-1 - bit 5
    7: 0x0100,  // Woods 3-2 - bit 8
    8: 0x0080,  // Woods 3-3 - bit 7
    9: 0x0400,  // Cavern 4-1 - bit 10
    10: 0x0008, // Cavern 4-2 - bit 3
    11: 0x0080, // Cavern 4-3 - bit 7
    12: 0x0002, // Enemy Hideout 5-1 - bit 1
    13: 0x0020  // Enemy Hideout 5-2 - bit 5
}

// $DE56: [8-bit] Cave opening bit mask
//        Stage 4-1: bit5 = no dancing sign
//        Stage 4-2: bit3 = no dancing sign #1
//        Stage 4-2: bit5 = no dancing sign #2
//        Stage 4-3: bit5 = no dancing sign #1
//        Stage 4-3: bit7 = no dancing sign #2
function CaveBitflag() => byte(0x00DE56)
function NoDance4_1_1() => bit5(0x00DE56)
function NoDance4_2_1() => bit3(0x00DE56)
function NoDance4_2_2() => bit5(0x00DE56)
function NoDance4_3_1() => bit5(0x00DE56)
function NoDance4_3_2() => bit7(0x00DE56)

// $DE60: Continues
function Continues() => byte(0x00DE60)

// $de63: [8-bit] Demo 0xFF = Demo is active, 00 = Inactive
function Demo() => byte(0xde63)

// $C546: [8-bit] Time Taken to complete stage, frame count down, seconds change when 0x1 to 0x3c.
// $DE64: [8-bit] Time 00XX current stage, BCD secs
// $DE65: [8-bit] Time XX00 current stage, BCD secs
function TimeX000() => high4(0x00DE65)
function Time0X00() => low4(0x00DE65)
function Time00X0() => high4(0x00DE64)
function Time000X() => low4(0x00DE64)
function TimeWord() => word(0x00DE64)
function Frames() => byte(0x00C546)

function Time() { 
    return 60 - Frames() +
        TimeX000() * 60000 +
        Time0X00() * 6000 +
        Time00X0() * 600 +
        Time000X() * 60
}

function Seconds() {
    return TimeX000() * 1000 +
        Time0X00() * 100 +
        Time00X0() * 10 +
        Time000X()
}

function TimeSpan(minutes, seconds) => minutes * 60 + seconds

// $dec6: [8-bit] Slowed down by spider web (0 = no, 1 = yes)
function WebEffect() => bit0(0xdec6)

// $ded8: [16-bit] On conveyors (0 = no, 0xFFFF = yes)
function Conveyors() => word(0xded8)

// $df00: [16-bit] Camera X
function CameraX() => word(0xdf00)

// $df12: [16-bit] Camera Y
function CameraY() => word(0xdf12)

// $16E0: [8-bit] Computer 5-1 #2 tiles (0x81 = working & 0x5d = broken)
// $DF94: [8-bit] HQ computer bit mask
//        Stage 5-1: bit0 = break computer #1
//        Stage 5-1: bit2 = break computer #3
//        Stage 5-1: bit3 = break server #1
//        Stage 5-1: bit5 = break computer #4
//        Stage 5-1: bit7 = break computer #5
// $DF95: [8-bit] HQ computer bit mask
//        Stage 5-1: bit1 = break server #2
//        Stage 5-1: bit3 = break server #3
//        Stage 5-1: bit5 = break server #4
function Computer1() => bit0(0x00DF94)
function Computer2() => high4(0x0016E0)
function Computer3() => bit2(0x00DF94)
function Computer4() => bit5(0x00DF94)
function Computer5() => bit6(0x00DF94)
function Server1() => bit3(0x00DF94)
function Server2() => bit1(0x00DF95)
function Server3() => bit3(0x00DF95)
function Server4() => bit5(0x00DF95)

// $DFC0: [16-bit] Stage 1 Stairs Active (0x0 = no, 0xffff = yes)
function StairsActive() => word(0x00DFC0)

// $dfd4: [8-bit] Stage 2 Fire Hydrant (0 = off, 1 = on)
function FireHydrant() => byte(0xdfd4)

// $e020: [8-bit] Animation State
//        bit3: Facing 0 = Right, 1 = Left
function Facing() => bit3(0xe020)

// $E023: [8-bit] Michael Anim Frame
//        0x5c = Slidding down stairs
//        0x5e ->0x5d Swinging from branch
function MichaelAnimation() => byte(0x00E023)

// $E02C: set to 8e when moonwalk is active, otherwise b0
function Moonwalk() => byte(0x00E02C)
function Moonwalking() => Moonwalk() == 0x8e
function Walking() => Moonwalk() != 0x8e

// $ecc0: [8-bit] Object Type (0x44 = Star in Caverns)
function ObjectTypeCaverns() => byte(0xecc0)

// $ecc3: [8-bit] Shooting Star State (in Caverns)
//        0x00 = None
//        0x47 = Count down to star
//        0x41 = Star Falling
function StarStateCaverns() => byte(0xecc3)

// $fb80: [8-bit] Object Type (0x44 = Star)
function ObjectType() => byte(0xfb80)

// $fb83: [8-bit] Shooting Star State
//        0x00 = None
//        0x47 = Count down to star
//        0x41 = Star Falling
function StarState() => byte(0xfb83)

// $FE44: Difficulty
function Difficulty() => byte(0x00FE44)

// $FE59: FF = Stage Select Active
function StageSelect() => byte(0x00FE59)

// $F6E4: [8-bit] Stage 2-3 Manhole Cover 1 Flag (0x0 = closed, 0x4 opening, 0x8 = open)
function ManholeCover1() => byte(0x00F6E4)

// $F824: [8-bit] Stage 2-3 Manhole Cover 2 Flag (0x0 = closed, 0x4 opening, 0x8 = open)
function ManholeCover2() => byte(0x00F824)

// $FE40: Sound Test
function SoundTest() => byte(0x00FE40)

// -- Helper Functions ----------------------------------------------------------------------------

// Event when starting a stage/round
function StartStage(stage, round)
{
    id = StageID(stage, round)
    
    trigger = StageSelect() != 0xff && 
        WasFading() && 
        InGame() &&
        Round() == id
        
     if (stage != 6)
        trigger = trigger && TimeWord() == 0
    
    return trigger
}

// Event when completing a stage
function EndStage(stage, round)
{
    id = StageID(stage, round)
    if (stage == 5 && round == 3)
        return StageSelect() != 0xff && FinalStage() && Round() == id + 1
    
    if (stage == 6 && round == 1)
        return StageSelect() != 0xff && EndCredits() && Round() == id 
    
    return StageSelect() != 0xff && EndRound() && Round() == id
}

// Challenge to beat a round in around the goal time
function Speedwalk(stage, round, time)
{
    id = StageID(stage, round)
    
    // Start at beginning of stage on normal+
    start = once(StartStage(stage, round) && Difficulty() >= 1) 
    
    // Cancel when game over, over par time, or on different stage
    cancel = never(Title()) &&
        never(GameOver()) &&
        never(Seconds() >= time) &&
        never(Round() != id && Round() <= 0xf)
    
    // Submit when end of round data is shown.
    submit = trigger_when(EndRound())
    
    return start && cancel && submit
}

// Challenge to obtain a certain score
function ObtainScore(score)
{
    return prev(Score()) != 0 &&
        prev(Score()) < score &&
        measured(Score() >= score) &&
        (
            InGame() || 
            EndRound()
       )
}

// Triggered when saving a child
function RescueChild() {
    return InGame() && 
        prev(ChildrenLeft()) > ChildrenLeft()
}

// Challenge to moonwalk for 5 seconds or more
function MoonwalkDance()
{
    moonwalking = [
        Moonwalking() && RightButton() == 1,
        Moonwalking() && LeftButton() == 1
    ]

    // Count how long the player is moonwalking
    return trigger_when(InGame()) &&  
        never(!Moonwalking()) &&
        (
            trigger_when(tally(600,moonwalking)) ||
            measured(tally(600,moonwalking), Moonwalking(), format = "percent")
        )        
}

// Event when slidding down stairs
function SliddingStairs() 
{
    return InGame() && 
        MichaelAnimation() == 0x5c
}

// Challenge to dance with a certain number of enemies
function DanceGroup(size)
{
    return InGame() &&
        DanceParty() >= size && 
        DanceParty() <= 9
}

// Challenge to collect a shooting star in a certain level (stages 2-1 to 5-2)
function ShootingStar(stage, round)
{
    id = StageID(stage, round) 
    
    // Start at beginning of stage if no childern are found
    start = once(StartStage(stage, round) && ChildenBitflag() == 0) 
    
    // Cancel if game over, changed levels, missed shooting star, or non star child found first
    cancel = never(Title()) &&
        never(GameOver()) &&
        never(Round() != id && Round() <= 0xf) &&
        never(
            Robot() == 0x0 &&
            prev(ObjectTypeCaverns()) == 0x44 &&
            prev(StarStateCaverns()) == 0x41 &&
            StarStateCaverns()== 0x0
        ) &&
        never(
            Robot() == 0x0 &&
            prev(ObjectType()) == 0x44 &&
            prev(StarState()) == 0x41 &&
            StarState()== 0x0
        ) &&
        never(
            prev(ChildenBitflag()) == 0 &&
            ChildenBitflag() != 0 &&
            ChildenBitflag() != StarChild[id]
        )
    
    // Trigger when turning into robot
    submit = trigger_when(
            prev(Robot()) == 0 &&
            Robot() == 1
       )
    
    return start && cancel && submit
}

// Event when a set of stairs are lowered
function StaircaseLowered()
{   lowId = StageID(1, 1) 
    highId = StageID(1, 3) 
    
    prime = InGame() &&
        Round() >= lowId &&
        Round() <= highId
        
    trigger = trigger_when(
        prev(StairsActive()) == 0x0 &&
        StairsActive() == 0xffff
    )
    
    return prime && trigger        
}

// Challenge to kill an enemy with a fire hydrant
function HydrantKill()
{
    lowId = StageID(2, 1) 
    highId = StageID(2, 3) 
    
    prime = InGame() &&
        Round() >= lowId &&
        Round() <= highId
        
    trigger = trigger_when(FireHydrant() == 1) &&
        trigger_when(
            prev(ScoreX0000000()) < ScoreX0000000() ||
            prev(Score0X000000()) < Score0X000000() ||
            prev(Score00X00000()) < Score00X00000() ||
            prev(Score000X0000()) < Score000X0000() ||
            prev(Score0000X000()) < Score0000X000() ||
            prev(Score00000X00()) < Score00000X00()
        )
        
    return prime && trigger  
}

// Event when opening a manhole cover
function ManholeCovers()
{   
    id = StageID(2, 3) 
    
    prime = InGame() &&
        Round() == id
        
    trigger = trigger_when(
            (prev(ManholeCover1()) == 0x4 &&
            ManholeCover1() == 0x8) ||
            (prev(ManholeCover2()) == 0x4 &&
            ManholeCover2() == 0x8)
        )
        
    return prime && trigger 
}

// Event when swinging from a branch
function BranchSwing()
{
    lowId = StageID(3, 1) 
    highId = StageID(3, 3) 

    prime = InGame() &&
        Round() >= lowId &&
        Round() <= highId
        
    trigger = trigger_when(
            prev(MichaelAnimation()) == 0x5e &&
            MichaelAnimation() == 0x5d
        )       
        
    return prime && trigger 
}

// Event for moonwalking through a web
function WebWalker()
{    
    lowId = StageID(4, 1) 
    highId = StageID(4, 3) 
    
    prime = InGame() && 
        Round() >= lowId &&
        Round() <= highId
        
    start = trigger_when(
            once(
                Moonwalking() &&                 
                prev(WebEffect()) == 0x0 &&
                WebEffect() == 0x1
            )
        )
        
    cancel = never(
            prev(Moonwalk()) == 0x8e &&
            Moonwalk() != 0x8e 
        ) && never(
            Moonwalking() &&
            prev(Facing()) != Facing()
        )
        
    submit = trigger_when(WebEffect() == 0x0)
    
    return prime && start && cancel && submit
}

// Event for moonwalking tover the bottom conveyor in 5-2
function ConveyorWalker()
{    
    id = StageID(5, 2) 
    
    prime = InGame() && 
        Round() == id
        
    start = trigger_when(
            once(
                InGame() && 
                Moonwalking() &&
                Facing() == 0x1 &&
                CameraY() >= 0xffa0 &&
                prev(Conveyors()) == 0x0 &&
                Conveyors() == 0xffff
            )
        )
        
    cancel = never(
            prev(Moonwalk()) == 0x8e &&
            Moonwalk() != 0x8e 
        ) && 
        never(
            Moonwalking() &&
            Facing() == 0x0
        )
        
    submit = trigger_when(prev(Conveyors()) == 0xffff &&
            Conveyors() == 0x0)
    
    return prime && start && cancel && submit
}

// Event for destroying a no dancing sign
function NoDancing()
{   
    id4_1 = StageID(4, 1) 
    id4_2 = StageID(4, 2) 
    id4_3 = StageID(4, 3) 
    return InGame() &&
        (
            Round() == id4_1 && trigger_when(prev(NoDance4_1_1()) < NoDance4_1_1()) ||
            Round() == id4_2 && trigger_when(prev(NoDance4_2_1()) < NoDance4_2_1()) ||
            Round() == id4_2 && trigger_when(prev(NoDance4_2_2()) < NoDance4_2_2()) ||
            Round() == id4_3 && trigger_when(prev(NoDance4_3_1()) < NoDance4_3_1()) ||
            Round() == id4_3 && trigger_when(prev(NoDance4_3_2()) < NoDance4_3_2())
        )        
}

// Event for destroying a computer
function NoComputers()
{   
    id = StageID(5, 1) 
    
    devices = [
        once(prev(Computer1()) < Computer1()),
        once(prev(Computer2()) == 0x8 && Computer2() == 0x5),
        once(prev(Computer3()) < Computer3()),
        once(prev(Computer4()) < Computer4()),
        once(prev(Computer5()) < Computer5()),
        once(prev(Server1()) < Server1()),
        once(prev(Server2()) < Server2()),
        once(prev(Server3()) < Server3()),
        once(prev(Server4()) < Server4())
    ]
    
    prime = InGame() && 
        Round() == id
        
    cancel = never(Title()) &&
        never(GameOver()) &&
        never(Round() != id && Round() <= 0xf) && 
        never(prev(Lives()) > Lives())
    
    trigger = trigger_when(tally(length(devices), devices))
    
    measure = measured(tally(length(devices), devices), prime)
    
    return prime && cancel && (trigger || measure)
}

// Challenge to beat the game without using a continue.
function NoContinues(difficulty)
{
    start = once(
            StartStage(1,1) && 
            Difficulty() >= difficulty
        )
    
    cancel = never(prev(Continues()) > Continues()) && 
        never(Title()) &&
        never(GameOver()) && 
        never(Lives() > 2)
        
        
    submit = trigger_when(EndStage(6,1))
    
    return start && cancel && submit
}

// -- Achievements ----------------------------------------------------------------------------

// Misc Achievements
achievement("Annie, Are You Okay?","Rescue a child", 1, RescueChild(), id = 363)
achievement("Fool Gravity","Perform a Moonwalk for 5 seconds (counts time while moving, resets when Moonwalk ends)", 3, MoonwalkDance(), id = 3591)
achievement("Hoooooo!!!","Slide down some stairs", 2, SliddingStairs(), id = 3593)
achievement("Emergency Entrance","Activate the movable stairs in stage 1 any round", 1,  StaircaseLowered())
achievement("Underground Mysteries","Open a manhole cover in stage 2-3", 1, ManholeCovers())
achievement("Cleaning the Streets","Take out an enemy while dancing on a fire hydrant in stage 2 any round", 2, HydrantKill())
achievement("Groove and Swing","Swing from a branch in stage 3 any round", 1, BranchSwing())
achievement("Footloose","Break a no dancing sign in stage 4 any round", 1, NoDancing())
achievement("Non-stick Dancing","Moonwalk through a spider web in stage 4 any round, start Moonwalk before entering web, no turning around", 3, WebWalker())
achievement("CTRL+Alt+Destroyer","Break all nine computers and servers in stage 5-1", 5, NoComputers())
achievement("Faster Going Backwards","Moonwalk over the entire bottom floor conveyor in stage 5-2 travelling against the direction of conveyor, left to right without turning around", 5, ConveyorWalker())
achievement("Form a Group ","Dance with 7 or more people at once", 10, DanceGroup(7), id = 3592)

// Speedwalk Achievements
achievement("Speed Demon ","Complete Stage 1-1 under 1m10s on Normal+", 25, Speedwalk(1, 1, TimeSpan(1,10)), id = 3594)
achievement("Nightlife Dash","Complete Stage 1-1 under the par time 2m00s on Normal+", 5, Speedwalk(1, 1, TimeSpan(2,0)))
achievement("Club Fever Frenzy","Complete Stage 1-2 under the par time 2m00s on Normal+", 5, Speedwalk(1, 2, TimeSpan(2,0)))
achievement("Speed Walk","Complete Stage 1-3 under the par time 2m00s on Normal+", 10, Speedwalk(1, 3, TimeSpan(2,0)))
achievement("Midnight Street Race","Complete Stage 2-1 under the par time 3m00s on Normal+", 5, Speedwalk(2, 1, TimeSpan(3,0)))
achievement("Chasing the Urban Beat","Complete Stage 2-2 under the par time 3m00s on Normal+", 5, Speedwalk(2, 2, TimeSpan(3,0)))
achievement("Streets of Speed","Complete Stage 2-3 under the par time 3m00s on Normal+", 5, Speedwalk(2, 3, TimeSpan(3,0)))
achievement("Moonlit Zombie Blitz","Complete Stage 3-1 under the par time 4m00s on Normal+", 5, Speedwalk(3, 1, TimeSpan(4,0)))
achievement("Chasing Shadows in the Haunted Woods","Complete Stage 3-2 under the par time 4m00s on Normal+", 5, Speedwalk(3, 2, TimeSpan(4,0)))
achievement("Survivor’s Dance of the Living Dead","Complete Stage 3-3 under the par time 4m00s on Normal+", 5, Speedwalk(3, 3, TimeSpan(4,0)))
achievement("Cave of Eight-Legged Tango","Complete Stage 4-1 under the par time 5m00s on Normal+", 5, Speedwalk(4, 1, TimeSpan(5,0)))
achievement("Dancing Through the Spider’s Lair","Complete Stage 4-2 under the par time 5m00s on Normal+", 5, Speedwalk(4, 2, TimeSpan(5,0)))
achievement("Underground Escape","Complete Stage 4-3 under the par time 5m00s on Normal+", 5, Speedwalk(4, 3, TimeSpan(5,0)))
achievement("Sprint Through Hostile Territory","Complete Stage 5-1 under the par time 6m00s on Normal+", 5, Speedwalk(5, 1, TimeSpan(6,0)))
achievement("Dance of Infiltration","Complete Stage 5-2 under the par time 6m00s on Normal+", 5, Speedwalk(5, 2, TimeSpan(6,0)))

// Shooting star achievements
achievement("[void] Moonwalker ","Transform into a robot", 0, RobotMode() && InGame(), id = 366)
achievement("Starstruck on Sunset Street","Collect the falling star in Stage 2-1", 3, ShootingStar(2,1))
achievement("Electric Avenue Transformation","Collect the falling star in Stage 2-2", 3, ShootingStar(2,2))
achievement("Robot Boogie in the City","Collect the falling star in Stage 2-3", 3, ShootingStar(2,3))
achievement("Moonwalk Among the Walking Dead","Collect the falling star in Stage 3-1", 3, ShootingStar(3,1))
achievement("Electro-Dance Battle in the Zombie Abyss","Collect the falling star in Stage 3-2", 3, ShootingStar(3,2))
achievement("Cybernetic Savior vs. the Undead","Collect the falling star in Stage 3-3", 3,  ShootingStar(3,3))
achievement("Starry Secrets Among the Stalactites","Collect the falling star in Stage 4-1", 4, ShootingStar(4,1))
achievement("Dance of the Arachnid Annihilation","Collect the falling star in Stage 4-2", 4, ShootingStar(4,2))
achievement("Bionic Battle with the Spider Swarm","Collect the falling star in Stage 4-3", 4, ShootingStar(4,3))
achievement("Starlit Dancefloor","Collect the falling star in Stage 5-1", 5, ShootingStar(5,1))
achievement("Battlefield of the Dancing Machine","Collect the falling star in Stage 5-2", 5, ShootingStar(5,2))

// Score Achievements
achievement("Hit Artist","Score over 10,000 Points", 5, ObtainScore(10000), id = 367)
achievement("Platinum Artist","Score over 100,000 Points", 10, ObtainScore(100000), id = 369)
achievement("International Superstar","Score over 400,000 Points", 10,  ObtainScore(400000))
achievement("Legend","Score over 800,000 Points", 25,  ObtainScore(800000), id = 1091)
achievement("[void] Immortal","Score over 1,000,000 Points", 0, ObtainScore(1000000), id = 2677)

// Progress Achievements
achievement("Smooth Criminal","Clear Stage 1-3", 10, EndStage(1,3), id = 364)
achievement("Beat it","Clear Stage 2-3", 10, EndStage(2,3), id = 365)
achievement("Thriller","Clear Stage 3-3", 10, EndStage(3,3), id = 368)
achievement("Billie Jean","Clear Stage 4-3", 10, EndStage(4,3), id = 370)
achievement("Who's Bad?","Clear Stage 5-3", 25, EndStage(5,3), id = 371)
achievement("Mr. Big","Clear Stage 6-1", 10, EndStage(6,1))
achievement("King of Pop ","Clear Stage 6-1 Hard", 50, Difficulty() == 2 && EndStage(6,1) , id = 2676)
achievement("Moonwalker","Clear Stage 6-1 without using a continue on Normal+", 50, NoContinues(1))

// -- Leaderboards ----------------------------------------------------------------------

// Fastest to complete the game
leaderboard(
    "Speed Demon",
    "Fastest time to complete the game in real time",
    StartStage(1,1),
    Title() || GameOver(),
    EndStage(6,1),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Fastest to complete each stage
for stage in range(1,5)
{
    leaderboard(
        "Speed Walk Stage " + stage,
        "Fastest time to complete all three rounds in stage " + stage + " in real time",
        StartStage(stage,1),
        Title() || GameOver(),
        EndStage(stage,3),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

// Fastest to complete each round
for stage in range(1,5)
{
    for round in range(1,3)
    {
        leaderboard(
            "Speed Walk Round " + stage + "-" + round,
            "Fastest time to complete " + stage + "-" + round + " in game time",
            StartStage(stage,round),
            Title() || GameOver(),
            EndStage(stage,round),
            Time(),
            lower_is_better = true,
            format = "FRAMES"
        )
    }
}

// Fastest to complete the last round
leaderboard(
    "Speed Walk Round 6-1",
    "Fastest time to complete 6-1 real time",
    StartStage(6,1),
    Title() || GameOver(),
    EndStage(6,1),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)


// Highest Score
leaderboard(
    "Superstar",
    "Highest score",
    InGame() && prev(Score()) == 0 && Score() > 0,
    always_false(),
    Title() || GameOver() || EndStage(6,1),
    Score(),
    lower_is_better = false,
    format = "VALUE"
)

// Most childern saved in one life
leaderboard(
    "Save the Childern",
    "Most childern saved in one life",
    InGame() && prev(ChildrenLeft()) > ChildrenLeft(),
    always_false(),
    prev(Lives()) > Lives() || Title() || GameOver() || EndStage(6,1),
    prev(ChildrenLeft()) > ChildrenLeft(),
    lower_is_better = false,
    format = "VALUE"
)

// -- Rich Presence -------------------------------------------------------------------------
Stages = {
    0: "in Club 30 1-1",
    1: "in Club 30 1-2",
    2: "in Club 30 1-3",
    3: "on the Streets 2-1",
    4: "on the Streets 2-2",
    5: "on the Streets 2-3",
    6: "in the Woods 3-1",
    7: "in the Woods 3-2",
    8: "in the Woods 3-3",
    9: "in the Cavern 4-1",
    10: "in the Cavern 4-2",
    11: "in the Cavern 4-3",
    12: "in the Enemy Hideout 5-1",
    13: "in the Enemy Hideout 5-2",
    14: "in the Enemy Hideout 5-3",
    15: "in Space 6-1",
    17: "in the Green Caves",
    18: "in the Green Caves"
}

Life = {
    1: "life"
}

rich_presence_conditional_display(Demo() == 0xff, "Michael is watching the demo!")
rich_presence_conditional_display(Title() || MainMenu(), "Michael is at the title screen!")
rich_presence_display("Michael is {0} for {1} with a score of {2} and {3} {4}",
    rich_presence_lookup("Stages", Round(), Stages, " in Limbo"),
    rich_presence_value("Time", Time(), format = "FRAMES"),
    rich_presence_value("Score", Score()),
    rich_presence_value("Lives", Lives()),
    rich_presence_lookup("Life", Lives(), Life, "lives")    
)
