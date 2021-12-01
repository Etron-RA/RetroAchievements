// King of Fighters '97, The | King of Fighters '97 Plus, The
// #ID = 12031

// $0500: Game region
function Region() => byte(0x000500)
// $8170: P1 active character
function P1_Active_Character() => byte(0x008170)
// $8238: P1 health
function P1_Health() => byte(0x008238)
// $8370: P2 active character
function P2_Active_Character() => byte(0x008370)
// $A787: [8-bit] Fight Status
//        0x00 = None
//        0x01 = Starting next round
//        0x18 = Ready
//        0x19 = Round over
//        0x1a = Fighting
function FightStatus() => byte(0x00A787)
// $A798: Defeat bitstring 1
function Defeat() => word(0x00A798)
// $A7EB: Arena
function Arena() => byte(0x00A7EB)
// $A7F0: Round
function Round() => byte(0x00A7F0)
// $A847: AES Mode
function AES_Mode() => byte(0x00A847)
// $A84A: P1 1st character
function P1_1st_Character() => byte(0x00A84A)
// $A84B: P1 rounds lost
function P1_Rounds_Lost() => byte(0x00A84B)
// $A84C: P1 3rd character
function P1_3rd_Character() => byte(0x00A84C)
// $A84D: P1 2nd character
function P1_2nd_Character() => byte(0x00A84D)
// $A856: Special character bitstring
function SpecialCharacter() => word(0x00A856)
// $A85A: P2 rounds lost
function P2_Rounds_Lost() => byte(0x00A85A)
// $D938: BGM
function BGM() => byte(0x00D938)
// $D93A: SFX
function SFX() => byte(0x00D93A)
// $DBA1: AES Difficulty
function Difficulty() => byte(0x00DBA1)
// $FD83: Dipswitch
function Dipswitch() => bit7(0x00FD83) 
// $FDB6: P2 Status
//        
//        00=inactive
//        01=active
//        02=continue
//        03=game over
function P2_Status() => byte(0x00FDB6)
// $FDB7: P1 Status
//        
//        00=inactive
//        01=active
//        02=continue
//        03=game over
function P1_Status() => byte(0x00FDB7)
// $FE30: BIOS settings
function BIOS() => dword(0x00FE30)

CharacterLookup = {
    0x00: "Kyo Kusanagi",
    0x01: "Benimaru",
    0x02: "Goro Daimon",
    0x03: "Terry Bogard",
    0x04: "Andy Bogard",
    0x05: "Joe Hagashi",
    0x06: "Ryo Sakazaki",
    0x07: "Robert Garcia",
    0x08: "Yuri Sakazaki",
    0x09: "Leona Haidern",
    0x0a: "Ralf Jones",
    0x0b: "Clark Still",
    0x0c: "Athena Asamiya",
    0x0d: "Sie Kensou",
    0x0e: "Chin Gentsai",
    0x0f: "Chizuru Kagura",
    0x10: "Mai Shiranui",
    0x11: "King",
    0x12: "Kim Kaphwan",
    0x13: "Chang Koehan",
    0x14: "Choi Bounge",
    0x15: "Yashiro Nanakase",
    0x16: "Shermie",
    0x17: "Chris",
    0x18: "Ryuji Yamazaki",
    0x19: "Blue Mary",
    0x1a: "Billy Kane",
    0x1b: "Iori Yagami",
    0x1c: "Orochi Iori",
    0x1d: "Orochi Leona",
    0x1e: "Orochi",
    0x1f: "Shingo Yabuki",
    0xff: "Any"
}

// Reverse Lookup to lookup dictionaries by value and returns thekey or -1 if an error
// dictionary - the dictionary to lookup
// value - the value we using referencing to find a key
// returns the key or -1 if none found
function ReverseLookup(dictionary,value)
{
    result = -1
    for key in dictionary 
    {
        if(dictionary[key] == value) result = key
    }
    return result
}

// Tests if the user used a certain team to win the game
// f1 - the 1st fighter required in slot 1
// f2 - the 2nd fighter required in slot 2 ("Any" mean any fighter can be selected)
// f3 - the 3rd fighter required in slot 3 ("Any" mean any fighter can be selected)
// returns the generated code
function TeamWin(f1, f2, f3)
{
    // Get the ID of the character from the name
    fighter1 = ReverseLookup(CharacterLookup, f1)
    fighter2 = ReverseLookup(CharacterLookup, f2)
    fighter3 = ReverseLookup(CharacterLookup, f3)
    
    // Pause if the BIOS is AES and that we're in player 1 mode
    mode = unless(BIOS() != 0) && 
           //unless(Dipswitch()== 1) && 
           unless(P2_Status() != 0)// && 
           //unless(AES_Mode() != 1)
    
    // Set a hit if we are on the first round of the 1st fight
    // (Adds initial checks for the team later)
    start = FightStatus() == 0x1a && 
            Defeat() == 0 &&
            Round() == 0

    // Cancel if player 1 is inactive or game over occurs
    // (Adds resets for the team later) 
    cancel = never(P1_Status() == 0) && 
             never(P1_Status() == 3)
    
    // Achievement triggers when the player has won 8 fights, the CPU is the boss,
    // the background music is victory, and the sound effect is victory.
    submit = trigger_when(
                 repeated(8, prev(Defeat()) < Defeat()) && 
                 Arena() == 7 &&
                 P2_Active_Character() == 30 && 
                 BGM() == 14 && 
                 SFX() == 80
             )
    
    if (f2 == "Any" && f3 == "Any")
    {
        // Add checks to make sure fighter 1 is f1
        // and fighter 2/3 can be anyone
        start = once(
                    start &&
                    P1_1st_Character() == fighter1
                )
                
        cancel = cancel &&
                 never(FightStatus() == 0x1a && P1_1st_Character() != fighter1)
    }
    else if (f3 == "Any")
    {
        // Add checks to make sure fighter 1 is f1,
        // fighter 2 is f2, and fighter 3 can be anyone
        start = once(
                    start &&
                    P1_1st_Character() == fighter1 &&
                    P1_2nd_Character() == fighter2
                )
                
        cancel = cancel  &&
                 never(FightStatus() == 0x1a && P1_1st_Character() != fighter1) &&
                 never(FightStatus() == 0x1a && P1_2nd_Character() != fighter2)
    }
    else
    {
        // Add checks to make sure fighter 1 is f1,
        // fighter 2 is f2, and fighter 3 is f3
        start = once(
                     start &&
                     P1_1st_Character() == fighter1 &&
                     P1_2nd_Character() == fighter2 &&
                     P1_3rd_Character() == fighter3
                )   

        cancel = cancel &&
                 never(FightStatus() == 0x1a && P1_1st_Character() != fighter1) &&
                 never(FightStatus() == 0x1a && P1_2nd_Character() != fighter2) &&
                 never(FightStatus() == 0x1a && P1_3rd_Character() != fighter3)
    }
    
    // Combine everything together
    return mode &&
           start &&
           cancel &&
           submit
}


achievement(
    title = "Esaka Forever '97", description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Benimaru, 3-Goro (P1)", points = 10,
    id = 72563, badge = "78409", published = "2/25/2019 3:21:10 AM", modified = "7/18/2019 2:56:59 AM",
    trigger = TeamWin("Kyo Kusanagi", "Benimaru", "Goro Daimon")
)

achievement(
    title = "Rumbling on the City '97", description = "Finish the game playing only as a team (initial select): 1-Leona, 2-Ralf, 3-Clark (P1)", points = 10,
    id = 72564, badge = "78416", published = "2/25/2019 3:21:35 AM", modified = "7/18/2019 2:57:00 AM",
    trigger = TeamWin("Leona Haidern", "Ralf Jones", "Clark Still")
)

achievement(
    title = "Seoul Road '97", description = "Finish the game playing only as a team (initial select): 1-Kim, 2-Chang, 3-Choi (P1)", points = 10,
    id = 72565, badge = "78417", published = "2/25/2019 3:21:38 AM", modified = "7/18/2019 2:57:01 AM",
    trigger = TeamWin("Kim Kaphwan", "Chang Koehan", "Choi Bounge")
)

achievement(
    title = "Chestnuts and Forever '97", description = "Finish the game playing only as a team (initial select): 1-Terry, 2-Andy, 3-Joe (P1)", points = 10,
    id = 72566, badge = "78410", published = "2/25/2019 3:21:40 AM", modified = "7/18/2019 2:57:03 AM",
    trigger = TeamWin("Terry Bogard", "Andy Bogard", "Joe Hagashi")
)

achievement(
    title = "Psycho Soldier Remix 97", description = "Finish the game playing only as a team (initial select): 1-Athena, 2-Sie, 3-Chin (P1)", points = 10,
    id = 72567, badge = "78413", published = "2/25/2019 3:21:42 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Athena Asamiya", "Sie Kensou", "Chin Gentsai")
)

achievement(
    title = "Bloody '97", description = "Finish the game playing only as a team (initial select): 1-Yashiro, 2-Shermie, 3-Chris (P1)", points = 10,
    id = 72568, badge = "78415", published = "2/25/2019 3:21:43 AM", modified = "7/18/2019 2:57:07 AM",
    trigger = TeamWin("Yashiro Nanakase", "Shermie", "Chris")
)

achievement(
    title = "Kamikirimushi '97", description = "Finish the game playing only as a team (initial select): 1-Ryo, 2-Robert, 3-Yuri (P1)", points = 10,
    id = 72569, badge = "78411", published = "2/25/2019 3:21:45 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Ryo Sakazaki", "Robert Garcia", "Yuri Sakazaki")
)

achievement(
    title = "Fairy '97", description = "Finish the game playing only as a team (initial select): 1-Chizuru, 2-Mai, 3-King (P1)", points = 10,
    id = 72570, badge = "78414", published = "2/25/2019 3:21:47 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Chizuru Kagura", "Mai Shiranui", "King")
)

achievement(
    title = "C62 ~White Country Ver.2~ KOF97", description = "Finish the game playing only as a team (initial select): 1-Ryuji, 2-Mary, 3-Billy (P1)", points = 10,
    id = 72571, badge = "78418", published = "2/25/2019 3:21:49 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Ryuji Yamazaki", "Blue Mary", "Billy Kane")
)

achievement(
    title = "Cool JAM ~Arashi no Saxophone 3~ ", description = "Finish the game playing only as a team (initial select): 1-Iori (both other free of choice) (P1)", points = 10,
    id = 72572, badge = "78419", published = "2/25/2019 3:21:51 AM", modified = "7/18/2019 2:57:16 AM",
    trigger = TeamWin("Iori Yagami", "Any", "Any")
)

achievement(
    title = "Still Green", description = "Finish the game playing only as a team (initial select): 1-Shingo, 2-Kyo (3rd one free of choice) (P1)", points = 10,
    id = 72573, badge = "78420", published = "2/25/2019 3:21:53 AM", modified = "7/18/2019 2:57:17 AM",
    trigger = TeamWin("Shingo Yabuki", "Kyo Kusanagi", "Any")
)

achievement(
    title = "Control Crisis", description = "Finish the game playing only as a team (initial select): 1-Orochi Iori, 2-Orochi Leona (3rd one free of choice) (P1)", points = 10,
    id = 72574, badge = "78421", published = "2/25/2019 3:21:57 AM", modified = "7/18/2019 2:57:19 AM",
    trigger = TeamWin("Orochi Iori", "Orochi Leona", "Any")
)

achievement(
    title = "Rhythmic Hallucination", description = "Finish the game playing only as a team (initial select): 1-Orochi Yashiro, 2-Orochi Shermie, 3-Orochi Chris (P1)", points = 10,
    id = 72575, badge = "78422", published = "2/25/2019 3:21:59 AM", modified = "6/9/2020 2:39:11 AM",
    trigger = TeamWin("Yashiro Nanakase", "Shermie", "Chris")
)

achievement(
    title = "The Mix of Fighters '97 - Sacred Force", description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Iori, 3-Chizuru (P1)", points = 10,
    id = 72576, badge = "78423", published = "2/25/2019 3:22:01 AM", modified = "6/5/2020 12:59:47 AM",
    trigger = TeamWin("Kyo Kusanagi", "Iori Yagami", "Chizuru Kagura")
)

achievement(
    title = "The Mix of Fighters '97 - '94 Females", description = "Finish the game playing only as a team (initial select): 1-King, 2-Mai, 3-Yuri (P1)", points = 10,
    id = 72577, badge = "78424", published = "2/25/2019 3:22:02 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("King", "Mai Shiranui", "Yuri Sakazaki")
)

achievement(
    title = "The Mix of Fighters '97 - Old SNK", description = "Finish the game playing only as a team (initial select): 1-Ralf, 2-Clark, 3-Athena (P1)", points = 10,
    id = 72578, badge = "78425", published = "2/25/2019 3:22:05 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Ralf Jones", "Clark Still", "Athena Asamiya")
)

achievement(
    title = "The Mix of Fighters '97 - Sidekick", description = "Finish the game playing only as a team (initial select): 1-Benimaru, 2-Joe, 3-Kim (P1)", points = 10,
    id = 72579, badge = "78426", published = "2/25/2019 3:22:07 AM", modified = "6/10/2020 1:51:46 AM",
    trigger = TeamWin("Benimaru", "Joe Hagashi", "Kim Kaphwan")
)

achievement(
    title = "The Mix of Fighters '97 - Superstar", description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Terry, 3-Ryo (P1)", points = 10,
    id = 72580, badge = "78427", published = "2/25/2019 3:22:08 AM", modified = "6/10/2020 2:18:31 AM",
    trigger = TeamWin("Kyo Kusanagi", "Terry Bogard", "Ryo Sakazaki")
)

achievement(
    title = "The Mix of Fighters '97 - Distant Desire", description = "Finish the game playing only as a team (initial select): 1-Terry, 2-Mary, 3-Joe (P1)", points = 10,
    id = 72581, badge = "78428", published = "2/25/2019 3:22:10 AM", modified = "10/1/2019 6:49:02 PM",
    trigger = TeamWin("Terry Bogard", "Blue Mary", "Joe Hagashi")
)

achievement(
    title = "The Mix of Fighters '97 - Famitsu", description = "Finish the game playing only as a team (initial select): 1-Chang, 2-Choi, 3-Ryuji (P1)", points = 10,
    id = 72582, badge = "78429", published = "2/25/2019 3:22:12 AM", modified = "10/7/2019 8:06:01 PM",
    trigger = TeamWin("Chang Koehan", "Choi Bounge", "Ryuji Yamazaki")
)

achievement(
    title = "The Mix of Fighters '97 - Fiery Vigor", description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Billy, 3-Mai (P1)", points = 10,
    id = 72583, badge = "78430", published = "2/25/2019 3:22:15 AM", modified = "7/18/2019 2:57:35 AM",
    trigger = TeamWin("Kyo Kusanagi", "Billy Kane", "Mai Shiranui")
)

achievement(
    title = "Teammates Are Bored", description = "Beat a team without losing a round (P1)", points = 10,
    id = 72627, badge = "78475", published = "2/25/2019 3:26:23 AM", modified = "5/17/2020 2:40:20 AM",
    trigger = unless(BIOS() != 0) && 
              unless(P2_Status() != 0) &&
              P1_Rounds_Lost() == 0 && 
              P2_Rounds_Lost() == 3 && 
              Round() == 3 
)
