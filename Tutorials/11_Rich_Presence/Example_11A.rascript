// Super Mario Bros.
// #ID = 1446

// $000E: Player's State:
function PlayerState() => byte(0x000e)

StatusLookup = {
    0: " [Loading]",
    1: " taking a vine warp",
    2: " entering a warp pipe",
    3: " entering a warp pipe",
    4: " 🚩",
    5: " [Stage Complete]",
    6: " [Game Over]",
    7: " [Entering Area]",
    9: " growing",
    0xA: " shrinking",
    0xB: " 💀",
    0xC: " powering up",
}

// $0704: Can swim flag
function Swimming() => byte(0x000704)

SwimmingLookup = {
    1: " swimming",
}

// $0756: Set to 01 when large mario, 02 when fire-flower mario
function PowerUp() => byte(0x000756)

PowerupLookup = {
    0: "Small",
    1: "Super",
    2: "Fire",
}

// $075C: Act Number (0 based)
function Act() => byte(0x00075C)

// $075F: World (0 based)
function World() => byte(0x00075F)

// $075A: Mario Number of Lives, set to ff when game over
function Lives() => byte(0x00075A)

// $0770: Gameplay Mode, 00=demo/menu, 01=playing,
//        02=end of level
//        NB. Set to 02 and wait to advance a world
function GameplayMode() => byte(0x000770)

ModeLookup = {
    0: "[Demo] ",
    2: "[World Complete] ",
}

// $0776: Pause: 00=normal 81=pausing 01=paused 80=unpausing
function Pause() => byte(0x000776)

PausedLookup = {
    0x81: "▌▌ ",
    0x80: "▌▌ ",
    1: "▌▌ ",
}

// $079f: Invulnerability Counter: starts at 23, counts to 0, 0=normal
function StarCounter() => byte(0x00079F)
function StarBitcount() => bit0(0x00079F) + bit1(0x00079F) + bit2(0x00079F) + bit3(0x00079F) + bit4(0x00079F) + bit5(0x00079F)

StarLookup = {
    5: "🌟 ",
    4: "🌟 ",
    3: "🌟 ",
    2: "🌟 ",
    1: "🌟 ",
}

// $07FC: Second Quest enabled = 01
function SecondQuest() => byte(0x0007FC)

QuestLookup = {
    0x0: "1st",
    0x1: "2nd",
}

// Example #11A - Rich Presence for Super Mario Bros.
rich_presence_display("{0}{1}{2}{3} Mario in {4}-{5}{6}{7}, 🚶:{8}, {9} Quest",
    rich_presence_lookup("Mode", GameplayMode(), ModeLookup),
    rich_presence_lookup("Paused", Pause(), PausedLookup),
    rich_presence_lookup("Star", StarBitcount(), StarLookup),
    rich_presence_lookup("Powerup", PowerUp(), PowerupLookup),
    rich_presence_macro("Number", World() + 1),
    rich_presence_macro("Number", Act() + 1),
    rich_presence_lookup("Swimming", Swimming(), SwimmingLookup),
    rich_presence_lookup("Status", PlayerState(), StatusLookup),
    rich_presence_macro("Number", Lives() + 1),
    rich_presence_lookup("Quest", SecondQuest(), QuestLookup)
)