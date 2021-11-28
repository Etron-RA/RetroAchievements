// Ninja Combat
// #ID = 13798

// $0000: using for bios init check [32-bit]
//        non-zero value = bios being initialized
function BIOS() => dword(0x000000)
// $0631: 0x1= hallebarde
//        0x2= nunchakus
//        0x3= katana
//        0x4= metal bat
//        0x5= ittle axe
//        0x6= eventail
function Weapon() => byte(0x000631)
// $0633: Life
function Life() => byte(0x000633)
// $12B3: Last boss energy
function BossEnergy() => byte(0x0012B3)
// $12C6: post death timer end boss [16-bit]
//        0x035f = final boss dead (counts down to zero)
function BossDeathTimer() => word(0x0012C6)
// $1800: stage part
//        0x00 = first stage
//        0x1e = tutorial before first stage
//        0x45 = final boss
function Stage()=> byte(0x001800)
// $2403: Lives: 00 is game over
function Lives()=> byte(0x002403)
// $262F: Character:
//        00 is Joe
//        01 is Musashi
//        02 is Gembu
//        03 is Kagerow
function Character()=> byte(0x00262F)
// $FD8D: Dipswitch difficulty: 03 is default
function Difficulty()=> byte(0x00FD8D)

// Challenges
function NoContinues() => never(Lives() == 0x00)
function Deathless() => never(Lives() < prev(Lives()))
function Damageless() => never(prev(Life()) < Life())

// Stage Transistion
function Stage0() => prev(Stage()) == 0x1E && Stage() == 0x00
function Stage1() => prev(Stage()) == 0x03 && Stage() == 0x0A
function Stage2() => prev(Stage()) == 0x0E && Stage() == 0x14
function Stage3() => prev(Stage()) == 0x18 && Stage() == 0x1E
function Stage4() => prev(Stage()) == 0x27 && Stage() == 0x28
function Stage4_1() => prev(Stage()) == 0x1E && Stage() == 0x1F
function Stage4_2() => prev(Stage()) == 0x20 && Stage() == 0x21 
function Stage5() => prev(Stage()) == 0x31 && Stage() == 0x32
function Stage6() =>  Stage() == 0x45 && prev(BossDeathTimer()) == 0x35F && BossDeathTimer() == 0x35E

// Check if play with with the passed charactor
function CharacterWin(charactor)
{
	return Difficulty() == 0x03 &&
		   Character() == charactor &&
		   Stage6()
}

achievement(
    title = "Weapons Expert", description = "Use every weapon during your play.", points = 5,
    id = 150201, badge = "168037", published = "4/18/2021 1:39:56 PM", modified = "10/26/2021 6:59:39 PM",
    trigger = Difficulty() == 0x03 && 
			  tally(6, 
				 once(Weapon() == 0x01) && 
				 once(Weapon() == 0x02) &&
				 once(Weapon() == 0x03) &&
				 once(Weapon() == 0x04) &&
				 once(Weapon() == 0x05) && 
                 once(Weapon() == 0x06)
		      )
			  && never(BIOS() != 0x00)
)

achievement(
    title = "1 C.C.", description = "Complete the game without getting a Game Over.", points = 25,
    id = 150214, badge = "167976", published = "4/18/2021 1:41:12 PM", modified = "10/26/2021 8:37:38 PM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage0()) &&
			  trigger_when(Stage6()) &&
			  NoContinues()
)

achievement(
    title = "Stage 6 - Perfect", description = "Complete stage 6 without losing a life.", points = 10,
    id = 150213, badge = "168035", published = "4/18/2021 1:41:06 PM", modified = "4/19/2021 5:32:18 PM",
	trigger = Difficulty() == 0x03 &&
			  once(Stage5()) &&
			  trigger_when(Stage6()) &&
			  Deathless()
)

achievement(
    title = "Stage 5 - Perfect", description = "Complete stage 5 without losing a life.", points = 10,
    id = 150212, badge = "168034", published = "4/18/2021 1:41:02 PM", modified = "4/19/2021 11:31:40 AM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage4()) &&
			  trigger_when(Stage5()) &&
			  Deathless()
)

achievement(
    title = "Stage 4 - Perfect", description = "Complete stage 4 without losing a life.", points = 10,
    id = 150211, badge = "168033", published = "4/18/2021 1:40:57 PM", modified = "4/19/2021 11:31:26 AM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage3()) &&
			  trigger_when(Stage4()) &&
			  Deathless()
)

achievement(
    title = "Stage 3 - Perfect", description = "Complete stage 3 without losing a life.", points = 10,
    id = 150210, badge = "168032", published = "4/18/2021 1:40:53 PM", modified = "6/11/2021 4:18:57 PM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage2()) &&
			  trigger_when(Stage3()) &&
			  Deathless()
)

achievement(
    title = "Stage 2 - Perfect", description = "Complete stage 2 without losing a life.", points = 10,
    id = 150209, badge = "168031", published = "4/18/2021 1:40:48 PM", modified = "4/19/2021 11:31:03 AM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage1()) &&
			  trigger_when(Stage2()) &&
			  Deathless()
)

achievement(
    title = "Stage 1 - Perfect", description = "Complete stage 1 without losing a life.", points = 10,
    id = 150208, badge = "168030", published = "4/18/2021 1:40:33 PM", modified = "4/19/2021 11:30:49 AM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage0()) &&
			  trigger_when(Stage1()) &&
			  Deathless()
)

achievement(
    title = "Mechanical Nightmare", description = "Get through the mechanical part of stage 4 without being hit.", points = 5,
    id = 150207, badge = "167986", published = "4/18/2021 1:40:29 PM", modified = "4/18/2021 1:40:29 PM",
    trigger = Difficulty() == 0x03 &&
			  once(Stage4_1()) &&
			  trigger_when(Stage4_2()) &&
			  Damageless()
)

achievement(
    title = "Butterfly Effect", description = "Complete the game with Kagerow.", points = 10,
    id = 150195, badge = "167975", published = "4/18/2021 1:39:23 PM", modified = "4/18/2021 1:39:23 PM",
    trigger = CharacterWin(0x03)
)

achievement(
    title = "Fists of Fury", description = "Complete the game with Gembu.", points = 10,
    id = 150194, badge = "167974", published = "4/18/2021 1:39:18 PM", modified = "4/18/2021 1:39:18 PM",
    trigger = CharacterWin(0x02)
)

achievement(
    title = "Katana Master", description = "Complete the game with Musashi.", points = 10,
    id = 150193, badge = "167973", published = "4/18/2021 1:39:13 PM", modified = "4/18/2021 1:39:13 PM",
    trigger = CharacterWin(0x01)
)

achievement(
    title = "Shuriken Master", description = "Complete the game with Joe.", points = 10,
    id = 150192, badge = "167972", published = "4/18/2021 1:39:09 PM", modified = "10/26/2021 8:40:35 PM",
    trigger = CharacterWin(0x00)
)

achievement("Stage 0", "Stage 0", 0, Stage() == 0x00)
achievement("Stage 1", "Stage 1", 0, Stage() == 0x0A)
achievement("Stage 2", "Stage 2", 0, Stage() == 0x14)
achievement("Stage 3", "Stage 3", 0, Stage() == 0x1E)
achievement("Stage 4", "Stage 4", 0, Stage() == 0x28)
achievement("Stage 4-1", "Stage 4-1", 0, Stage() == 0x1F)
achievement("Stage 4-2", "Stage 4-2", 0, Stage() == 0x21)
achievement("Stage 5", "Stage 5", 0, Stage() == 0x32)
achievement("Stage 6", "Stage 6", 0, Stage() == 0x45)