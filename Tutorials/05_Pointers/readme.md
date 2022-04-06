# Tutorial #5 – Pointers
## Overview
This tutorial will show a few examples of how to create achievements for a game that uses *pointers*. [Spider-Man](https://retroachievements.org/game/11319) was chosen for the tutorial because it uses several *pointers* for Spider-Man himself and other characters in the game.  If you are unfamiliar with *pointers* then please review the [Pointer/Add Address Tutorial video](https://youtu.be/_gk0vYYlm-E) by [wilhitewarrior](https://retroachievements.org/user/wilhitewarrior). The video contains a great explanation of *pointers* and how to find them.<br>
 
![Spider-Man Title Screen](Spiderman_Title.png)
## Pointers
*Pointers* are variables that point to another memory address. They are commonly used for dynamic memory where the program will ask for a specified amount of memory and the operating system will allocate the next available block of memory to it.  The *pointer* is then assigned the memory address for the newly created memory.  Once the program is done with the memory it is returned to the operating system.  Because of the dynamic nature of acquiring and releasing memory a *pointer* will rarely point to the same address.<br>
<br>
Dynamic memory is a modern feature so you’re more likely to run into *pointers* on newer systems like the N64, Playstation, or Dreamcast although they do show up occasionally on earlier systems.  Pointers are often 32-bits with the address being in the bottom 24-bits and the top 8-bits commonly being 0x80, 0x90, 0xc0, or 0xff. These prefixes are based on where the RAM is located in the memory map of the system. For example, Playstation and N64 starts at 0x80000000, so that's why the upper byte is 0x80 on those systems. Similiarly, the Mega Drive RAM starts at 0xFF0000, so you will often see pointers with that prefix on that system.  Knowing this, we can ignore the prefix and use the rest of the *pointer* value to figure out where the memory is located.  A 24-bit *pointer* can address up to 16MB of memory so later generation consoles may use the full 32-bits to represent higher memory addresses and likewise older generation consoles may have 16-bit *pointers*.
## Data Structures
*Data structures* are a specialized way for organizing memory in object oriented programming. *Data structures* are used to group pieces of data together and are sometimes organized to improve performance.  Consider the *data structure* used for Spider-Man’s player stats below:
```
Player Stats Data Structure
+04 - X Coordinates
+08 - Y Coordinates
+0C - Z Coordinates
+DE - Health
+140 - Animation ID
+150 - Another Animation ID?
+1A8 - Cutscene Playing (01)
+5D8 - Webbing
+5DC - Web Cartridges
+5F0 - Spidey Armor Active
+5F8 - Spidey Armor Strength
+5EC - Magnesium Webbing (01)
+EE8 - Pointer to Current Enemy
+EEB - Target Type
+1014 - Max Health
```
Note that the *data structure* is incomplete and has many more variables that were not required for the achievements. When assigning a new *pointer* the address points to the root of the data structure at *data offset* 0x0.  If we want to know the address for Spider-Man’s health we would need to add 0xDE to the player stats *pointer*. Similarly, if we want to know who Spider-Man is targeting we would add 0xEE8 to the player stats *pointer*.  In this case we would have a double *pointer*, a *pointer* that points to another *pointer*, which is shown in [Example 5B](Example_5B.md).  One of the nice things about *data structures* is that since they group data together, once you find a useful memory address there will likely be other useful memory addresses around it.
# Finding Pointers
How do you know if you have a *pointer*? *Pointers* can change at any time but are usually set during a load sequence.  To find a *pointer* it’s best to dig memory in multiple game instances. If you notice that a memory address differs between instances you might have a *pointer* on your hands.  To find a pointer:
1)	Make three or more save states and save a note for the memory address of interest in each state.  For this example we will be using three states
```
Mem_1 = Memory address in state 1
Mem_2 = Memory address in state 2
Mem_3 = Memory address in state 3
```
2)	Find the address differences between the states by using a [hex calculator](https://www.calculator.net/hex-calculator.html).  For a three state example:
```
MemDiff1_2 = Mem_2 – Mem_1
MemDiff2_3 = Mem_3 – Mem_2
```
3)	Start in state 1 and filter the memory for a 32-bit address (may be 16-bit for Mega Drive or SNES).  *Pointers* are often aligned in memory so try using an aligned 32-bit filter if you have too many candidates.
4)	Continuously filter by "= Last Value" and play the game for a little bit to reduce the possible candidates
5)	Turn off the continuous filter and switch to state 2 
```
If MemDiff1_2 > 0 then filter “Last Value Plus” by MemDiff1_2
If MemDiff1_2 < 0 then filter “Last Value Minus” abs(MemDiff1_2)
```
6)	Switch to state 3 
```
If MemDiff2_3 > 0 then filter “Last Value Plus” by MemDiff2_3
If MemDiff2_3 < 0 then filter “Last Value Minus” by abs(MemDiff2_3)
```
7)	At this point you should have a couple of good *pointer* candidates. If not then you may need more than three save states. You can filter candidates further by using "constant <" the address of ```Mem_3``` (don't forget the memory prefixs for the system ie. 0x80, 0x90, 0xc0, etc...)
8)	Select a pointer with the value that is a little less than the address of the memory you're testing.   The reason why it should be less is to account for the data structure of the memory ```Candidate = value of the pointer candidate```.
9)	Figure out the *data offset* for the current memory by ```Data_Offset = Mem_3 - Candidate```
10)	Make a small test achievement using the new *pointer* and *data offset* to check if it works for all the states. If we are testing a byte then the syntax would be ```byte(tbyte(Candidate) + Data_Offset)```

### Links
Tutorial #5<br>
[Example #5A](Example_5A.md)<br>
[Example #5B](Example_5B.md)<br>
[Example #5C](Example_5C.md)