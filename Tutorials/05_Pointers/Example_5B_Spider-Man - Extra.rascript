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
//          +1014 - Max Health
function PlayerStatsPointer() => tbyte(0x0B5268)
function PlayerTarget() => byte(prior(tbyte(PlayerStatsPointer() + 0x000EE8)) + 0x000126)

achievement(
    title = "I'm Trained for This", description = "Knock 25 lizardmen off the subway car", points = 10,
    id = 109226, badge = "119369", published = "2020-05-01 1:48:38 AM", modified = "2021-11-29 6:36:11 PM",
    trigger = measured(tally(25, (byte(prior(tbyte(PlayerStatsPointer() + 0x000EE8)) + 0x000126) !=
               prev(byte(prior(tbyte(PlayerStatsPointer() + 0x000EE8)) + 0x000126))) && byte(prior(tbyte(PlayerStatsPointer() +
               0x000EE8)) + 0x000126) == 21, byte(tbyte(PlayerStatsPointer() + 0x000EE8) + 0x000126) == 21)) && 
              never(ChapterID() != 53) && never(LevelID() != 53) && unless((CostumeSelected() >= 1 &&
               CostumeSelected() <= 4)) && unless(Difficulty() == 0) && unless(InvincibilityCheat() != 0) && 
              unless(UnlimitedWebbingCheat() != 0)
)
