// Spider-Man
// #ID = 11319

// $0A568D: Chapter ID (US)
function ChapterID() => byte(0x0A568D)

// $0A568F: Level ID? (US)
function LevelID() => byte(0x0A568F)

// $0A5704: Costume Selected (US)
//          00 - Default
//          01 - Spider-Man 2099
//          02 - Symbiote Spider-Man
//          03 - Captain Universe
//          04 - Spider-Man Unlimited
//          05 - Amazing Bag-Man
//          06 - Scarlet Spider-Man
//          07 - Ben Reilly
//          08 - Quick-Change Spider-Man
//          09 - Peter Parker
function CostumeSelected() => byte(0x0A5704)

// $0B4F34: Various Flags (US)
//          01 - Menu
//          02 - Game Over
//          03 - Level Completed Flag
//          07 - Quit to Main Menu
//          08 - Level Restart
//          0A - Quit to Training
function Flags() => byte(0x0B4F34)

// $0B4F38: Level Time? (32-Bit) (US)
//          (Continues counting while paused)
function LevelTime() => dword(0x0B4F38)

// $0B4F40: Difficulty? (US)
//          00 - Kid Mode
//          01 - Easy
//          02 - Normal
//          03 - Hard
function Difficulty() => byte(0x0B4F40)

// $0B4F6C: Invincibility Cheat Boolean (00/01) (US)
function InvincibilityCheat() => byte(0x0B4F6C)

// $0B4F98: Unlimited Webbing Cheat Boolean (00/01) (US)
function UnlimitedWebbingCheat() => byte(0x0B4F98)

// $0B5268: Player Stats Pointer? (US)
//          +04 - X Coordinates
//          +08 - Y Coordinates
//          +0C - Z Coordinates
//          +DE - Health
//          +140 - Animation ID
//          +150 - Another Animation ID?
//          +1A8 - Cutscene Playing (01)
//          +5D8 - Webbing
//          +5DC - Web Cartridges
//          +5F0 - Spidey Armor Active
//          +5F8 - Spidey Armor Strength
//          +5EC - Magnesium Webbing (01)
//          +EE8 - Pointer to Current Enemy
//          +EEB - Target Type
//          +1014 - Max Health
function PlayerStatsPointer() => tbyte(0x0B5268)
function PlayerStatsNull() => dword(0x0B5268) == 0
function PlayerHealth() => byte(PlayerStatsPointer() + 0x0000DE)
function PlayerArmor() => byte(PlayerStatsPointer() + 0x0005F8)

// $0B563C: Boss Pointer (US)
//          +DE - Boss Health
//          +2F4 - Water Level (Spidey Vs Venom Again)
//          +40C - Number of switches remaining to deactivate Ock's shield
function BossPointer() => tbyte(0x0B563C)
function BossNull() => dword(0x0B563C) == 0
function BossSwitchesRemaining() => byte(BossPointer() + 0x00040C)

// No cheating conditions common for the entire set.
function NoCheats()
{
    // Pause if any the costume with special abilities are selected
    // ie. Spider-Man 2099, Symbiote Spider-Man, Captain Universe, Spider-Man Unlimited
    noSpecialCostumes = unless((CostumeSelected() >= 1 && CostumeSelected() <= 4))

    // Pause if the player is in kid mode (difficulty 0)
    noKidsMode = unless(Difficulty() == 0)

    // Pause if the player is cheating
    noCheats = unless(InvincibilityCheat() != 0) && 
        unless(UnlimitedWebbingCheat() != 0)

    return noSpecialCostumes && noKidsMode && noCheats
}

// ------------------------------------------------------------------------
// Function to build the "Example 5C:No Idea What You're In For" achievement
function DocOckBossFight(title, description, points)
{
    //  Trigger the achievement when the level is complete
    progress = trigger_when((Flags() != prev(Flags()) && Flags() == 3))

    // Add a hit at the beginning of the level
    start = measured(once(prev(LevelTime()) < 32))

    // Reset when Dr. Octopus heals twice
    noDocOckRegen = never(
        repeated(2, 
            BossPointer() == prev(BossPointer()) && 
            !BossNull() && 
            (prev(BossSwitchesRemaining()) == 0) &&
            BossSwitchesRemaining() == 4
        )
    )

    //  Reset if the player loses health
    spidyDamageless = never((!PlayerStatsNull() &&  PlayerHealth() < prev(PlayerHealth())))

    //  Reset if the player loses armor
    spidyNoArmor =never((!PlayerStatsNull() &&  PlayerArmor() < prev(PlayerArmor())))

    //  Reset if game flags are anything other than in game or level complete
    gameActive = never((Flags() != 0 && Flags() != 3))

    //  Reset if we are any level other than Spidey Vs. Dr. Octopus
    noLevelChange = never(prev(ChapterID()) != 56) &&
        never(prev(LevelID()) != 52)
    
    achievement(title, description, points, progress && start && noDocOckRegen && spidyDamageless &&
        spidyNoArmor && gameActive && noLevelChange && NoCheats())
}
DocOckBossFight("Example 5C: No Idea What You're In For", "Defeat Doc Ock without taking damage before his shield can regenerate for a second time", 25)