// Panic Restaurant
// #ID = 1871

// $0019: menu = 1, start scene = 2, recipe menu = 4, respawn = 5, in=game = 6, stage clear = 8, slots = 9, game over = 13, ending = 16
function Menu() => byte(0x000019)

// $006F: position?
function Position() => byte(0x00006F)

// $008C: Stage Progression X
function StageProgressionX() => byte(0x00008C)

// $0094: Stage
function Stage() => byte(0x000094)

// $00AD: Boss Health
function BossHealth() => byte(0x0000AD)

// $00D6: Lives
function Lives() => byte(0x0000D6)

// $00D7: Health
function Health() => byte(0x0000D7)

// $00D8: Item
function Item() => byte(0x0000D8)

// $00D9: Score [Hex] [0-25500]
function ScoreHexByte() => byte(0x0000D9)
function ScoreHexWord() => word(0x0000D9)

// $00DA: Score [Hex] 01 = 25600
function ScoreHex01() => byte(0x0000DA)

// $00DF: Checkpoint
function Checkpoint() => byte(0x0000DF)

// $00E1: Coin
function Coin() => byte(0x0000E1)

// $03E6: minigame count
function MinigameCount() => byte(0x0003E6)

function DamagelessStage(stage, lastCheckpoint)
{
    start = once(
                Stage() == stage &&
                Checkpoint() == 0 &&
                prev(Menu()) == 5 &&
                Menu() == 6
            )
            
    cancel = never(Health() < prev(Health())) &&
             never(Lives() < prev(Lives())) &&
             never(Stage() != stage)
    
    submit = prev(Checkpoint()) == lastCheckpoint - 1 &&
             Checkpoint() == lastCheckpoint
    
    return start && cancel && submit
}

achievement(
    title = "Frozen Fritta", points = 10,
    description = "Reach Frozen Fritta Without Taking Damage - Stage 5",
    id = 5271, badge = "05464", published = "2014-02-19 10:34:15 AM", modified = "2020-07-04 7:25:32 PM",
    trigger = DamagelessStage(4, 4)
)
