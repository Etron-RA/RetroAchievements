// Batman: The Brave and The Bold - The Videogame
// #ID = 5656

// -- Pointer Functions ------------------------------------------------

MASK = 0xFFFFFF

function Pointer(base, offsets)
{
    // Start the chain
    max = length(offsets)
    count = 0
    chain = dword(base) & MASK    
    
    for offset in offsets
    {
        // if not end of chain then follow the chain
        if count < max - 1
            chain = dword(chain + offset) & MASK
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
    return all_of(pauseArray, p => unless(dword(p) == 0))
}

// Block achievement if any part of the chain is null
function PointerBlockIfNull(base, offsets) => all_of(PointerArray(base, offsets), p => p != 0)


// -- Memmory Addresses ------------------------------------------------

// $0E1D68: [32-bit] Player Enabled (0 = no, 1 = yes)
function PlayerEnabled() => dword(0x0E1D68)

// $0E1D6C: [32-bit] Hero Selected (0 = Guest, 1 = Batman)
function HeroSelected() => dword(0x0E1D6C)

// Playing state macros
function PlayingBatman() => HeroSelected() == 1
function PlayingGuest() => HeroSelected() == 0

// $0E8588: [32-bit] Title Sequence (0xc000c000 to 0xe000e000 on start)
function TitleSequence() => dword(0x0E8588)

// $0E8658: [32-bit] In game (0x99a when in game, 0x1000 at Title)
function GameState() => dword(0x0E8658)

// $0E866C: [24-bit] Player Data Pointer
//          +0x8 = [24-bit] Batman Data Pointer Chain
//          ++0x1C = [8-bit] Super State (0x77 => 0x78 super)
//          ++0x6C = [8-bit] Batman State
//          ++0x164 = [32-bit] Batman Health Current
//          ++0x168 = [32-bit] Batman Health Max
//          ++0x19c = [bit0] Cutscene (1 = yes, 0 = no)
//          ++0x1A4 = [32-bit] I-Frame count during bomb run (0 > invincible)
//          +0xC = [24-bit] Guest Hero Data Pointer Chain
//          ++0x1C = [8-bit] Super State (0x77 => 0x78 super)
//          ++0x6C = [8-bit] Guest Hero State
//          ++0x164 = [32-bit] Guest Hero Health Current
//          ++0x168 = [32-bit] Guest Hero Health Max
//          ++0x19c = [bit0] Cutscene (1 = yes, 0 = no)
//          ++0x590 = [32-bit] Sprite Count
function BatmanPointerNotNull() => PointerPauseIfNull(0x0E866C, [0x8])
function GuestHeroPointerNotNull() => PointerPauseIfNull(0x0E866C, [0xc])

function BatmanSuperState() => byte(Pointer(0x0E866C, [0x8, 0x1c]))
function BatmanAnimationState() => byte(Pointer(0x0E866C, [0x8, 0x6c]))
function BatmanCurrentHealth() => dword(Pointer(0x0E866C, [0x8, 0x164]))
function BatmanMaxHealth() => dword(Pointer(0x0E866C, [0x8, 0x168]))
function BatmanCutscene() => bit0(Pointer(0x0E866C, [0x8, 0x19c]))
function BatmanIFrames() => dword(Pointer(0x0E866C, [0x8, 0x1a4]))

function GuestHeroSuperState() => byte(Pointer(0x0E866C, [0xc, 0x1c]))
function GuestHeroAnimationState() => byte(Pointer(0x0E866C, [0xc, 0x6c]))
function GuestHeroCurrentHealth() => dword(Pointer(0x0E866C, [0xc, 0x164]))
function GuestHeroMaxHealth() => dword(Pointer(0x0E866C, [0xc, 0x168]))
function GuestHeroCutscene() => bit0(Pointer(0x0E866C, [0xc, 0x19c]))

// $0e8688 [32-bit] Challenge beat (0 = no, 1 = yes)
function ChallengeBeat() => dword(0x0E8688)

// $0E869A: [16-bit] Current Combo
//          Max displayed is 0x0063, 99 hits.
function Combo() => word(0x0E869A)

// $0E8714: [32-bit] Current Mission Room / Batcave menus
//          In a mission, this address starts at 0x02 and increments by 0x01 for every room.  Missions go to last level=>0x01=>0x0 upon completion.
function Room() => dword(0x0E8714)
function SmallRoom() => byte(0x0E8714)

// $0E8720: [8-bit] Current Selected Gadget
//          0x00 = Batarangs
//          0x01 = Belt Sword
//          0x02 = Flashbang
//          0x04 = Smoke Pellet
//          0x05 = Bat-Grenade
//          0x06 = Barrier
//          0x07 = Batarangs Again (set when entering batcave)
function Gadget() => byte(0x0E8720)

// $0E8724: [32-bit] Current Mission
//          0x00 = Cape Carmine
//          0x01 = Gotham
//          0x02 = Atlantis
//          0x03 = Science Island
//          0x04 = London
//          0x05 = Dinosaur Island
//          0x06 = Space Lab
//          0x07 = Fear Dream
//          0x08 = Challenge
//          0x09 = Bomb Run
//          0x0a = Batcave
//          0x0b = Results
function Mission() => dword(0x0E8724)

// $0E8728: [32-bit] Currently worn Batsuit
//          0x00 = Default
//          0x01 = Dark
//          0x02 = Medieval
//          0x03 = Rainbow
function Batsuit() => dword(0x0E8728)

// $1909C8: [32-bit] Bat-Cash
//          Max = 0x01869f, 99999 cash
function BatCash() => dword(0x1909C8)

// $1909CC: [8-bit] Unlocks (1/3)
//          Bit 0-1 = [2-bit] Extra batarangs (3 Max)
//          Bit 2-4 = [3-bit] Armor upgrade (5 max)
//          Bit 5 = Shock Batarang
//          Bit 6-7 = [2-bit] Belt Sword (2 max)
function Batarangs() => bit1(0x1909CC) * 2 + bit0(0x1909CC)
function Armor() => bit4(0x1909CC) * 4 + bit3(0x1909CC) * 2 + bit2(0x1909CC)
function ShockBatarang() => bit5(0x1909CC)
function BeltSword() => bit7(0x1909CC) + bit6(0x1909CC)

// $1909CD: [8-bit] Unlocks (2/3)
//          Bit 0 = Flashbangs
//          Bit 1 = Smoke pellets
//          Bit 2 = Barrier
//          Bit 3 = Bat-grenade
//          Bit 4 = Reflector
//          Bit 5 = Regeneration
//          Bit 6 = Lightning glove
//          Bit 7 = Item Radar
function Flashbangs() => bit0(0x1909CD)
function SmokePellets() => bit1(0x1909CD)
function Barrier() => bit2(0x1909CD)
function BatGrenade() => bit3(0x1909CD)
function Reflector() => bit4(0x1909CD)
function Regeneration() => bit5(0x1909CD)
function LightningGlove() => bit6(0x1909CD)
function ItemRadar() => bit7(0x1909CD)

// $1909CE: [8-bit] Unlocks (3/3), Menu toggles
//          Bit 0 = Power Punches
//          Bit 1 = Rainbow suit
//          Bit 2 = Medieval Suit
//          Bit 3 = Dark Suit
//          Bit 4 = Proto has appeared
//          Bit 5 = Hints enabled
//          Bit 6 = Bat-Mite Boost enabled
//          Bit 7 = Bat-Mite Boost prompt was shown after falling 5 times.
function PowerPunches() => bit0(0x1909CE)
function RainbowSuit() => bit1(0x1909CE)
function MedievalSuit() => bit2(0x1909CE)
function DarkSuit() => bit3(0x1909CE)
function ProtoAppeared() => bit4(0x1909CE)
function HintsEnabled() => bit5(0x1909CE)
function BatMiteBoost() => bit6(0x1909CE)
function BatMitePrompt() => bit7(0x1909CE)

// $1909CF: [8-bit] Level clears
//          Bit 0 = Cape Carmine
//          Bit 1 = Gotham
//          Bit 2 = Atlantis
//          Bit 3 = Science Island
//          Bit 4 = London
//          Bit 5 = Dinosaur Island
//          Bit 6 = Space Lab
//          Bit 7 = Fear
function CapeCarmine() => bit0(0x1909CF)
function Gotham() => bit1(0x1909CF)
function Atlantis() => bit2(0x1909CF)
function ScienceIsland() => bit3(0x1909CF)
function London() => bit4(0x1909CF)
function DinosaurIsland() => bit5(0x1909CF)
function SpaceLab() => bit6(0x1909CF)
function Fear() => bit7(0x1909CF)

// $1909D0: [32-bit] Fear reveal animation
//          0x00 = Fear hasn't been revealed
//          0x01 = Fear has been revealed
function FearRevealed() => dword(0x1909D0)

// $1909D4: [8-bit] Challenge clears (1/4) - Mirrors challenge unlocks.
//          Bit 0 = Gotham Battle
//          Bit 1 = London Battle
//          Bit 2 = Atlantis Battle
//          Bit 3 = Space Lab Battle
//          Bit 4 = Dinosaur Island Battle
//          Bit 5 = Science Island Battle
//          Bit 6 = Fear Battle
//          Bit 7 = Boss Rush Gotham
function GothamBattle() => bit0(0x1909D4)
function LondonBattle() => bit1(0x1909D4)
function AtlantisBattle() => bit2(0x1909D4)
function SpaceLabBattle() => bit3(0x1909D4)
function DinosaurIslandBattle() => bit4(0x1909D4)
function ScienceIslandBattle() => bit5(0x1909D4)
function FearBattle() => bit6(0x1909D4)
function BossRushGotham() => bit7(0x1909D4)

// $1909D5: [8-bit] Challenge clears (2/4)
//          Bit 0 = Boss rush London
//          Bit 1 = Boss rush Atlantis
//          Bit 2 = Boss rush Space Lab
//          Bit 3 = Boss rush Dinosaur Island
//          Bit 4 = Boss rush Science Island
//          Bit 5 = Boss rush Fear
//          Bit 6 = Red Tornado challenge
//          Bit 7 = Blue Beetle challenge
function BossRushLondon() => bit0(0x1909D5)
function BossRushAtlantis() => bit1(0x1909D5)
function BossRushSpaceLab() => bit2(0x1909D5)
function BossRushDinosaurIsland() => bit3(0x1909D5)
function BossRushScienceIsland() => bit4(0x1909D5)
function BossRushFear() => bit5(0x1909D5)
function RedTornadoChallenge() => bit6(0x1909D5)
function BlueBeetleChallenge() => bit7(0x1909D5)

// $1909D6: [8-bit] Challenge clears (3/4)
//          Bit 0 = Green Arrow challenge
//          Bit 1 = Green Lantern challenge
//          Bit 2 = Batman challenge
//          Bit 3 = Plastic man challenge
//          Bit 4 = Aquaman challenge
//          Bit 5 = Gotham Code 1
//          Bit 6 = Gotham Code 2
//          Bit 7 = Science island code 1
function GreenArrowChallenge() => bit0(0x1909D6)
function GreenLanternChallenge() => bit1(0x1909D6)
function BatmanChallenge() => bit2(0x1909D6)
function PlasticManChallenge() => bit3(0x1909D6)
function AquamanChallenge() => bit4(0x1909D6)
function GothamCode1() => bit5(0x1909D6)
function GothamCode2() => bit6(0x1909D6)
function ScienceIslandCode1() => bit7(0x1909D6)

// $1909D7: [8-bit] Challenge clears (4/4)
//          Bit 0 = Science island code 2
//          Bit 1 = Protobot code
//          Max = 0x03
function ScienceIslandCode2() => bit0(0x1909D7)
function ProtobotCode() => bit1(0x1909D7)

// $1909DC: [8-bit] Character hologram unlocks (1/6)
//          bit0 = General Kreegaar (unlocks in Space Lab)
//          bit1 = Jonah Hex (unlocks in Space Lab)
//          bit2 = Felix Faust (unlocks in Dinosaur Island)
//          bit3 = Ocean Master (unlocks in Atlantis)
//          bit4 = Guy Gardner (unlocks in Atlantis)
//          bit5 = Bronze Tiger (unlocks in Dinosaur Island)
//          bit6 = Wildcat (unlocks in Gotham)
//          bit7 = Jarvis Kord (unlocks in Science Island)
function HologramGeneralKreegaar() => bit0(0x1909DC)
function HologramJonahHex() => bit1(0x1909DC)
function HologramFelixFaust() => bit2(0x1909DC)
function HologramOceanMaster() => bit3(0x1909DC)
function HologramGuyGardner() => bit4(0x1909DC)
function HologramBronzeTiger() => bit5(0x1909DC)
function HologramWildcat() => bit6(0x1909DC)
function HologramJarvisKord() => bit7(0x1909DC)

// $1909DD: [8-bit] Character hologram unlocks (2/6)
//          bit0 = Gorilla Grood (unlocks in Atlantis)
//          bit1 = Atom (unlocks in Space Lab)
//          bit2 = Black Canary (unlocks in Atlantis)
//          bit3 = Doctor Polaris (unlocks in Space Lab)
//          bit4 = Huntress (unlocks in Science Island)
//          bit5 = Kantana (unlocks in Gotham)
//          bit6 = Deadman (unlocks in London)
//          bit7 = Baby Face (unlocks in Gotham)
function HologramGorillaGrood() => bit0(0x1909DD)
function HologramAtom() => bit1(0x1909DD)
function HologramBlackCanary() => bit2(0x1909DD)
function HologramDoctorPolaris() => bit3(0x1909DD)
function HologramHuntress() => bit4(0x1909DD)
function HologramKantana() => bit5(0x1909DD)
function HologramDeadman() => bit6(0x1909DD)
function HologramBabyFace() => bit7(0x1909DD)

// $1909DE: [8-bit] Character hologram unlocks (3/6)
//          bit0 = Gentleman Ghost (unlocks in London)
//          bit1 = Bat-mite (unlocks in Space Lab)
//          bit2 = Riddler (unlocks in Science Island)
//          bit3 = Aquaman (unlocks in Atlantis)
//          bit4 = Green Arrow (unlocks in London)
//          bit5 = Booster Gold (unlocks in London)
//          bit6 = Black Lightning (unlocks in Gotham)
//          bit7 = Hal Jordan (unlocks in Space Lab)
function HologramGentlemanGhost() => bit0(0x1909DE)
function HologramBatMite() => bit1(0x1909DE)
function HologramRiddler() => bit2(0x1909DE)
function HologramAquaman() => bit3(0x1909DE)
function HologramGreenArrow() => bit4(0x1909DE)
function HologramBoosterGold() => bit5(0x1909DE)
function HologramBlackLightning() => bit6(0x1909DE)
function HologramHalJordan() => bit7(0x1909DE)

// $1909DF: [8-bit] Character hologram unlocks (4/6)
//          bit0 = Music Meister (unlocks in Atlantis)
//          bit1 = Elongated Man (unlocks in Science Island)
//          bit2 = Kiteman (unlocks in London)
//          bit3 = Plastic Man (unlocks in Gotham)
//          bit4 = Clock King (unlocks in Dinosaur Island)
//          bit5 = Red Tornado (unlocks in Dinosaur Island)
//          bit6 = Metamorpho (unlocks in Gotham)
//          bit7 = The Flash (unlocks in Dinosaur Island)
function HologramMusicMeister() => bit0(0x1909DF)
function HologramElongatedMan() => bit1(0x1909DF)
function HologramKiteman() => bit2(0x1909DF)
function HologramPlasticMan () => bit3(0x1909DF)
function HologramClockKing() => bit4(0x1909DF)
function HologramRedTornado() => bit5(0x1909DF)
function HologramMetamorpho() => bit6(0x1909DF)
function HologramTheFlash() => bit7(0x1909DF)

// $1909E0: [8-bit] Character hologram unlocks (5/6)
//          bit0 = Black Manta (unlocks in Science Island)
//          bit1 = Morgan Le Fey (unlocks in Dinosaur Island)
//          bit2 = Catwoman (unlocks in Gotham)
//          bit3 = Bane (unlocks in London)
//          bit4 = Scream Queen (unlocks in Fear Dream)
//          bit5 = Blue Beetle (unlocks in Science Island)
//          bit6 = Robin (unlocks in Fear Dream)
//          bit7 = Scarecrow (unlocks in Fear Dream)
function HologramBlackManta() => bit0(0x1909E0)
function HologramMorganLeFey() => bit1(0x1909E0)
function HologramCatwoman() => bit2(0x1909E0)
function HologramBane() => bit3(0x1909E0)
function HologramScreamQueen() => bit4(0x1909E0)
function HologramBlueBeetle() => bit5(0x1909E0)
function HologramRobin() => bit6(0x1909E0)
function HologramScarecrow() => bit7(0x1909E0)

// $1909E1: [8-bit] Character hologram unlocks (6/6)
//          bit0 = The Brain (unlocks in Fear Dream)
//          bit1 = Batman (unlocks in Cape Carmine)
//          bit2 = Joker (unlocks in Cape Carmine)
function HologramTheBrain() => bit0(0x1909E1)
function HologramBatman() => bit1(0x1909E1)
function HologramJoker() => bit2(0x1909E1)

// $190D24: [32-bit] Timer
//          Clears at room change, but obeys pauses.
function Timer() => dword(0x190D24)
function Flasher() => bit2(0x190D24)

// $190e00: [24-bit] Barrier Sprite (not null when shown)
function BarrierPointer() => tbyte(0x190e00)

// $190EFC: [16-bit] Death counter
//          Clears on room change
function DeathCounter() => word(0x190EFC)

// [32-bit] [32-bit] Level State
//          0x03 = Autoscolling Elevator Up
//          0x05 = Autoscolling Elevator Stopped
//          [32-bit] Level State
//          0x0d = Meet Blue Beetle
//          0x10 = Meet Red Tornado
//          0x11 = Meet Hal Jordan
//          0x11 = Meet Aquaman
//          0x19 = Meet Plastic Man
//          0x1a = Meet Green Arrow
function LevelState() => dword(0x190F28)

// $190F84: [32-bit] Code terminal first digit
//          The address of all the digits is consecutive.
function CodeTerminal() => dword(0x190F84)

// $1911C8: [32-bit] Bomb run Bat-Cash
//          Default = 0x0
//          Max =  0x151a (5403)
function BombRun() => dword(0x1911C8)

// All Upgrades out of 20
function UpgradeCount() => Batarangs() + Armor() + ShockBatarang() + BeltSword() + bitcount(0x1909CD) + PowerPunches()

// All Missions out of 8
function MissionClearCount() => bitcount(0x1909CF)

// All Challenges out of 26
function ChallengeClearCount() => bitcount(0x1909D4) + bitcount(0x1909D5) + bitcount(0x1909D6) + ScienceIslandCode2() + ProtobotCode()

// All Challenges out of 43
function HologramCount() => bitcount(0x1909DC) + bitcount(0x1909DD) + bitcount(0x1909DE) + bitcount(0x1909DF) + bitcount(0x1909E0) + HologramTheBrain() + HologramBatman() + HologramJoker()

// Count of all the possible upgrades, challenges, missions, and holograms out of 97
function CompleteCount() => UpgradeCount() + MissionClearCount() + ChallengeClearCount() + HologramCount()

// Combine 
function Stage() => Mission() * 0x100 + Room()

// -- Game Events ---------------------------------------------------------

// In and out of game macros
function InGame() => GameState() == 0x99A
function TitleScreen() => GameState() == 0x1000

// Shortcut for converting time to frames
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Current in a room
function InRoom(mission, room) => Stage() == mission * 0x100 + room

// Transistioned to a new room
function ChangeRoom(mission, room)
{
    stage = mission * 0x100 + room
    return prev(Stage()) != stage &&
        Stage() == stage
}

// Transistioned from an old room to a new room
function TransistionRooms(mission, roomStart, roomEnd)
{
    stageStart = mission * 0x100 + roomStart
    stageEnd = mission * 0x100 + roomEnd
    return prev(Stage()) == stageStart &&
        Stage() == stageEnd
}

// Start/win/lose mission and challenge shortcuts
function StartMission(mission) => ChangeRoom(mission, 0x02)
function WonMission(mission) =>  ChangeRoom(mission, 0x01)

function StartChallenge(challenge) => ChangeRoom(0x08, challenge)
function WonChallenge(challenge) => ChangeRoom(0x0b, challenge)
function LostChallenge() => ChangeRoom(0x0b, 0x00)

// Specail bat cave rooms
function BatCave() => ChangeRoom(0x0A, 0x00)
function ChallengeRoom() => ChangeRoom(0x0A, 0x04)
function UpgradeRoom() => InRoom(0x0A, 0x01)

// Bat-Mite Mode
function BatmiteMode() => InGame() && prev(BatMiteBoost()) < BatMiteBoost()

// Player has been damaged in the bomb run
function PlayerIFrames() {
    return BatmanPointerNotNull() &&
        prev(BatmanIFrames()) == 0 &&
        BatmanIFrames() != 0
}

// Player has been damaged
function PlayerDamaged() {
    return PlayerEnabled() == 1 &&
        BatmanPointerNotNull() &&
        prev(BatmanCurrentHealth()) > BatmanCurrentHealth()
}

// Guest hero has been damaged
function GuestHeroDamaged() {
    return PlayerEnabled() == 1 &&
        GuestHeroPointerNotNull() &&
        prev(GuestHeroCurrentHealth()) > GuestHeroCurrentHealth()
}


// Player has been damaged (handles damage caused by downgrade)
function PlayerDamagedChallenge() {
    return PlayerEnabled() == 1 &&
        BatmanPointerNotNull() &&        
        BatmanCurrentHealth() < 0x64000 &&
        prev(BatmanCurrentHealth()) > BatmanCurrentHealth()
}

// Guest hero has been damaged (handles damage caused by downgrade)
function GuestHeroDamagedChallenge() {
    return PlayerEnabled() == 1 &&
        GuestHeroPointerNotNull() &&
        GuestHeroCurrentHealth() < 0x64000 &&
        prev(GuestHeroCurrentHealth()) > GuestHeroCurrentHealth()
}

// Player has been damaged by a certain amount
function GuestDamagedBy(damage) {
    return BatmanPointerNotNull() &&
        prev(GuestHeroCurrentHealth()) - damage == GuestHeroCurrentHealth()
}

// Player has been damaged by a certain amount
function PlayerDamagedBy(damage) {
    return BatmanPointerNotNull() &&
        prev(BatmanCurrentHealth()) - damage == BatmanCurrentHealth()
}

// Player got crushed by the bone wall
function BoneWallCrushPlayer() => PlayerDamagedBy(0x32000)


// Player got crushed by the bone wall
function BoneWallCrushGuest() => GuestDamagedBy(0x32000)

// Player died
function PlayerDeath() => prev(DeathCounter()) < DeathCounter()

// -- Helper Functions -----------------------------------------------

// Player collected a certain number of large bat coins.
function BatCoinsCollected(max, mission, room)
{
    return repeated(
        max,
        InRoom(mission, room) &&
        BatCash() - 100 >= prev(BatCash())
    )
}

// Created a coin array to track if multiple coins were collected at once
function BatCoinsCounter(maxCoins)
{
    coinArray = []
    for index in range(0,maxCoins)
    {
       array_push(coinArray, prev(BatCash()) + index < BatCash()) 
    }

    // Use the max int to count all coins
    return tally(0x7fffffff, coinArray)
}

// The title card for each mission
function MissionTitle(mission)
{
    // 0xF: "Snickery When Wet!"
    if (mission == 0) return (InGame() && ChangeRoom(0xa, 0xf)) || StartTutorialFresh()
    
    // 0x8: "The Cat Prowls at Night!"
    if (mission == 1) return InGame() && ChangeRoom(0xa, 0x8)
    
    // 0xA: "Aquaman's Ape Adventure!"
    if (mission == 2) return InGame() && ChangeRoom(0xa, 0xa)
    
    // 0x9: "Manta's Mechanical Mayhem!"
    if (mission == 3) return InGame() && ChangeRoom(0xa, 0x9)
    
    // 0xD: "Death by Lamplight!"
    if (mission == 4) return InGame() && ChangeRoom(0xa, 0xd)
    
    // 0xB: "Temporal Temple of Terror!"
    if (mission == 5) return InGame() && ChangeRoom(0xa, 0xb)
    
    // 0xC: "Space Plot of Polaris!"
    if (mission == 6) return InGame() && ChangeRoom(0xa, 0xc)
    
    // 0xE: "Cowl and Cape Fear!"
    if (mission == 7) return InGame() && ChangeRoom(0xa, 0xe)
}

// Starting a new game
function StartTutorialFresh()
{
    return TitleScreen() && 
        CapeCarmine() == 0 &&
        prev(TitleSequence()) == 0xc000c000 &&
        TitleSequence() == 0xe000e000
}

// Starting new game after beating fear
function StartTutorialNewGamePlus()
{
    return InGame() &&
         MissionClearCount() == 8 &&
         ChangeRoom(0xa, 0xf)
}

// Punch Brain at the end of the game
function PunchBrain()
{
    return InGame() &&
        InRoom(0x7, 0x6) &&
        Combo() != 0x0 &&
        prev(LevelState()) < 0x12 && 
        LevelState() >=0x12
}

// Player has completed a Mission
function CompleteTutorial()
{
    // start on the 1st room of a Mission
    start = once(StartMission(0))
    
    // cancels if in the bat cave
    cancel = never(BatCave()) && 
        never(BatMiteBoost() == 1) 
        
    // Submit at the end of the Mission
    submit = trigger_when(WonMission(0))
    
    return start && cancel && submit
}

// Player has completed a Mission
function CompleteMission(Mission)
{
    // start on the 1st room of a Mission
    start = once(InGame() &&
        StartMission(Mission))
    
    // cancels if in the bat cave
    cancel = never(BatCave()) && 
        never(BatMiteBoost() == 1) 
        
    // Submit at the end of the Mission
    submit = trigger_when(WonMission(Mission))
    
    return start && cancel && submit
}

// Player has completed a Mission without dying
function DeathlessMission(Mission)
{
    // Start at beginning of Mission
    start = once(InGame() &&
        StartMission(Mission))
    
    // Cancel if in the bat cave or dead
    cancel = never(BatCave()) &&
        never(PlayerDeath()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the Mission
    submit = trigger_when(WonMission(Mission))
    
    return start && cancel && submit
}

// Challenge to beat a challenge
function CompleteChallenge(challenge)
{
    // Start at beginning of challenge
    start = once(InGame() && 
        StartChallenge(challenge))
    
    // Cancel if in the challenge room or lost
    cancel = never(LostChallenge()) &&
        never(ChallengeRoom()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the challenge
    submit = trigger_when(WonChallenge())
    
    return start && cancel && submit
}

// Challenge to beat Joker, no health bar yet so use Iframes instead
function DamagelessJoker(Mission, room)
{   
    // Start at beginning of challenge
    start = once(InGame() && 
        ChangeRoom(Mission,room))
    
    // Cancel if in the challenge room or lost
    cancel = never(PlayerIFrames()) &&
        never(BatCave()) &&
        never(PlayerDeath()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the Mission
    submit = trigger_when(WonMission(Mission))
    
    return start && cancel && submit
}

// Challenge to beat a section without dying
function DamagelessChallenge(boss, last)
{   
    challenge = bosses[boss]

    // Start at beginning of challenge
    start = once(InGame() && 
        StartChallenge(challenge))
    
    // Cancel if in the challenge room or lost
    cancel = never(PlayerDamagedChallenge()) &&
        never(GuestHeroDamagedChallenge()) &&
        never(LostChallenge()) &&
        never(ChallengeRoom()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the challenge
    if (last)
        submit = trigger_when(WonChallenge(challenge))
    else
        submit = trigger_when(StartChallenge(challenge + 1))
    
    return start && cancel && submit
}

// Group challenges together
function GroupChallenge(challenge)
{
    group = challenges[challenge]
    max = length(group)
    return InGame() &&
        BatMiteBoost() == 0x0 &&
        sum_of(group, h => prev(h)) == max - 1 &&
        measured(sum_of(group, h => h) == max)
}

// Challenge to collect all the holograms in a Mission
function GroupHolograms(hologram)
{
    group = holograms[hologram]
    max = length(group)
    return InGame() &&
        BatMiteBoost() == 0x0 &&
        sum_of(group, h => prev(h)) < max  &&
        measured(sum_of(group, h => h) == max)
}

// Count all upgrades
function CompleteUpgrades()
{
    return InGame() &&
        BatMiteBoost() == 0 &&
        prev(UpgradeCount()) < 20 &&
        measured(UpgradeCount() == 20)
}

// Count all missions, challenges, upgrades, and holograms
function CompleteCrusader()
{
    return InGame() &&
        BatMiteBoost() == 0 &&
        prev(CompleteCount()) < 97 &&
        measured(CompleteCount() == 97, format="percent")
}

// Challenge to preform a super
function PlayerSuper(super)
{
	superState = supers[super]
    prevSuperState = superState - 1
    return InGame() &&
        BatMiteBoost() == 0 &&
        BatmanPointerNotNull() &&
        prev(BatmanSuperState()) == prevSuperState &&
        BatmanSuperState() == superState
}

// Challenge to buy a upgrade
function ObtainUpgrade(upgrade)
{
    data = upgrades[upgrade]
    memory = data[0]
    max = data[1]
    
    // If multibits than use a measure
    if (max > 1)
    {
        return InGame() &&
            UpgradeRoom() &&
            BatMiteBoost() == 0 &&
            prev(memory) == max - 1 &&
            measured(memory == max)
    }
    
    // If only one bit then simplify check no measure
    return InGame() &&
        UpgradeRoom() &&
        BatMiteBoost() == 0 &&
        prev(memory) < memory    
}

// Challenge to a certain area damageless and collecting all the bat coins
function DamagelessCollection(Mission, startRoom, endRoom, coins, autoscolling = false)
{
    // Start at room transistion
    start = once(InGame() && 
        ChangeRoom(Mission, startRoom))
        
    // If true only count damage during the autoscroll
    playerDamage = PlayerDamaged() 
    guestDamage = GuestHeroDamaged() 
    if (autoscolling == true) 
    {
        playerDamage = LevelState() == 0x3 && PlayerDamaged()
        guestDamage = LevelState() == 0x3 && GuestHeroDamaged()
    }
        
    // If protobot shows up or not have two rooms to cancel on
    cancleRoom = never(prev(Room()) == endRoom) 
    if(endRoom != startRoom + 1)
        cancleRoom = cancleRoom && never(prev(Room()) == startRoom + 1) 
        
    // Cancel if damaged or killed
    cancel = cancleRoom &&
        never(BatCave()) &&
        never(PlayerDeath()) && 
        never(playerDamage) &&
        never(guestDamage) &&
        never(BatMiteBoost() == 1)
        
    collectCoins = BatCoinsCollected(coins, Mission, startRoom)    
        
    // Measure how many bat coins are collect
    measure = TitleScreen() && measured(collectCoins, when=start)
    
    // Trigger on room transisition
    trigger = trigger_when(collectCoins && ChangeRoom(Mission, endRoom))
        
    // If protobot shows up or not have two rooms to trigger on    
    if(endRoom != startRoom + 1)
        trigger = trigger || trigger_when(collectCoins && ChangeRoom(Mission, startRoom +1))

    return start && cancel && (measure || trigger)
}

// Challenge to pass a room with getting crushed
function CrushlessCatacomb(Mission, startRoom, endRoom)
{
    // Start at beginning of crushing block room
    start = once(InGame() && 
        ChangeRoom(Mission, startRoom))      
    
    // Cancel on death or being crush crushed
    cancel = never(prev(Room()) == endRoom) &&
        never(BatCave()) &&
        never(PlayerDeath()) && 
        never(BoneWallCrushPlayer()) && 
        never(BoneWallCrushGuest()) && 
        never(BatMiteBoost() == 1)
    
    // Trigger at end of room
    trigger = trigger_when(ChangeRoom(Mission, endRoom))

    return start && cancel && trigger
}

// Challenge to pass a room using the minimum about of blocks
function EfficentBlocks(Mission, startRoom, endRoom, max)
{
    // Start at beginning of sliding block room
    start = once(InGame() && 
        ChangeRoom(Mission, startRoom))      

    // Count how many blocks were made
    createMaxBlocks = GuestHeroPointerNotNull() &&
        repeated(max + 1,
            prev(GuestHeroSuperState()) != 0x40 && GuestHeroSuperState() == 0x40
        )

    // Cancel if create too many blocks
    cancel = never(prev(Room()) == endRoom) &&
        never(BatCave()) &&
        never(createMaxBlocks) &&
        never(BatMiteBoost() == 1)
        
    trigger = trigger_when(ChangeRoom(Mission, endRoom))

    return start && cancel && trigger
}

// Challenge for a damageless bomb run
function BatBombRun(Mission, room)
{ 
    // Start at beginning of bomb run
    start = once(InGame() && 
        ChangeRoom(Mission, room))      

     // Cancel if in batcave or iFrame counter starts
    cancel = never(BatCave()) &&
        never(PlayerIFrames()) &&
        never(BatMiteBoost() == 1)
        
    // Submit at credits
    trigger = trigger_when(ChangeRoom(0xb, 0x2))

    return start && cancel && trigger
}

// Challenge to play primarily as guest
function PlayAsGuest(Mission, room, state, time, exempts = [-1])
{
    // Start when you meet the guest hero
    start = once(InGame() && 
        InRoom(Mission, room) &&
        prev(LevelState()) < state && 
        LevelState() >= state)  
    
    // Logic for detecting playing as Batman (except in room list in exempt parameter)
    playingAsHero = PlayerEnabled() == 1 && HeroSelected() == 1
    allowed = always_false()
    exemptions = false
    for exempt in exempts
    {
        if (exempt != -1) {
            exemptions = true
            playingAsHero = playingAsHero && Room() != exempt 
            allowed = allowed || PlayerEnabled() == 1 && HeroSelected() == 1 && SmallRoom() == exempt 
        }
    }
    
    // Cancel if in batcave or batman for too long
    cancel = never(BatCave()) &&
        never(BatMiteBoost() == 1) &&        
        never(repeated(time,
            playingAsHero &&
            never(HeroSelected() == 0))
        ) 
    submit = trigger_when(WonMission(Mission))
    
    // Use the timer to flash the trigger if batman
    flasher = HeroSelected() == 0  ||
        (PlayerEnabled() == 0 && HeroSelected() == 1) ||
        (PlayerEnabled() == 1 && HeroSelected() == 1 && Flasher() == 1)
         
    // Logic for flasher with allowed exemptions
    if (exemptions) 
        flasher = flasher || allowed
    
    return start && cancel && flasher && submit
}

// Challenge to play primarily as Batman with a certain suit and gadget
function PlayAsBatman(Mission, room, suit, gadget, time, exempts = [-1])
{
    // Start if on the 1st room of the Mission and both suit and gadget are selected
    suited = InGame() && 
        InRoom(Mission, room) &&
        Batsuit() == suit
        
    // Note that the batarangs start as 7 and turn to 0 when selected
    if (gadget != 0)
        equip_gadget = suited && Gadget() == gadget
    else
        equip_gadget = (suited && Gadget() == gadget) || (suited && Gadget() == 7)
    
    start = once(equip_gadget) 
    
    // Logic for detecting playing as Guest (except in room list in exempt parameter)
    playingAsGuest  = PlayerEnabled() == 1 && HeroSelected() == 0 
    allowed = always_false()
    exemptions = false
    for exempt in exempts
    {
        if (exempt != -1) {
            exemptions = true
            playingAsGuest  = playingAsGuest && Room() != exempt 
            allowed = allowed || PlayerEnabled() == 1 && HeroSelected() == 0 && SmallRoom() == exempt 
        }
    }
   
    // Cancel if in batcave or guest hero for too long
    cancel = OneGadgetAllow(gadget) &&
        never(BatCave()) &&
        never(BatMiteBoost() == 1) &&
        never(repeated(time,
            playingAsGuest &&
            never(HeroSelected() == 1))
        ) 
        
    // Submit at the end of the Mission
    submit = trigger_when(WonMission(Mission))
    
    // Use the timer to flash the trigger if the guest hero        
    flasher = HeroSelected() == 1 ||
        (PlayerEnabled() == 0 && PlayingGuest()) ||
        (PlayerEnabled() == 1 && HeroSelected() == 0 && Flasher() == 1)
         
    // Logic for flasher with allowed exemptions
    if (exemptions) 
        flasher = flasher || allowed
            
    return start && cancel && submit && flasher
}

// Make a list of reses for using any weapon but the allowed one
function OneGadgetAllow(gadget)
{
    weapons = []
    
    // Batrangs states
    if (gadget != 0)
    {
        array_push(weapons, WeaponUsed(0x0, 0x41))
        array_push(weapons, WeaponUsed(0x0, 0x44))
        array_push(weapons, WeaponUsed(0x7, 0x41))
        array_push(weapons, WeaponUsed(0x7, 0x44))
    }
    
    // Belt Sword states
    if (gadget != 1)
    {
        array_push(weapons, WeaponUsed(0x1, 0x45))
        array_push(weapons, WeaponUsed(0x1, 0x47))
    }
    
    // Flashbang states
    if (gadget != 2)
    {
        array_push(weapons, WeaponUsed(0x2, 0x4c))
    }
    
    // Smoke Pellet states
    if (gadget != 4)
    {
        array_push(weapons, WeaponUsed(0x4, 0x48))
        array_push(weapons, WeaponUsed(0x4, 0x4c))
    }
    
    // Bat Grenade states
    if (gadget != 5)
    {
        array_push(weapons, WeaponUsed(0x5, 0x4f))
        array_push(weapons, WeaponUsed(0x5, 0x4c))
    }
    
    // Barrier states
    if (gadget != 6)
    {
        barrierUsed = PlayerEnabled() == 1 && 
            HeroSelected() == 1 && 
            Gadget() == 0x6 &&
            BarrierPointer() != 0
        array_push(weapons, barrierUsed)
    }
    
    return all_of(weapons, a => never(a))
}

// Check if player used a weapon
function WeaponUsed(gadget, state)
{
    return PlayerEnabled() == 1 && 
        HeroSelected() == 1 && 
        Gadget() == gadget &&
        BatmanPointerNotNull() &&
        BatmanSuperState() == state
}

// -- Dictionaries -------------------------------------------------------------

// Dictionary for mission names
missions = {
    0x00: "Cape Carmine",
    0x01: "Gotham",
    0x02: "Atlantis",
    0x03: "Science Island",
    0x04: "London",
    0x05: "Dinosaur Island",
    0x06: "Space Lab",
    0x07: "Fear Dream",
    0x08: "Challenge",
    0x09: "Bomb Run",
    0x0a: "Batcave",
    0x0b: "Results"
}

// Names for the bat coin collection
batbucks = {
    0x00: "Joker’s Jackpot",
    0x01: "Gotham Billionair",
    0x02: "Outrageous Earnings",
    0x03: "Mad Science, Mad Riches",
    0x04: "Bangers and Cash",
    0x05: "Prehistoric Payday",
    0x06: "The Final Fortune",
    0x07: "Scared Rich",
}

// Story missions names reverse dictionary
story = {
    "Cape Carmine": 0x0,
    "Gotham": 0x1,
    "Atlantis": 0x2,
    "Science Island": 0x3,
    "London": 0x4,
    "Dinosaur Island": 0x5,
    "Space Lab": 0x6,
    "Fear Dream": 0x7
}

// Animation frame for each super team-up
supers = {
    "Plastic Man": 0x78,
    "Aquaman": 0x83,
    "Blue Beetle": 0x7a,
    "Green Arrow": 0x88,
    "Red Tornado": 0x7c,
    "Hal Jordan": 0x86,
}

// Value of each suit
suits = {
    "Default": 0x0,
    "Dark": 0x1,
    "Medieval": 0x2,
    "Rainbow": 0x3
}

// Currently equiped weapon
gadgets = {
    "Batarangs": 0x0,
    "Belt Sword": 0x1,
    "Flashbang": 0x2,
    "Smoke Pellet": 0x4,
    "Bat Grenade": 0x5,
    "Barrier": 0x6    
}

// Upgrades {name: [memory, max]}
upgrades = {
    "Batarangs": [Batarangs(), 3],
    "Armor": [Armor(), 5],
    "Shock Batarang": [ShockBatarang(), 1],
    "Belt Sword": [BeltSword(), 2],
    "Flashbangs": [Flashbangs(), 1],    
    "Smoke Pellets": [SmokePellets(), 1],
    "Barrier": [Barrier(), 1],
    "Bat Grenade": [BatGrenade() , 1],
    "Reflector": [Reflector() , 1],
    "Regeneration": [Regeneration() , 1],
    "Lightning Glove": [LightningGlove() , 1],
    "Item Radar": [ItemRadar() , 1],
    "Power Punches": [PowerPunches() , 1],
    "Rainbow Suit": [RainbowSuit() , 1],
    "Medieval Suit": [MedievalSuit() , 1],
    "Dark Suit": [DarkSuit() , 1]   
}

// Bosses {name: room ID}
bosses = {
    "Babyface": 0x09,
    "Catwoman": 0x0A,
    "Bane": 0x0B,
    "Bane II": 0x0C,
    "Gentleman Ghost": 0x0D,
    "Ocean Master": 0x0E,
    "Gorilla Grood": 0x0F,
    "Sentry Bot": 0x10,
    "Polaris": 0x11,
    "Morgan Le Fey": 0x12,
    "Clock King": 0x13,
    "Jarvis Kord": 0x14,
    "Black Mantra": 0x15,
    "Scream Queen": 0x16,
    "Scarecrow": 0x17
}

// Holograms {name: [array of holograms]}
holograms = {
    "Cape Carmen": [HologramBatman(), HologramJoker()],
    "Gotham": [HologramWildcat(), HologramKantana(), HologramBabyFace(), HologramBlackLightning(),
        HologramPlasticMan(),HologramMetamorpho(), HologramCatwoman()],
    "Atlantis": [HologramOceanMaster(), HologramGuyGardner(), HologramGorillaGrood(), 
        HologramBlackCanary(), HologramAquaman(), HologramMusicMeister()],
    "Science Island": [HologramJarvisKord(), HologramHuntress(), HologramRiddler(), 
        HologramElongatedMan(), HologramBlackManta(), HologramBlueBeetle()],
    "London": [HologramDeadman(), HologramGentlemanGhost(), HologramGreenArrow(),
        HologramBoosterGold(), HologramKiteman(), HologramBane()],
    "Dinosaur Island": [HologramFelixFaust(), HologramBronzeTiger(), HologramClockKing(),
        HologramRedTornado(), HologramTheFlash(), HologramMorganLeFey()],
    "Space Lab": [HologramGeneralKreegaar(), HologramJonahHex(), HologramAtom(), 
        HologramDoctorPolaris(), HologramBatMite(), HologramHalJordan()],
    "Fear Dream": [HologramScreamQueen(), HologramRobin(), HologramScarecrow(), HologramTheBrain()]
}

// Challenges {name: [array of challenges]}
 challenges = {
    "Battle": [GothamBattle(), LondonBattle(), AtlantisBattle(), SpaceLabBattle(), 
        DinosaurIslandBattle(), ScienceIslandBattle(), FearBattle()],
    "Boss Rush": [BossRushGotham(), BossRushLondon(), BossRushAtlantis(), BossRushSpaceLab(), 
        BossRushDinosaurIsland(), BossRushScienceIsland(), BossRushFear()],
    "Hero": [RedTornadoChallenge(), BlueBeetleChallenge(), GreenArrowChallenge(), 
        GreenLanternChallenge() , BatmanChallenge(), PlasticManChallenge(), AquamanChallenge()],
    "Code": [GothamCode1(), GothamCode2(), ScienceIslandCode1(), ScienceIslandCode2(), ProtobotCode()]
}

// -- Achievement Functions ------------------------------------------------------

// Progress Achievements
achievement("Snickery when Wet!","Complete Cape Carmine.", 2, CompleteTutorial(), type="progression")
achievement("The Cat Prowls at Night!","Complete Gotham.", 5, CompleteMission(story["Gotham"]), type="progression")
achievement("Aquaman's Ape Adventure!","Complete Atlantis.", 5, CompleteMission(story["Atlantis"]), type="progression")
achievement("Manta's Mechanical Mayhem!","Complete Science Island.", 5, CompleteMission(story["Science Island"]), type="progression")
achievement("Death by Lamplight!","Complete London.", 5, CompleteMission(story["London"]), type="progression")
achievement("Temporal Temple of Terror!","Complete Dinosaur Island.", 5, CompleteMission(story["Dinosaur Island"]), type="progression")
achievement("Space Plot of Polaris!","Complete Space Lab.", 5, CompleteMission(story["Space Lab"]), type="progression")
achievement("Cowl and Cape Fear!","Complete Fear Dream.", 10, CompleteMission(story["Fear Dream"]), type="win_condition")

// Deathless Achievements
achievement("Knightfall? Not Today!","Complete Gotham without dying.", 10, DeathlessMission(story["Gotham"]))
achievement("Unsinkable!","Complete Atlantis without dying.", 10, DeathlessMission(story["Atlantis"]))
achievement("Mad Science Survivor!","Complete Science Island without dying.", 10, DeathlessMission(3))
achievement("Fog-Free Escape!","Complete London without dying.", 10, DeathlessMission(story["London"]))
achievement("Jurassic Survivor!","Complete Dinosaur Island without dying.", 10, DeathlessMission(story["Dinosaur Island"]))
achievement("Cosmic Courage!","Complete Space Lab without dying.", 10, DeathlessMission(story["Space Lab"]))
achievement("Master of Fear!","Complete Fear Dream without dying.", 25, DeathlessMission(story["Fear Dream"]))


// Level challenges	
achievement("Plastic Paratrooper!","Complete the parachute section in Gotham without taking damage and collect 4 large bat coins.",
    10, DamagelessCollection(story["Gotham"], 0x08, 0x09, 0x04))
achievement("Deep Dive Daredevil!","Complete the diving section in Atlantis without taking damage and collect 3 large bat coins.",
    5, DamagelessCollection(story["Atlantis"], 0x02, 0x09, 0x03))
achievement("Elevator of Doom!","Complete the elevator section in Science Island without taking damage from mines and collect 3 large bat coins.",
    10, DamagelessCollection(story["Science Island"], 0x05, 0x06, 0x03, true))
achievement("Crush-Proof!","Complete the moving bone wall section in London without getting crushed or dying.",
    10, CrushlessCatacomb(story["London"], 0x8, 0x9))
achievement("Jurassic Pursuit!","Complete the T-Rex Chase section in Dinosaur Island without taking damage and collect 5 large bat coins.",
    10, DamagelessCollection(story["Dinosaur Island"], 0x04, 0x05, 0x05))
achievement("Efficient Architect!","Complete the sliding block section in the Space Lab creating 4 or less blocks.",
    10, EfficentBlocks(story["Space Lab"], 0x5, 0x6, 0x4))
achievement("Bat Bomb Blitz!","Complete the Bomb Run section in Fear Dream without taking damage.",  
    10, BatBombRun(0x9, 0x2))

// Play Primarily as Guest Hero Achievements
achievement("Elastic Escapade!", "Complete Gotham playing primarily as Plastic Man, "+
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["Gotham"], 0x2, 0x19, TimeSpan(0,20,0), [0x8]))   
    
achievement("Tide Turning Tale!","Complete Atlantis playing primarily as Aquaman, "+
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["Atlantis"], 0x2, 0x11, TimeSpan(0,20,0), [0x7,0x8]))
    
achievement("Bug Blaster!","Complete Science Island playing primarily as Blue Beetle, " +
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["Science Island"], 0x3, 0x0d, TimeSpan(0,20,0)))   
    
achievement("Quiver Full of Justice!","Complete London playing primarily as Green Arrow, " + 
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["London"], 0x2, 0x1a, TimeSpan(0,20,0)))
    
achievement("Gale-Force Guardian!","Complete Dinosaur Island playing primarily as Red Tornado, " +
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["Dinosaur Island"], 0x2, 0x10, TimeSpan(0,20,0)))
    
achievement("Cosmic Crusader!","Complete Space Lab playing primarily as Hal Jordan, " +
    "starts after teaming up and resets if Batman for 20s consecutively.",
    10, PlayAsGuest(story["Space Lab"], 0x2, 0x11, TimeSpan(0,20,0)))

// Play Primarily as Batman Achievements
achievement("Shadow of the Bat!","Complete Gotham playing primarily as Dark Suit Batman using only Batarangs, " + 
    "starts when equipping Batarangs on the first screen and resets if Plastic Man for 20s consecutively. " + 
    "Enter 3756448 on Batcomputer to unlock Dark Batsuit.", 10, 
    PlayAsBatman(story["Gotham"], 0x2, suits["Dark"], gadgets["Batarangs"], TimeSpan(0,20,0)))    
    
achievement("Primed for Justice!","Complete Atlantis playing primarily as Dark Suit Batman using only the Bat Grenade, " + 
    "starts when equipping Bat Grenade on the second screen and resets if Aquaman for 20s consecutively. "+
    "Enter 3756448 on Batcomputer to unlock Dark Batsuit.", 10, 
    PlayAsBatman(story["Atlantis"], 0x3, suits["Dark"], gadgets["Bat Grenade"], TimeSpan(0,20,0)))

achievement("Flash of Inspiration!","Complete Science Island playing primarily as Rainbow Suit Batman using only the Flashbang, " +
    "starts when equipping Flashbang on the second screen and resets if Blue Beetle for 20s consecutively. " +
    "Enter 7629863 on Batcomputer to unlock Rainbow Batsuit.", 10, 
    PlayAsBatman(story["Science Island"], 0x3, suits["Rainbow"], gadgets["Flashbang"], TimeSpan(0,20,0)))																							

achievement("Sword of the Dark Knight!","Complete London playing primarily as Medieval Suit Batman using only the Belt Sword, " +
    "starts when equipping Belt Sword on the first screen and resets if Green Arrow for 20s consecutively. " + 
    "Enter 5644863 on Batcomputer to unlock Medieval Batsuit.", 10, 
    PlayAsBatman(story["London"], 0x2, suits["Medieval"], gadgets["Belt Sword"], TimeSpan(0,20,0)))
    
achievement("From Camelot to Cretaceous!","Complete Dinosaur Island playing primarily as Medieval Suit Batman using only Smoke Pellets, " + 
    "starts when equipping Smoke Pellets on the first screen and resets if Red Tornado for 20s consecutively. " +
    "Enter 5644863 on Batcomputer to unlock Medieval Batsuit.", 10, 
    PlayAsBatman(story["Dinosaur Island"], 0x2, suits["Medieval"], gadgets["Smoke Pellet"], TimeSpan(0,20,0)))																								

achievement("The Brightest Day and the Blackest Knight!","Complete Space Lab playing primarily as Rainbow Suit Batman using only the Barrier, " +
    "starts when equipping Barrier on the first screen and resets if Hal Jordan for 20s consecutively. " +
    "Enter 7629863 on Batcomputer to unlock Rainbow Batsuit.", 10, 
    PlayAsBatman(story["Space Lab"], 0x2, suits["Rainbow"], gadgets["Barrier"], TimeSpan(0,20,0)))

// Holograms Achievements
achievement("Gotham’s Secrets!","Collect all the Holograms in Gotham.", 5, GroupHolograms("Gotham"))
achievement("Atlantis' Ancient Archives!","Collect all the Holograms in Atlantis.", 5, GroupHolograms("Atlantis"))
achievement("Scientific Discovery!","Collect all the Holograms in Science Island.", 5, GroupHolograms("Science Island"))
achievement("London’s Lost Legends!","Collect all the Holograms in London.", 5, GroupHolograms("London"))
achievement("Fossil Finder!","Collect all the Holograms in Dinosaur Island.", 5,GroupHolograms("Dinosaur Island"))
achievement("Cosmic Collector!","Collect all the Holograms in Space Lab.", 5, GroupHolograms("Space Lab"))

// Challenge Achievements
achievement("Fistful of Justice!","Complete all of the Battle Challenges.", 10, GroupChallenge("Battle"))
achievement("Boss of the Bosses!","Complete all of the Boss Rush Challenges.", 25, GroupChallenge("Boss Rush"))
achievement("Justice Served!","Complete all of the Hero Challenges.", 10, GroupChallenge("Hero"))
achievement("Codebreaker Crusader!","Complete all of the Code Challenges. "+
    "Enter 4846348, 7262348, and 6677686 on Batcomputer to unlock all five.", 
    10, GroupChallenge("Code"))

// Damageless Bosses
achievement("Last Laugh!","Defeat Joker in Cape Carmine without being knocked back or down.", 5, DamagelessJoker(story["Cape Carmine"], 0x3))
achievement("Babyface Breaker!","Defeat Babyface in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Babyface",false))
achievement("Purr-fect Precision!","Defeat Catwoman in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Catwoman",true))
achievement("Bane's Bane!","Defeat Bane the first time in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Bane",false))
achievement("Bane and Bane Again!","Defeat Bane a second time in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Bane II",false))
achievement("Ghostbuster!","Defeat Gentleman Ghost in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Gentleman Ghost",true))
achievement("Master of the Ocean!","Defeat Ocean Master in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Ocean Master",false))
achievement("Going Ape!","Defeat Gorilla Grood in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Gorilla Grood",true))
achievement("Sentry Shutdown!","Defeat Sentry Bot in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Sentry Bot",false))
achievement("Polar Opposite!","Defeat Polaris in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Polaris",true))
achievement("Magic Show Stopper!","Defeat Morgan Le Fey in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Morgan Le Fey",false))
achievement("Clocked Out!","Defeat Clock King in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Clock King",true))
achievement("Corporate Takedown!","Defeat Jarvis Kord in the Boss Rush challenge without taking damage.", 5, DamagelessChallenge("Jarvis Kord",false))
achievement("Sunken Menace!","Defeat Black Mantra in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Black Mantra",true))
achievement("Scream Silencer!","Defeat Scream Queen in the Boss Rush challenge without taking damage.", 10, DamagelessChallenge("Scream Queen",false))
achievement("Fearless Knight!","Defeat Scarecrow in the Boss Rush challenge without taking damage.", 25, DamagelessChallenge("Scarecrow",false))

// Upgrade Achievements
achievement("Batteries Not Included!","Fully unlock and purchase all of the upgrades.", 10, CompleteUpgrades())
achievement("Complete Crusader!","Complete every episode, every challenge, fully upgrade, and collect all holograms.", 25, CompleteCrusader())


// Super Move Achivements
achievement("Stretchin’ into Action!","Perform a Super Team-up move with Plastic Man.", 1, PlayerSuper("Plastic Man"))
achievement("Outrageous!","Perform a Super Team-up move with Aquaman.", 1, PlayerSuper("Aquaman"))
achievement("Scarab, Give me Firepower!","Perform a Super Team-up move with Blue Beetle.", 1, PlayerSuper("Blue Beetle"))
achievement("Justice Hits the Mark!","Perform a Super Team-up move with Green Arrow.", 1, PlayerSuper("Green Arrow"))
achievement("Initiating Cyclonic Offensive!","Perform a Super Team-up move with Red Tornado.", 1, PlayerSuper("Red Tornado"))
achievement("Green Lantern’s Light!","Perform a Super Team-up move with Hal Jordan.", 1, PlayerSuper("Hal Jordan"))

// Bat-mite Mode
achievement("Gotham's Miteiest Hero!","Activate Bat-mite Boost mode during a Mission. " + 
    "Warning! Bat-mite Boost mode will cancel active challenges and block other achievements in the set.", 0, BatmiteMode())

// -- Rich Presence -----------------------------------------------------------

// RP Mission Names
MissionNames = {
    0x00: "in Cape Carmine",
    0x01: "in Gotham",
    0x02: "in Atlantis",
    0x03: "on Science Island",
    0x04: "in London",
    0x05: "on Dinosaur Island",
    0x06: "in the Space Lab",
    0x07: "having a fear dream",
    0x08: "in the Challenge Room",
    0x09: "in the Bomb Run",
    0x0a: "in the Batcave"
}

// RP Rooms = Mission * 0x100 + Room ID
RoomNames ={
    0x0001: "celebrating a victory",
    0x0002: "taking the tutorial",
    0x0003: "battling the Joker",
    0x0101: "celebrating a victory",
    0x0102: "at the Gotham Central Depot",
    0x0103: "exploring the WayneTech Warehouse",
    0x0104: "battling Baby Face",
    0x0105: "on top of the Prowling Penthouses",
    0x0106: "sleuthing the silhouetted skylines",
    0x0107: "on top of the Prowling Penthouses",
    0x0108: "is using Plastic Man as a parachute",
    0x0109: "battling Catwoman",
    0x0201: "celebrating a victory",
    0x0202: "diving deep",
    0x0203: "exploring n the Atlantis Aqueduct",
    0x0204: "battling Ocean Master",
    0x0205: "at the Aquatic Arcway Bridge",
    0x0206: "enjoying the Atlantis seaside silhouette",
    0x0207: "riding Bat Ape",
    0x0208: "riding Bat Ape battling Gorilla Grood",
    0x0209: "at the Nautical Gateway",
    0x0301: "celebrating a victory",
    0x0302: "battling Jarvis Kord",
    0x0303: "exploring the scientific seashores",
    0x0304: "exploring the Salvage Sanctuary",
    0x0305: "surviving the Elevator of Doom",
    0x0306: "travelling through the Conveyor Corridor Complex",
    0x0307: "battling Black Manta",
    0x0401: "celebrating a victory",
    0x0402: "battling Bane",
    0x0403: "quelling a prison break at the Towering Thames Pen",
    0x0404: "battling Bane",
    0x0405: "exploring the Graveyard Gardens",
    0x0406: "exploring the Subterranean Silhouette Sanctum",
    0x0407: "exploring the Limestone Labyrinth",
    0x0408: "avoiding the Sliding Bonewalls",
    0x0409: "battling Gentleman Ghost",
    0x0501: "celebrating a victory",
    0x0502: "exploring the Prehistoric Primordial Preserve",
    0x0503: "enjoying the Whispering Waterfall",
    0x0504: "running from T-Rex Terror",
    0x0505: "exploring the Scorching Shrine Stronghold",
    0x0506: "battling Morgan Le Fey",
    0x0507: "exploring the Inferno Inner Sanctum",
    0x0508: "battling Clock King",
    0x0601: "celebrating a victory",
    0x0602: "exploring the Airlock Access",
    0x0603: "exploring the Trash Transformer Terminal",
    0x0604: "enjoying the Starry Silhouette Station",
    0x0605: "exploring the Orbital Observatory Outpost",
    0x0606: "battling Sentry Bot",
    0x0607: "exploring the Propulsion Power Platform",
    0x0608: "battling Doctor Polaris",
    0x0701: "celebrating a victory",
    0x0702: "exploring the Operating Room",
    0x0703: "exploring the Nightmare Realm",
    0x0704: "battling Scream Queen",
    0x0705: "battling the Scarecrow",
    0x0706: "battling the Brain",
    0x0802: "attempting the Gotham Battle",
    0x0803: "attempting the London Battle",
    0x0804: "attempting the Atlantis Battle",
    0x0805: "attempting the Space Lab Battle",
    0x0806: "attempting the Dinosaur Island Battle",
    0x0807: "attempting the Science Island Battle",
    0x0808: "attempting the Fear Dream Battle",
    0x0809: "attempting the Boss Rush Gotham vs Babyface",
    0x080A: "attempting the Boss Rush Gotham vs Catwoman",
    0x080B: "attempting the Boss Rush London vs Bane",
    0x080C: "attempting the Boss Rush London vs Bane",
    0x080D: "attempting the Boss Rush London vs Gentleman Ghost",
    0x080E: "attempting the Boss Rush Atlantis vs Ocean Master",
    0x080F: "attempting the Boss Rush Atlantis vs Gorilla Grood",
    0x0810: "attempting the Boss Rush Space Lab vs Sentry Bot",
    0x0811: "attempting the Boss Rush Space Lab vs Doctor Polaris",
    0x0812: "attempting the Boss Rush Dinosaur Island vs Morgan Le Fey",
    0x0813: "attempting the Boss Rush Dinosaur Island vs Clock King",
    0x0814: "attempting the Boss Rush Science Island vs Jarvis Kord",
    0x0815: "attempting the Boss Rush Science Island vs Black Mantra",
    0x0816: "attempting the Boss Rush Fear Dream vs Scream Queen",
    0x0817: "attempting the Boss Rush Fear Dream vs the Scarecrow",
    0x0818: "attempting the Boss Rush Fear Dream vs the Brain",
    0x0819: "attempting the Red Tornado Challenge",
    0x081A: "attempting the Blue Beetle Challenge",
    0x081B: "attempting the Green Arrow Challenge",
    0x081C: "attempting the Green Lantern Challenge",
    0x081D: "attempting the Batman Challenge",
    0x081E: "attempting the Plastic Man Challenge",
    0x081F: "attempting the Aquaman Challenge",
    0x0820: "attempting the Gotham Code 1",
    0x0821: "attempting the Gotham Code 2",
    0x0822: "attempting the Science Island Code 1",
    0x0823: "attempting the Science Island Code 2",
    0x0824: "attempting the Protobot Code Challenge",
    0x0902: "navigating the Mine Maze",
    0x0A00: "exploring the trophy room",
    0x0A01: "improving his gear at the Upgrade Station",
    0x0A02: "working on the Batcomputer",
    0x0A03: "selecting a Mission",
    0x0A04: "choosing a challenge",
    0x0A05: "hacking the Code Terminal",
    0x0A06: "contemplating reseting the saves",
    0x0A07: "hacking wireless communications",
    0x0A08: "The Cat Prowls at Night!",
    0x0A09: "Manta's Mechanical Mayhem!",
    0x0A0A: "Aquaman's Ape Adventure!",
    0x0A0B: "Temporal Temple of Terror!",
    0x0A0C: "Space Plot of Polaris!",
    0x0A0D: "Death by Lamplight!",
    0x0A0E: "Cowl and Cape Fear!",
    0x0A0F: "Snickery When Wet!",
}

// Selected Player = Player # * 0x10000 + Mission * 0x100 + Room ID
SelectedHeros = {
    0x0102: "Plastic Man",
    0x0103: "Plastic Man",
    0x0104: "Plastic Man",
    0x0105: "Plastic Man",
    0x0106: "Plastic Man",
    0x0107: "Plastic Man",
    0x0108: "Plastic Man",
    0x0109: "Plastic Man",
    0x0202: "Aquaman",
    0x0203: "Aquaman",
    0x0204: "Aquaman",
    0x0205: "Aquaman",
    0x0206: "Aquaman",
    0x0207: "Aquaman",
    0x0208: "Aquaman",
    0x0209: "Aquaman",
    0x0302: "Blue Beetle",
    0x0303: "Blue Beetle",
    0x0304: "Blue Beetle",
    0x0305: "Blue Beetle",
    0x0306: "Blue Beetle",
    0x0307: "Blue Beetle",
    0x0402: "Green Arrow",
    0x0403: "Green Arrow",
    0x0404: "Green Arrow",
    0x0405: "Green Arrow",
    0x0406: "Green Arrow",
    0x0407: "Green Arrow",
    0x0408: "Green Arrow",
    0x0409: "Green Arrow",
    0x0502: "Red Tornado",
    0x0503: "Red Tornado",
    0x0504: "Red Tornado",
    0x0505: "Red Tornado",
    0x0506: "Red Tornado",
    0x0507: "Red Tornado",
    0x0508: "Red Tornado",
    0x0602: "Hal Jordan",
    0x0603: "Hal Jordan",
    0x0604: "Hal Jordan",
    0x0605: "Hal Jordan",
    0x0606: "Hal Jordan",
    0x0607: "Hal Jordan",
    0x0608: "Hal Jordan",
    0x0802: "Aquaman",
    0x0803: "Hal Jordan",
    0x0804: "Bat Ape",
    0x0805: "Red Tornado",
    0x0806: "Blue Beetle",
    0x0807: "Green Arrow",
    0x0809: "Plastic Man",
    0x080A: "Plastic Man",
    0x080C: "Green Arrow",
    0x080D: "Green Arrow",
    0x080E: "Aquaman",
    0x080F: "Bat Ape",
    0x0810: "Hal Jordan",
    0x0811: "Hal Jordan",
    0x0812: "Red Tornado",
    0x0813: "Red Tornado",
    0x0814: "Blue Beetle",
    0x0815: "Blue Beetle",
    0x0819: "Red Tornado",
    0x081A: "Blue Beetle",
    0x081B: "Green Arrow",
    0x081C: "Hal Jordan",
    0x081E: "Plastic Man",
    0x081F: "Aquaman",
    0x0820: "Red Tornado",
    0x0821: "Green Arrow",
    0x0822: "Hal Jordan",
    0x0823: "Plastic Man",
    0x0824: "Protobot",
    0x10207: "Aquaman",
    0x10208: "Aquaman",
}

// RP when in game
rich_presence_conditional_display(InGame(), 
     "{0} is {1} {2} • Missions {3}/8 • Challenges {4}/26 • Upgrades {5}/20 • Holograms {6}/43",
    rich_presence_lookup("Heros", HeroSelected() * 0x10000 + Mission() * 0x100 + Room(), SelectedHeros, "Batman"),
    rich_presence_lookup("Rooms", Mission() * 0x100 + Room(), RoomNames, "is training"),
    rich_presence_lookup("Missions", Mission(), MissionNames, "in the Batcave"),
    rich_presence_value("MissionCount", MissionClearCount()),
    rich_presence_value("ChallengeCount", ChallengeClearCount()),
    rich_presence_value("UpgradeCount", UpgradeCount()),
    rich_presence_value("HologramCount", HologramCount())
 )

// RP any other time
rich_presence_display("Batman is brooding on the title screen")

// -- Leaderboards -----------------------------------------------------------

// Any% Speedrun
leaderboard(
    "No Time for Justice!",
    "Fastest time to Any % complete the game from a new save. Any % requires completing every Mission.",
    StartTutorialFresh(),
    BatMiteBoost() == 1,
    PunchBrain(),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// 100% Speedrun
leaderboard(
    "Complete Crusader!",
    "Fastest time to 100% complete the game from a new save. 100% requires all holograms, all upgrades, all challenges, and completing every Mission.",
    StartTutorialFresh(),
    BatMiteBoost() == 1,
    prev(CompleteCount()) < 97 && CompleteCount() == 97,
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// NG+ Speedrun
leaderboard(
    "The Bat Reborn!",
    "Fastest time to NG+ complete the game after previously completing all Missions. Starts on Cape Carmine and ends after completing every Mission again.",
    StartTutorialNewGamePlus(),
    BatMiteBoost() == 1,
    never(BatMiteBoost() == 1) && all_of(range(0, 6), n => once(WonMission(n))) && once(PunchBrain()),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Make mission speedruns
for mission in range(0,6)
{
    name = missions[mission]
    leaderboard(
        name + "!",
        "Fastest time to complete " + name,
        MissionTitle(mission),
        BatCave() || BatMiteBoost() == 1,
        WonMission(mission),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

// Last mission for speedrun
name = missions[7]
leaderboard(
    name + "!",
    "Fastest time to complete " + name,
    MissionTitle(7),
    BatCave() || BatMiteBoost() == 1,
    PunchBrain(),
    always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Make challenge speedruns [name, start, end]
challengesLB = [
    ["Gotham Battle!", 0x02, 0x02],
    ["London Battle!", 0x03, 0x03],
    ["Atlantis Battle!", 0x04, 0x04],
    ["Space Lab Battle!", 0x05, 0x05],
    ["Dinosaur Island Battle!", 0x06, 0x06],
    ["Science Island Battle!", 0x07, 0x07],
    ["Fear Dream Battle!", 0x08, 0x08],
    ["Boss Rush Gotham!", 0x09, 0x0A],
    ["Boss Rush London!", 0x0B, 0x0D],
    ["Boss Rush Atlantis!", 0x0E, 0x0F],
    ["Boss Rush Space Lab!", 0x10, 0x11],
    ["Boss Rush Dinosaur Island!", 0x12, 0x13],
    ["Boss Rush Science Island!", 0x14, 0x15],
    ["Boss Rush Fear Dream!", 0x16, 0x17],
    ["Red Tornado Challenge!", 0x19, 0x19],
    ["Blue Beetle Challenge!", 0x1A, 0x1A],
    ["Green Arrow Challenge!", 0x1B, 0x1B],
    ["Green Lantern Challenge!", 0x1C, 0x1C],
    ["Batman Challenge!", 0x1D, 0x1D],
    ["Plastic Man Challenge!", 0x1E, 0x1E],
    ["Aquaman Challenge!", 0x1F, 0x1F],
    ["Gotham Code 1!", 0x20, 0x20],
    ["Gotham Code 2!", 0x21, 0x21],
    ["Science Island Code 1!", 0x22, 0x22],
    ["Science Island Code 2!", 0x23, 0x23],
    ["Protobot Code Challenge!", 0x24, 0x24]
]

// Make every cHallenge
for data in challengesLB
{
    name = data[0]
    start = data[1]
    end = data[2]
    leaderboard(
        name,
        "Fastest time to complete " + name,
        InGame() && StartChallenge(start),
        LostChallenge() || ChallengeRoom(),
        WonChallenge(end),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

// Make mission money counts
for mission in range(0,6)
{
    leaderboard(
        batbucks[mission] + "!",
        "Most Bat Bucks collect in " + missions[mission],
        MissionTitle(mission),
        BatCave() || BatMiteBoost() == 1,
        WonMission(mission),
        BatCoinsCounter(120),
        lower_is_better = true,
        format = "VALUE"
    )
}

// Last mission for money count
leaderboard(
    batbucks[7] + "!",
    "Most Bat Bucks collect in " + missions[7],
    MissionTitle(7),
    BatCave() || BatMiteBoost() == 1,
    PunchBrain(),
    BatCoinsCounter(120),
    lower_is_better = true,
    format = "VALUE"
)