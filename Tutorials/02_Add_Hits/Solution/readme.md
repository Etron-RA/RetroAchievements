# Tutorial #2 Solution
## Solution A
Using the same method found in Example 2B we use a *tally* to add *hits* for multiple knockouts. The *hits* are reset if the player is not holding a weapon, the weapon type changed, or if the game mode changes from in game.
```
// Streets of Rage 2
// #ID = 3

// $EF33: 8-bit - Holding Weapon
function HoldingWeapon() => byte(0x00EF33)

// $EF37: 8-bit - Weapon Type
function WeaponType() => byte(0x00EF37)

// $EF4E: Player one, number KOs
function Player1KO() => word(0x00EF4E)

// $FC02: Screen Mode- 0=segalogo, 4=pressstart, 8=demo, c=mainmenu, 10=options, 14=ingame, 
//        18=charselect, 1c=ending, 24=introcards, 28=credits
function ScreenMode() => byte(0x00FC02)

// Count how many enemies where knocked out while holding a weapon
// This variation counts instance of multiple enemies getting knocked out at once.
achievement(
    title = "Example 2C: Steel Grip",
    description = "Defeat 10 enemies without dropping your weapon",
    points = 0,
    trigger = measured(
                  tally(10, 
                      prev(Player1KO()) < Player1KO(),
                      prev(Player1KO()) + 1 < Player1KO(),
                      prev(Player1KO()) + 2 < Player1KO(),
                      prev(Player1KO()) + 3 < Player1KO(),
                      prev(Player1KO()) + 4 < Player1KO()
                  )
              ) &&
              never(ScreenMode() != 20) &&
              never(WeaponType() != prev(WeaponType())) &&
              never(HoldingWeapon() != 1)
)
```
There many cases where you might want to use *AddHits* to count in game events that increment/decrement by multiple values. It's a good practice to test knocking out multiple enemies at once or collecting multiple items at once.  When in doubt, assume that a piece of memory could increment/decrement by multiple values.  It's minimal overhead that will potential save future hassle.<br>
<br>
[Complete Example #2C with the above solution](Example_02C_Streets_of_Rage_2_Solution.rascript)<br>
<br>
### Links
[Tutorial #2](../readme.md)<br>
[Example #2A](../Example_2A.md)<br>
[Example #2B](../Example_2B.md)<br>
[Example #2C](../Example_2C.md)