// Scooby-Doo! Classic Creep Capers
// #ID = 10646

// $07D8B0: (16-bit) Master Code (v1.0)
//          Should be 0x9000 for v1.0
//          Useful for checking the version of the game
function MasterCodeV0() => word(0x07D8B0)

// $07D910: (16-bit) Master Code (v1.1)
//          Should be 0x9000 for Rev1
//          Useful for checking the version of the game
function MasterCodeV1() => word(0x07D910)

// $0BB088: (8-bit) Title Screen
//          00 - No
//          01 - Yes
function TitleV0() => byte(0x0BB088)

// $0BB0E8: (8-bit) Title Screen (v1.1)
//          00 - No
//          01 - Yes
function TitleV1() => byte(0x0BB0E8)

// $0BB468: (1-bit) Demo flag
function DemoV0() => byte(0x0BB468)

// $0BB4C8: (1-bit) Demo flag (v1.1)
function DemoV1() => byte(0x0BB4C8)

// $0BB970: (8-bit) Level Indicator
//          00 - What a Night for a Knight
//          01 - That's Snow Ghost
//          02 - A Tikie Scare is No Fair
//          03 - The Case of the Classic Creeps
function LevelV0() => byte(0x0BB970)

// $0BB9D0: (8-bit) Level Indicator (v1.1)
//          00 - What a Night for a Knight
//          01 - That's Snow Ghost
//          02 - A Tikie Scare is No Fair
//          03 - The Case of the Classic Creeps
function LevelV1() => byte(0x0BB9D0)

// $0C0B44: (32-bit) Equipped Item (changes each episode)
//          0xffffffff - nothing
//          Episode 1:
//          0 - handkerchief
//          1 - a fire extinguisher
//          2 - a shipping invoice
//          3 - an egyptian headdress
//          4 - velma's glasses
//          5 - a sandbag
//          6 - a paintbrush
//          7 - a canvas
//          8 - a tape recorder
//          9 - a lamp
//          a - the guard's keys
//          b - a coil of rope
//          Episode 2:
//          0 - some firewood
//          1 - a white sheet
//          2 - some coal
//          3 - a corset
//          4 - an invoice
//          5 - a bone
//          6 - some jewels
//          7 - a book on tibetan myths
//          8 - a shovel
//          9 - an iron key
//          Episode 3:
//          0 - a box of pearls with r. necros on the shipping label.
//          1 - a vine
//          2 - a grass mat
//          3 - some crackers
//          4 - some palm fronds
//          5 - an iron key
//          6 - a coin
//          7 - a coin
//          Episode 4:
//          0 - a newspaper
//          1 - a hook
//          2 - a net
//          3 - a handkerchief
//          4 - some tibetan chimes
//          5 - the witch doctor mask
//          6 - the snow ghost mask
//          7 - the black knight helmet
//          8 - a computer tape
//          9 - a painting
//          a - an oil can
//          b - a long chain
//          c - ladder rungs
//          d - a tiny fish
//          e - a large fish
//          f - a huge fish
//          10 - a music box
//          11 - an iron key
//          12 - a gold key
//          13 - a hammer
//          14 - a bug-sprayer
//          15 - a small gear
function ItemV0() => LevelV0() * 0x100 + byte(0x0C0B44)

// $0C0BA4: (32-bit) Equipped Item (v1.1) (changes each episode)
//          0xffffffff - nothing
//          Episode 1:
//          0 - handkerchief
//          1 - a fire extinguisher
//          2 - a shipping invoice
//          3 - an egyptian headdress
//          4 - velma's glasses
//          5 - a sandbag
//          6 - a paintbrush
//          7 - a canvas
//          8 - a tape recorder
//          9 - a lamp
//          a - the guard's keys
//          b - a coil of rope
//          Episode 2:
//          0 - some firewood
//          1 - a white sheet
//          2 - some coal
//          3 - a corset
//          4 - an invoice
//          5 - a bone
//          6 - some jewels
//          7 - a book on tibetan myths
//          8 - a shovel
//          9 - an iron key
//          Episode 3:
//          0 - a box of pearls with r. necros on the shipping label.
//          1 - a vine
//          2 - a grass mat
//          3 - some crackers
//          4 - some palm fronds
//          5 - an iron key
//          6 - a coin
//          7 - a coin
//          Episode 4:
//          0 - a newspaper
//          1 - a hook
//          2 - a net
//          3 - a handkerchief
//          4 - some tibetan chimes
//          5 - the witch doctor mask
//          6 - the snow ghost mask
//          7 - the black knight helmet
//          8 - a computer tape
//          9 - a painting
//          a - an oil can
//          b - a long chain
//          c - ladder rungs
//          d - a tiny fish
//          e - a large fish
//          f - a huge fish
//          10 - a music box
//          11 - an iron key
//          12 - a gold key
//          13 - a hammer
//          14 - a bug-sprayer
//          15 - a small gear
function ItemV1() => LevelV1() * 0x100 + byte(0x0C0BA4)

Levels = {
    00: "What a Night for a Knight",
    01: "That's Snow Ghost",
    02: "A Tikie Scare is No Fair",
    03: "The Case of the Classic Creeps"
}

Items = {
    0x000: "a handkerchief",
    0x001: "a fire extinguisher",
    0x002: "a shipping invoice",
    0x003: "an Egyptian headdress",
    0x004: "Velma's glasses",
    0x005: "a sandbag",
    0x006: "a paintbrush",
    0x007: "a canvas",
    0x008: "a tape recorder",
    0x009: "a lamp",
    0x00a: "the guard's keys",
    0x00b: "a coil of rope",
    0x100: "some firewood",
    0x101: "a white sheet",
    0x102: "some coal",
    0x103: "a corset",
    0x104: "an invoice",
    0x105: "a bone",
    0x106: "some jewels",
    0x107: "a book on Tibetan myths",
    0x108: "a shovel",
    0x109: "an iron key",
    0x200: "a box of pearls",
    0x201: "a vine",
    0x202: "a grass mat",
    0x203: "some crackers",
    0x204: "some palm fronds",
    0x205: "an iron key",
    0x206: "a coin",
    0x207: "a coin",
    0x300: "a newspaper",
    0x301: "a hook",
    0x302: "a net",
    0x303: "a handkerchief",
    0x304: "some Tibetan chimes",
    0x305: "the witch doctor mask",
    0x306: "the snow ghost mask",
    0x307: "the black knight helmet",
    0x308: "a computer tape",
    0x309: "a painting",
    0x30a: "an oil can",
    0x30b: "a long chain",
    0x30c: "ladder rungs",
    0x30d: "a tiny fish",
    0x30e: "a large fish",
    0x30f: "a huge fish",
    0x310: "a music box",
    0x311: "an iron key",
    0x312: "a gold key",
    0x313: "a hammer",
    0x314: "a bug-sprayer",
    0x315: "a small gear"
}

rich_presence_conditional_display(
    MasterCodeV0() == 0x9000 && TitleV0() == 0x1 && DemoV0() == 0x0,
    "Scooby and Shaggy are at the Title Screen"
)
rich_presence_conditional_display(
    MasterCodeV1() == 0x9000 && TitleV1() == 0x1 && DemoV1() == 0x0,
    "Scooby and Shaggy are at the Title Screen"
)
rich_presence_conditional_display(
    MasterCodeV0() == 0x9000 && TitleV0() == 0x0 && DemoV0() == 0x1,
    "Scooby and Shaggy are watching the demo"
)
rich_presence_conditional_display(
    MasterCodeV1() == 0x9000 && TitleV1() == 0x0 && DemoV1() == 0x1,
    "Scooby and Shaggy are watching the demo"
)
rich_presence_conditional_display(
    MasterCodeV0() == 0x9000 && TitleV0() == 0x0 && DemoV0() == 0x0,
    "Scooby and Shaggy are in episode {0} holding {1}",
    rich_presence_lookup("Levels", LevelV0(), Levels),    
    rich_presence_lookup("Items", ItemV0(), Items, "nothing")
)
rich_presence_conditional_display(
    MasterCodeV1() == 0x9000 && TitleV1() == 0x0 && DemoV1() == 0x0,
    "Scooby and Shaggy are in episode {0} holding {1}",
    rich_presence_lookup("Levels", LevelV1(), Levels),    
    rich_presence_lookup("Items", ItemV1(), Items, "nothing")
)
rich_presence_display("Unable to recognize rom version")