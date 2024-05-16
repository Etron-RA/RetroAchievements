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

// $0E8658: [32-bit] In game (0x99a when in game)
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
function BatmanIFrames() => dword(Pointer(0x0E866C, [0x8, 0x590]))

function GuestHeroSuperState() => byte(Pointer(0x0E866C, [0xc, 0x1c]))
function GuestHeroAnimationState() => byte(Pointer(0x0E866C, [0xc, 0x6c]))
function GuestHeroCurrentHealth() => dword(Pointer(0x0E866C, [0xc, 0x164]))
function GuestHeroMaxHealth() => dword(Pointer(0x0E866C, [0xc, 0x168]))
function GuestHeroCutscene() => bit0(Pointer(0x0E866C, [0xc, 0x19c]))
function GuestHeroSprites() => dword(ointer(0x0E866C, [0xc, 0x590]))

// $0e8688 [32-bit] Challenge beat (0 = no, 1 = yes)
function ChallengeBeat() => dword(0x0E8688)

// $0E869A: [16-bit] Current Combo
//          Max displayed is 0x0063, 99 hits.
function Combo() => word(0x0E869A)

// $0E8714: [32-bit] Current Mission Room / Batcave menus
//          In a mission, this address starts at 0x02 and increments by 0x01 for every room.  Missions go to last level=>0x01=>0x0 upon completion.
function Room() => dword(0x0E8714)

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
//          Bit 2-4 = [3-bit] Armor upgrade (4 max)
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
//          0x11 = Meet Aqua Man
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

// Count of all the possible upgrades, challenges, missions, and holograms
function UpgradeCount() => Batarangs() + Armor() + ShockBatarang() + BeltSword() + bitcount(0x1909CD) + PowerPunches()
function MissionClearCount() => bitcount(0x1909CF)
function ChallengeClearCount() => bitcount(0x1909D4) + bitcount(0x1909D5) + bitcount(0x1909D6) + ScienceIslandCode2() + ProtobotCode()
function HologramCount() => bitcount(0x1909DC) + bitcount(0x1909DD) + bitcount(0x1909DE) + bitcount(0x1909DF) + bitcount(0x1909E0) + HologramTheBrain() + HologramBatman() + HologramJoker()

// Combine 
function Stage() => Mission() * 0x100 + Room()

// -- Game Events ---------------------------------------------------------

// In and out of game macros
function InGame() => GameState() == 0x99A
function TitleScreen() => GameState() != 0x99A

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
function WonChallenge() => ChallengeBeat() == 1 && ChangeRoom(0x08, 0x00)
function LostChallenge() =>  ChallengeBeat() == 0 && ChangeRoom(0x08, 0x00)

// Specail bat cave rooms
function BatCave() => ChangeRoom(0x0A, 0x00)
function ChallengeRoom() => ChangeRoom(0x0A, 0x04)
function UpgradeRoom() => InRoom(0x0A, 0x01)

// Bat-Mite Mode
function BatmiteMode() => InGame() && prev(BatMiteBoost()) < BatMiteBoost()

// Player has been damaged
function PlayerDamaged() {
    return BatmanPointerNotNull() &&
        prev(BatmanCurrentHealth()) < BatmanCurrentHealth()
}

// Player has been damaged in the bomb run
function PlayerIFrames() {
    return BatmanPointerNotNull() &&
        prev(BatmanIFrames()) == 0 &&
        BatmanIFrames() != 0
}

// Guest hero has been damaged
function GuestHeroDamaged() {
    return GuestHeroPointerNotNull() &&
        prev(GuestHeroCurrentHealth()) < GuestHeroCurrentHealth()
}

// Player has been damaged by a certain amount
function PlayerDamagedBy(damage) {
    return BatmanPointerNotNull() &&
        prev(BatmanCurrentHealth()) - damage == BatmanCurrentHealth()
}

// Player got crushed by the bone wall
function BoneWallCrush() => PlayerDamagedBy(0x32000)

// Player died
function PlayerDeath() => prev(DeathCounter()) < DeathCounter()

// Player collected a certain number of large bat coins.
function BatCoinsCollected(max)
{
    return repeated(
        max,
        BatCash() - 150 >= prev(BatCash()) &&
        BatCash() - 200 >= prev(BatCash())
    )
}

// Player has completed a mission
function CompleteMission(mission)
{
    // start on the 1st room of a mission
    start = once(InGame() &&
        StartMission(mission))
    
    // cancels if in the bat cave
    cancel = never(BatCave()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the mission
    submit = trigger_when(WonMission(mission))
    
    return start && cancel && submit
}

function DeathlessMission(mission)
{
    // Start at beginning of mission
    start = once(InGame() &&
        StartMission(mission))
    
    // Cancel if in the bat cave or dead
    cancel = never(BatCave()) &&
        never(PlayerDeath()) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the mission
    submit = trigger_when(WonMission(mission))
    
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

// Challenge to collect all the holograms in a mission
function GroupHolograms(hologram)
{
    group = holograms[hologram]
    max = length(group)
    return InGame() &&
        BatMiteBoost() == 0 &&
        sum_of(group, h => prev(h)) < max  &&
        measured(sum_of(group, h => h) == max)
}

// Challenge to preform a super
function PlayerSuper(superState)
{
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
function DamagelessCollection(mission, room, coins, autoscolling = false)
{
    // Start at room transistion
    start = once(InGame() && 
        ChangeRoom(mission, room))      
    
    // If true only count damage during the autoscroll
    damage = PlayerDamaged()
    if (autoscolling == true) 
        damage = LevelState() == 0x3 && PlayerDamaged()
    
    // Cancel if damaged or killed
    cancel = never(BatCave()) &&
        never(PlayerDeath()) && 
        never(damage) &&
        never(repeated(2, !InRoom(mission, room))) && 
        never(BatMiteBoost() == 1)
        
    // Measure how many bat coins are collect
    measure = TitleScreen() && measured(BatCoinsCollected(coins))
    
    // Trigger on room transisition
    trigger = trigger_when(BatCoinsCollected(coins) &&
        ChangeRoom(mission, room + 1))

    return start && cancel && (measure || trigger)
}

// Challenge to pass a room with getting crushed
function CrushlessCatacomb(mission, room)
{
    // Start at beginning of crushing block room
    start = once(InGame() && 
        ChangeRoom(mission, room))      
    
    // Cancel on death or being crush crushed
    cancel = never(BatCave()) &&
        never(PlayerDeath()) && 
        never(BoneWallCrush()) && 
        never(BatMiteBoost() == 1)
    
    // Trigger at end of room
    trigger = trigger_when(ChangeRoom(mission, room + 1))

    return start && cancel && trigger
}

// Challenge to pass a room using the minimum about of blocks
function EfficentBlocks(mission, room, max)
{
    // Start at beginning of sliding block room
    start = once(InGame() && 
        ChangeRoom(mission, room))      

    // Count how many blocks were made
    createMaxBlocks = GuestHeroPointerNotNull() &&
        repeated(max,
            prev(GuestHeroSuperState()) != 0x40 && GuestHeroSuperState() == 0x40
        )

    // Cancel if create too many blocks
    cancel = never(BatCave()) &&
        never(createMaxBlocks) &&
        never(repeated(2, !InRoom(mission, room))) && 
        never(BatMiteBoost() == 1)
        
    trigger = trigger_when(ChangeRoom(mission, room + 1))

    return start && cancel && trigger
}

// Challenge for a damageless bomb run
function BatBombRun(mission, room)
{ 
    // Start at beginning of bomb run
    start = once(InGame() && 
        ChangeRoom(mission, room))      

     // Cancel if in batcave or iFrame counter starts
    cancel = never(BatCave()) &&
        never(PlayerIFrames()) &&
        never(BatMiteBoost() == 1)
        
    // Submit at credits
    trigger = trigger_when(ChangeRoom(0xb, 0x2))

    return start && cancel && trigger
}

// Challenge to play primarily as guest
function PlayAsGuest(mission, room, state, time)
{
    // Start when you meet the guest hero
    start = once(InGame() && 
        InRoom(mission, room) &&
        LevelState() == state)  
        
    // Cancel if in batcave or batman for too long
    cancel = never(BatCave()) &&
        never(
            repeated(time, PlayerEnabled() == 1 && PlayingBatman()) &&
            never(PlayingGuest())
        ) && 
        never(BatMiteBoost() == 1)
        
    submit = trigger_when(WonMission(mission))
    
    // Use the timer to flash the trigger if batman
    flasher = PlayingGuest() ||
        (PlayerEnabled() == 0 && 
         PlayingBatman()) ||
        (PlayerEnabled() == 1 && 
         PlayingBatman() && 
         Flasher() == 1)
        
    return start && cancel && flasher && submit
}

// Challenge to play primarily as Batman with a certain suit and gadget
function PlayAsBatman(mission, room, suit, gadget, time)
{
    // Start if on the 1st room of the mission and both suit and gadget are selected
    start = once(InGame() && 
        InRoom(mission, room) &&
        Batsuit() == suit &&
        Gadget() == gadget) 
    
    // Cancel if in batcave or guest hero for too long
    cancel = never(BatCave()) &&
        never(Gadget() != gadget) &&
        never(
            repeated(time, PlayerEnabled() == 1 && PlayingGuest()) &&
            never(PlayingBatman())
        ) && 
        never(BatMiteBoost() == 1)
    
    // Submit at the end of the mission
    submit = trigger_when(WonMission(mission))
    
    // Use the timer to flash the trigger if the guest hero        
    flasher = PlayingBatman() ||
        (PlayerEnabled() == 0 && 
         PlayingGuest()) ||
        (PlayerEnabled() == 1 && 
         PlayingGuest() && 
         Flasher() == 1)
        
    return start && cancel && submit && flasher
}

// -- Dictionaries -------------------------------------------------------------
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

challenges = {
    0x02: "Gotham Battle",
    0x03: "London Battle",
    0x04: "Atlantis Battle",
    0x05: "Space Lab Battle",
    0x06: "Dinosaur Island Battle",
    0x07: "Science Island Battle",
    0x08: "Fear Dream Battle",
    0x09: "Boss Rush Gotham Babyface",
    0x0A: "Boss Rush Gotham Catwoman",
    0x0B: "Boss Rush London Bane",
    0x0C: "Boss Rush London Bane II",
    0x0D: "Boss Rush London Gentleman Ghost",
    0x0E: "Boss Rush Atlantis Ocean Master",
    0x0F: "Boss Rush Atlantis Gorilla Grood",
    0x10: "Boss Rush Space Lab Sentry Bot",
    0x11: "Boss Rush Space Lab Doctor Polaris",
    0x12: "Boss Rush Dinosaur Island Morgan Le Fey",
    0x13: "Boss Rush Dinosaur Island Clock King",
    0x14: "Boss Rush Science Island Jarvis Kord",
    0x15: "Boss Rush Science Island Black Mantra",
    0x16: "Boss Rush Fear Dream Scream Queen",
    0x17: "Boss Rush Fear Dream Scarecrow",
    0x18: "Boss Rush Fear Dream The Brain",
    0x19: "Red Tornado Challenge",
    0x1A: "Blue Beetle Challenge",
    0x1B: "Green Arrow Challenge",
    0x1C: "Green Lantern Challenge",
    0x1D: "Batman Challenge",
    0x1E: "Plastic Man Challenge",
    0x1F: "Aquaman Challenge",
    0x20: "Gotham Code 1",
    0x21: "Gotham Code 2",
    0x22: "Science Island Code 1",
    0x23: "Science Island Code 2",
    0x24: "Protobot Code Challenge"
}

supers = {
    0x78: "Plastic Man",
    0x83: "Aquaman",
    0x7a: "Blue Beetle",
    0x88: "Green Arrow",
    0x7c: "Red Tornado",
    0x86: "Hal Jordan",
}

// Upgrades {name: [memory, max]}
upgrades = {
    "Batarangs": [Batarangs(), 3],
    "Armor": [Armor(), 4],
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

// Progress Achievements
achievement("Snickery when Wet!","Complete Cape Carmine.", 2, CompleteMission(0))
achievement("The Cat Prowls at Night!","Complete Gotham.", 5, CompleteMission(1))
achievement("Aquaman's Ape Adventure!","Complete Atlantis.", 5, CompleteMission(2))
achievement("Manta's Mechanical Mayhem!","Complete Science Island.", 5, CompleteMission(3))
achievement("Death by Lamplight!","Complete London.", 5, CompleteMission(4))
achievement("Temporal Temple of Terror!","Complete Dinosaur Island.", 5, CompleteMission(5))
achievement("Space Plot of Polaris!","Complete Space Lab.", 5, CompleteMission(6))
achievement("Dark Knightmares Unleashed!","Complete Fear Dream.", 10, CompleteMission(7))

// Challenge Achievements
achievement("Trident of Justice!","Complete Gotham Battle.", 3, CompleteChallenge(0x02))
achievement("Lantern's Light over London!","Complete London Battle.", 3, CompleteChallenge(0x03))  
achievement("Ape Crusader of the Abyss!","Complete Atlantis Battle.", 3, CompleteChallenge(0x04)) 
achievement("Tornado in Orbit!","Complete Space Lab Battle.", 3, CompleteChallenge(0x05))  
achievement("Scarab Among the Fossils!","Complete Dinosaur Island Battle.", 3, CompleteChallenge(0x06))  
achievement("Quantum Precision Marksman!","Complete Science Island Battle.", 3, CompleteChallenge(0x07))  
achievement("Bat-nap Trap!","Complete Fear Dream Battle.", 3, CompleteChallenge(0x08))  
achievement("Feline Fatale's Farewell!","Complete Boss Rush Gotham.", 5, CompleteChallenge(0x09)) 
achievement("Ghostly Venom Smackdown!","Complete Boss Rush London.", 5, CompleteChallenge(0x0B))
achievement("Ape Avenger's Apex!","Complete Boss Rush Atlantis.", 5, CompleteChallenge(0x0E))
achievement("Magnetic Mastermind Meltdown!","Complete Boss Rush Space Lab.", 5, CompleteChallenge(0x10))
achievement("Chronicle of the Clockwork Conqueror!","Complete Boss Rush Dinosaur Island.", 5, CompleteChallenge(0x12))
achievement("Oceanic Overlord's Overthrow!","Complete Boss Rush Science Island.", 5,  CompleteChallenge(0x14))
achievement("Fearmonger's Frightsome Foe!","Complete Boss Rush Fear Dream.", 5, CompleteChallenge(0x16))
achievement("Red Tornado's Cyclonic Conquest!","Complete Red Tornado Challenge.", 3, CompleteChallenge(0x19))
achievement("Blue Beetle's Scarab Savior!","Complete Blue Beetle Challenge.", 3, CompleteChallenge(0x1A))
achievement("Green Arrow's Archer Ascendance!","Complete Green Arrow Challenge.", 3, CompleteChallenge(0x1B))
achievement("Green Lantern's Ringmaster Triumph!","Complete Green Lantern Challenge.", 3, CompleteChallenge(0x1C))
achievement("Batman's Gotham Guardian Glory!","Complete Batman Challenge.", 3, CompleteChallenge(0x1D))
achievement("Plastic Man's Elastic Enigma!","Complete Plastic Man Challenge.", 3, CompleteChallenge(0x1E))
achievement("Aquaman's Oceanic Triumph!","Complete Aquaman Challenge.", 3, CompleteChallenge(0x1F))
achievement("Gotham's Gale Guardians!","Complete Gotham Code 1, enter 4846348 into the Batcompter to unlock.", 3, CompleteChallenge(0x20))
achievement("Gotham's Bowstring Bravo!","Complete Gotham Code 2, enter 4846348 into the Batcompter to unlock.", 3, CompleteChallenge(0x21))
achievement("Lantern's Luminescent Legacy!","Complete Science Island Code 1, enter 7262348 into the Batcompter to unlock.", 3, CompleteChallenge(0x22))
achievement("Elastic Elevation Innovator!","Complete Science Island Code 2, enter 7262348 into the Batcompter to unlock.", 3, CompleteChallenge(0x23))
achievement("Orbital Outer Space Odyssey!","Complete Protobot Code, enter 6677686 into the Batcompter to unlock.", 3, CompleteChallenge(0x24))

// Holograms Achievements
achievement("Gotham's Hologram Hunter!","Collect all the Holograms in Gotham.", 5, GroupHolograms("Gotham"))
achievement("Atlantean Hologram Gatherer!","Collect all the Holograms in Atlantis.", 5, GroupHolograms("Atlantis"))
achievement("Island's Illustrious Illuminator!","Collect all the Holograms in Science Island.", 5, GroupHolograms("Science Island"))
achievement("London's Luminescen Locator!","Collect all the Holograms in London.", 5, GroupHolograms("London"))
achievement("Dino Dream's Dazzling Discovery!","Collect all the Holograms in Dinosaur Island.", 5, GroupHolograms("Dinosaur Island"))
achievement("Space Lab's Spectrum Surveyor!","Collect all the Holograms in Space Lab.", 5, GroupHolograms("Space Lab"))

// Super Move Achivements
achievement("Malleable Mayhem!","Perform a Super Team-up move with Plastic Man.", 1, PlayerSuper(0x78))
achievement("Titantic Tide-Turners!","Perform a Super Team-up move with Aqua Man.", 1, PlayerSuper(0x83))
achievement("Scarab and Shadow!","Perform a Super Team-up move with Blue Beetle.", 1, PlayerSuper(0x7a))
achievement("Bows and Bats!","Perform a Super Team-up move with Green Arrow.", 1, PlayerSuper(0x88))
achievement("Whirlwind Warriors!","Perform a Super Team-up move with Red Tornado.", 1, PlayerSuper(0x7c))
achievement("Green Light, Dark Knight!","Perform a Super Team-up move with Hal Jordan.", 1, PlayerSuper(0x86))

// Upgrade Achievements
achievement("Batrangs & Beyond!","Purchase all the Batrangs upgrades.", 2, ObtainUpgrade("Batarangs"))
achievement("Armored Avenger!","Purchase all the Bat Armor upgrades.", 2, ObtainUpgrade("Armor"))
achievement("Shock Specialist!","Purchase the Shock Batarang upgrade.", 1, ObtainUpgrade("Shock Batarang"))
achievement("Reflector Resilience!","Purchase the Reflector upgrade.", 1, ObtainUpgrade("Reflector"))
achievement("Healing Hope for Gotham!","Purchase the Regeneration upgrade.", 2, ObtainUpgrade("Regeneration"))
achievement("Lightning Glove Dynamo!","Purchase the Lightning Glove upgrade.", 1, ObtainUpgrade("Lightning Glove"))
achievement("Hammers of Justice!","Purchase the Power Punches upgrade.", 1, ObtainUpgrade("Power Punches"))

// Deathless Achievements
achievement("Gotham Guardian's Perfect Pursuit!","Complete Gotham without dying.", 10, DeathlessMission(0x2))
achievement("Atlantean Aquanaut's Voyage!","Complete Atlantis without dying.", 10, DeathlessMission(0x3))
achievement("Science Island's Innovator!","Complete Science Island without dying.", 10, DeathlessMission(0x4))
achievement("London Luminary's Odyssey!","Complete London without dying.", 10, DeathlessMission(0x5))
achievement("Dino Island's Fearless Explorer!","Complete Dinosaur Island without dying.", 10, DeathlessMission(0x6))
achievement("Space Lab's Astral Avenger!","Complete Space Lab without dying.", 10, DeathlessMission(0x7))
achievement("Fear Dream's Nightmare Nullifier!","Complete Fear Dream without dying.", 10, DeathlessMission(0x9))

// Level challenges
achievement("Plastic Man Paratrooper!","Complete the parachute section in Gotham without taking damage collecting X large bat coins.",
    5, DamagelessCollection(0x01, 0x08, 0x04))
achievement("Aquaman Deep Diver!","Complete the diving section in Atlantis without taking damage collecting X large bat coins.",
    5, DamagelessCollection(0x02, 0x02, 0x04))
achievement("Elevator of Doom!","Complete the elevator section in Science Island without destroying any mines collecting X large bat coins.",
    5, DamagelessCollection(0x03, 0x05, 0x04, true))
achievement("Bone-Crushing Gauntlet!","Complete the moving bone wall section in London without getting crushed or dying.",
    5, CrushlessCatacomb(0x4, 0x8))
achievement("Jurassic Pursuit!","Complete the T-Rex Chase section in Dinosaur Island without taking damage collecting X large bat coins.", 
    5, DamagelessCollection(0x5, 0x04, 0x04))
achievement("Efficient Emerald Escape!","Complete the sliding block section in the Space Lab creating 4 or less blocks.", 
    5, EfficentBlocks(0x6, 0x5, 0x4))
achievement("Bat Bomb Blitz!","Complete the Bomb Run section in Fear Dream without taking damage.", 
    5, BatBombRun(0x9, 0x2))

// Play Primarily as Guest Hero Achievements
achievement("Elastic Escapade!","Complete Gotham playing primarily as Plastic Man, starts after teaming up and resets if Batman for 30s consecutively.",
    5, PlayAsGuest(0x1, 0x2, 0x19, TimeSpan(0,30,0)))   
achievement("Tide Turning Tale!","Complete Atlantis playing primarily as Aqua Man, starts after teaming up and resets if Batman for 30s consecutively.",
    5, PlayAsGuest(0x2, 0x2, 0x11, TimeSpan(0,30,0)))
achievement("Bionic Byte Blaster!","Complete Science Island playing primarily as Blue Beetle, starts after teaming up and resets if Batman for 30s consecutively.", 
    5, PlayAsGuest(0x3, 0x3, 0x0d, TimeSpan(0,30,0)))   
achievement("Monarchs and Marksmanship!","Complete London playing primarily as Green Arrow, starts after teaming up and resets if Batman for 30s consecutively.",
    5, PlayAsGuest(0x4, 0x2, 0x1a, TimeSpan(0,30,0)))
achievement("Prehistoric Pneumatics!","Complete Dinosaur Island playing primarily as Red Tornado, starts after teaming up and resets if Batman for 30s consecutively.",
    5, PlayAsGuest(0x5, 0x2, 0x10, TimeSpan(0,30,0)))
achievement("Cosmic Crusader!","Complete Space Lab playing primarily as Hal Jordan, starts after teaming up and resets if Batman for 30s consecutively.",
    5, PlayAsGuest(0x6, 0x2, 0x11, TimeSpan(0,30,0)))
    
// Play Primarily as Batman Achievements
achievement("Shrouded in Darkness!","Complete Gotham playing primarily as Dark Suit Batman using only Batarangs equipped, " + 
    "starts when equipping Batarangs on the first screen and resets if Plastic Man for 30s consecutively. " + 
    "Enter 3756448 into the Batcompter to unlock Dark Batsuit.", 5, PlayAsBatman(0x2, 0x2, 0x1, 0x0, TimeSpan(0,30,0)))
achievement("Sword of Shadows!","Complete London playing primarily as Medieval Suit Batman using only the Belt Sword, " +
    "starts when equipping Belt Sword on the first screen and resets if Green Arrow for 30s consecutively. " + 
    "Enter 5644863 into the Batcompter to unlock Medieval Batsuit.", 5, PlayAsBatman(0x4, 0x2, 0x2, 0x1, TimeSpan(0,30,0)))
achievement("The Brightest Day and the Blackest Knight!","Complete Space Lab playing primarily as Rainbow Suit Batman using only the Barrier, " +
    "starts when equipping Barrier on the first screen and resets if Hal Jordan for 30s consecutively. " +
    "Enter 7629863 into the Batcompter to unlock Rainbow Batsuit.", 5, PlayAsBatman(0x6, 0x2, 0x3, 0x6, TimeSpan(0,30,0)))

// Bat-mite Mode
achievement("Gotham's Miteiest Hero!","Activate Bat-mite Boost mode during a mission. " + 
    "Warning! Bat-mite Boost mode will cancel active challenges and block other achievements in the set.", 0, BatmiteMode())

// -- Rich Presence -----------------------------------------------------------

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

// Rooms = Mission * 0x100 + Room ID
RoomNames ={
    0x0001: "celebrating a victory",
    0x0002: "taking the tutorial",
    0x0003: "battling the Joker",
    0x0101: "celebrating a victory",
    0x0102: "at the Gotham Central Depot",
    0x0103: "exploring the WayneTech Warehous",
    0x0104: "battling Baby Face",
    0x0105: "on top of the Prowling Penthouses",
    0x0106: "sleuthing the silhouetted skylines",
    0x0107: "on top of the Prowling Penthouses",
    0x0108: "is using Plastic Man as a parachute",
    0x0109: "battling Catwoman",
    0x0201: "celebrating a victory",
    0x0202: "diving deep",
    0x0203: "at the Nautical Gateway",
    0x0204: "exploring n the Atlantis Aqueduct",
    0x0205: "battling Ocean Master",
    0x0206: "at the Aquatic Arcway Bridge",
    0x0207: "enjoying the Atlantis seaside silhouette",
    0x0208: "riding Bat Ape",
    0x0209: "battling Gorilla Grood",
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
    0x0405: "exploring the Grove Graveyard Gardens",
    0x0406: "exploring the Subterranean Silhouette Sanctum",
    0x0407: "exploring the Limestone Labyrinth",
    0x0408: "avoiding the Sliding Bonewalls",
    0x0409: "breaking through the Bone Borough Barrier",
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
    0x0A03: "selecting a mission",
    0x0A04: "choosing a challenge",
    0x0A05: "hacking the Code Terminal",
    0x0A06: "contemplating reseting the saves",
    0x0A07: "hacking wireless communications",
    0x0A08: "The Cat Prowls at Night!",
    0x0A09: "Manta's Mechanical Mayhem!",
    0x0A0A: "Aquaman's Ape Adventure!",
    0x0A0B: "Temporal Temple of Terror!",
    0x0A0C: "Space Plot of Polaris!",
    0x0A0D: "Death by Lamplight!"
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
    0x0208: "Bat Ape",
    0x0209: "Bat Ape",
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
    0x0824: "Protobot"
}

rich_presence_conditional_display(InGame(), 
     "{0} is {1} {2} • Missions {3}/8 • Challenges {4}/26 • Upgrades {5}/21 • Holograms {6}/43",
    rich_presence_lookup("Heros", HeroSelected() * 0x10000 + Mission() * 0x100 + Room(), SelectedHeros, "Batman"),
    rich_presence_lookup("Rooms", Mission() * 0x100 + Room(), RoomNames, "is training"),
    rich_presence_lookup("Missions", Mission(), MissionNames, "in the Batcave"),
    rich_presence_value("MissionCount", MissionClearCount()),
    rich_presence_value("ChallengeCount", ChallengeClearCount()),
    rich_presence_value("UpgradeCount", UpgradeCount()),
    rich_presence_value("HologramCount", HologramCount())
 )

rich_presence_display("Batman is brooding on the title screen")

// -- Leaderboards -----------------------------------------------------------

// Make mission speedruns
for mission in range(0,7)
{
    name = missions[mission]
    leaderboard(
        name,
        "Fastest time to complete " + name,
        InGame() && StartMission(mission),
        BatCave() || BatMiteBoost() == 1,
        WonMission(mission),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

// Make challenge speedruns [name, start, end]
challengesLB = [
    ["Gotham Battle", 0x02, 0x02],
    ["London Battle", 0x03, 0x03],
    ["Atlantis Battle", 0x04, 0x04],
    ["Space Lab Battle", 0x05, 0x05],
    ["Dinosaur Island Battle", 0x06, 0x06],
    ["Science Island Battle", 0x07, 0x07],
    ["Fear Dream Battle", 0x08, 0x08],
    ["Boss Rush Gotham", 0x09, 0x0A],
    ["Boss Rush London", 0x0B, 0x0D],
    ["Boss Rush Atlantis", 0x0E, 0x0F],
    ["Boss Rush Space Lab", 0x10, 0x11],
    ["Boss Rush Dinosaur Island", 0x12, 0x13],
    ["Boss Rush Science Island", 0x14, 0x15],
    ["Boss Rush Fear Dream", 0x16, 0x17],
    ["Red Tornado Challenge", 0x19, 0x19],
    ["Blue Beetle Challenge", 0x1A, 0x1A],
    ["Green Arrow Challenge", 0x1B, 0x1B],
    ["Green Lantern Challenge", 0x1C, 0x1C],
    ["Batman Challenge", 0x1D, 0x1D],
    ["Plastic Man Challenge", 0x1E, 0x1E],
    ["Aquaman Challenge", 0x1F, 0x1F],
    ["Gotham Code 1", 0x20, 0x20],
    ["Gotham Code 2", 0x21, 0x21],
    ["Science Island Code 1", 0x22, 0x22],
    ["Science Island Code 2", 0x23, 0x23],
    ["Protobot Code Challenge", 0x24, 0x24]
]

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
        WonChallenge(),
        always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}