// Space Squadron
// #ID = 21613

// $00E2: [8-bit] Game Status
//        0x4 = Playing
//        0x6 = Dying
//        0xa = Waiting for player to start
//        0xc = Game Over
function GameStatus() => byte(0x0000E2)

// $00E4: [8-bit] Scoll Location (0x0 to 0x3f)
function ScollLocation() => byte(0x0000E4)

// $0258: [8-bit] Enemy State (every two bytes from 0x0268 to 0x026E)
//        bit 6 - 0 = alive, 1 = dead
//        bit 7 - 0 = travel right, 1 = travel left
function EnemyState(index) => byte(0x000258 + (index * 2))
function EnemySide(index) => bit7(0x000258 + (index * 2))
function EnemyDead(index) => bit6(0x000258 + (index * 2))
function EnemyDeath(index) => prev(EnemyDead(index)) < EnemyDead(index) && EnemySide(index) == 0

// $0259: [8-bit] Enemy Location (every two bytes from 0x0269 to 0x026F)
function EnemyLocation(index) => byte(0x000259 + (index * 2))

// $026E: [8-bit] Alien State
//        bit 6 - 0 = alive, 1 = dead
//        bit 7 - 0 = travel right, 1 = travel left
function AlienState() => byte(0x00026E)
function AlienDead() => bit6(0x00026E)

// $026F: [8-bit] Alien Location
function AlienLocation() => byte(0x00026F)

// $02B0: [8-bit] Player Status (0x0 = dead. 0x4 = alive)
function PlayerStatus() => byte(0x0002B0)

// $02D2: [16-bit] Ship Distance Travelled
function ShipDistanceTravelled() => word(0x0002D2)

// $02F1: [BCD] Score
function ScoreX000() => high4(0x0002F1)
function Score0X00() => low4(0x0002F1)
function Score00X0() => high4(0x0002F2)
function Score000X() => low4(0x0002F2)
function Score() {
    return ScoreX000() * 1000 +
        Score0X00() * 100 +
        Score00X0() * 10 +
        Score000X()
}

// $02F5: [8-bit] Lives
function Lives() => byte(0x0002F5)

// $02F6: [8-bit] Level (0 = Level 1, 1 = Level 2)
function Level() => byte(0x0002F6)

function NewGame()
{
    return Lives() == 2 &&
        prev(GameStatus()) != 0x4 &&
        GameStatus() == 0x4
}

function Death()
{
    return prev(Lives()) > Lives()
}

function GameOver()
{
    return Lives() == 0 &&
        prev(GameStatus()) != 0xC &&
        GameStatus() == 0xC
}

function CountMutants(count)
{
    enemies = []
    for index in range(0,10)
        array_push(enemies, EnemyDeath(index))
        
    return never(GameStatus() == 0xC) &&
           measured(
               tally(count, enemies),
               GameStatus() == 0x4
           )        
}


function CountAliens(count)
{
    enemies = [EnemyDeath(11)]
    return never(GameStatus() == 0xC) &&
           measured(
               tally(count, enemies),
               GameStatus() == 0x4
           )       
}

function CountAll(count)
{
    enemies = []
    for index in range(0,11)
        array_push(enemies, EnemyDeath(index))
        
    return never(GameStatus() == 0xC) &&
           measured(
               tally(count, enemies),
               GameStatus() == 0x4
           )         
}

function AnyHit()
{
    enemies = []
    for index in range(0,11)
        array_push(enemies, EnemyDeath(index))
        
    return GameStatus() == 0x4 &&
        any_of(enemies, e => e)
}


function HuntMutants(count)
{
    mutantDeaths = []
    for index in range(0,10)
        array_push(mutantDeaths, EnemyDeath(index))
        
    alienDeath = EnemyDeath(11)
    
    return never(GameStatus() == 0xC) &&
           never(alienDeath) &&
           measured(
               tally(count, mutantDeaths),
               GameStatus() == 0x4
           )  
}

function WorldPeace()
{
    mapped = []
    for index in range(0,0x3f)
        array_push(mapped, once(ScollLocation() == index))        
        
    deaths = []
    for index in range(0,11)
        array_push(deaths, EnemyDeath(index))
        
    return never(GameStatus() == 0xC) &&
        never(Death()) &&
        all_of(deaths, b => never(b)) && 
        measured(
            tally(0x40, mapped),
            GameStatus() == 0x4
        )           
}

function HighScore(highScore, level)
{
    lowScore = highScore - 10
    return prev(Score()) >= lowScore &&
        prev(Score()) < highScore &&
        measured(
            Score() >= highScore,
            GameStatus() == 0x4 && Level() == level
        )     
}

achievement("Stellar Initiate","Score 50 or more in level 1", 2, HighScore(50,1))
achievement("Celestial Voyager","Score 100 or more in level 1", 3, HighScore(100,1))
achievement("Galactic Master","Score 250 or more in level 1", 5, HighScore(250,1))
achievement("Lunar Novice","Score 25 or more in level 2", 2, HighScore(25,2))
achievement("Solar Ace","Score 50 or more in level 2", 3, HighScore(50,2))
achievement("Nebula Conqueror","Score 100 or more in level 2", 5, HighScore(100,2))
achievement("Mutant Exterminator","Kill 15 mutants in a row without dying or hitting an alien", 5, HuntMutants(15))
achievement("Alien Annihilator","Kill 5 aliens in a row without dying or hitting a mutant", 5, HuntMutants(count))
achievement("World Peace","Fly around the map looping once without dying or killing anything", 5, WorldPeace())
