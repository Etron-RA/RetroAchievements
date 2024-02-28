// Rez
// #ID = 3419

// $2003BC: [32-bit] Boss Pointer (not null when boss is spawned)
function BossPointer() => tbyte(0x2003BC)

// $201234: [8-bit] Direct Assault Color (0-5)
//          DirectAssaultColor = {0: "Normal", 1: "Ambient", 2: "Punk", 3: "Old School", 4: "Psychedelic", 5: "Trance"}
function DirectAssaultColor() => byte(0x201234)

// $201248: [8-bit] Immortal Cheat (0 = off, 1 = on)
function ImmortalCheat() => byte(0x201248)

// $201250: [8-bit] Overdrive Cheat (0 = off, 1 = on)
function OverdriveCheat() => byte(0x201250)

// $201270: [float] Boss Health
function BossHealth() => float(0x201270)

// $20C124: [ASCII] [ASCII] Current model loaded index 0
//          "areacho.bin" = Play area menu
//          "areasel.bin" = Score attack menu
//          "ear_ch.mdp" = Earth boss (start)
//          "eden_d5.pmm" = Form 5 of the final boss end movie
//          "eden_s1.pmm" = Form 1 of the final boss (start & end)
//          "eden_s2.pmm" = Form 2 of the final boss (start & end)
//          "eden_s3.pmm" = Form 3 of the final boss (start & end)
//          "eden_s4.pmm" = Form 4 of the final boss (start & end)
//          "eden_s5.pmm" = Form 5 of the final boss (pre battle)
//          "extra.bin" = The beyond extra menu
//          "gameover.bin" = Game over screen
//          "mar_ch.mdp" = Mars boss (start)
//          "result.nbp" = The results screen
//          "s_ear_c.stp" = Earth boss (end)
//          "s_ede_c.stp" = Form 5 of the final boss (start & end)
//          "s_mar_c.stp" = Mars boss (end)
//          "s_null_c.mpb" = Screen after game over or log out
//          "s_title2.stm" = The Main menu
//          "s_ura_c.stp" = Uranus boss (start & end)
//          "s_ven_c.stp" = Venus boss (start & end)
//          "ura_ch.mdp" = Uranus boss (pre battle)
//          "ven_ch.mdp" = Venus boss (pre battle)
//          "venus.nb" = Venus boss (pre battle)
function ModelLoaded(offset = 0) => 0x20C124 + offset

// $20d8d4: [8-bit] Game Type (0 = Travelling, 2 = How To Play, 3 = Play, 4 = Score, 5 = Beyond)
function GameType() => byte(0x20d8d4)

// $210AC4: [24-bit] Game Pointer (null in menu)
function GamePointer() => tbyte(0x210AC4)

// $210ADC: [8-bit] Current form (0-6)
function CurrentForm() => byte(0x210ADC)

// $210B2C: [8-bit] Overloads (0-4)
function Overloads() => byte(0x210B2C)

// $210B40: [32-bit] Current Score
function CurrentScore() => dword(0x210B40)

// $28DE38: [8-bit] Area (0-9)
//          Areas = {0:"Area 1", 1:"Area 2", 2:"Area 3", 3:"Area 4",  4:"Area 5", 
//            5:"Area 5 Bosses", 6: "How to Play", 7:"Boss Rush", 8:"Lost Area", 9:"Trace Mission"}
function Areas() => byte(0x28DE38)

// $3A3304: [ASCII] Mars Boss Type ("Mars[Mega]","Mars[Giga]", and "Mars[Tera]")
function MarsBossType(offset = 0) => 0x3A3304 + offset

// $3A7794: [ASCII] Uranus Boss Type ("Uranus[Mega]","Uranus[Giga]", and "Uranus[Tera]")
function UranusBossType(offset = 0) => 0x3A7794 + offset

// $3A91F8: [ASCII] Venus Boss Type ("Venus[Mega]","Venus[Giga]", and "Venus[Tera]")
function VenusBossType(offset = 0) => 0x3A91F8 + offset

// $3ADFF8: [ASCII] Earth Boss Type ("Earth[Mega]","Earth[Giga]", and "Earth[Tera]")
function EarthBossType(offset = 0) => 0x3ADFF8 + offset

// $960094: [32-bit] Game Mode (0xFFFFFFFF when in game, otherwise in menu)
function GameMode() => dword(0x960094)

//-------------------------------------------------------------------------
// Hex array string definitions

// "ear_ch.mdp" hex array string when Earth boss fight begins
EarthStart = [0x65,0x61,0x72,0x5F,0x63,0x68,0x2E,0x6D,0x64,0x70,0x0]

// "mar_ch.mdp" hex array string when Mars boss fight begins
MarsStart = [0x6D,0x61,0x72,0x5F,0x63,0x68,0x2E,0x6D,0x64,0x70,0x0]

// "ven_ch.mdp" hex array string when Venus boss fight begins
VenusStart = [0x76,0x65,0x6E,0x5F,0x63,0x68,0x2E,0x6D,0x64,0x70,0x0]

// "s_ura_c.stp" hex array string when Venus boss fight begins and ends
UranusBoss = [0x73,0x5F,0x75,0x72,0x61,0x5F,0x63,0x2E,0x73,0x74,0x70,0x0]

// "eden_s1.pmm" hex array string when 1st Eden boss fight begins and ends
Eden1Boss = [0x65,0x64,0x65,0x6E,0x5F,0x73,0x31,0x2E,0x70,0x6D,0x6D,0x0]

// "eden_s2.pmm" hex array string when 2nd Eden boss fight begins and ends
Eden2Boss = [0x65,0x64,0x65,0x6E,0x5F,0x73,0x32,0x2E,0x70,0x6D,0x6D,0x0]

// "eden_s3.pmm" hex array string when 3rd Eden boss fight begins and ends
Eden3Boss = [0x65,0x64,0x65,0x6E,0x5F,0x73,0x33,0x2E,0x70,0x6D,0x6D,0x0]

// "eden_s4.pmm" hex array string when 4th Eden boss fight begins and ends
Eden4Boss = [0x65,0x64,0x65,0x6E,0x5F,0x73,0x34,0x2E,0x70,0x6D,0x6D,0x0]

// "eden_s5.pmm" hex array string when final Eden boss fight begins
Eden5Start = [0x65,0x64,0x65,0x6E,0x5F,0x73,0x35,0x2E,0x70,0x6D,0x6D,0x0]

// "eden_d5.pmm" hex array string before the credits
GameWon = [0x65,0x64,0x65,0x6E,0x5F,0x64,0x35,0x2E,0x70,0x6D,0x6D,0x0]

// "extra.bin" hex array string when in the extras menu
ExtraMenu = [0x65,0x78,0x74,0x72,0x61,0x2E,0x62,0x69,0x6E,0x0]

// "result.nb" hex array string when in the result screen
Results = [0x72,0x65,0x73,0x75,0x6C,0x74,0x2E,0x6E,0x62]

// "s_null_c.mpb"" hex array string when logging out
LogOut = [0x73,0x5F,0x6E,0x75,0x6C,0x6C,0x5F,0x63,0x2E,0x6D,0x70,0x62,0x0]

// "Mars[Mega]" hex array string when fighting Mega Mars boss
MarsMega = [0x4D,0x61,0x72,0x73,0x5B,0x4D,0x65,0x67,0x61,0x5D]

// "Mars[Giga]" hex array string when fighting Giga Mars boss
MarsGiga = [0x4D,0x61,0x72,0x73,0x5B,0x47,0x69,0x67,0x61,0x5D]

// "Mars[Tera]" hex array string when fighting Tera Mars boss
MarsTera = [0x4D,0x61,0x72,0x73,0x5B,0x54,0x65,0x72,0x61,0x5D]

// "Uranus[Mega]" hex array string when fighting Mega Uranus boss
UranusMega = [0x55,0x72,0x61,0x6E,0x75,0x73,0x5B,0x4D,0x65,0x67,0x61,0x5D]

// "Uranus[Giga]" hex array string when fighting Giga Uranus boss
UranusGiga =[0x55,0x72,0x61,0x6E,0x75,0x73,0x5B,0x47,0x69,0x67,0x61,0x5D]

// "Uranus[Tera]" hex array string when fighting Tera Uranus boss
UranusTera = [0x55,0x72,0x61,0x6E,0x75,0x73,0x5B,0x54,0x65,0x72,0x61,0x5D]

// "Venus[Mega]" hex array string when fighting Mega Venus boss
VenusMega = [0x56,0x65,0x6E,0x75,0x73,0x5B,0x4D,0x65,0x67,0x61,0x5D]

// "Venus[Giga]" hex array string when fighting Giga Venus boss
VenusGiga = [0x56,0x65,0x6E,0x75,0x73,0x5B,0x47,0x69,0x67,0x61,0x5D]

// "Venus[Tera]" hex array string when fighting Tera Venus boss
VenusTera = [0x56,0x65,0x6E,0x75,0x73,0x5B,0x54,0x65,0x72,0x61,0x5D]

// "Earth[Mega]" hex array string when fighting Mega Earth boss
EarthMega = [0x45,0x61,0x72,0x74,0x68,0x5B,0x4D,0x65,0x67,0x61,0x5D]

// "Earth[Giga]" hex array string when fighting Giga Earth boss
EarthGiga = [0x45,0x61,0x72,0x74,0x68,0x5B,0x47,0x69,0x67,0x61,0x5D]

// "Earth[Tera]" hex array string when fighting Tera Earth boss
EarthTera = [0x45,0x61,0x72,0x74,0x68,0x5B,0x54,0x65,0x72,0x61,0x5D]

//-------------------------------------------------------------------------
// Helper Functions

// Check if the string hex values equal the hex values at the passed address
function StringCompare(address, string)
{
    strArray = []
    for hexValue in string
    {
        array_push(strArray, byte(address) == hexValue)
        address = address + 1
    }
    return all_of(strArray, a => a)
}

// Cheating functions
function NoCheats() => ImmortalCheat() == 0 && OverdriveCheat() == 0
function Cheating() => ImmortalCheat() == 1 || OverdriveCheat() == 1

// Game state functions
function GameActive() => NoCheats() && GamePointer() != 0
function GameInactive() => NoCheats() && GamePointer() == 0 
function GameStart() => NoCheats() && prev(GamePointer()) == 0 && GamePointer() != 0
function GameEnd() => prev(GameMode()) == 0xffffffff && GameMode() != 0xffffffff
function GameWon() => NoCheats() && StringCompare(ModelLoaded(), GameWon)
function TitleScreen() => StringCompare(ModelLoaded(), GameTitle)
function UpgradeActive() => NoCheats() && GameMode() == 0xffffffff

// Boss active functions
function BossActive() => NoCheats() && BossPointer() != 0
function BossInactive() => NoCheats() && BossPointer() == 0
function BossStart() => BossActive() && prev(BossHealth()) <= 0.0 && BossHealth() == 1.0 
function BossEnd() =>  BossActive() && prev(BossHealth()) > 0.0 && prev(BossHealth()) <= 1.0  && BossHealth() <= 0.0 

function BossLoaded(model) => BossStart() && StringCompare(ModelLoaded(), model)
function ShowingModel(model) => GameActive() && StringCompare(ModelLoaded(), model)

function ScoreRange(low, high)
{
    return GameActive() &&
        prev(CurrentScore()) >= low &&
        prev(CurrentScore()) < high &&
        CurrentScore() >= high
}

//-------------------------------------------------------------------------
// Menu item selections

// Areas
DirectAssault = 0
Area1 = 0
Area2 = 1
Area3 = 2
Area4 = 3
Area5 = 4
BossRush = 7
LostArea = 8
TransMission = 9

// Direct Assault colors
Normal = 0 
Ambient = 1
Punk = 2
OldSchool = 3
Psychedelic = 4
Trance = 5

// Menus
TravellingMenu = 0
HowToPlayMenu = 2
PlayMenu = 3
ScoreMenu = 4
BeyondMenu = 5

function PlayMode() => GameType() != TravellingMenu && GameType() != HowToPlayMenu

// Conditions when normal play menu selection is made
function MenuPlayArea(area)
{
    return GameStart() &&
        GameType() == PlayMenu &&
        Areas() == area
}

// Conditions when score attack menu selection is made
function MenuScoreArea(area)
{ 
    return GameStart() &&
        GameType() == ScoreMenu &&
        Areas() == area 
}
// Conditions when beyond menu selection is made
function BeyondMenu(area, color = 6)
{
    trigger = GameStart() && 
        GameType() == BeyondMenu &&
        Areas() == area 
    if color != 6
        trigger = trigger && DirectAssaultColor() == color
        
    return trigger
}

//---------------------------------------------------------------------------
// Challenge Shortcuts

// Basic challenge achievement the takes start, cancel, and submit arrays
function Challenge(start, cancel, submit)
{
    return any_of(start, s => once(s)) && 
        all_of(cancel, c => never(c)) && 
        all_of(submit, s => trigger_when(s))
}

// Damageless challenge that cancels if player loses a form
function Damageless(start) 
{
    return Challenge(
        [start], 
        [GameEnd(), prev(CurrentForm()) > CurrentForm()], 
        [BossEnd()])
}

// Direct assault challenge for all the colors modes
function DirectAssaultChallenge(color)
{
    return Challenge(
        [BeyondMenu(DirectAssault, color)], 
        [GameEnd()], 
        [GameWon()]
    )
}

// Transmission challenge for getting a certain score level
function ScoreChallenge(start, lowScore, highScore)
{
    return Challenge(
        [start], 
        [GameEnd()], 
        [ScoreRange(lowScore, highScore)]
     )        
}

// Challenges for the giga and tera bosses
function BossTypeChallenge(bossMemory, bossType)
{
    return Challenge(
        [GameActive() && StringCompare(bossMemory, bossType)],
        [GameEnd()],
        [BossEnd()])
}

// Challenge for completing a area without upgrading the form
function LowLevelChallenge(start, end, lowestForm)
{
    return Challenge(
        start, 
        [GameEnd(), CurrentForm() >= lowestForm], 
        [end]
    )
}

// Challenge to obtain the top score in an area 
function TopScoreChallenge(start, firstPlace, secondPlace)
{
    return Challenge(
        [start], 
        [GameEnd(), TitleScreen()], 
        [HighScore(firstPlace, secondPlace)]
    )    
}

//---------------------------------------------------------------------------
// Progression Achievements

achievement("Earth","Complete Area 1", 2, Challenge([MenuPlayArea(Area1)], [GameEnd()], [BossEnd()]))
achievement("Mars","Complete Area 2", 3, Challenge([MenuPlayArea(Area2)], [GameEnd()], [BossEnd()]))
achievement("Venus","Complete Area 3", 5, Challenge([MenuPlayArea(Area3)], [GameEnd()], [BossEnd()]))
achievement("Uranus","Complete Area 4", 5, Challenge([MenuPlayArea(Area4)], [GameEnd()], [BossEnd()]))
achievement("Eden","Complete Area 5", 10, Challenge([MenuPlayArea(Area5)], [GameEnd()], [GameWon()]))

achievement("Lost Area","Complete Lost Area", 10, Challenge([BeyondMenu(LostArea)], [GameEnd()], [ShowingModel(Results)]))
achievement("Trance Mission","Score more than 150,000 in Trance Mission", 5, ScoreChallenge(BeyondMenu(TransMission),50000, 150000))
achievement("Boss Rush","Complete Boss Rush", 25, Challenge([BeyondMenu(BossRush)], [GameEnd()], [GameWon()]))

achievement("Direct Assault Normal","Complete Direct Assault Normal", 25, DirectAssaultChallenge(Normal))
achievement("Direct Assault Ambient","Complete Direct Assault Ambient", 25, DirectAssaultChallenge(Ambient))
achievement("Direct Assault Punk","Complete Direct Assault Punk", 25, DirectAssaultChallenge(Punk))
achievement("Direct Assault Old-School","Complete Direct Assault Old-School", 25, DirectAssaultChallenge(OldSchool))
achievement("Direct Assault Psychedelic","Complete Direct Assault Psychedelic", 25, DirectAssaultChallenge(Psychedelic))
achievement("Direct Assault Trance","Complete Direct Assault Trance", 25, DirectAssaultChallenge(Trance))
//---------------------------------------------------------------------------
// Boss Challenges

// Giga bosses
achievement("Giga Earth","Defeat the Giga form Earth boss in Area 1", 5, BossTypeChallenge(EarthBossType(), EarthGiga))
achievement("Giga Mars","Defeat the Giga form Mars boss in Area 2", 5, BossTypeChallenge(MarsBossType(), MarsGiga))
achievement("Giga Venus","Defeat the Giga form Venus boss in Area 3", 5, BossTypeChallenge(VenusBossType(), VenusGiga))
achievement("Giga Uranus","Defeat the Giga form Uranus boss in Area 4", 5, BossTypeChallenge(UranusBossType(), UranusGiga))

// Tera Bosses
achievement("Tera Earth","Defeat the Tera form Earth boss in Area 1", 10, BossTypeChallenge(EarthBossType(), EarthTera))
achievement("Tera Mars","Defeat the Tera form Mars boss in Area 2", 10, BossTypeChallenge(MarsBossType(), MarsTera))
achievement("Tera Venus","Defeat the Tera form Venus boss in Area 3", 10, BossTypeChallenge(VenusBossType(), VenusTera))
achievement("Tera Uranus","Defeat the Tera form Uranus boss in Area 4", 10, BossTypeChallenge(UranusBossType(), UranusTera))

// Damageless Bosses
achievement("Earth Evolved","Defeat the Earth boss in Area 1 without devolving", 10, Damageless(BossLoaded(EarthStart)))
achievement("Mars Evolved","Defeat the Mars boss in Area 2 without devolving", 10, Damageless(BossLoaded(MarsStart)))
achievement("Venus Evolved","Defeat the Venus boss in Area 3 without devolving", 10, Damageless(ShowingModel(VenusStart)))
achievement("Uranus Evolved","Defeat the Uranus boss in Area 4 without devolving", 10, Damageless(BossLoaded(UranusBoss)))
achievement("Apex Earth Evolution","Defeat the Eden Earth boss in Area 5 without devolving", 10, Damageless(BossLoaded(Eden1Boss)))
achievement("Apex Mars Evolution","Defeat the Eden Mars boss in Area 5 without devolving", 10, Damageless(BossLoaded(Eden2Boss)))
achievement("Apex Venus Evolution","Defeat the Eden Venus boss in Area 5 without devolving", 10, Damageless(BossLoaded(Eden3Boss)))
achievement("Apex Uranus Evolution","Defeat the Eden Uranus boss in Area 5 without devolving", 10, Damageless(BossLoaded(Eden4Boss)))
achievement("Final Evolution","Defeat the Final Eden boss in Area 5 without devolving", 10, Damageless(ShowingModel(Eden5Start)))

//---------------------------------------------------------------------------
// Low Level Challenges

achievement("Primal Earth","Beat Area 1 without evolving past the default starting level 1 form in play or score attack mode", 10,
    LowLevelChallenge([MenuPlayArea(Area1),MenuScoreArea(Area1)], BossEnd(), 2))
achievement("Primal Mars","Beat Area 2 without evolving past the default starting level 1 form in play or score attack mode", 10,
    LowLevelChallenge([MenuPlayArea(Area2),MenuScoreArea(Area2)], BossEnd(), 2))
achievement("Primal Venus","Beat Area 3 without evolving past the default starting level 1 form in play or score attack mode", 10,
    LowLevelChallenge([MenuPlayArea(Area3),MenuScoreArea(Area3)], BossEnd(), 2))
achievement("Primal Uranus","Beat Area 4 without evolving past the default starting level 1 form in play or score attack mode", 10,
    LowLevelChallenge([MenuPlayArea(Area4),MenuScoreArea(Area4)], BossEnd(), 2))
achievement("Primal Lost Area","Beat Lost Area without evolving past the default starting level 1 form", 10, 
    LowLevelChallenge([BeyondMenu(LostArea)], ShowingModel(Results), 2))

//---------------------------------------------------------------------------
// Score challenges
achievement("Earth High Score","Score 150,000 or higher in Area 1 score attack", 10, ScoreChallenge(MenuScoreArea(Area1), 50000, 150000))
achievement("Mars High Score","Score 150,000 or higher in Area 2 score attack", 10, ScoreChallenge(MenuScoreArea(Area2), 50000, 150000))
achievement("Venus High Score","Score 150,000 or higher in Area 3 score attack", 10, ScoreChallenge(MenuScoreArea(Area3), 50000, 150000))
achievement("Uranus High Score","Score 150,000 or higher in Area 4 score attack", 10, ScoreChallenge(MenuScoreArea(Area4), 50000, 150000))
achievement("Eden High Score","Score 300,000 or higher in Area 5 score attack", 25, ScoreChallenge(MenuScoreArea(Area5), 200000, 300000))
achievement("Lost Area High Score","Score 150,000 or higher in the Lost Area", 10, ScoreChallenge(BeyondMenu(LostArea), 50000, 150000))
achievement("Boss Rush High Score","Score 300,000 or higher in Boss Rush", 25, ScoreChallenge(BeyondMenu(BossRush), 200000, 300000))
achievement("Direct Assault High Score","Score 1,000,000 or higher in any Direct Assault", 50, ScoreChallenge(BeyondMenu(DirectAssault), 900000, 1000000))

//---------------------------------------------------------------------------
// Upgrade achievements

achievement("Autonomous","Reach Evolution Level 02", 1, UpgradeActive() && PlayMode() && prev(CurrentForm()) == 1 && CurrentForm() == 2)
achievement("Cognitive","Reach Evolution Level 03", 2, UpgradeActive() && PlayMode() && prev(CurrentForm()) == 2 && CurrentForm() == 3)
achievement("Analysis","Reach Evolution Level 04", 3, UpgradeActive() && PlayMode() && prev(CurrentForm()) == 3 && CurrentForm() == 4)
achievement("Synthesis","Reach Evolution Level 05", 4, UpgradeActive() && PlayMode() && prev(CurrentForm()) == 4 && CurrentForm() == 5)
achievement("Enlightenment","Reach Evolution Level 06", 5, GameActive() && PlayMode() && prev(CurrentForm()) <= 5 && CurrentForm() == 6)
achievement("Maximum Overdrive","Have 4 overdrive attacks built up at once", 5, UpgradeActive() && PlayMode() && prev(Overloads()) == 3 && Overloads() == 4)

//---------------------------------------------------------------------------
//  Leaderboards
leaderboard("Score Attack Earth","Highest Score in Score Attack Area 1", MenuScoreArea(Area1), always_false(), GameEnd() || ShowingModel(Results), CurrentScore(), "VALUE", false)
leaderboard("Score Attack Mars","Highest Score in Score Attack Area 2", MenuScoreArea(Area2), always_false(), GameEnd() ||  ShowingModel(Results), CurrentScore(), "VALUE", false)
leaderboard("Score Attack Venus","Highest Score in Score Attack Area 3", MenuScoreArea(Area3), always_false(), GameEnd() || ShowingModel(Results), CurrentScore(), "VALUE", false)
leaderboard("Score Attack Uranus","Highest Score in Score Attack Area 4", MenuScoreArea(Area4), always_false(), GameEnd() || ShowingModel(Results), CurrentScore(), "VALUE", false)
leaderboard("Score Attack Eden","Highest Score in Score Attack Area 5", MenuScoreArea(Area5), always_false(), GameEnd() || GameWon(), CurrentScore(), "VALUE", false)
leaderboard("Lost Area Score","Highest Score in Lost Area", BeyondMenu(LostArea), always_false(), GameEnd() || ShowingModel(Results), CurrentScore(), "VALUE", false)
leaderboard("Direct Assault Score","Highest Score in Direct Assault", BeyondMenu(DirectAssault), always_false(), GameEnd() || GameWon(), CurrentScore(), "VALUE", false)
leaderboard("Boss Rush Score","Highest Score in Boss Rush", BeyondMenu(BossRush), always_false(), GameEnd() || GameWon(), CurrentScore(), "VALUE", false)
leaderboard("Boss Rush Speedrun","Fastest Boss Rush Time", BeyondMenu(BossRush), GameEnd(), GameWon(), always_true(), "FRAMES", true)

//---------------------------------------------------------------------------
// Rich Presence

rich_presence_conditional_display(GamePointer() == 0, "Swayzak is hacking the {0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} system",
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(0))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(1))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(2))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(3))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(4))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(5))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(6))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(7))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(8))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(9))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(10))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(11)))
)
rich_presence_display("Swayzak is level {0} with {1} overloads hacking the {2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13} system", 
    rich_presence_value("Level", CurrentForm()),
    rich_presence_value("Overloads", Overloads()),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(0))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(1))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(2))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(3))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(4))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(5))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(6))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(7))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(8))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(9))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(10))),
    rich_presence_macro("ASCIIChar", byte(ModelLoaded(11)))
)
