// Streets of Rage 2
// #ID = 3

// $FC02: Screen Mode- 0=segalogo, 4=pressstart, 8=demo, c=mainmenu, 10=options, 14=ingame, 18=charselect, 1c=ending, 24=introcards, 28=credits
function ScreenMode() => byte(0x00FC02)

// $FC50: Axel selected = 0xff
function AxelSelected() => word(0x00FC50)

// $FC51: Max selected = 0xff
function MaxSelected() => word(0x00FC51)

// $FC52: Skate selected = 0xff
function SkateSelected() => word(0x00FC52)

// $FC53: Blaze selected = 0xff
function BlazeSelected() => word(0x00FC53)

// Record a hit for each character active during gameplay
// This variation is the current core achievement
achievement(
    title = "Team Game", 
    description = "Play once as every character",
    points = 4,
    trigger = unless(ScreenMode() != 20) &&
        once(AxelSelected() == 255) && 
        once(BlazeSelected() == 255) &&
        once(MaxSelected() == 255) && 
        once(SkateSelected() == 255)
)

// Record a hit for each character active during gameplay
// This variation of the using add hits to support using measure
achievement(
    title = "Example 2A: Team Game", 
    description = "Play once as every character", 
    points = 0,
    trigger = measured(
                  tally(4,
                      once(ScreenMode() == 20 && AxelSelected() == 255),
                      once(ScreenMode() == 20 && MaxSelected() == 255),
                      once(ScreenMode() == 20 && SkateSelected() == 255),
                      once(ScreenMode() == 20 && BlazeSelected() == 255)
                  )
              )
)