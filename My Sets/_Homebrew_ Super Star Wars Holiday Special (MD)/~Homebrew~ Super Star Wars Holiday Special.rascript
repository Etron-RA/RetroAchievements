// ~Homebrew~ Super Star Wars Holiday Special
// #ID = 32906

// -- Pointer Functions ------------------------------------------------

function Pointer(base, offsets)
{
    // Start the chain
    max = length(offsets)
    count = 0
    chain = word(base)    
    
    for offset in offsets
    {
        // if not end of chain then follow the chain
        if count < max - 1
            chain = word(chain + offset)
        else
            chain = chain + offset
        
        count = count + 1
    }
    return chain
}

// Pauses achievement if any part of the chain is null
function PointerPauseIfNull(base, offsets)
{
    offsetSteps = []
    pauseArray = [base]
    for offset in offsets
    {
        array_push(offsetSteps, offset)
        array_push(pauseArray, Pointer(base, offsetSteps))
    }
    return all_of(pauseArray, p => unless(word(p) == 0))
}

// $AFF2: [16-bit] Luke Pointer
//        +0x0A: [16-bit pointer] Nested pointer
//        ++0x08: [16-bit] X-Axis Velocity (Signed)
//        ++0x0C: [16-bit] Y-Axis Velocity (Signed)
//        ++0x4A: [16-bit] Luke State
//        Left side / Right side = State
//        0x1c30 / 0x1c40 = Idle
//        0x1c90 / 0x1ca0 = Running
//        0x1a90 / 0x1aa0 = Ducking
//        0x1a70 / 0x1a80 = Reflect
//        0x1c70 / 0x1c80 = High Attack
//        0x1a50 / 0x1a60 = Med Attack
//        0x1ab0 / 0x1ac0 = Low Attack
//        0x1bf0 / 0x1c00 = High Jump
//        0x1c10 / 0x1c20 = Slide
function LukePointer() => word(0xAFF2)
function LukeState() => word(Pointer(0xAFF2, [0x0A, 0x4A]))

// $CBBA: [16-bit] Theme Music Cooldown
function ThemeMusicCooldown() => word(0xCBBA)

// $CBBC: [16-Bit] Camera X-Axis
function CameraXaxis() => word(0xCBBC)

// $CBBE: [16-Bit] Camera Y-Axis
function CameraYaxis() => word(0xCBBE)

// $CBD8: [16-Bit] Music Playing
//        0x2 = Dogfight Fanfair
//        0x3 = Dogfight Theme
//        0x4 = Stage Fanfair
//        0x5 = Mission Fanfair
//        0x6 = Game Over Theme
//        0x7 = Mission Completed
//        0x8 = Star Wars Theme
//        0x9 = Han Solo Theme
//        0xa = R2D2 Theme
//        0xb = Space Port Theme
//        0xc = Cave Theme
//        0xd = Throneroom Theme
function MusicPlaying() => word(0xCBD8)
// $CC3A: [8-bit] Buttons
//        bit0 = B
//        bit1 = C
//        bit2 = A
//        bit3 = Start
//        bit4 = Z
//        bit5 = Y
//        bit6 = X
//        bit7 = Select
function ButtonA() => bit2(0xCC3A)
function ButtonB() => bit0(0xCC3A)
function ButtonC() => bit1(0xCC3A)

// $CE33: [8-bit] Starting Lives
function StartingLives() => byte(0xCE33)

// $D552: [16-Bit] Music
//        0x0 = Throneroom Theme
//        0x1 = Star Wars Theme
//        0x2 = Mission Farefair
//        0x3 = Dogfight Fanfair
//        0x4 = Dogfight Theme
//        0x5 = Game Over Theme
//        0x6 = Mission Completed
//        0x7 = Cave Theme
//        0x8 = R2D2 Theme
//        0x9 = Space Port Theme
//        0xa = Han Solo Theme
//        0xb = Stage Fanfair
function Music() => word(0xD552)

// $D55A: [16-bit] Upper score partial (multiple by 0xffff)
function UpperScorePartial() => word(0xD55A)

// $D55C: [16-bit] Lower score partial
function LowerScorePartial() => word(0xD55C)

// $D55E: [16-bit] Health (0 = Dead, 7 = Max)
function Health() => word(0xD55E)

// $D560: [16-bit] stage
//        0x0 = Title
//        0x1 = Intro cutscenes
//        0x2 = Forest
//        0x3 = Prison
//        0x4 = X-Wing
//        0x5 = Treetops
//        0x6 = Boba Fett Battle
//        0x7 = Credits
function Stage() => word(0xD560)

// $D562: [16-bit] Current Lives (0xffff = Game Over)
function CurrentLives() => word(0xD562)

// $D56A: [16-bit] Red key (1 = Aquired, 0 = None)
function RedKey() => word(0xD56A)

// $D56C: [16-bit] Brown key (1 = Aquired, 0 = None)
function BrownKey() => word(0xD56C)

// $D570: [16-bit] Tokens
function Tokens() => word(0xD570)

// $DBE2: [16-Bit] Logo Displayed (0x2a22 = yes, 0x2360 = no)
function Logo() => word(0xDBE2)

// $FF36: [16-bit] Intro Fanfair (0xffff = Intro Fanfair, 0x0000 = Outro Fanfair)
function IntroFanfair() => word(0xFF36)

// $FFF3: [8-bit] Pause (0x00 = playing, 0xcc = pause)
function Pause() => byte(0xFFF3)

///////// Helpers ////////////////////////////////////////////////////////////////////////////////

// Logo shown or not during fanfair
function NoLogo() => Logo() == 0x2a22 
function ShowLogo() => Logo() == 0x2360

// Luke Death
function Death() => prev(CurrentLives()) > CurrentLives()

// Luke Damage or heal
function Damage() => prev(Health()) > Health()
function Heal() => prev(Health()) < Health()

// Game Over
function GameOver() => CurrentLives() == 0xffff

// Combined 32-bit word swapped score
function Score() => UpperScorePartial() * 0x10000 + LowerScorePartial()

// Uses the stage to test if the play is in game
function TitleScreen() => Stage() == 1 
function InGame() => Stage() >= 2 && Stage() <= 6

// Time span from minutes, seconds, and frames
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

///////// Achievement Events //////////////////////////////////////////////////////////////////////

// Event when the player gains control at the start of a stage
function StartStage(stage)
{
    return ShowLogo() &&
           Stage() == stage + 1 && 
           MusicPlaying()  == 0x4 &&
           prev(ThemeMusicCooldown()) == 2 &&
           ThemeMusicCooldown() == 1   
}

// Event when the player reachs he goal at the end of a stage
function EndStage(stage)
{
    return NoLogo() &&
           MusicPlaying()  == 0x4 &&
           Stage() == stage + 1 && 
           prev(ThemeMusicCooldown()) == 0 &&
           ThemeMusicCooldown() != 0
}

// Speedrun a stage
function SpeedRun(stage, time)
{
    // Starts when player starts a stage
    start = StartStage(stage)
    
    // Cancles when play dies or the time goal expires
    cancle = Death() ||
        GameOver() ||
        ( 
            once(start) &&
            repeated(time, Stage() == stage + 1)
        )
    
    // Submits when the player completes a stage
    submit = EndStage(stage)
    
    return once(start) && never(cancle) && trigger_when(submit)
}

// Complete stage without healing
function NoHealing(stage)
{
    // Starts when player starts a stage
    start = StartStage(stage)
    
    // Cancles when play dies or the time goal expires
    cancle = Death() ||
        GameOver() ||
        Heal()
             
    // Submits when the player completes a stage
    submit = EndStage(stage)
    
    return once(start) && never(cancle) && trigger_when(submit)
}

// Event when player earns a life by picking up a token
function LifePickUp()
{
    return [
            // ALT 1: Lives went up, and Tokens DID NOT roll over. 
            prev(CurrentLives()) < CurrentLives() && prev(Tokens()) <= Tokens()
        ,
            // ALT 2: Lives went up, Tokens DID roll over, BUT they went up by 2 or more
             prev(CurrentLives()) + 1 < CurrentLives() && prev(Tokens()) > Tokens()
        ]
}

// Collect a goal number of lives in a certain stage
function CollectLives(stage, lives)
{
    // Measure how many lives have been collected
    measure = tally(lives, LifePickUp())
    
    // Only count during the ertain stage
    enabled = Stage() == stage + 1
    
    // Reset on death or game over
    cancle = Death() || GameOver() || Stage() != stage + 1
        
    return never(cancle) && measured(measure, enabled, format="raw")
}

// Event when player picks up a Token
function TokenPickUp()
{
    return [
            prev(Tokens()) < Tokens(),             
            prev(Tokens()) + 1 < Tokens(),
            prev(Tokens()) == 99 && Tokens() == 0, 
            prev(Tokens()) == 99 && Tokens() == 1, 
            prev(Tokens()) == 98 && Tokens() == 0
        ]
}

// Collect a goal number of Tokens in a certain stage
function CollectTokens(stage,Tokens)
{
    // Measure how many Tokens have been collected
    measure = tally(Tokens, TokenPickUp())
   
    // Only count during the ertain stage
    enabled = Stage() == stage + 1
    
    // Reset on death or game over
    cancle = Death() || GameOver() || Stage() != stage + 1
        
    return never(cancle) && measured(measure, enabled, format="raw")
}

// Complete stage without pressing the attack button
function CompleteNoButton(stage, button)
{
    // Starts when player starts a stage
    start = StartStage(stage)
    
    // Cancle on death, game over, or player presses attack
    cancle = Death() ||
        GameOver() ||
        button
        
    // Submits when the player completes a stage
    submit = EndStage(stage)
    
    return once(start) && never(cancle) && trigger_when(submit)
}

// Complete game with stock piling more than the lives limit
function BeatWithLivesLimit(limit)
{
    // Start on the 1st stage if starting lives are 0
    start = StartStage(1) 
    
    // Cancle on game over or picking up a 1up
    cancle = GameOver() || CurrentLives() > limit
        
    // Submit after completing the final stage
    submit = EndStage(5)
    
    return once(start) && never(cancle) && trigger_when(submit)
}

// Count how many times the score changes
function ScoreCounter(stage, changes)
{
    // Measure how many score change have occured
    measure = tally(changes,
        prev(Score()) == Score() - 250
    )
    
    // Enabled only for a certain level
    enabled = Stage() == stage + 1
    
    // Reset on death or game over
    cancle = Death() || GameOver()
        
    return never(cancle) && measured(measure, enabled, format="raw")
}

// Event when player gains a life from collecting 100 Tokens
function TokenLife()
{
    return InGame() && 
        prev(CurrentLives()) < CurrentLives() &&
        prev(Tokens()) >= 95 &&
        Tokens() <= 5
}

// Checks if the camera is within the range (x1,y1) to (x2,y2)
function InArea(x1, y1, x2, y2)
{
    return CameraXaxis() >= x1 &&
        CameraXaxis() <= x2 &&
        CameraYaxis() >= y1 &&
        CameraYaxis() <= y2    
}

// Complete the prison level without falling into a pit
function PrisonNoPits()
{
    // Start on the prison stage
    start = StartStage(2) 
    
    // Cancle on game over, death, or falling into a pit
    cancle = GameOver() || 
        Death() ||
        InArea(0x586, 0x488, 0x865, 0x4f8) || // 2nd level pit
        InArea(0x01c, 0x590, 0x08f, 0x5f0) || // 2nd level elevator
        InArea(0x300, 0x150, 0xa72, 0x180)    // 3rd level pit
        
    // Submit after completing the prison stage
    submit = EndStage(2)
    
    return once(start) && never(cancle) && trigger_when(submit)
}


///////// Achievements /////////////////////////////////////////////////////////////////////////////

achievement("Harvesting the Life Day Tree","Clear the Forest", 5, EndStage(1), type="progression")
achievement("The Force is My Shield","Clear the Forest without Healing", 3, NoHealing(1), type="")
achievement("Kashyyyk Rescue","Clear the Forest in under 1:30", 5, SpeedRun(1, TimeSpan(1,30,0)), type="")
achievement("A Life Day Miracle","Collect all of the 1ups in the Forest without dying", 2, CollectLives(1, 4), type="")
achievement("Mykit System 7","Collect all Rebel Alliance tokens in the Forest without dying for Lumpy's Life Day gift", 2, CollectTokens(1,58), type="")

achievement("Busting Out for the Holidays","Clear the Prison", 5, EndStage(2), type="progression")
achievement("Watch Your Step, Kid!","Clear the Prison without falling into any pits or lower levels.", 5, PrisonNoPits(), type="")
achievement("Consecutive Life Sentences!","Collect all of the 1ups in the Prison without dying", 3, CollectLives(2, 4), type="")
achievement("Mindroamer VR Headset","Collect all Rebel Alliance tokens in the Prison without dying for Itchy's Life Day gift", 2, CollectTokens(2,47), type="")

achievement("Flying Home for Life Day","Clear the X-Wing Dogfight", 10, EndStage(3), type="progression")

achievement("Star on Top of the Tree","Clear the Treetops", 10, EndStage(4), type="progression")
achievement("Treetop Acrobatics","Clear the Treetops without using A-button attacks or C-button deflects", 5, CompleteNoButton(4, ButtonA() == 1|| ButtonC() == 1), type="")
achievement("Hypersonic Oven","Collect all Rebel Alliance tokens in the Tree Tops without dying for Malla's Life Day gift", 3, CollectTokens(4,75), type="")

achievement("He’s No Good to Me Dead","Defeat Boba Fett", 25, EndStage(5), type="win_condition")
achievement("Trust Your Instincts","Defeat Boba Fett without using C-button deflects", 25, CompleteNoButton(5, ButtonC() == 1), type="")

achievement("Chewie’s Holiday Bonus","Collect 100 Rebel Alliance tokens", 5, TokenLife(), type="")
achievement("Cheap Budget Broadcast","Keep the Holiday Special under budget and beat the game without having more than 5 lives at once", 50, BeatWithLivesLimit(5), type="")

///////// Leaderboards /////////////////////////////////////////////////////////////////////////////

StageNames = {
    1: "Forest",
    2: "Prison",
    3: "X-Wing Dogfight",
    4: "Treetops",
    5: "Boba Fett Battle"
}

// Whole game speed run
leaderboard("Holiday Speedrun", "Quickest time to beat the game", StartStage(1), GameOver(), EndStage(5), always_true(), format="FRAMES", lower_is_better=true)

// Stage speed runs
for stage in range(1,5)
{
    leaderboard(StageNames[stage] + " Speedrun", "Quickest time to clear the " + StageNames[stage], StartStage(stage), GameOver() || Death(), EndStage(stage), always_true(), format="FRAMES", lower_is_better=true)
}

// Hi score
leaderboard("Highscore Specail ", "Highest score", StartStage(1), always_false(), GameOver() || EndStage(5), Score(), format="VALUE", lower_is_better=false)

///////// Rich Presence ////////////////////////////////////////////////////////////////////////////

StageFlavour = {
    2: "foraging in the Forest",
    3: "in the Imperial Prison",
    4: "piloting his X-Wing",
    5: "scaling the Treetops",
    6: "facing off against Boba Fett"
}

// Converts health value (0-7) into a visual status bar
HealthBar = {
    0: "☠️", // Dead
    1: "🖤", // Critical
    2: "💔", // Low (Broken heart)
    3: "❤️", // Warning (Red heart)
    4: "🧡", // Caution (Orange heart)
    5: "💛", // Fine (Yellow heart)
    6: "💙", // Good (Blue heart)
    7: "💚" // Full (Green heart)
}

// 1. Active Gameplay (Stages 1-5)
rich_presence_conditional_display(
    Stage() >= 2 && Stage() <= 6,
    "Luke is {0} • Health: {1} • Lives: {2} • Score: {3}",
    rich_presence_lookup("StageFlavour", Stage(), StageFlavour),
    rich_presence_lookup("HealthBar", Health(), HealthBar),
    rich_presence_value("Value", CurrentLives()),
    rich_presence_value("Value", Score())
)
// 2. Watching the Intro Cinematic
rich_presence_conditional_display(
    Stage() == 1, 
    "Luke is watching the Opening Crawl, learning of the Empire's plot to ruin Life Day."
)

// 3. Watching the Ending Credits
rich_presence_conditional_display(
    Stage() == 7,
    "Happy Life Day! Luke is celebrating with Chewbacca's family while the credits roll."
)

// Start of game, title, or sound test
rich_presence_display("Luke is watching Chef Gormaanda cooking videos and dreaming of Life Day.")
