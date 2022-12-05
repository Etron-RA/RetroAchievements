// Downtown Special: Kunio-kun no Jidaigeki da yo Zenin Shugo!
// #ID = 5821

// $7AE2: Player 1 Money (x*10,000)
function MoneyP1XX0000() => byte(0x007AE2)

// $7AE5: Player 2 Money (x*10,000)
function MoneyP2XX0000() => byte(0x007AE5)

function NoCheat() => MoneyP1XX0000() <= 0x80 && MoneyP2XX0000() <= 0x80

achievement(
    title = "Let's Get Started", points = 5,
    description = "Watch the introductionary movie.",
    id = 56897, badge = "59528", published = "2018-01-08 4:29:33 AM", modified = "2021-08-18 4:47:27 AM",
    trigger = byte(0x000043) == 7 && byte(0x00707F) == 196
)

achievement(
    title = "Medicine Man", points = 10,
    description = "Acquire and deliver the KANPOU to Bunzo.",
    id = 56898, badge = "59529", published = "2018-01-08 4:29:47 AM", modified = "2021-08-18 4:47:27 AM",
    trigger = NoCheat() && byte(0x00707F) == 170
)

achievement(
    title = "Ultimate Happiness", points = 25,
    description = "Get the girl. Drinks are on Bunzo.",
    id = 56899, badge = "59522", published = "2018-01-08 4:29:59 AM", modified = "2021-08-18 4:47:28 AM",
    trigger = NoCheat() && byte(0x00707F) == 205
)

achievement(
    title = "Forever Drifting", points = 25,
    description = "Rejection is the one constant of human experience.",
    id = 56900, badge = "59523", published = "2018-01-08 4:30:08 AM", modified = "2021-08-18 4:47:28 AM",
    trigger = NoCheat() && byte(0x00707F) == 214
)

achievement(
    title = "Best Punch Line", points = 10,
    description = "Max out the punch stat (127, item bonuses don't count).",
    id = 56901, badge = "59502", published = "2018-01-08 4:30:19 AM", modified = "2021-08-18 4:47:28 AM",
    trigger = NoCheat() && measured(byte(0x007A08) == 127)
)

achievement(
    title = "Professional Butt Kicker", points = 10,
    description = "Max out the kick stat (127, item bonuses don't count).",
    id = 56902, badge = "59503", published = "2018-01-08 4:30:23 AM", modified = "2021-08-18 4:47:29 AM",
    trigger = NoCheat() && measured(byte(0x007A0C) == 127)
)

achievement(
    title = "Miyamoto Musashi", points = 10,
    description = "Max out the weapon stat (127, item bonuses don't count).",
    id = 56903, badge = "59506", published = "2018-01-08 4:30:27 AM", modified = "2021-08-18 4:47:29 AM",
    trigger = NoCheat() && measured(byte(0x007A10) == 127)
)

achievement(
    title = "105 mph Fastball", points = 10,
    description = "Max out the throw stat (127, item bonuses don't count).",
    id = 56904, badge = "59505", published = "2018-01-08 4:30:32 AM", modified = "2021-08-18 4:47:29 AM",
    trigger = NoCheat() && measured(byte(0x007A14) == 127)
)

achievement(
    title = "Run Like the Wind", points = 10,
    description = "Max out the agility stat (127, item bonuses don't count).",
    id = 56905, badge = "59504", published = "2018-01-08 4:30:36 AM", modified = "2021-08-18 4:47:30 AM",
    trigger = NoCheat() && measured(byte(0x007A18) == 127)
)

achievement(
    title = "I Think I Can, I Think I Can...", points = 10,
    description = "Max out the willpower stat (127, item bonuses don't count).",
    id = 56906, badge = "59507", published = "2018-01-08 4:30:44 AM", modified = "2021-08-18 4:47:30 AM",
    trigger = NoCheat() && measured(byte(0x007A24) == 127)
)

achievement(
    title = "Unbreakable", points = 10,
    description = "Max out the defense stat (127, item bonuses don't count).",
    id = 56907, badge = "59508", published = "2018-01-08 4:30:50 AM", modified = "2021-08-18 4:47:30 AM",
    trigger = NoCheat() && measured(byte(0x007A1C) == 127)
)

achievement(
    title = "Master Deflector", points = 10,
    description = "Max out the strength stat (127, item bonuses don't count).",
    id = 56908, badge = "59509", published = "2018-01-08 4:30:56 AM", modified = "2021-08-18 4:47:31 AM",
    trigger = NoCheat() && measured(byte(0x007A20) == 127)
)

achievement(
    title = "Presidential Fitness Award", points = 10,
    description = "Max out the stamina stat (255, item bonuses don't count).",
    id = 56909, badge = "59510", published = "2018-01-08 4:31:08 AM", modified = "2021-08-18 4:47:31 AM",
    trigger = NoCheat() && measured(byte(0x007A28) == 255)
)

achievement(
    title = "Bottomless Reserves", points = 10,
    description = "Max out the vitality stat (255, item bonuses don't count).",
    id = 56910, badge = "59511", published = "2018-01-08 4:31:13 AM", modified = "2021-08-18 4:47:31 AM",
    trigger = NoCheat() && measured(byte(0x007A2C) == 255)
)

achievement(
    title = "I Call Him Stabby", points = 10,
    description = "You are one with your prized dagger.",
    id = 56911, badge = "59515", published = "2018-01-08 4:31:20 AM", modified = "2021-08-18 4:47:32 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 32 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 32 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 32 && bit0(0x00005D) == 1))
)

achievement(
    title = "Bamboozle", points = 10,
    description = "Bamboo is technically just grass, but it's your grass.",
    id = 56912, badge = "59517", published = "2018-01-08 4:31:24 AM", modified = "2021-08-18 4:47:32 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 33 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 33 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 33 && bit0(0x00005D) == 1))
)

achievement(
    title = "Everybody Must Get Stoned", points = 10,
    description = "The thought of dropping your precious stone scares you.",
    id = 56913, badge = "59518", published = "2018-01-08 4:31:29 AM", modified = "2021-08-18 4:47:32 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 34 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 34 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 34 && bit0(0x00005D) == 1))
)

achievement(
    title = "Million Dollar Idea", points = 10,
    description = "This is your pet rock, none shall take him from you.",
    id = 56914, badge = "59519", published = "2018-01-08 4:31:33 AM", modified = "2021-08-18 4:47:33 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 35 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 35 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 35 && bit0(0x00005D) == 1))
)

achievement(
    title = "Completely Stumped", points = 10,
    description = "Fight back with nature.",
    id = 56915, badge = "59516", published = "2018-01-08 4:31:43 AM", modified = "2021-08-18 4:47:33 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 36 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 36 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 36 && bit0(0x00005D) == 1))
)

achievement(
    title = "A Hard Lesson", points = 10,
    description = "Scrolls contain knowledge and knowledge is power. Don't lose yours.",
    id = 56916, badge = "59520", published = "2018-01-08 4:31:52 AM", modified = "2021-08-18 4:47:33 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 37 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 37 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 37 && bit0(0x00005D) == 1))
)

achievement(
    title = "Buck It", points = 10,
    description = "You've grown quite attached to this bucket. Don't lose it!",
    id = 56917, badge = "59521", published = "2018-01-08 4:31:55 AM", modified = "2021-08-18 4:47:34 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 38 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 38 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 38 && bit0(0x00005D) == 1))
)

achievement(
    title = "Rickshaw Driver", points = 10,
    description = "Make a killing out of your living.",
    id = 56918, badge = "59514", published = "2018-01-08 4:32:10 AM", modified = "2021-08-18 4:47:34 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(bit6(0x000057) == 0) && 
              never(byte(0x000379) != prev(byte(0x000379))) && byte(0x007A02) == 0 && byte(0x007A06) == 0 && 
              byte(0x007A03) == 0 && byte(0x007A07) == 0 && repeated(11, word(0x000498) > prev(word(0x000498))) && 
              never(byte(0x007C99) < 2) &&
              ((byte(0x0000D0) == 39 && bit0(0x00005B) == 1) ||
               (byte(0x0000D1) == 39 && bit0(0x00005C) == 1) ||
               (byte(0x0000D2) == 39 && bit0(0x00005D) == 1))
)

achievement(
    title = "The Frat Guys", points = 10,
    description = "Defeat Ashi, Ben, Hide, Hira, Moemo, Mura, Sada, Saita, Seki, Yotsu and their leader Gonsa.",
    id = 56919, badge = "59532", published = "2018-01-08 4:32:29 AM", modified = "2021-08-18 4:47:34 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && byte(0x0004F2) == 0 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 0 && byte(0x007A30) != 0) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 0 && byte(0x007A40) != 0) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 0 && byte(0x007A50) != 0) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 0 && byte(0x007A60) != 0) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 0 && byte(0x007A70) != 0))
)

achievement(
    title = "The Generic Dudes", points = 10,
    description = "Defeat Itoki, Hagi, Hansu, Hashi, Koue, Kosu, Saixu, Saki, Tamo, Yuki and their leader Ginpa.",
    id = 56920, badge = "59533", published = "2018-01-08 4:32:41 AM", modified = "2021-08-18 4:47:35 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && byte(0x0004F2) == 16 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 16) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 16) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 16) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 16) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 16))
)

achievement(
    title = "Benny and Clyde", points = 10,
    description = "Defeat Chie, Isoro, Kuma, Onoki, Rihei, Tata, Tomo, Urae, Yata, Wata and their leaders Ichi and Roku.",
    id = 56921, badge = "59534", published = "2018-01-08 4:33:16 AM", modified = "2021-08-18 4:47:35 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && byte(0x007A03) == 0 && byte(0x007A07) == 0 && never(byte(0x007C99) < 2) && 
              byte(0x0004F2) == 1 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 1) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 1) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 1) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 1) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 1))
)

achievement(
    title = "The Jets", points = 10,
    description = "Defeat Dezou, Hachi, Kumi, Rihe, Shima, Suya, Taro, Tero, Urasa, Yone and their leader Kinsu.",
    id = 56922, badge = "59535", published = "2018-01-08 4:33:36 AM", modified = "2021-08-18 4:47:35 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 4 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 4) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 4) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 4) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 4) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 4))
)

achievement(
    title = "The Home Boys", points = 10,
    description = "Defeat Bobu, Kisu, Kouki, Nori, Sahei, Suema, Take, Umema, Yoshi, Yuue and their leader Tame.",
    id = 56923, badge = "59536", published = "2018-01-08 4:33:40 AM", modified = "2021-08-18 4:47:36 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 5 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 5) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 5) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 5) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 5) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 5))
)

achievement(
    title = "The Jocks", points = 10,
    description = "Defeat Gensu, Hemo, Hisa, Kame, Mune, Oisa, Shin, Sumi, Taki, Yota and their leader Heiru.",
    id = 56924, badge = "59537", published = "2018-01-08 4:33:47 AM", modified = "2021-08-18 4:47:36 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 3 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 3) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 3) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 3) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 3) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 3))
)

achievement(
    title = "Oko Yono", points = 10,
    description = "Defeat Yono.",
    id = 56925, badge = "59538", published = "2018-01-08 4:33:55 AM", modified = "2021-08-18 4:47:36 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 17 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 17) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 17) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 17) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 17) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 17))
)

achievement(
    title = "The Sharks", points = 10,
    description = "Defeat Akizo, Ineta, Ishi, Jmgq, Junzo, Mori, Saku, Shiba, Shiro, Uraji and their leader Heisi.",
    id = 56926, badge = "59540", published = "2018-01-08 4:34:03 AM", modified = "2021-08-18 4:47:37 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 6 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 6) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 6) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 6) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 6) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 6))
)

achievement(
    title = "The Hurricanes", points = 10,
    description = "Defeat Atsu, Chiji, Ebino, Gosu, Kana, Shuu, Suke, Sute, Tsuno, Yuri and their leader Jinro.",
    id = 56927, badge = "59539", published = "2018-01-08 4:34:06 AM", modified = "2021-08-18 4:47:37 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 7 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 7) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 7) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 7) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 7) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 7))
)

achievement(
    title = "The Cowboys", points = 10,
    description = "Defeat Gosa, Katsu, Kengo, Kiku, Mansi, Obisa, Sono, Toshi, Tsuki, Yasu and their leader Han.",
    id = 56928, badge = "59541", published = "2018-01-08 4:34:12 AM", modified = "2021-08-18 4:47:37 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 8 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 8) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 8) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 8) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 8) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 8))
)

achievement(
    title = "The Mob", points = 10,
    description = "Defeat Ingo, Mochi, Mohe, Neha, Omeno, Shou, Some, Tema, Toube, Zene and their leader Yago.",
    id = 56929, badge = "59542", published = "2018-01-08 4:34:15 AM", modified = "2021-08-18 4:47:38 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 9 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 9) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 9) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 9) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 9) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 9))
)

achievement(
    title = "The Squids", points = 10,
    description = "Defeat Goro, Inosu, Kamo, Kota, Mango, Mata, Tsuda, Uki, Umeta, Usuke and their leader Nizae.",
    id = 56930, badge = "59543", published = "2018-01-08 4:34:18 AM", modified = "2021-08-18 4:47:38 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 10 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 10) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 10) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 10) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 10) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 10))
)

achievement(
    title = "The Dragon Twins", points = 10,
    description = "Defeat Home, Kichi, Kuro, Nenki, Neto, Senbe, Senpa, Tago, Taha, Teha and their leaders Tatsu and Tsui.",
    id = 56931, badge = "59544", published = "2018-01-08 4:34:33 AM", modified = "2021-08-18 4:47:38 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && byte(0x007A03) == 0 && byte(0x007A07) == 0 && never(byte(0x007C99) < 2) &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 11) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 11) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 11) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 11) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 11) ||
               (byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 12) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 12) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 12) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 12) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 12))
)

achievement(
    title = "The Internationals", points = 10,
    description = "Defeat Heko, Keta, Kunki, Manpe, Masu, Mataa, Mehei, Momo, Tane, Unji and the traitor Tsuu.",
    id = 56932, badge = "59545", published = "2018-01-08 4:34:41 AM", modified = "2021-08-18 4:47:39 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && never(byte(0x007C99) < 2) && byte(0x0004F2) == 13 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 13) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 13) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 13) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 13) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 13))
)

achievement(
    title = "The Plague", points = 10,
    description = "Defeat Fune, Ihoma, Kansu, Kanta, Kome, Mino, Rohei, Sichi, Suji and Ushi.",
    id = 56933, badge = "59546", published = "2018-01-08 4:34:47 AM", modified = "2021-08-18 4:47:39 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(byte(0x007C99) < 2) && byte(0x0004F2) ==
               14 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 14) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 14) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 14) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 14) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 14))
)

achievement(
    title = "The Black Plague", points = 10,
    description = "Defeat The Plague a second time, including their leader Tora.",
    id = 56934, badge = "59547", published = "2018-01-08 4:34:51 AM", modified = "2021-08-18 4:47:39 AM",
    trigger = NoCheat() && byte(0x000707) == 128 && never(byte(0x007C99) < 2) && byte(0x0004F2) ==
               15 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 15 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
                byte(0x007A06) == 0) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 15 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
                byte(0x007A06) == 0) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 15 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
                byte(0x007A06) == 0) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 15 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
                byte(0x007A06) == 0) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 15 && byte(0x000052) == 145 && byte(0x007A02) == 0 && 
                byte(0x007A06) == 0) ||
               (byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 15 && byte(0x000053) == 145 && byte(0x007A03) == 0 && 
                byte(0x007A07) == 0) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 15 && byte(0x000053) == 145 && byte(0x007A03) == 0 && 
                byte(0x007A07) == 0) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 15 && byte(0x000053) == 145 && byte(0x007A03) == 0 && 
                byte(0x007A07) == 0) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 15 && byte(0x000053) == 145 && byte(0x007A03) == 0 && 
                byte(0x007A07) == 0) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 15 && byte(0x000053) == 145 && byte(0x007A03) == 0 && 
                byte(0x007A07) == 0))
)

achievement(
    title = "Grand Finale", points = 10,
    description = "Defeat The Plague for a third and final time, including their leader Asaji.",
    id = 56935, badge = "59548", published = "2018-01-08 4:34:55 AM", modified = "2021-08-18 4:47:40 AM",
    trigger = NoCheat() && repeated(300, byte(0x000707) == 144) && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0 && byte(0x007A03) == 0 && byte(0x007A07) == 0 && never(byte(0x000043) !=
               prev(byte(0x000043))) && never(byte(0x007C99) < 2) && byte(0x0004F2) == 14 &&
              ((byte(0x000043) == byte(0x007A33) && byte(0x007A31) == 14) ||
               (byte(0x000043) == byte(0x007A43) && byte(0x007A41) == 14) ||
               (byte(0x000043) == byte(0x007A53) && byte(0x007A51) == 14) ||
               (byte(0x000043) == byte(0x007A63) && byte(0x007A61) == 14) ||
               (byte(0x000043) == byte(0x007A73) && byte(0x007A71) == 14))
)

achievement(
    title = "Reasonable Roller", points = 5,
    description = "Win three bets in a row.",
    id = 56936, badge = "59525", published = "2018-01-08 4:35:04 AM", modified = "2021-08-18 4:47:40 AM",
    trigger = NoCheat() && byte(0x000043) == 7 && never(byte(0x00707F) == 156) &&
              ((repeated(1500, byte(0x00707F) == 155) && byte(0x007C9A) == 0) ||
               (repeated(750, byte(0x00707F) == 155) && byte(0x007C9A) == 1) ||
               (repeated(400, byte(0x00707F) == 155) && byte(0x007C9A) == 2) ||
               (repeated(200, byte(0x00707F) == 155) && byte(0x007C9A) == 3) ||
               (repeated(120, byte(0x00707F) == 155) && byte(0x007C9A) == 4))
)

achievement(
    title = "Paying for Hope", points = 5,
    description = "Using the third option, win 4000 in a single bet.",
    id = 56944, badge = "59526", published = "2018-01-08 4:36:39 AM", modified = "2021-08-18 4:47:40 AM",
    trigger = NoCheat() && byte(0x000043) == 7 && byte(0x00051F) == 2 && byte(0x00707F) == 155
)

achievement(
    title = "Fully Equipped", points = 5,
    description = "Equip an item in every item slot.",
    id = 56937, badge = "59524", published = "2018-01-08 4:35:08 AM", modified = "2021-08-18 4:47:41 AM",
    trigger = NoCheat() && bit7(0x007AC0) == 1 && bit7(0x007AC1) == 1 && bit7(0x007AC2) == 1 && 
              bit7(0x007AC3) == 1 && bit7(0x007AC4) == 1 && bit7(0x007AC5) == 1 && bit7(0x007AC6) == 1 && bit7(0x007AC7)
               == 1 && bit7(0x007AC8) == 1 && bit7(0x007AC9) == 1 && bit7(0x007ACA) == 1 && bit7(0x007ACB) == 1 && 
              bit7(0x007ACC) == 1 && bit7(0x007ACD) == 1 && bit7(0x007ACE) == 1 && bit7(0x007ACF) == 1
)

achievement(
    title = "High Fashion", points = 5,
    description = "Obtain and equip MASTER shades.",
    id = 56938, badge = "59530", published = "2018-01-08 4:35:14 AM", modified = "2021-08-18 4:47:41 AM",
    trigger = NoCheat() &&
              ((byte(0x007AC0) == 202) ||
               (byte(0x007AC1) == 202) ||
               (byte(0x007AC2) == 202) ||
               (byte(0x007AC3) == 202) ||
               (byte(0x007AC4) == 202) ||
               (byte(0x007AC5) == 202) ||
               (byte(0x007AC6) == 202) ||
               (byte(0x007AC7) == 202) ||
               (byte(0x007AC8) == 202) ||
               (byte(0x007AC9) == 202) ||
               (byte(0x007ACA) == 202) ||
               (byte(0x007ACB) == 202) ||
               (byte(0x007ACC) == 202) ||
               (byte(0x007ACD) == 202) ||
               (byte(0x007ACE) == 202) ||
               (byte(0x007ACF) == 202))
)

achievement(
    title = "Work Smarter, Not Harder", points = 5,
    description = "Obtain and equip MAP CRSR.",
    id = 56939, badge = "59531", published = "2018-01-08 4:35:18 AM", modified = "2022-11-27 9:41:39 AM",
    trigger = prev(byte(0x007CC4)) != 255 &&
              ((prev(byte(0x007AC0)) == 70 && byte(0x007AC0) == 198) ||
               (prev(byte(0x007AC1)) == 70 && byte(0x007AC1) == 198) ||
               (prev(byte(0x007AC2)) == 70 && byte(0x007AC2) == 198) ||
               (prev(byte(0x007AC3)) == 70 && byte(0x007AC3) == 198) ||
               (prev(byte(0x007AC4)) == 70 && byte(0x007AC4) == 198) ||
               (prev(byte(0x007AC5)) == 70 && byte(0x007AC5) == 198) ||
               (prev(byte(0x007AC6)) == 70 && byte(0x007AC6) == 198) ||
               (prev(byte(0x007AC7)) == 70 && byte(0x007AC7) == 198) ||
               (prev(byte(0x007AC8)) == 70 && byte(0x007AC8) == 198) ||
               (prev(byte(0x007AC9)) == 70 && byte(0x007AC9) == 198) ||
               (prev(byte(0x007ACA)) == 70 && byte(0x007ACA) == 198) ||
               (prev(byte(0x007ACB)) == 70 && byte(0x007ACB) == 198) ||
               (prev(byte(0x007ACC)) == 70 && byte(0x007ACC) == 198) ||
               (prev(byte(0x007ACD)) == 70 && byte(0x007ACD) == 198) ||
               (prev(byte(0x007ACE)) == 70 && byte(0x007ACE) == 198) ||
               (prev(byte(0x007ACF)) == 70 && byte(0x007ACF) == 198))
)

achievement(
    title = "Make it Rain", points = 10,
    description = "Obtain and use GOODTIME.",
    id = 56940, badge = "59527", published = "2018-01-08 4:36:03 AM", modified = "2021-08-18 4:47:42 AM",
    trigger = NoCheat() && byte(0x00707F) == 242
)

achievement(
    title = "Tech School", points = 10,
    description = "Obtain and activate M.FIST, M.KICK, M.WPN, M.FUMI, SCREW, N.ATTACK, and H.GUARD.",
    id = 56941, badge = "59550", published = "2018-01-08 4:36:12 AM", modified = "2021-08-18 4:47:42 AM",
    trigger = NoCheat() &&
              ((byte(0x007AEB) == 255) ||
               (byte(0x007AEB) == 239))
)

achievement(
    title = "Certified Technician", points = 10,
    description = "Obtain and activate M.FISTII, M.KICKII, SCREWII, MASSAGE, WARPSHOT, DEFLECT, and M.KIUKIU.",
    id = 56942, badge = "59551", published = "2018-01-08 4:36:16 AM", modified = "2021-08-18 4:47:42 AM",
    trigger = NoCheat() &&
              ((byte(0x007AF3) == 255) ||
               (byte(0x007AF3) == 247))
)

achievement(
    title = "Super Technical", points = 10,
    description = "Obtain and activate BIGBANG or BMPKNART (on Kunio).",
    id = 56943, badge = "59552", published = "2018-01-08 4:36:19 AM", modified = "2021-08-18 4:47:43 AM",
    trigger = NoCheat() && byte(0x0000CC) != 40 && byte(0x0000CC) != 47 && byte(0x0000CC) != 48 && 
              byte(0x0000CC) != 44 && byte(0x000043) != 15 && byte(0x000043) != 7 && byte(0x000030) != 8 && 
              byte(0x000030) != 9 &&
              ((bit3(0x007AF3) == 1 && byte(0x0000CC) == 0 && byte(0x0000CD) != 0) ||
               (bit0(0x007AEF) == 1 && byte(0x0000CC) == 0 && byte(0x0000CD) != 0) ||
               (bit3(0x007AF4) == 1 && byte(0x0000CC) != 0 && byte(0x0000CD) == 0) ||
               (bit0(0x007AF0) == 1 && byte(0x0000CC) != 0 && byte(0x0000CD) == 0))
)

achievement(
    title = "Hot Stuff", points = 10,
    description = "Defeat a gang's leader by throwing them into the center pit of the lava fields west of Rikuchuu.",
    id = 56945, badge = "59513", published = "2018-01-08 4:36:44 AM", modified = "2021-08-18 4:47:43 AM",
    trigger = NoCheat() && byte(0x000043) == 29 && byte(0x000707) == 128 && byte(0x0018A1) > 47 && 
              byte(0x0018A1) < 65 && byte(0x001886) <= 130 && byte(0x00188F) == 1 && byte(0x007A02) == 0 && 
              byte(0x007A06) == 0
)

achievement(
    title = "Circus Performer", points = 10,
    description = "Keep a singular boss rolling or airborne for at least 10 seconds.",
    id = 56946, badge = "59512", published = "2018-01-08 4:36:48 AM", modified = "2021-08-18 4:47:43 AM",
    trigger = NoCheat() && never(byte(0x000052) == 128) && never(byte(0x000052) == 129) && 
              never(byte(0x000052) == 145) && never(byte(0x000052) == 154) && never(byte(0x000052) == 140) && 
              never(byte(0x000052) == 168) && repeated(600, bit7(0x000059) == 1) && never(byte(0x000379) !=
               prev(byte(0x000379))) && never(byte(0x000052) == 180) &&
              ((byte(0x000707) == 128) ||
               (byte(0x000707) == 144))
)

achievement(
    title = "Heavy-handed", points = 10,
    description = "Defeat an entire gang with each hit doing 100 or more damage (this applies to your ally).",
    id = 56947, badge = "59549", published = "2018-01-08 4:36:54 AM", modified = "2021-08-18 4:47:44 AM",
    trigger = NoCheat() && never(byte(0x000379) != prev(byte(0x000379))) && repeated(10,
               word(0x000498) > prev(word(0x000498))) && never(byte(0x000608) < 100) && never(byte(0x000609) < 100) &&
              ((byte(0x000707) == 128 && byte(0x007A02) == 0 && byte(0x007A06) == 0 && byte(0x000052) == 145) ||
               (byte(0x000707) == 144 && byte(0x007A02) == 0 && byte(0x007A06) == 0 && byte(0x000052) == 145) ||
               (byte(0x000707) == 128 && byte(0x007A03) == 0 && byte(0x007A07) == 0 && byte(0x000053) == 145) ||
               (byte(0x000707) == 144 && byte(0x007A03) == 0 && byte(0x007A07) == 0 && byte(0x000053) == 145))
)
