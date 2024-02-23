// Star Honor
// #ID = 11671

// $010E: [16-bit] Time Minutes
function Minutes() => word(0x00010E)

// $0110: [float] Time Seconds
function Seconds() => float(0x000110)
function Time() =>  Minutes() * 6000.0 + Seconds() * 100.0
function Frames() =>  Minutes() * 3600.0 + Seconds() * 60.0

// $0120: [8-bit] Current Sector (1-7 changes during warping)
function Sector() => byte(0x000120)

// $01D0: [8-bit] SequenceStage
Intro = 1
CombatChoice = 3
CombatCalculations = 4
StatusScreen = 5
RunAway = 6
NeutralPlanet = 7
PositivePlanet = 8
PrintDamage = 9
Success = 15
RanAway = 16
Result = 17
CombatGameOver = 18
function SequenceStage() => byte(0x0001D0)

// $01D6: [8-bit] GameState
Title = 0
TitleLoop = 1
Prologue = 2
Map = 3
Status = 4
Encounter = 5
GameOver = 6
TimeUp = 7
Reset = 8
WinGame = 9
Warping = 10
function GameState() => byte(0x0001D6)

// $05FA: [16-bit] Last Planet Pointer
//        +0 Bitmap Pointer
//        +2 Map Position
//        +4 Alignment
//        +6 Attack
//        +7 Defense
//        +8 Loot
//        +10 Contacted
function PlanetPointer() => word(0x0005FA)
function PlanetNotNull() => word(0x0005FA) != 0
function PlanetAlignment() => byte(PlanetPointer() + 4)
function PlanetAttack() => byte(PlanetPointer() + 6)
function PlanetDefense() => byte(PlanetPointer() + 7)
function PlanetLoot() => word(PlanetPointer() + 8)
function PlanetContacted() => bit0(PlanetPointer() + 10)

// $090C: [bit 0] Ship Alive (0 = no, 1 = yes)
function ShipAlive() => byte(0x00090C)

// $0919: [8-bit] Hull
function Hull() => byte(0x000919)

// $091B: [8-bit] Weapons
function Weapons() => byte(0x00091B)

// $091D: [8-bit] Engine
function Engine() => byte(0x00091D)

// $091F: [8-bit] Shields
function Shields() => byte(0x00091F)

// $0921: [8-bit] Red Shirts
function Crew() => byte(0x000921)

// $0923: [8-bit] Crystals
function Crystals() => byte(0x000923)

// $0925: [8-bit] Hull Max
function HullMax() => byte(0x000925)

// $0926: [8-bit] Weapons Max
function WeaponsMax() => byte(0x000926)

// $0927: [8-bit] Engine Max
function EngineMax() => byte(0x000927)

// $0928: [8-bit] Shields Max
function ShieldMax() => byte(0x000928)

// $0929: [8-bit] Red Shirts Max
function CrewMax() => byte(0x000929)

// $092A: [8-bit] Crystals Max
function CrystalsMax() => byte(0x00092A)

// $0959: [Array] Start of planet pointer array
function PlanetContact(offset) => bit0(word(0x0959 + offset * 2) + 10)

//--------------------------------------------------------------------------------
// Function Helpers

// Completion checke
function Completion(address, goal) => prev(address) == goal - 1 && measured(address == goal)

// Game state and encounter stage functions  
function StateChange(state) => prev(GameState()) != state && GameState() == state
function StageChange(stage) => prev(SequenceStage()) != stage && SequenceStage() == stage

// Game start, win and game over conditions
function GameStart() => StateChange(Prologue)
function GameOver() => StateChange(Reset)
function GameWin() => StateChange(WinGame)
function InGame() => GameState() > Prologue  && GameState() <= Warping

// Conditions for warping to a sector
function WarpSector(sector) =>  InGame() && Completion(Sector(), sector)

// Conditions for combat wins
function EncounterMode() => GameState() == Encounter
function CombatStart() => EncounterMode() && StageChange(CombatChoice)
function CombatSuccess() => EncounterMode() && StageChange(Success)
function CombatRanAway() => EncounterMode() && StageChange(RanAway)
function CombatSuccessCount(count) => measured(repeated(count, CombatSuccess())) && never(GameOver())

// Add up all of the contact bits for each planet
function SumContacts() => sum_of(range(0,9), i => PlanetContact(i))
function CountContacts()
{
    contacts = []
    for index in range(0,9)
        array_push(contacts, 
            InGame() && 
            prev(PlanetContact(index)) < PlanetContact(index)
        )
    return contacts
}

// General challenge achievement
function Challenge(start, cancel, submit)
{
    return any_of(start, s => once(s)) && 
        all_of(cancel, c => never(c)) && 
        all_of(submit, s => trigger_when(s))
}

// Challenge to beat the game with more then pass time on the clock
function TimeChallenge(minutes)
{
    return Challenge(
        [GameStart()], 
        [GameOver(), Minutes() < minutes], 
        [GameWin()]
    )
}

// Challenge to beat the game without reviving the crew
function RedShirtChallenge()
{
    return Challenge(
        [GameStart()], 
        [GameOver(), GameState() == Map && prev(Crew()) < Crew()], 
        [GameWin()]
    )
}

// Beat planet with a high defense
function StrongPlanetChallenge(defense)
{
    return Challenge(
        [CombatStart() && PlanetNotNull() && PlanetDefense() >= defense], 
        [GameOver(), CombatRanAway()], 
        [CombatSuccess()]
    )    
}

//--------------------------------------------------------------------------------
// Achievements

achievement("Warp Speed","Warp from the first system", 1, WarpSector(2))
achievement("Faster Than Light","Warp from the second system", 2, WarpSector(3))
achievement("Half Way Home","Warp from the third system", 3, WarpSector(4))
achievement("Space Odyssey","Warp from the fourth system", 4, WarpSector(5))
achievement("Extraterrestrial Expedition","Warp from the fifth system", 5, WarpSector(6))
achievement("Cure the Phage","Beat the game", 5, WarpSector(7))

achievement("Two Minutes to Midnight","Beat the game with 2:00 or more left on the countdown", 10, TimeChallenge(2))
achievement("Expendable Crew","Beat the game without reviving the crew", 10, RedShirtChallenge())

achievement("Star Fighter","Win 5 combat encounters", 2, CombatSuccessCount(5))
achievement("Star Warrior","Win 10 combat encounters", 3, CombatSuccessCount(10))
achievement("Star Conqueror","Win 20 combat encounters", 5, CombatSuccessCount(20))

achievement("Planetary Defense","Win combat with a planet that has 12 or more defense", 5, StrongPlanetChallenge(12))
achievement("Crystalline Entity","Collect 6 or more crystals at once", 5, InGame() && Completion(Crystals(), 6))
achievement("Space Diplomacy","Make contact every planet in a sector without running away", 5, InGame() && Completion(SumContacts(), 10))

//--------------------------------------------------------------------------------
// Leaderboards

leaderboard(
    "Time Warp",
    "Shortest time to beat the game",
    GameStart(),
    GameOver(),
    GameWin(),
    Frames(),
    "FRAMES",
    false
)

leaderboard(
    "Space Conquerer",
    "Most combat encounters won",
    GameStart(),
    always_false(),
    GameOver() || GameWin(),
    repeated(0, CombatSuccess()),
    "VALUE",
    false
)

leaderboard(
    "Space Diplomacy",
    "Most planets contacted (do not run away)",
    GameStart(),
    always_false(),
    GameOver() || GameWin(),
    tally(0, CountContacts()),
    "VALUE",
    false
)

//--------------------------------------------------------------------------------
// Rich Presence

rich_presence_conditional_display(GameState() <= 2, "USS Arduino is running a human machine interface system diagnostic!")

rich_presence_display("USS Arduino is racing home! 🚩 {0} | 🚀 {1} | 🔫 {2} | 🛡 {3} | 🚂 {4} | 👩‍🚀 {5} | ⛽ {6}", 
    rich_presence_macro("Number", Sector()),
    rich_presence_macro("Number", Hull()),
    rich_presence_macro("Number", Weapons()),
    rich_presence_macro("Number", Engine()),
    rich_presence_macro("Number", Shields()),
    rich_presence_macro("Number", Crew()),
    rich_presence_macro("Number", Crystals())
)
