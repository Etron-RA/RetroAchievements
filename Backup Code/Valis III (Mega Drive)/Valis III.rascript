// Valis III
// #ID = 2268

// $C0A8: d(0-9) stage select page midle digit
function MiddleDigit() => byte(0x00C0A8)
// $C0AA: d(0-9) stage select page last digit
function LastDigit() => byte(0x00C0AA)
// $D708: 32bit looks like stable hit for SEGA logo
function SegaLogo() => dword(0x00D708)
// $D904: Area X
// $F3FB: Input
// $F414: Stages
function Stage() => byte(0x00F414)
// $F444: Power extra
// $F448: Health
// $F44A: MP
// $F44C: MP
// $F450: Power up
// $F452: Spells
// $F458: Lives
// $F494: When get sword valis ?
// $F4A2: Valis hurt
// $F4A8: Boss die

function Progression(stage)
{
    return prev(Stage()) == stage && 
           Stage() == stage + 1 && 
           once(SegaLogo() == 241176192) && 
           never(LastDigit() == 208) 
    
}

function Fixed()
{
    achievement(
        title = "Asura", description = "Defeat Asura", points = 10,
        id = 4994, badge = "05598", published = "2014-02-12 7:56:35 PM", modified = "2021-11-15 9:59:27 AM",
        trigger = Progression(19)                  
    )
}
Fixed()

function Original()
{
    achievement(
        title = "Act 1 - 2", description = "Reach Act 1 - 2", points = 3,
        id = 4969, badge = "05608", published = "2014-02-12 7:54:59 PM", modified = "2021-02-10 2:45:44 AM",
        trigger = byte(0x00F414) == 4 && never(byte(0x00C0AA) == 208) && once(dword(0x00D708) == 241176192)
    )

    achievement(
        title = "Fire", description = "Get Fire Spell", points = 2,
        id = 4997, badge = "05590", published = "2014-02-12 7:56:46 PM", modified = "2021-02-10 2:45:45 AM",
        trigger = bit0(0x00F452) == 1
    )

    achievement(
        title = "Power Up", description = "Catch Power up", points = 2,
        id = 5001, badge = "05606", published = "2014-02-12 7:56:58 PM", modified = "2021-02-10 2:45:46 AM",
        trigger = byte(0x00F444) == 1
    )

    achievement(
        title = "Sword Bar Increassed", description = "Collect Sword Full Bar", points = 2,
        id = 5000, badge = "05605", published = "2014-02-12 7:56:55 PM", modified = "2021-02-10 2:45:48 AM",
        trigger = byte(0x00F450) == 2
    )

    achievement(
        title = "Ghost Steel", description = "Defeat Ghost Steel", points = 5,
        id = 4989, badge = "05593", published = "2014-02-12 7:56:19 PM", modified = "2021-02-10 2:45:49 AM",
        trigger = byte(0x00F414) == 4 && byte(0x00D904) == 8 && byte(0x00D905) == 249 && byte(0x00F4A8) == 100 && 
                  never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Infinity Magic", description = "Collect Full MP", points = 4,
        id = 4996, badge = "05604", published = "2014-02-12 7:56:42 PM", modified = "2021-02-10 2:45:54 AM",
        trigger = byte(0x00F44A) == 24
    )

    achievement(
        title = "Thunder", description = "Collect Thunder Spell", points = 4,
        id = 4999, badge = "05592", published = "2014-02-12 7:56:52 PM", modified = "2021-02-10 2:45:57 AM",
        trigger = byte(0x00F452) == 3
    )

    achievement(
        title = "Ice", description = "Get Ice Spell", points = 4,
        id = 4998, badge = "05591", published = "2014-02-12 7:56:49 PM", modified = "2021-02-10 2:45:59 AM",
        trigger = bit1(0x00F452) == 1
    )

    achievement(
        title = "Act 2 - 2 ", description = "Reach Act 2 - 2", points = 4,
        id = 4971, badge = "05610", published = "2014-02-12 7:55:07 PM", modified = "2021-02-10 2:46:01 AM",
        trigger = byte(0x00F414) == 6 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Dragon", description = "Defeat Dragon", points = 5,
        id = 4990, badge = "05594", published = "2014-02-12 7:56:23 PM", modified = "2021-02-10 2:46:03 AM",
        trigger = byte(0x00F414) == 6 && byte(0x00D904) == 0 && byte(0x00D905) == 247 && byte(0x00F4A8) == 100 && 
                  never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Act 3 - 2", description = "Reach Act 3 - 2", points = 5,
        id = 4973, badge = "05612", published = "2014-02-12 7:55:15 PM", modified = "2019-03-11 12:14:54 PM",
        trigger = byte(0x00F414) == 8 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 3 - 3 ", description = "Reach Act 3 - 3", points = 5,
        id = 4974, badge = "05613", published = "2014-02-12 7:55:19 PM", modified = "2019-03-11 12:14:58 PM",
        trigger = byte(0x00F414) == 9 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 3 - 4  ", description = "Reach Act 3 - 4", points = 5,
        id = 4975, badge = "05614", published = "2014-02-12 7:55:22 PM", modified = "2019-03-11 12:15:03 PM",
        trigger = byte(0x00F414) == 11 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Lord the Fire", description = "Defeat Lord the fire", points = 5,
        id = 4991, badge = "05595", published = "2014-02-12 7:56:26 PM", modified = "2021-02-10 2:46:08 AM",
        trigger = byte(0x00F414) == 11 && byte(0x00D904) == 0 && byte(0x00D905) == 0 && byte(0x00F4A8) == 100 && 
                  never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Act 4 - 2", description = "Reach Act 4 - 2", points = 5,
        id = 4977, badge = "05616", published = "2014-02-12 7:55:29 PM", modified = "2019-03-11 12:15:12 PM",
        trigger = byte(0x00F414) == 14 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Warrior Golds", description = "Defeat Warrior Golds", points = 10,
        id = 4992, badge = "05596", published = "2014-02-12 7:56:29 PM", modified = "2021-11-15 9:59:26 AM",
        trigger = prev(byte(0x00F414)) == 14 && byte(0x00F414) == 15 && byte(0x00D904) >= 0 && byte(0x00D905) >= 0 && 
                  byte(0x00F4A8) >= 0 && never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Zalude", description = "Defeat Zalude", points = 10,
        id = 4993, badge = "05597", published = "2014-02-12 7:56:32 PM", modified = "2021-02-10 2:46:19 AM",
        trigger = byte(0x00F414) >= 17 && byte(0x00D904) == 0 && byte(0x00F4A8) == 100 && never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Act 6 - 2", description = "Reach Act 6 - 2", points = 5,
        id = 4980, badge = "05619", published = "2014-02-12 7:55:47 PM", modified = "2019-03-11 12:15:21 PM",
        trigger = byte(0x00F414) == 18 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 6 - 3", description = "Reach Act 6 - 3", points = 5,
        id = 4981, badge = "05620", published = "2014-02-12 7:55:50 PM", modified = "2019-03-11 12:15:25 PM",
        trigger = byte(0x00F414) == 19 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Asura", description = "Defeat Asura", points = 10,
        id = 4994, badge = "05598", published = "2014-02-12 7:56:35 PM", modified = "2021-11-15 9:59:27 AM",
        trigger = byte(0x00F414) == 19 && byte(0x00D904) >= 0 && byte(0x00D905) >= 0 && byte(0x00F4AC) >= 2 && 
                  never(byte(0x00F414) == 28) && once(byte(0x00F4A8) == 100)
    )

    achievement(
        title = "Act 7 - 2", description = "Reach Act 7 - 2", points = 5,
        id = 4983, badge = "05623", published = "2014-02-12 7:55:57 PM", modified = "2019-03-11 12:15:32 PM",
        trigger = byte(0x00F414) == 22 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 7 - 3 ", description = "Reach Act 7 - 3", points = 5,
        id = 4984, badge = "05624", published = "2014-02-12 7:56:00 PM", modified = "2019-03-11 12:15:36 PM",
        trigger = byte(0x00F414) == 23 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 7 - 4", description = "Reach Act 7 - 4", points = 5,
        id = 4985, badge = "05625", published = "2014-02-12 7:56:05 PM", modified = "2019-03-11 12:15:40 PM",
        trigger = byte(0x00F414) == 24 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Glames", description = "Defeat Glames", points = 10,
        id = 4995, badge = "05599", published = "2014-02-12 7:56:38 PM", modified = "2021-02-10 2:46:26 AM",
        trigger = byte(0x00F414) == 0 && byte(0x00D904) == 0 && byte(0x00D905) == 253 && byte(0x00F4A8) == 100 && 
                  byte(0x00F4AD) == 8 && never(byte(0x00F414) == 28)
    )

    achievement(
        title = "Act 1 - 1", description = "Start Game in Act 1 - 1", points = 10,
        id = 4968, badge = "05607", published = "2014-02-12 7:54:56 PM", modified = "2019-03-11 12:14:28 PM",
        trigger = byte(0x00F414) == 1 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "I Need That Sword", description = "Get Valis Sword", points = 1,
        id = 5002, badge = "05626", published = "2014-02-12 7:57:01 PM", modified = "2021-02-10 2:45:42 AM",
        trigger = byte(0x00F494) == 17 && byte(0x00F414) == 3
    )

    achievement(
        title = "Act 2 - 1", description = "Reach Act 2 - 1", points = 4,
        id = 4970, badge = "05609", published = "2014-02-12 7:55:03 PM", modified = "2021-02-10 2:45:51 AM",
        trigger = byte(0x00F414) == 5 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Cham", description = "Cham join in party", points = 5,
        id = 4986, badge = "05600", published = "2014-02-12 7:56:10 PM", modified = "2021-02-10 2:45:52 AM",
        trigger = byte(0x00F414) >= 5 && never(byte(0x00C0AA) == 208) && once(dword(0x00D708) == 241176192)
    )

    achievement(
        title = "Act 3 - 1", description = "Reach Act 3 - 1", points = 5,
        id = 4972, badge = "05611", published = "2014-02-12 7:55:12 PM", modified = "2021-02-10 2:46:02 AM",
        trigger = byte(0x00F414) == 7 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Valna", description = "Valna join in party", points = 5,
        id = 4987, badge = "05601", published = "2014-02-12 7:56:13 PM", modified = "2021-02-10 2:46:07 AM",
        trigger = byte(0x00F414) >= 10 && never(byte(0x00C0AA) == 208) && once(dword(0x00D708) == 241176192)
    )

    achievement(
        title = "Act 4 - 1", description = "Reach Act 4 - 1", points = 5,
        id = 4976, badge = "05615", published = "2014-02-12 7:55:25 PM", modified = "2021-02-10 2:46:10 AM",
        trigger = byte(0x00F414) == 13 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Valis are Been Released", description = "Talk Nizetti and get sword full power", points = 10,
        id = 4988, badge = "05603", published = "2014-02-12 7:56:16 PM", modified = "2021-02-10 2:46:15 AM",
        trigger = byte(0x00F414) >= 16 && never(byte(0x00C0AA) == 208) && once(dword(0x00D708) == 241176192)
    )

    achievement(
        title = "Act 5 - 1", description = "Reach Act 5 - 1", points = 5,
        id = 4978, badge = "05617", published = "2014-02-12 7:55:40 PM", modified = "2021-02-10 2:46:16 AM",
        trigger = byte(0x00F414) == 16 && byte(0x00F426) == 40
    )

    achievement(
        title = "Act 6 - 1", description = "Reach Act 6 - 1", points = 5,
        id = 4979, badge = "05618", published = "2014-02-12 7:55:44 PM", modified = "2021-02-10 2:46:18 AM",
        trigger = byte(0x00F414) == 17 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "Act 7 - 1", description = "Reach Act 7 - 1", points = 5,
        id = 4982, badge = "05622", published = "2014-02-12 7:55:54 PM", modified = "2021-02-10 2:46:23 AM",
        trigger = byte(0x00F414) == 21 && once(dword(0x00D708) == 241176192) && never(byte(0x00C0AA) == 208)
    )

    achievement(
        title = "The End", description = "Beat game", points = 25,
        id = 5003, badge = "05627", published = "2014-02-12 7:57:23 PM", modified = "2021-02-10 2:46:28 AM",
        trigger = byte(0x00F414) == 0 && byte(0x00D904) == 0 && byte(0x00D905) == 253 && byte(0x00F4A8) == 100 && 
                  byte(0x00F4AD) == 8
    )
}
