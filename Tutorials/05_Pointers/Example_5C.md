 ## Example #5C - Steel Grip
 # Example 5C: No Idea What You're In For
Following the animal theme, Doctor Octopus is a scientist driven mad by the accident that fused four robotic tentacle arms to his body.  In this achievement Spider-Man must defeat Doctor Octopus without taking damage or letting Doctor Octopus regenerate his shield two or more times.
 
!(Spider-Man Vs. Doctor Octopus)[Spiderman_Vs_DocOck_Fight.png]
## Boss Pointer
The boss *pointer* at address ```$0B563C``` uses the same data structure as the player stat’s pointer at memory ```$0B5268``` plus a few specific variables used to track events in the fight.  Doctor Octopus is using a shield to protect himself from Spider-Man which can be turned off temporary by turning off four switches. The offset ```+40c``` tracks how many of the four switches are currently on.  Once all four switches are off the shield will drop and Spider-Man can attack Doctor Octopus directly.  After a few seconds the shield will be restored and the switch count will go from zero to four again.
```
+DE - Boss Health
+2F4 - Water Level (Spidey Vs Venom Again)
+40C - Number of switches remaining to deactivate Ock's shield
```
## Homework #5
Create an achievement to defeat Doc Ock without taking damage before his shield can regenerate for a second time.
<br>
Solutions: [Tutorial #5 Solution](./Solution/readme.md)<br>
### Links
[Tutorial #5](readme.md)<br>
[Example #5A](Example_5A.md)<br>
[Example #5B](Example_5B.md)<br>
Example #5C