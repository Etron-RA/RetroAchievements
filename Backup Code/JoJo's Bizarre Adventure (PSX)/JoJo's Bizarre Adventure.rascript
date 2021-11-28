// JoJo's Bizarre Adventure
// #ID = 14415

// $066730: Unlockables Part 1
//          bit0 = tower of gray fight
//          bit1 = strength minigame
//          bit2 = robber soul (yellow temperance) unlocked
//          bit3 = fortune telling minigame
//          bit4 = character/close-up graphics
//          bit5 = arcade version artwork/illustrations
//          bit6 = justice minigame
//          bit7 = lovers minigame
// $066731: Unlockables Part 2
//          bit0 = sun minigame
//          bit1 = death 13 fight
//          bit2 = judgement minigame
//          bit3 = stage design artwork
//          bit4 = n'dool minigame
//          bit5 = sound & voice test
//          bit6 = character design artwork
//          bit7 = kan unlocked
// $066732: Unlockables Part 3
//          bit0 = music test
//          bit1 = secret file artwork
//          bit2 = darby's cat minigame
//          bit3 = darby's coin minigame
//          bit4 = darby's poker minigame
//          bit5 = hol horse & voing unlocked
//          bit6 = pet shop fight
//          bit7 = tenore sax minigame
// $066758: Jojo Ability Points [16-bit]
function JojoAP() => word(0x066758)
// $06676F: Seems to be related to ranks for each Story Mode episode [0=S, 1 = A, 2 = B, 5 = unplayed, etc.]
// $066770: Story Mode Episode 1 Jojo Points [40 or more = S rank?]
function Story1() => byte(0x066770)
// $06677D: Story Mode Episode 1 Best Vital (Health)
// $06677E: Story Mode Episode 1 Best Time
// $066790: Story Mode Episode 2 Jojo Points
// $0667B0: Story Mode Episode 3 Jojo Points
function Story3() => byte(0x0667B0)
// $0667D0: Story Mode Episode 4 Jojo Points
// $0667F0: Story Mode Episode 5 Jojo Points
// $066810: Story Mode Episode 6 Jojo Points
function Story6() => byte(0x066810)
// $066830: Story Mode Episode 7 Jojo Points
// $066850: Story Mode Episode 8 Jojo Points
// $066870: Story Mode Episode 9 Jojo Points
// $066890: Story Mode Episode 10 Jojo Points
// $0668B0: Story Mode Episode 11 Jojo Points
function Story11() => byte(0x0668B0)
// $0668D0: Story Mode Episode 12 Jojo Points
// $0668F0: Story Mode Episode 13 Jojo Points
// $066910: Story Mode Episode 14 Jojo Points
// $066930: Story Mode Episode 15 Jojo Points
function Story15() => byte(0x066930)
// $066950: Story Mode Episode 16 Jojo Points
// $066970: Story Mode Episode 17 Jojo Points
// $066990: Story Mode Episode 18 Jojo Points
// $0669B0: Story Mode Episode 19 Jojo Points
function Story19() => byte(0x0669B0)
// $0669D0: Story Mode Episode 20 Jojo Points
// $0669F0: Story Mode Episode 21 Jojo Points
// $066A10: Story Mode Episode 22 Jojo Points
// $066A30: Story Mode Episode 23 Jojo Points
// $066A50: Story Mode Episode 24 Jojo Points
// $066A70: Story Mode Episode 25 Jojo Points
function Story25() => byte(0x066A70)
// $066A90: Story Mode Episode 26 Jojo Points
// $066AB0: Story Mode Episode 27 Jojo Points
function Story27() => byte(0x066AB0)
// $066AD0: Story Mode Episode 28 Jojo Points
// $066AF0: Story Mode Episode 29 Jojo Points
// $066B10: Story Mode Episode 30 Jojo Points
function Story30() => byte(0x066B10)
// $066B30: Story Mode Episode 31 Jojo Points
// $066B50: Story Mode Episode 32 Jojo Points
// $066B70: Story Mode Episode 33 Jojo Points
// $066B90: Story Mode Episode 34 Jojo Points
// $066BB0: Story Mode Episode 35 Jojo Points
function Story35() => byte(0x066BB0)
// $066BD0: Story Mode Episode 36 Jojo Points [Shadow Dio vs Avdol]
function Story36() => byte(0x066BD0)
// $066BF0: Story Mode Episode 37 Jojo Points [Shadow Dio vs Kakyoin]
function Story37() => byte(0x066BF0)
// $066C10: Story Mode Episode 38 Jojo Points [Shadow Dio vs Polnareff]
function Story38() => byte(0x066C10)
// $066C30: Story Mode Episode 39 Jojo Points [Shadow Dio vs Hol Horse]
function Story39() => byte(0x066C30)
// $066c48: [8-bit] Game State (0x1,0x2 - Menu, 0x3 - Beginning Cut Scene, 0x4,0x5 - Fighting, 0x6 - Results Screen, 0x7 - Ending Cut Scene, 0x9 - Save Data, 0xb - Continue)
function GameState() => byte(0x066c48)
// $066C6C: Current Mode [0 = Story, 1 = Arcade, 2 = Versus, 3 = Training, 4 = Gallery, 5 = Book, 6 = Options]
function GameMode() => byte(0x066C6C)
Modes = {
	0: "Story", 
	1: "Arcade", 
	2: "Versus", 
	3: "Training",
	4: "Gallery",
	5: "Book",
	6: "Options"
}
// $06CE50: Difficulty [starts at 0]
function Difficulty() => byte(0x06CE50)
// $06CE54: Gauge Setting [1 is max]
function Gauge() => byte(0x06CE54)
// $06CE56: Shortcut Setting [1 = on]
function Shortcut() => byte(0x06CE56)
// $06D2D0: Arcade Progress [ending number is different per character]
//          8 = Jotaro, Avdol, Polnareff, Alessy, Kakyoin, Joseph, D'Bo, Chaca, Iggi, Hol Horse, Midler, Black Polnareff, Iced, New Kakyoin     
//          6  = Mahrahia, Dio, Pet Shop, Jojo, Shadow Dio, Kan, Hol Horse & Voing, Robber Soul
// $06D2D2: Round
function Round() => byte(0x06D2D4)
// $06D2D4: Character [P1]
//          0 = Jotaro
//          1 = Kakyoin
//          2 = Avdol
//          3 = Polnareff
//          4 = Joseph
//          5 = Iggi
//          6 = Alessy
//          7 = Chaca
//          8 = D'Bo
//          10 = Midler
//          11 = Dio
//          14 = Shadow Dio
//          15 = "Jojo"/Young Joseph
//          16 = Hol Horse
//          17 = Iced
//          18 = New Kakyoin
//          19 = Black Polnareff
//          20 = Pet Shop
//          22 = Mahrahia
//          23 = Hol Horse & Voing
//          24 = Robber Soul
//          25 = Kan
function Player1() => byte(0x06D2D4)
Characters = {   
	0: "Jotaro",
	1: "Kakyoin",
	2: "Avdol",
	3: "Polnareff",
	4: "Joseph",
	5: "Iggi",
	6: "Alessy",
	7: "Chaca",
	8: "D'Bo",
	9: "N'Dool",
	10: "Midler",
	11: "Dio",
	13: "Death 13",
	14: "Shadow Dio",
	15: "'Jojo'/Young Joseph",
	16: "Hol Horse",
	17: "Iced",
	18: "New Kakyoin",
	19: "Black Polnareff",
	20: "Pet Shop",
	21: "Tower of Gray",
	22: "Mahrahia",
	23: "Hol Horse & Voing",
	24: "Robber Soul",
	25: "Kan"
}
// $06D2E0: Timer [starts at 99 by default]
function Timer() => byte(0x06D2E0)
// $06D2E1: Timer [Milliseconds]
// $06d2f8: Score [32-bit] [displayed in hex, so 96800 = 96800 in hex]
function Score() => high4(0x06d2fb) * 10000000 +
					low4(0x06d2fb) * 1000000 +
					high4(0x06d2fa) * 100000 +
					low4(0x06d2fa) * 10000 +
					high4(0x06d2f9) * 1000 +
					low4(0x06d2f9) * 100 +
					high4(0x06d2f8) * 10 +
					low4(0x06d2f8)
// $08DE72: Could be current minigame? [needs checking]
// $0A36CC: [8-bit] Current Story Mode Episode (start at 0)
function Episode() => byte(0x0A36CC)
// $0AC7E9: how many times you hit the guy [tenore sax minigame, 4 = max]
// $0AC7F0: Tenore Sax minigame timer [16-bit, shows time in hex]
// $0AE702: Orangutan Health? [max = 90 in hex/144 in decimal]
// $0AF248: Timer [Orangutan Minigame, 99 = max]
// $0C36EC: Sun Minigame Timer [16-bit, shows time in hex]
// $0C36F4: Number of times you got the guy [Sun minigame, 4 = max]
// $0CD72F: Character [P2]
//          9 = blind dude (N'Dool)
//          13 = Death 13 [the baby's stand]
//          17 = ???
//          21 = Tower of Gray (beetle)
function Player2() => byte(0x0CD72F)
// $0D08EB: [P1] Current Combo
// 0xd6822: P2 Health [during fights with multiple enemies]?
// 0xd6826: P2 Health [during fights with multiple enemies]??
// 0xd7a86: P2 Health [during fights with multiple enemies]???

achievement(
    title = "Just Your Average High Schooler", description = "Get out of jail. [Complete Story Mode Episode 1]", points = 2,
    id = 80850, badge = "90097", published = "2019-08-19 2:24:57 AM", modified = "2019-09-14 7:10:04 PM",
    trigger = Story1() != 0 && prev(Story1()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "A Disgusting Stand For A Disgusting Person", description = "Defeat a beetle. [Complete Story Mode Episode 3]", points = 5,
    id = 80851, badge = "90098", published = "2019-08-19 2:25:00 AM", modified = "2019-09-09 12:10:01 AM",
    trigger = Story3() != 0 && prev(Story3()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Definitely A Bizarre Adventure", description = "Defeat an orangutan. [Complete Story Mode Episode 6]", points = 5,
    id = 80852, badge = "90099", published = "2019-08-19 2:25:05 AM", modified = "2019-10-08 9:11:01 AM",
    trigger = Story6() != 0 && prev(Story6()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "That Car....Is A Stand!", description = "Defeat a car. [Complete Story Mode Episode 11]", points = 5,
    id = 80853, badge = "90100", published = "2019-08-19 2:25:09 AM", modified = "2019-09-23 7:29:01 AM",
    trigger = Story11() != 0 && prev(Story11()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Here Comes The Choo Choo Train!", description = "Defeat a baby. [Complete Story Mode Episode 15]", points = 5,
    id = 80854, badge = "90101", published = "2019-08-19 2:25:15 AM", modified = "2019-09-23 7:29:01 AM",
    trigger = Story15() != 0 &&  prev(Story15()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "The Misadventures of Oingo & Boingo", description = "Defeat two enemies without doing anything. [Complete Story Mode Episode 19]", points = 5,
    id = 80855, badge = "90102", published = "2019-08-19 2:25:20 AM", modified = "2019-10-20 12:14:02 PM",
    trigger = Story19() != 0 &&  prev(Story19()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "How'd You Get That Juice!?!?", description = "Win a gamble. [Complete Story Mode Episode 25]", points = 5,
    id = 80856, badge = "90103", published = "2019-08-19 2:25:25 AM", modified = "2019-10-05 8:32:02 AM",
    trigger = Story25() != 0 &&  prev(Story25()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Best Doggo", description = "Defeat a bird. [Complete Story Mode Episode 27]", points = 5,
    id = 80857, badge = "90104", published = "2019-08-19 2:25:29 AM", modified = "2019-10-05 8:32:02 AM",
    trigger = Story27() != 0 &&  prev(Story27()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Serect Yer Kur!", description = "Outplay a gamer. [Complete Story Mode Episode 30]", points = 5,
    id = 80858, badge = "90105", published = "2019-08-19 2:25:34 AM", modified = "2019-10-20 12:14:02 PM",
    trigger = Story30() != 0 &&  prev(Story30()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Goodbye, My Friends!", description = "Defeat Dio. [Complete Story Mode Episode 35]", points = 25,
    id = 80859, badge = "90106", published = "2019-08-19 2:25:46 AM", modified = "2019-10-20 12:14:02 PM",
    trigger = Story35() != 0 &&  prev(Story35()) == 0 && GameMode() == 0 && GameState() == 6
)

achievement(
    title = "Dio The Edgehog", description = "Complete Story Mode Episodes 36-39.", points = 10,
    id = 80860, badge = "90107", published = "2019-08-19 2:25:52 AM", modified = "2019-10-20 12:14:02 PM",
    trigger = GameMode() == 0 && GameState() == 6 && Story36() != 0 && Story37() != 0 && Story38() != 0 && Story39() != 0 &&
		(prev(Story36()) == 0 || prev(Story37()) == 0 || prev(Story38()) == 0 || prev(Story39()) == 0)
)


// Story mode
rich_presence_conditional_display(
    GameState() > 2 && GameMode() == 0,
    "Story | {0} in Episode {1} | 💯 {2}",
    rich_presence_lookup("Characters", Player1(), Characters),
    rich_presence_value("Episode", Episode() + 1, "VALUE"),
    rich_presence_value("Number", JojoAP(), "VALUE")
)

// Arcade mode
rich_presence_conditional_display(
    GameState() > 2 && GameMode() == 1,
    "Arcade | {0} vs {1} | 💀 {2} | 🥊 {3} | ⏲ {4} | 💯 {5}",
    rich_presence_lookup("Characters", Player1(), Characters),
    rich_presence_lookup("Characters", Player2(), Characters),
    rich_presence_value("Number", Difficulty() + 1, "VALUE"),
	rich_presence_value("Number", Round() + 1, "VALUE"),
    rich_presence_value("Number", Timer(), "VALUE"),
    rich_presence_value("Number", Score(), "VALUE")
)
// Versus mode
rich_presence_conditional_display(
    GameState() > 2 && GameMode() == 2,
    "Versus | {0} vs {1} | 🥊 {2} | ⏲ {3} ",
    rich_presence_lookup("Characters", Player1(), Characters),
    rich_presence_lookup("Characters", Player2(), Characters),
	rich_presence_value("Number", Round() + 1, "VALUE"),
    rich_presence_value("Number", Timer(), "VALUE")
)
// Training mode
rich_presence_conditional_display(
    GameMode() == 3,
    "Training Mode | {0} vs {1}",
    rich_presence_lookup("Characters", Player1(), Characters),
    rich_presence_lookup("Characters", Player2(), Characters)
)
rich_presence_conditional_display(GameMode() == 4,"Looking at the Gallery")
rich_presence_conditional_display(GameMode() == 5,"Reading a Book")
rich_presence_conditional_display(GameMode() == 6,"Changing the Options")
rich_presence_display("In Menu")