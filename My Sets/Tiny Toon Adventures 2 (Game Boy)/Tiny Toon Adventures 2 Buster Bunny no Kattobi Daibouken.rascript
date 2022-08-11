// Tiny Toon Adventures 2: Buster Bunny no Kattobi Daibouken
// #ID = 20097

// $C0A1: [bit 6] Game Started (0 = Title, 1 = Playing)
function GameStarted() => bit6(0xC0A1)

// $C0C5: [8-bit] Continue screen when = 0x30
function Continue() => byte(0xC0C5)

// $C100: [8-bit] Boss Type (appears at beginning of boss fight):
//        0x25 = Cowboy Max
//        0x27 = Kabuki Max
//        0x2a = Cyber Max
//        0x2d = Franken Max
//        0x30 = Director Max
function BossType() => byte(0x00C100)

BossTypeLookup = {
    0: 0x25,
    1: 0x27,
    2: 0x2a,
    3: 0x2d,
    4: 0x30
}

// $C103: [8-bit] Boss State
//        0 = None
//        1 = Boss Pattern 1
//        2 = Boss Pattern 2
//        3 = Boss Pattern 3
function BossState() => byte(0x00C103)

// $C106: [8-bit] Max's HP
function BossHP() => byte(0x00C106)

// $DD50: [8-bit] Player Active (0 = Demo, 1 = Player in control)
function Active() => bit0(0x00DD50)

// $DD54: Health
function BusterHP() => byte(0x00DD54)

// $DD55: Carrots
function CarrotsX0() => high4(0x00DD55)
function Carrots0X() => low4(0x00DD55)
function Carrots() {
    return CarrotsX0() * 10 +
        Carrots0X()
}

CarrotGoals = {
    0: 50,
    1: 47,
    2: 70,
    3: 25,
    4: 23
}

// $DD59: [bit 0] Difficulty (0 = Easy, 1 = Hard)
function Difficulty() => bit0(0x00DD59)
function Hard() => Difficulty() == 1

// $DD60: Seconds BCD
function SecondsX00() => byte(0x00DD60)
function Seconds0X0() => high4(0x00DD61)
function Seconds00X() => low4(0x00DD61)
function Seconds() {
    return SecondsX00() * 100 + 
        Seconds0X0() * 10 +
        Seconds00X()
}

StageTimes = {
    0: 350,
    1: 320,
    2: 250,
    3: 300,
    4: 375
}

// $DD62: Lives
function Lives() => byte(0x00DD62)

// $DD64: [8-bit] Score BCD
function ScoreX000000() => high4(0x00DD64)
function Score0X00000() => low4(0x00DD64)
function Score00X0000() => high4(0x00DD65)
function Score000X000() => low4(0x00DD65)
function Score0000X00() => high4(0x00DD66)
function Score00000X0() => low4(0x00DD66)
function Score() {
    return ScoreX000000() * 1000000 + 
        Score0X00000() * 100000 + 
        Score00X0000() * 10000 + 
        Score000X000() * 1000 + 
        Score0000X00() * 100 + 
        Score00000X0() * 10
}

// $DDC2: Stage
//        0 = Western
//        1 = Samurai
//        2 = Future
//        3 = Monster
//        4 = Final Movie
function Stage() => byte(0x00DDC2)
WesternMovie = 0
SamuraiMovie = 1
FutureMovie = 2
MonsterMovie =  3
Studio = 4
StageLookup = {
    0: "western movie",
    1: "samurai saga",
    2: "future flick",
    3: "monster movie",
    4: "behind the scenes featurette",
}

// $DDC3: [8-bit] Substage
//        0x6 = Boss 1
//        0x7 = Boss 2
//        0x6= Boss 3
//        0xa = Boss 4
//        0x4 = Final Boss
function Substage() => byte(0x00DDC3)

BossStageLookup = {
    0: 0x6,
    1: 0x7,
    2: 0x6,
    3: 0xa,
    4: 0x4
}

// $DEC0: [8-bit] Bonus Game
//        0x0 = Basketball
//        0x1 = Tug of War
//        0x2 = Soccer
function BonusGame() => byte(0x00DEC0)
BonusLookup = {
    0: "basketball",
    1: "tug of war",
    2: "soccer"
}

// $DEC1: [8-bit] Bonus State:
//        0x1 = Intro
//        0x2 = Ready
//        0x3 = Playing
//        0x4 = Input Paused
//        0x6 = Bonus Ended
function BonusState() => byte(0x00DEC1)

// $DEC2: [8-bit] Tug of War when bonus state (0xdec1) = 4
//        2 = Arnold Won
//        5 = Buster Won
function TugOfWarWinner() => byte(0x00DEC2)

// $DEC3: [8-bit] Basketball Score
function BasketballScore() => byte(0x00DEC3)

// $DEE0: [16-bit] Results Carrots Score BCD
function ResultsCarrotsX000() => high4(0xdee0)
function ResultsCarrots0X00() => low4(0xdee0)
function ResultsCarrots00X0() => high4(0xdee1)
function ResultsCarrots000X() => low4(0xdee1)
function ResultsCarrots()
{
    return ResultsCarrotsX000() * 1000 + 
        ResultsCarrotsX000() * 100 + 
        ResultsCarrots00X0() * 10 +
        ResultsCarrots000X() 
}

// $DEE2: [16-bit] Results Time Score BCD
function ResultsTimeX000() => high4(0xdee2)
function ResultsTime0X00() => low4(0xdee2)
function ResultsTime00X0() => high4(0xdee3)
function ResultsTime000X() => low4(0xdee3)
function ResultsTime()
{
    return ResultsTimeX000() * 1000 + 
        ResultsTime0X00() * 100 + 
        ResultsTime00X0() * 10 +
        ResultsTime000X() 
}

// $DEE2: [16-bit] Results Life Score BCD
function ResultsLifeX000() => high4(0xdee4)
function ResultsLife0X00() => low4(0xdee4)
function ResultsLife00X0() => high4(0xdee5)
function ResultsLife000X() => low4(0xdee5)
function ResultsLife()
{
    return ResultsLifeX000() * 1000 + 
        ResultsLife0X00() * 100 + 
        ResultsLife00X0() * 10 +
        ResultsLife000X() 
}

// $DEC4: [8-bit] Bonus Timer
function BonusTimer() => byte(0x00DEC4)

// $DEE6: [8-bit] Soccer Bonus Score
function SoccerScoreX0() => high4(0x00DEE6)
function SoccerScore0X() => low4(0x00DEE6)
function SoccerScore() => SoccerScoreX0() * 10 + SoccerScore0X() 

// Event when buster starts a stage
function StageStart(stage)
{
    return GameStarted() == 0x1 && 
        Stage() == stage && 
        Substage() == 0 && 
        prev(Active()) < Active()
}

// Event when buster starts a boss fight
function BossStart(stage)
{
    return GameStarted() == 0x1 && 
        Active() == 1 && 
        Stage() == stage && 
        Substage() == BossStageLookup[stage] &&     
        prev(BossType()) != BossTypeLookup[stage] &&
        BossType() == BossTypeLookup[stage] 
}

// Event when buster wins a boss fight (hard mode if true passed)
function StageBeat(stage, hard = false)
{
    start = GameStarted() == 0x1 && Active() == 1
    if (hard == true) start = start && Hard()
    
    return start &&         
        Stage() == stage && 
        Substage() == BossStageLookup[stage] && 
        BossType() == BossTypeLookup[stage] && 
        BossState() != 0 &&
        prev(BossHP()) == 1 && 
        BossHP() == 0
}

// Event when buster is at the end of the results screen
function EndResults(stage = 4)
{
    return Stage() == stage &&
        Substage() == BossStageLookup[stage] && 
        BonusGame() == 0x3 &&
        ResultsCarrots() == 0 &&
        ResultsTime() == 0 &&
        prev(ResultsLife()) == 10 &&
        ResultsLife() == 0
}

// Global events for game start, game over, and game won
function GameStart() => StageStart(WesternMovie)
function GameOver() => prev(GameStarted()) > GameStarted()
function GameWon() => StageBeat(Studio)
function ContinueScreen() => BusterHP() == 0 && Lives() == 0 && prev(Continue()) != 0x30 && Continue() == 0x30

// Damageless challenge
// Starts at boss fight
// Cancels if player loses health, a life, a continue, or at a game over
// Submits when the boss has been beat
function Damageless(stage, hard = false)
{
    start = BossStart(stage)
    if (hard == true) start = start && Hard()
    
    return once(start) &&
        never(GameStarted() == 0) &&
        never(prev(BusterHP()) > BusterHP()) &&
        never(prev(Lives()) > Lives()) &&
        never(ContinueScreen()) &&
        trigger_when(StageBeat(stage))        
}

// Trigger when the carrots goes over the stage goal
function CarrotCollector(stage)
{
    return unless(GameStarted() == 0) &&
        unless(Stage() != stage) &&
        prev(Carrots()) >= CarrotGoals[stage] - 10 &&
        prev(Carrots()) < CarrotGoals[stage] &&        
        measured(Carrots() >= CarrotGoals[stage])
}

// Triggers during the basketball bonus when the player scores 3 points
function BasketBallBonus(score)
{
    return GameStarted() == 0x1 && 
        BonusGame() == 0 && 
        BonusState() >= 3 && 
        BonusState() <= 4 && 
        prev(BasketballScore()) == score - 1 &&
        BasketballScore() == score
}

// Triggers during the tug of war bonus when the player pulls in Arnold the pitbull
function TugOfWarBonus()
{
    return GameStarted() == 0x1 && 
        BonusGame() == 1 && 
        BonusState() == 4 &&
        TugOfWarWinner() == 5
}

// Triggers during the soccer bonus when the player scores score points
function SoccerBonus(score)
{
    return GameStarted() == 0x1 && 
        BonusGame() == 2 && 
        BonusState() >= 3 && 
        BonusState() <= 4 && 
        prev(SoccerScore()) == score - 1 &&
        SoccerScore() == score
}

// Triggers when the play has # hearts
function BusterHearts(hearts)
{
    return GameStarted() == 0x1 && 
        Active() == 0x1 &&
        BusterHP() == hearts
}

// Speedrun challenge
// Starts at beginning of stage
// Cancels if time is less than the goal or at a game over
// Submits when the boss has been beat
function Speedrun(stage)
{
    return once(StageStart(stage)) &&
        never(GameStarted() == 0) &&
        never(ContinueScreen()) &&        
        never(Seconds() < StageTimes[stage]) &&
        trigger_when(StageBeat(stage))       
}

// Deathless challenge
// Starts at beginning of stage-substart
// Cancels if life lost, continue used, or at a game over
// Submits at end of stage-subend
function Deathless(stage, substart, subend)
{
    start = GameStarted() == 0x1 && 
        Stage() == stage && 
        prev(Substage()) == substart - 2 && 
        Substage() == substart - 1
    
    cancel = never(GameStarted() == 0) &&
        never(prev(Lives()) > Lives()) &&
        never(ContinueScreen())
        
    submit = prev(Substage()) == subend - 1 && 
        Substage() == subend
        
    return once(start) && cancel && trigger_when(submit)
}

// 1CC challenge  (hard mode if true passed)
// Starts at beginning of game
// Cancels if a continue is used or at a game over
// Submits when the final boss has been beat
function NoContinues(hard = false)
{
    start = GameStart()
    if (hard == true) start = start && Hard()
    
    return once(start) &&
        never(GameStarted() == 0) &&
        never(ContinueScreen()) &&
        trigger_when(GameWon())     
}

// Normal Progression
achievement("Hop-along Little Buster","Beat the western movie", 5, StageBeat(WesternMovie))
achievement("The Twilight Samurai","Beat the samurai movie", 5, StageBeat(SamuraiMovie))
achievement("Buster O'Hare","Beat the future movie", 5, StageBeat(FutureMovie))
achievement("Stuff That Goes Bump in the Night","Beat the monster movie", 5, StageBeat(MonsterMovie))
achievement("Behind the Scenes","Beat the studio", 5, StageBeat(Studio))

// Hard Progression
achievement("How Buster Bunny Won the West","Beat the western movie on hard", 10, StageBeat(WesternMovie) && Hard())
achievement("The Last Samurai","Beat the samurai movie on hard", 10, StageBeat(SamuraiMovie) && Hard())
achievement("Back to the Future","Beat the future movie on hard", 10, StageBeat(FutureMovie) && Hard())
achievement("Night of the Lepus","Beat the monster movie on hard", 10, StageBeat(MonsterMovie) && Hard())
achievement("All the Worlds are a Stage","Beat the studio on hard", 10, StageBeat(Studio) && Hard())

// Hard Damageless Bosses
achievement("Mega Cowboy Max","Beat Cowboy Max without taking damage on hard", 5, Damageless(WesternMovie, true))
achievement("Hyper Kabuki Max","Beat Kabuki Max without taking damage on hard", 5, Damageless(SamuraiMovie, true))
achievement("Giga Cyber Max","Beat Cyber Max without taking damage on hard", 10, Damageless(FutureMovie, true))
achievement("Omega Franken Max","Beat Franken Max without taking damage on hard", 25, Damageless(MonsterMovie, true))
achievement("Ultimate Director Max","Beat Director Max without taking damage on hard", 10, Damageless(Studio, true))

// Carrot Collection per Stage
achievement("Western Collector","Collect " + CarrotGoals[WesternMovie] + " or more carrots in the western movie", 5, CarrotCollector(WesternMovie))
achievement("Samurai Collector","Collect " + CarrotGoals[SamuraiMovie] + " or more carrots in the samurai movie", 5, CarrotCollector(SamuraiMovie))
achievement("Future Collector","Collect " + CarrotGoals[FutureMovie] + " or more carrots in the future movie", 10, CarrotCollector(FutureMovie))
achievement("Monster Collector","Collect " + CarrotGoals[MonsterMovie] + " or more carrots in the monster movie", 10, CarrotCollector(MonsterMovie))
achievement("Studio Collector","Collect " + CarrotGoals[Studio] + " or more carrots in the studio", 5, CarrotCollector(Studio))

// Bonus Games
achievement("Buster Baller","Win the basketball bonus game", 5, BasketBallBonus(3))
achievement("Flea Bath for Arnold","Win the tug of war bonus game", 5, TugOfWarBonus())
achievement("Bend it like Buster","Win the soccer bonus game", 10, SoccerBonus(15))

// Speed runs
achievement("Buster the Hedgehog","Beat the western movie with " + StageTimes[WesternMovie] + "s or more left in the clock", 5, Speedrun(WesternMovie))
achievement("Buster the Dragon","Beat the samurai movie with " + StageTimes[SamuraiMovie] + "s or more left in the clock", 5, Speedrun(SamuraiMovie))
achievement("Buster the Rocket","Beat the future movie with " + StageTimes[FutureMovie] + "s or more left in the clock", 10, Speedrun(FutureMovie))
achievement("Buster the Were-Rabbit","Beat the monster movie with " + StageTimes[MonsterMovie] + "s or more left in the clock", 10, Speedrun(MonsterMovie))
achievement("Buster the Fast and the Furriest","Beat the studio movie with " + StageTimes[Studio] + "s or more left in the clock", 5, Speedrun(Studio))

// Deathless Sections
achievement("Buster Rogers of the 24½th Century","Beat the rocket auto-scroller without dying (future movie 3-3 to 3-4)", 10, Deathless(FutureMovie, 3, 4))
achievement("Buster the Rising Star","Beat the rising water auto-scroller without dying (monster movie 4-5 to 4-8)", 10, Deathless(MonsterMovie, 5, 8))

// Misc. Challenges
achievement("Buster the Strong","Have 4 hearts at once", 5, BusterHearts(4))
achievement("Buster the Untouchable","Beat the game without using a continue", 25, NoContinues())

// Rich Presence
rich_presence_conditional_display(GameStarted() == 0, "Buster is in the menu")

rich_presence_conditional_display(BonusState() >= 1 && BonusState() <= 6, 
    "Buster is trying his luck at the {0} bonus game",
    rich_presence_lookup("Bonus", BonusGame(), BonusLookup)
)
    
rich_presence_display("Buster is filming a {0} | 🐰 {1} | 🥕 {2} | ⏲ {3} | 💯 {4}",	
    rich_presence_lookup("Stage", Stage(), StageLookup),
    rich_presence_value("Lives", Lives(), "Value"),	
    rich_presence_value("Carrots", Carrots(), "Value"),
    rich_presence_value("Times", Seconds(), "Value"),
    rich_presence_value("Score", Score(), "Value")
)

// Leaderboards
leaderboard("Speedrun","Fastest time to complete the game",GameStart(),GameOver(),GameWon(),always_true(),format="MILLISECS",lower_is_better=true)
leaderboard("Western Speedrun","Fastest time to complete the western movie",StageStart(WesternMovie),GameOver()||ContinueScreen(),StageBeat(WesternMovie),always_true(),format="MILLISECS",lower_is_better=true)    
leaderboard("Samurai Speedrun","Fastest time to complete the samurai movie",StageStart(SamuraiMovie),GameOver()||ContinueScreen(),StageBeat(SamuraiMovie),always_true(),format="MILLISECS",lower_is_better=true)    
leaderboard("Future Speedrun","Fastest time to complete the future movie",StageStart(FutureMovie),GameOver()||ContinueScreen(),StageBeat(FutureMovie),always_true(),format="MILLISECS",lower_is_better=true)    
leaderboard("Monster Speedrun","Fastest time to complete the movie movie",StageStart(MonsterMovie),GameOver()||ContinueScreen(),StageBeat(MonsterMovie),always_true(),format="MILLISECS",lower_is_better=true)    
leaderboard("Studio Speedrun","Fastest time to complete the studio",StageStart(Studio),GameOver()||ContinueScreen(),StageBeat(Studio),always_true(),format="MILLISECS",lower_is_better=true)
leaderboard("Top Score","Highest score",GameStart(),always_false(),EndResults()||GameOver()||ContinueScreen(),Score(),format="VALUE",lower_is_better=false)