// Akira
// #ID = 6119

// $0034: what button is pressed player 1
function ButtonPressed() => byte(0x000034)

// $0052: is the area you are in
function Area() => byte(0x000052)

// $002d: [8-bit] Game State (0 = Title, 1 = In Game, 2 = Menu)
function GameState() => byte(0x00002d)

// $033D: This just tells what option what have selected when given an option.
function Option() => byte(0x00033D)

AreaDictionary = {
    0x00: "fighting the Clowns",
    0x01: "in interrogation",
    0x02: "in custody",
    0x03: "outside the gymnasium",
    0x04: "at school",
    0x05: "looking for Tetsuo",
    0x06: "at the factories",
    0x07: "on the walkway",
    0x08: "at the sewers",
    0x09: "at the hideout",
    0x0a: "in the storage room",
    0x0b: "in the planning room",
    0x0c: "in the drainage system",
    0x0d: "riding a F.P.H.",
    0x0e: "in sublevel 8",
    0x0f: "in the nursery",
    0x10: "in a confinement room",
    0x11: "at the sewers",
    0x12: "in town",
    0x13: "at the Olympic Grounds",
    0x14: "at the tollbooth",
    0x15: "at the final showdown",
    0x16: "at a good ending",
    0x17: "at a bad ending",
    0x18: "at the credits"
}

// Ticket 50272: I got it after terrorist blow me up. I choose Yell->Tackle Take Cover. It's dead ending not jail.
//               RetroAchievements Hash: 3296794f3ceb04638e488adfc0459404
//               Emulator: RetroArch (F)
//               Emulator Version: 1.10.3
achievement(
    title = "Go to Jail", points = 1,
    description = "Bad Ending 1",
    id = 132224, badge = "144985", published = "2020-11-12 12:57:26 AM", modified = "2020-11-14 1:17:03 AM",
    trigger = prev(Area()) == 2 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "Dead?", points = 1,
    description = "Bad Ending 2",
    id = 132225, badge = "144985", published = "2020-11-12 12:57:32 AM", modified = "2020-11-14 1:17:08 AM",
    trigger = prev(Area()) == 6 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "Drugs are bad", points = 2,
    description = "Bad Ending 3",
    id = 132226, badge = "144985", published = "2020-11-12 12:57:36 AM", modified = "2020-11-14 1:17:11 AM",
    trigger = prev(Area()) == 7 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "No place is safe", points = 2,
    description = "Bad Ending 4",
    id = 132227, badge = "144985", published = "2020-11-12 12:57:40 AM", modified = "2020-11-14 1:17:13 AM",
    trigger = prev(Area()) == 8 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "Terrorist stopped?", points = 3,
    description = "Bad Ending 5",
    id = 132228, badge = "144985", published = "2020-11-12 12:57:46 AM", modified = "2020-11-14 1:17:15 AM",
    trigger = prev(Area()) == 9 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "Thought i was safe", points = 4,
    description = "Bad Ending 6",
    id = 132229, badge = "144985", published = "2020-11-12 12:57:49 AM", modified = "2020-11-14 1:17:18 AM",
    trigger = prev(Area()) == 12 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "Alternate time line", points = 5,
    description = "Alertnate Explination",
    id = 132230, badge = "144985", published = "2020-11-12 12:57:54 AM", modified = "2020-11-14 1:17:20 AM",
    trigger = prev(Area()) == 10 && Area() == 11 && ButtonPressed() == 0
)

achievement(
    title = "Talked to the Colonel", points = 4,
    description = "Bad ending 7",
    id = 132231, badge = "144985", published = "2020-11-12 12:58:08 AM", modified = "2020-11-14 1:23:52 AM",
    trigger = prev(Area()) == 15 && Area() == 23 && ButtonPressed() == 0
)

achievement(
    title = "This is how the manga ends", points = 10,
    description = "Short manga prelude",
    id = 132233, badge = "144985", published = "2020-11-12 1:29:34 AM", modified = "2020-11-14 1:17:27 AM",
    trigger = prev(Area()) == 22 && Area() == 24 && Option() == 1 && ButtonPressed() == 0
)

achievement(
    title = "More details how the manga ends", points = 10,
    description = "Long manga prelude",
    id = 132234, badge = "144985", published = "2020-11-12 1:29:39 AM", modified = "2020-12-15 11:37:37 PM",
    trigger = never(Area() == 0) && once(prev(Area()) == 21 && Area() == 22) && 
              prev(Area()) == 22 && Area() == 24 && Option() == 2 && ButtonPressed() == 0 && 
              byte(0x00020A) == 1
)

achievement(
    title = "This is how the movie ends", points = 10,
    description = "Movie Ending",
    id = 132235, badge = "144985", published = "2020-11-12 1:29:44 AM", modified = "2020-11-14 1:17:35 AM",
    trigger = prev(Area()) == 22 && Area() == 24 && Option() == 0 && unless((byte(0x000207) == 120
               && byte(0x00020B) == 128 && byte(0x00020F) == 120 && byte(0x000213) == 128 && byte(0x000519) == 128)) && 
              ButtonPressed() == 0
)

achievement(
    title = "Neo-Tokyo's end", points = 5,
    description = "Neo-Tokyo's Destruction bad ending",
    id = 132236, badge = "144985", published = "2020-11-12 1:29:49 AM", modified = "2020-11-14 1:17:38 AM",
    trigger = never(Area() == 0) && once(prev(Area()) == 19 && Area() == 22) && Area()
               == 24 && ButtonPressed() == 0
)

achievement(
    title = "Tetsuo Killed", points = 5,
    description = "A good ending but not the intended ending (Don't move!)",
    id = 132237, badge = "144985", published = "2020-11-12 1:29:55 AM", modified = "2022-08-15 2:12:47 PM",
    trigger = prev(Area()) == 21 && Area() == 22 && Option() == 0 && byte(0x000207) == 120 && 
              byte(0x00020B) == 128 && byte(0x00020F) == 120 && byte(0x000213) == 128 && byte(0x000519) == 128 && 
              ButtonPressed() == 0
)


rich_presence_conditional_display(GameState() == 0, "Kaneda is at the title screen!")
rich_presence_conditional_display(GameState() == 2, "Kaneda is at the main menu!")
rich_presence_display("Kaneda is {0}!", rich_presence_lookup("Area", Area(), AreaDictionary, "with Akira"))

