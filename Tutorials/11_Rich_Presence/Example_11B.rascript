// Muppet RaceMania
// #ID = 13910

// Give each language an unique value
EU = 0
FR = 1
DE = 2
IT = 3
ES = 4
US = 5

// Array of each supported language
languages = [EU, FR, DE, IT, ES, US]

// $00b8b7: [ASCII] CD-ROM Name
//          SCES_020.01;1 = EU
//          SCES_024.83;1 = FR
//          SCES_024.84;1 = DE
//          SCES_024.85;1 = IT
//          SCES_024.86;1 = ES
//          SLUS_012.37;1 = US
function CDROM() => 0xb8b7

// "SCES_020.01;1" = EU Disc
EU_Disc = [0x53,0x43,0x45,0x53,0x5F,0x30,0x32,0x30,0x2E,0x30,0x38,0x3B,0x31]

// "SCES_024.83;1" = FR Disc
FR_Disc = [0x53,0x43,0x45,0x53,0x5F,0x30,0x32,0x34,0x2E,0x38,0x33,0x3B,0x31]

// "SCES_024.84;1" = DE Disc
DE_Disc = [0x53,0x43,0x45,0x53,0x5F,0x30,0x32,0x34,0x2E,0x38,0x34,0x3B,0x31]

// "SCES_024.85;1" = IT Disc
IT_Disc = [0x53,0x43,0x45,0x53,0x5F,0x30,0x32,0x34,0x2E,0x38,0x35,0x3B,0x31]

// "SCES_024.86;1" = ES Disc
ES_Disc = [0x53,0x43,0x45,0x53,0x5F,0x30,0x32,0x34,0x2E,0x38,0x36,0x3B,0x31]

// "SLUS_012.37;1" = US Disc
US_Disc = [0x53,0x4C,0x55,0x53,0x5F,0x30,0x31,0x32,0x2E,0x33,0x37,0x3B,0x31]    

// Dictionary of the disc names
Discs = {
    EU: EU_Disc,
    FR: FR_Disc,
    DE: DE_Disc,
    IT: IT_Disc,
    ES: ES_Disc,
    US: US_Disc
}

// 0xb0f38: Player's character (EU)
// 0xb0328: Personnage du joueur (fr)
// 0xb01dc: Spielercharakter (De)
// 0xb01ec: Personaggio dei giocatore (It)
// 0xb038c: Personaje del jugador (Es)
// 0xb07a4: Player's character (US)
PlayerCharacter = {
    EU: byte(0xb0f38),
    FR: byte(0xb0328),
    DE: byte(0xb01dc),
    IT: byte(0xb01ec),
    ES: byte(0xb038c),
    US: byte(0xb07a4)
}

// Dictionary of all the racers
Racers = {
    0: "Kermit",
    1: "Miss Piggy",
    2: "Gonzo",
    3: "Fozzie",    
    4: "Rizzo",
    5: "Beaker",
    6: "Rowlf",
    7: "Animal",
    8: "Janice",
    9: "Dr. Teeth",
    10: "Floyd",
    11: "Zoot",
    12: "Bunsen",
    13: "Chef",
    14: "Sam",
    15: "Scooter",
    16: "Pepe",
    17: "Bobo",
    18: "Link",
    19: "Robin",
    20: "Johnny Fiamma",
    21: "Sal",
    22: "Bean Bunny",
    23: "Clifford",
    24: "Doozer"
}

// 0xb0f3c: Player's vehicle (EU)
// 0xb032c: Véhicle du joueur (Fr)
// 0xb01e0: Spielerfahrzeug (De)
// 0xb01f0: Veicolo del giocatore (It)
// 0xb0390: Vehiculo del jugador (Es)
// 0xb07a8: Player's vehicle (US)
PlayerVehicle = {
    EU: byte(0xb0f3c),
    FR: byte(0xb032c),
    DE: byte(0xb01e0),
    IT: byte(0xb01f0),
    ES: byte(0xb0390),
    US: byte(0xb07a8)
}

// All the vehicles in the game
Vehicles = {
    0: "Racer",
    1: "Monster Truck",
    2: "Flying Saucer",
    3: "Bubbler",
    4: "Cheese",
    5: "Moon Buggy",
    6: "Bulldozer",
    7: "Dragster",
    8: "Love Bug",
    9: "Hotrod",
    10: "Spoetster",
    11: "Supercharger",
    12: "Hovercraft",
    13: "Hotdog",
    14: "Plane",
    15: "Dune Buggy",
    16: "Kart",
    17: "Water Buggy",
    18: "Spaceship",
    19: "Steamroller",
    20: "Speedster",
    21: "Flamer",
    22: "Snow Bike",
    23: "Trike",
    24: "Dumper"
}

// 0x0b1628: Current course set (EU)
// 0x0b0a18: Set de parcourses courante (Fr)
// 0x0b08d0: Aktuelle Set von Strecken (De)
// 0x0b08e0: Set di percorsi corrente (It)
// 0x0b0a80: Set de pistas actual (Es)
// 0x0b0e38: Current course set (US)
Set = {
    EU: byte(0x0b1628),
    FR: byte(0x0b0a18),
    DE: byte(0x0b08d0),
    IT: byte(0x0b08e0),
    ES: byte(0x0b0a80),
    US: byte(0x0b0e38)
}

// 0x0b1622: Current course (EU)
// 0x0b0a12: Parcours courante (Fr)
// 0x0b08ca: Aktuelle Strecke (De)
// 0x0b08da: Percorso corrente (It)
// 0x0b0a7a: Pista actual (Es)
// 0x0b0e32: Current course (US)
Course = {
    EU: byte(0x0b1622),
    FR: byte(0x0b0a12),
    DE: byte(0x0b08ca),
    IT: byte(0x0b08da),
    ES: byte(0x0b0a7a),
    US: byte(0x0b0e32)
}

// Dictionary of tracks are hashed by Set # * 16 + Course #
Tracks = {
    0x00: "Swamp",
    0x01: "Ghost Town",
    0x02: "Canyon",
    0x03: "Funfair",
    0x10: "Happiness Hotel",
    0x11: "Mallory Gallery",
    0x12: "Trafalgar Square",
    0x13: "Resturant",
    0x20: "Central Park",
    0x21: "New York City",
    0x22: "Theatre",
    0x23: "Diner",
    0x30: "Old London Town",
    0x31: "Graveyard",
    0x32: "Chamber",
    0x33: "Rooftops",
    0x40: "Dock",
    0x41: "Treasure Island",
    0x42: "Lagoon",
    0x43: "Mountain",
    0x50: "Secret Base",
    0x51: "Cape Doom",
    0x52: "Laboratory",
    0x53: "Muppet Labs",
    0x60: "Studio",
    0x61: "Arches",
    0x62: "Fraggle Rock",
    0x63: "Disco"
}

// 0x0c3e10: Player's race position (EU)
// 0x0c3158: Position du joueur (Fr)
// 0x0c3010: Platz im Rennen (De)
// 0x0c3020: Posizione del giocatore (It)
// 0x0c31c0: Posición del jugador (Es)
// 0x0c3572: Player's race position (US)
RacePosition = {
    EU: byte(0x0c3e10),
    FR: byte(0x0c3158),
    DE: byte(0x0c3010),
    IT: byte(0x0c3020),
    ES: byte(0x0c31c0),
    US: byte(0x0c3572)
}

// Dictionary of the place names for each position
Place = {
    1: "1st",
    2: "2nd",
    3: "3rd",
    4: "4th",
    5: "5th",
    6: "6th",
    7: "7th",
    8: "8th",
    9: "9th",
    10: "10th",
    11: "11th",
    12: "12th"
}

// Check if the string hex values equal the hex values at the passed address
function StringCompare(address, string)
{
    strArray = []
    for hexValue in string
    {
        array_push(strArray, byte(address) == hexValue)
        address = address + 1
    }
    return all_of(strArray, a => a)
}

// Make 25 example achievements using that support multiple languages
for index in range(0,24)
{
    // Setup the title and description of 
    title = Racers[index] + " " + Vehicles[index]
    description = "Select the racer " + Racers[index] + " with the vehicle " + Vehicles[index]
    triggers = []
        
    for language in languages
    {
        // Make a condition to check the current language disc region and racer/vehicle combo
        array_push(triggers,
            StringCompare(CDROM(), Discs[language]) &&
            PlayerCharacter[language] == index &&
            PlayerVehicle[language] == index
        )
    }
    achievement(title, description, 0, any_of(triggers, t => t))
}

// Example #11B - Rich Presence the supports mulitple regions
for language in languages
{
    disc = Discs[language]    
    rich_presence_conditional_display(
        StringCompare(CDROM(), disc) &&
            Set[language] != 0xff &&
            Course[language] != 0xff &&
            RacePosition[language] >= 1 && 
            RacePosition[language] <= 12, 
        "{0} is driving a {1} on the track {2} in {3} position!", 
        rich_presence_lookup("Racer", PlayerCharacter[language], Racers),
        rich_presence_lookup("Vehicle", PlayerVehicle[language], Vehicles),
        rich_presence_lookup("Track", Set[language] * 0x10 + Course[language], Tracks),
        rich_presence_lookup("Position", RacePosition[language], Place)
    )
}
rich_presence_display("The muppets are in the menu!")