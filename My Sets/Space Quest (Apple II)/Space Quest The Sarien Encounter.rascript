// Space Quest: The Sarien Encounter
// #ID = 18951


// $0EAF: [8-bit] Objects (0 = None, 0xff = In Inventory)
function Object(objNumber)
{
    startAddress = 0x000EAF
    offsetAddress = objNumber * 3
    return byte(startAddress + offsetAddress)
}

// $89D1: [8-bit] Restore Game (0xe3 = Saving, 0x3 = Loading)
function LoadingGame() => byte(0x89D1) == 3

// $928F: [8-bit] Disk Number (0x1-0x8 =>0xf save game)
function Disk() => byte(0x928f)

// $FEE0: [32 bytes] Flags 0-255 (each bit is big endian so flag 0 = byte 0.7, flag 1 = byte 0.6, ..., flag 255 byte 32.0)
function Flag(flagNumber)
{
    startAddress = 0x00FEE0
    byteNumber = flagNumber / 8
    bitNumber = 7 - (flagNumber - (byteNumber * 8))
    return bit(bitNumber, startAddress + byteNumber)
}

// $FF00: [256 bytes] Variables 0-255
function Variable(varNumber) => 0x00FF00 + varNumber

//-----------------------------------------------------------------------------
// Look ups

// List of scenes
Scenes = {
    1:"in the Cartridge Retrieval Room",
    2:"in the Arcada Hallways",
    3:"in the Arcada Hallways",
    4:"in the Arcada Hallways",
    5:"on the Arcada Lower Decks",
    6:"on the Lower Decks",
    7:"on the Arcada Lower Decks",
    8:"on theArcada Docking Bay",
    9:"in theArcada Armory",
    10:"in theEscape Pod",
    11:"on the Arcada Observation Deck",
    12:"viewing Arcada Spaceship",
    13:"viewing the planet Kerona",
    14:"in the Crashed Escape Pod",
    15:"on the Kerona Plateau",
    16:"on the Kerona Plateau",
    17:"on the Kerona Plateau",
    18:"on the Kerona Plateau",
    19:"on the Kerona Plateau",
    20:"on the Kerona Plateau",
    21:"on the Kerona Plateau",
    22:"in the Kerona Valley",
    23:"in the Kerona Valley",
    24:"in the Orat Cave",
    25:"in the Underground Cavern",
    26:"in the Underground Cavern",
    27:"in the Underground Cavern",
    28:"in the Underground Cavern",
    30:"in the Kerona Desert",
    31:"in the Underground Lab",
    32:"in the Underground Lab",
    33:"in the Kerona Desert",
    34:"in Tiny's Used Spacecraft",
    35:"by the Ulence Flats Bar",
    36:"by the Ulence Flats Bar",
    37:"on the Ulence Flats",
    38:"by the Droids R' Us",
    39:"by the Droids R' Us",
    41:"in the Drallion Cruiser",
    42:"in the Drallion Cruiser",
    43:"on the Deltaur Spaceship",
    45:"in the Deltaur Hatch",
    46:"on the Deltaur Observation Deck",
    47:"in the Deltaur Jeffries Tube",
    48:"Deltaur Hallways",
    49:"Deltaur Hallways",
    50:"Deltaur Star Generator",
    51:"Deltaur Armory",
    52:"in the Deltaur Jeffries Tube",
    53:"on the Deltaur Lower Decks",
    54:"on the Deltaur Lower Decks",
    55:"in the Deltaur Hallways",
    56:"in the Deltaur Jeffries Tube",
    57:"in the Deltaur Maintenance Room",
    58:"in the Deltaur Hallways",
    59:"in the Deltaur Hallways",
    60:"in the Deltaur Jeffries Tube",
    61:"in the Deltaur Maintenance Room",
    62:"in the Deltaur Shuttle Room",
    64:"on the Xenon Homeworld",
    65:"looking at Star Generator Keypad",
    67:"looking at Title Screen",
    70:"in the Ulence Flats Bar",
    71:"in the Droids R' Us",
    73:"in Daventry",
    75:"playing the Slot Machine",
    77:"is blown up",
    80:"on the Arcada Docking Bay",
    81:"in the Kerona Desert",
    82:"in the Kerona Desert",
    83:"in the Kerona Desert"
}

// List of objects
Objects = {
    0:"Cartridge",
    1:"Life Detector",
    2:"Rock",
    3:"Gadget",
    4:"Orat Part",
    5:"Key Card",
    6:"Glass",
    7:"Skimmer Key",
    8:"Beer",
    9:"Jetpack",
    10:"?",
    11:"Dehydrated Water",
    12:"Xenon Army Knife",
    13:"Own 1  Used Ship",
    14:"Sarien ID Card",
    15:"Pulseray",
    16:"Gas Grenade",
    17:"Remote Control",
    18:"?",
    19:"Plant",
    20:"Control",
    21:"Survival Kit",
    22:"Survival Kit",
    23:"Pocket Lint"
}

//------------------------------------------------------------------------------
// Function Helpers

// Start, restore, and save functions
function StartGame() => Scene() == 2 && prev(Flag(141)) < Flag(141)
function RestoreGame() => LoadingGame() && prev(Disk()) >= 2 && prev(Disk()) < 15 && Disk() == 15
function SaveGame() => SavingGame() &&  prev(Disk()) == 15 && Disk() >= 2 && Disk() < 15

// [8-bit] Current Scene (Var 0 see scene lookup for values)
function Scene() => byte(Variable(0))

// [8-bit] Points (Var 3  = 0-205)
function Points() => byte(Variable(3))

// [bit 5] Debug Mode (Flag 190 - 0 = off, 1 = on)
function DebugMode() => Flag(190)
function DebugInactive() => DebugMode() == 0
function DebugActive() => DebugMode() == 1

// -----------------------------------------------------------------------------
// Achievements

// Pick up the keycard from the dead arcadain
function GetKeycard(name, description, points)
{
    keycardRoom = Scene() == 0x3
    pickupKeycard = prev(Object(5)) == 0x00 && Object(5) == 0xff

    achievement(name, description, points, DebugInactive() && keycardRoom && pickupKeycard)
}
GetKeycard("Keys to Success!","Obtain the Keycard", 5)

// Pick up the cartridge from the archives
function GetCartridge(name, description, points)
{
    cartridgeRoom = Scene() == 0x1
    pickupCartridge = prev(Object(0)) == 0x00 && Object(0) == 0xff
    
    achievement(name, description, points, DebugInactive() && cartridgeRoom && pickupCartridge)
}
GetCartridge("Archival Memories!", "Obtain the Memory Cartridge", 5)

// Get the flight suit
function FlyingHigh(name, description, points)
{
    // Suit Type (Var 81, 0 = Janitor, 1 = Flight suit, 2 = Sarien Uniform, 3 = Sarien Uniform/No Helmet)
    suitType = byte(Variable(81))
    airlockRoom = Scene() == 0x9
    changeFlightSuit = prev(suitType) == 0 && suitType == 1
    
    achievement(name, description, points, DebugInactive() && airlockRoom && changeFlightSuit)
}
FlyingHigh("Flying High!", "Obtain a Flight Suit", 3)

// Escape the arcada before it explodes
function EscapeArcada(name, description, points)
{
    viewingArcada = Scene() == 0xc
    escapedArcada = prev(Flag(30)) > Flag(30)
    
    achievement(name, description, points, DebugInactive() && viewingArcada && escapedArcada)
}
EscapeArcada("Abandon Ship!", "Escape the Arcada", 10)

// Crash land in Daventry
function DaventryZone(name, description, points)
{
    // Turns off when lands in Daventry moat
    viewingDaventry = Scene() == 0x49
    inDaventry = prev(Flag(31)) > Flag(31) 
    achievement(name, description, points, DebugInactive() && viewingDaventry && inDaventry)
}
DaventryZone("The Daventry Zone!", "Visit the Kingdom of Daventry", 2)

// Pick up the survival kit
function SurvivalKit(name, description, points)
{
    inCrashedPod = Scene() == 0x0e
    pickupKit = prev(Object(21)) == 0x00 && Object(21) == 0xff
    
    achievement(name, description, points, DebugInactive() && inCrashedPod && pickupKit)
}
SurvivalKit("Exoplanet Wilderness Survival!", "Obtain the Survival Kit", 3)

// Find the entrance to the underground lab
function UndergroundLab(name, description, points)
{
    labEntrance = prev(Scene()) == 0x11
    elevator = Scene() == 0x20

    achievement(name, description, points, DebugInactive() && labEntrance && elevator) 
}
UndergroundLab("Better Living Underground!", "Find the Underground Lab", 5) 

// Check if the player has found the alien and can understand it
function TranslationMatrix(name, description, points)
{
    inLab = Scene() == 0x1d
    alienDialog = byte(Variable(32)) == 2
    hasGadget = Object(3) == 0xff
    translatorOn = Flag(154) == 1
    
    achievement(name, description, points, DebugInactive() && inLab && alienDialog && hasGadget && translatorOn)
}
TranslationMatrix("Translation Matrix!","Understand the Keronain Alien", 3)

// Check if the player killed the Orat with the Spider Droid
function HighTechOrat(name, description, points)
{
    inOratCave = Scene() == 0x18
    techKill = prev(Flag(161)) < Flag(161)
        
    achievement(name, description, points, DebugInactive() && inOratCave && techKill)
}
HighTechOrat("High Tech Orat!","Kill the Orat with technology", 10)

// Check if the player killed the Orat with Dehydrated Water
function PrimalOrat(name, description, points)
{
    inOratCave = Scene() == 0x18
    primalKill = prev(Flag(42)) > Flag(42)
        
    achievement(name, description, points, DebugInactive() && inOratCave && primalKill)
}
PrimalOrat("Primal Orat!","Kill the Orat with the elements", 10)

// Pass the driving sequence with hitting three or less rocks
function SkilledSkimmerSkipper(name, description, points)
{
    inDesert = Scene() == 0x4e
    startDriving = prev(Flag(36)) > Flag(36)
    rocksHits = byte(Variable(42))
    ulenceFlats = Scene() == 0x23
    arrivedAtUlenceFlats = prev(Flag(32)) < Flag(32)
        
    start = once(inDesert && startDriving)
    cancel = never(prev(rocksHits) == 3 && rocksHits >= 4)
    submit = trigger_when(ulenceFlats && arrivedAtUlenceFlats)
    
    achievement(name, description, points, DebugInactive() && start && cancel && submit)
}
//SkilledSkimmerSkipper("Skilled Skimmer Skipper!","Navigate the Skimmer through the desert without hitting more than three rocks", 10)

// Find the Ulence Flats
function UlenceFlatsFound(name, description, points)
{
    ulenceFlats = Scene() == 0x23
    arrivedAtUlenceFlats = prev(Flag(32)) < Flag(32)
    
    achievement(name, description, points, DebugInactive() && ulenceFlats && arrivedAtUlenceFlats)
}
UlenceFlatsFound("Ulence Flats Spaceport!","Find the Ulence Flats", 10)

// Sale the Skimmer for 30-35 Buck-A-Zoids and a Jetpack
function HardNegotiator(name, description, points)
{
    ulenceFlats = Scene() == 0x23
    pickupJetPack = prev(Object(9)) == 0x00 && Object(9) == 0xff
    
    achievement(name, description, points, DebugInactive() && ulenceFlats && pickupJetPack)
}
HardNegotiator("Hard Negotiator!","Make a good trade for the Skimmer", 2)

// See all of the bands in the Ulence Flats bar
function XenoCultured(name, description, points)
{
    delay = 3600
    inBar = Scene() == 0x46
    bandHipCombo = byte(Variable(96)) == 1
    bandHumanoids = byte(Variable(96)) == 2
    bandBeards = byte(Variable(96)) == 3
    bandsSeen = measured(tally(delay * 3,
        repeated(delay, inBar && bandHipCombo),
        repeated(delay, inBar && bandHumanoids),
        repeated(delay, inBar && bandBeards)        
    ), format="percent")
    
    achievement(name, description, points, DebugInactive() && bandsSeen)
}
XenoCultured("Xeno Cultured!","Catch all of the bands in the Ulence Flats bar (must listen to each band for a minute)", 3)

// Break the slots machine by earning > 249 Buck-A-Zoids
function BuckAZoidBankBusted(name, description, points)
{
    atSlotMachine = Scene() == 0x4b
    buckazoidsMaxed = prev(byte(Variable(124))) < 250 &&byte(Variable(124)) >= 250
        
    achievement(name, description, points, DebugInactive() && atSlotMachine && buckazoidsMaxed)
}
BuckAZoidBankBusted("Buck-A-Zoid Bank Busted!","Break the Slot Machine", 3)

// Buy the Drallion model cruiser
function SpaceshipCaptian(name, description, points)
{
    bySpaceship = Scene() == 0x25
    boughtShip = prev(Flag(74)) < Flag(74)
    
    achievement(name, description, points, DebugInactive() && bySpaceship && boughtShip)
}
SpaceshipCaptian("Spaceship Captian!","Buy a Spaceship", 5)

// Buy the navigation droid
function BuyDroid(name, description, points)
{
    inDroidsBUs = Scene() == 0x47
    boughtDroid = prev(Flag(60)) < Flag(60)
    
    achievement(name, description, points, DebugInactive() && inDroidsBUs && boughtDroid)    
}
BuyDroid("The Droid You're Looking For!","Buy a Droid", 5)

// Make it to the Deltaur
function SarienFlagship(name, description, points)
{
    fromShipView = prev(Scene()) == 0x29
    toDeltaur = Scene() == 0x2b
    
    achievement(name, description, points, DebugInactive() && fromShipView && toDeltaur)   
}
SarienFlagship("Sarien Flagship!","Find the Deltaur", 10)

// Sneek on to the Deltaur
function SolidRoger(name, description, points)
{
    fromShipExterior = prev(Scene()) == 0x34
    toShipInterior = Scene() == 0x35
    
    achievement(name, description, points, DebugInactive() && fromShipExterior && toShipInterior)  
}
SolidRoger("Solid Roger!","Sneak into the Deltaur", 3)

// Change in to a Sarien Uniform
function BustonFreem(name, description, points)
{    
    laundryRoom = Scene() == 0x35
    suitType = byte(Variable(81))
    changeSarienUniform = prev(suitType) <= 2 && suitType == 3
    
    achievement(name, description, points, DebugInactive() && laundryRoom && changeSarienUniform)  
}
BustonFreem("Buston Freem!","Wear a Sarien Uniform", 5)

// Say yes to play KQ2
function SirRoger(name, description, points)
{
    onDeltaur = Scene() >= 0x2a && Scene() <= 0x3e
    askedAboutKQ2 = prev(Flag(218)) > Flag(218)
    hasPlayedKQ2 = prev(Flag(206)) < Flag(206)
    
    achievement(name, description, points, DebugInactive() && onDeltaur && askedAboutKQ2 && hasPlayedKQ2)      
}
SirRoger("Sir Roger of Wilco!","Admit to having played other Sierra Adventure games", 5)

// Enter the self-destruct sequence
function AppetiteForDestruction(name, description, points)
{
    atStarGeneratorPanel = Scene() == 0x41
    enteredCode = prev(Flag(31)) < Flag(31)

    achievement(name, description, points, DebugInactive() && atStarGeneratorPanel && enteredCode) 
}
AppetiteForDestruction("Appetite for Destruction!","Enter the self destruct code into the Star Generator", 5)

// Shoot a Sarien soilder
function SpaceWarrior(name, description, points)
{
    onDeltaur = Scene() >= 0x2a && Scene() <= 0x3e
    hasPulseray = Object(15) == 0xff
    shotSarien  = prev(Flag(207)) < Flag(207)
    
    achievement(name, description, points, DebugInactive() && onDeltaur && hasPulseray && shotSarien) 
}
SpaceWarrior("Space Warrior!","Shoot a Sarien Solider", 3)

// Don't shoot anyone while escaping the Deltaur
function SpacePaficst(name, description, points)
{
    hasPulseray = Object(15) == 0xff
    fromShuttleBay = prev(Scene()) == 0x3e
    toEscape = Scene() == 0x2b
    peaceful = Flag(207) == 0
    
    achievement(name, description, points, DebugInactive() &&  peaceful && hasPulseray && trigger_when(fromShuttleBay && toEscape)) 
}
SpacePaficst("Space Pacifist!","Escape the Deltaur without shooting anybody", 10)

// Beat the game with a certain score
function BeatGame(name, description, points, lowScore, highScore)
{
    pointsRange = Points() >= lowScore && Points() <= highScore 
    onXenon = Scene() == 0x40
    endGameDialog = byte(Variable(88))
    atCermony = prev(endGameDialog) == 2 && endGameDialog == 1
    
    achievement(name, description, points, DebugInactive() && pointsRange && onXenon && atCermony) 
}
BeatGame("Homeworld Saved!","Beat the game", 25, 0, 205)
BeatGame("Space Hero!","Beat the game with a perfect score of 202 points", 25, 202, 205)
BeatGame("Hero on a Budget!","Beat the game with a score of 170 points or less", 25, 0, 170)

// -----------------------------------------------------------------------------
// Leaderboards

// [16-bit] Arcada Explosion Countdown (Var 109/110 - starts at 0x28fa decrements every 4 frames)
function ArcadaCountdown() => word(Variable(109))

function ArcadaEscape(name, description)
{
    // Start at the begining of the game
    startingScene = Scene() == 0x2
    playerControl = prev(Flag(141)) > Flag(141)
    start = DebugInactive() && startingScene && playerControl
    
    // Cancel on debug menu, starting new game, or restoring a game
    cancel = DebugActive() || StartGame() || RestoreGame()
    
    // Submit when player escapes the Arcada
    viewingArcada = Scene() == 0xc
    escapedArcada = prev(Flag(30)) > Flag(30)
    submit = viewingArcada && escapedArcada
    
    // Count the countdown timer x4 to get a more accurate time
    measure = tally(0,
        prev(ArcadaCountdown()) != ArcadaCountdown(),
        prev(ArcadaCountdown()) != ArcadaCountdown(),
        prev(ArcadaCountdown()) != ArcadaCountdown(),
        prev(ArcadaCountdown()) != ArcadaCountdown()
    )
    
    leaderboard(name, description, start, cancel, submit, measure,format="MILLISECS", lower_is_better=true)
}
ArcadaEscape("Quick Escape Artist I", "Quickest time to escape the Arcada (cancels on game restore)")

// [16-bit] Dehydration Meter (decrease once every frame while in the desert)
function Dehydration() => word(Variable(147))

function DesertSurvivlist(name, description)
{
    // Starts when crash lands on Kerona
    fromViewingKerona = prev(Scene()) == 0x0d
    toCrashedPod = Scene() == 0x1e
    start = DebugInactive() && fromViewingKerona && toCrashedPod
   
    // Cancel on debug menu, starting new game, or restoring a game   
    cancel = DebugActive() || StartGame() || RestoreGame()
    
    // Submits when you start the skimmer
    inDesert = Scene() == 0x4e
    startDriving = prev(Flag(36)) > Flag(36)
    submit = inDesert && startDriving
    
    // How much water is lost while in the desert
    measure = repeated(0,prev(Dehydration()) > Dehydration())
    
    leaderboard(name, description, start, cancel, submit, measure, format="VALUE", lower_is_better=true)
}
DesertSurvivlist("Desert Survivalist", "Least amount of water lost in the Kerona Desert (cancels on game restore)")

// [8-bit] BuckAZoids count (Var 124 - 0-255)
function BuckAZoids() => byte(Variable(124))

function BuckAZillionair(name, description)
{
    // Starts when crash lands on Kerona
    ulenceFlats = Scene() == 0x23
    arrivedAtUlenceFlats = prev(Flag(32)) < Flag(32)
    start = DebugInactive() && ulenceFlats && arrivedAtUlenceFlats
    
    // Cancel on debug menu or starting new game  
    cancel = DebugActive() || StartGame()    
    
    // Submits when you arrive at the deltaur
    fromShipView = prev(Scene()) == 0x29
    toDeltaur = Scene() == 0x2b
    submit = fromShipView && toDeltaur || RestoreGame()
    
    accumulativeBucks = []
    for index in range(1,60)
        array_push(accumulativeBucks, prev(BuckAZoids()) + index <= BuckAZoids())
    
    measure = tally(0,accumulativeBucks)
    
    leaderboard(name, description, start, cancel, submit, measure, format="VALUE", lower_is_better=false)
}
BuckAZillionair("Buck-A-Zillionair", "Make the most Buck-A-Zoids after arriving at the Ulence Flats (submits on game restore or leaving Ulence Flats)")

// [16-bit] Countdown to destruction of the star generator
function SelfDestructLow() => byte(Variable(145))
function SelfDestructHigh() => byte(Variable(144))
function SelfDestruct() => SelfDestructHigh() * 256 + SelfDestructLow()

function DetlaurEscape(name, description)
{
    // Starts when crash lands on Kerona
    atStarGeneratorPanel = Scene() == 0x41
    enteredCode = prev(Flag(31)) < Flag(31)
    start = DebugInactive() && atStarGeneratorPanel && enteredCode
    
    // Cancel on debug menu, starting new game, or restoring a game   
    cancel = DebugActive() || StartGame() || RestoreGame()
    
    // Submits when you arrive at the deltaur    
    fromShuttleBay = prev(Scene()) == 0x3e
    toEscape = Scene() == 0x2b
    submit = fromShuttleBay && toEscape 
    
    // Count the countdown timer x4 to get a more accurate time
    measure = tally(0,
        prev(SelfDestructLow()) != SelfDestructLow(),
        prev(SelfDestructLow()) != SelfDestructLow(),
        prev(SelfDestructLow()) != SelfDestructLow(),
        prev(SelfDestructLow()) != SelfDestructLow()
    )
       
    leaderboard(name, description, start, cancel, submit, measure, format="MILLISECS", lower_is_better=true)
}
DetlaurEscape("Quick Escape Artist II", "Quickest time to escape the Deltaur after starting self-destruction countdown (cancels on game restore)")

// -----------------------------------------------------------------------------
// Rich Presence
rich_presence_conditional_display(DebugActive(), "Roger Wilco is in the debug menu, achievements deactivated!")

rich_presence_display("Roger Wilco is {0} with {1} points", 
    rich_presence_lookup("Scenes", Scene(), Scenes, "is loading"),
    rich_presence_value("Points", Points(), "VALUE")
)
