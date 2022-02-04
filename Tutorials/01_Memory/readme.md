# Tutorial 1 - Memory Basics
## Overview
This tutorial will show a few examples of how to use both variables and functions to create some basic achievements in RAScript.  [Sonic the Hedgehog](https://retroachievements.org/game/1) was chosen for the example due to its simple memory and since it is such a well know title.  The [example script](Example_01_Sonic_the_Hedgehog.rascript) will used to highlight aspects of the tutorial.
Note that this tutorial will touch on some programming fundamentals but will not go in to depth.  If you are new to the programming world there several free sites online that would be a good introduction.  This series of tutorials will use video links from [Khan Academy](https://www.khanacademy.org/) to help explain programming basics where appropriate. 

![Sonic the Hedgehohg Title Screen](Sonic_Title.PNG)

## Variables
Variables are abstract data elements that allow the programmer to store and manipulate different types of data.  As a programmer you can create and manipulate variable as needed. If you are unfamiliar with the concept of variables then review [Variables](https://www.khanacademy.org/computing/computer-programming/programming/variables/pt/intro-to-variables) and [More on Variables](https://www.khanacademy.org/computing/computer-programming/programming/variables/pt/more-on-variables) videos from Khan Academy.

In RAScripts a variable can be:
* Integers - Whole numbers that range from -2147483648 to 2147483647
* Floats - Real numbers that range from -3.4E+38 to +3.4E+38
* Strings - Text values that are surrounded by quotation marks 
* Conditions - Binary logical expressions that yield true or false values.  Achievement logic are conditions and the achievement is triggered when all of the conditions are true.
* Arrays – Arrays are sequential memory that can be indexed by an integer. Arrays are commonly used with for loops and will be covered there.
* Dictionaries – Dictionaries are memory that can be indexed by either an integer or string using hash maps. Dictionaries are commonly used with rich presence and will be covered there.

The following code is using variables to abstract memory locations with easy to understand names.  For example, it’s much easier to understand what the variable *Rings* is used for instead of *byte(0xFE20)*. One major point is that variables must be declared before you use them so many scripts declare variables right at the beginning.
```
// $F601: [8-bit] Stage type
//        0x10 = special
//        0x0C = normal?
StageType = byte(0xF601)

// $FE10: [16-bit] Current Act and Zone Together
Level = word(0xFE10)

// $FE17: [8-bit] Current special stage
//        0 = White Emerald
//        1 = Blue Emerald
//        2 = Yellow Emerald
//        3 = Purple Emerald
//        4 = Green Emerald
//        5 = Red Emerald
SpecialStage = byte(0xFE17)

// $FE20: [8-bit] Ring counter
Rings = byte(0xFE20)

// $FE56: [8-bit] Chaos Emeralds Count (range 0-6)
ChaosEmeralds = byte(0xFE56)

// $FFE1: [8-bit] Level Select Active (0 = not active)
LevelSelect = byte(0xFFE1)

// $FFF0: [8-bit] Demo Mode Active (0 = not active)
DemoMode = byte(0xFFF0)

// $FFFB: [8-bit] Debug Mode active (0 = not active)
DebugMode = byte(0xFFFB)
```
## Functions
Function are modules of code that can be reused as many times as needed. If you find yourself writing a repetitive piece of code it would often be better written as a function.  When you call a function all of the code inside of the function is ran returning a result variable once done. If you are unfamiliar with the concept of functions then review the [Functions](https://www.khanacademy.org/computing/computer-programming/programming/functions/pt/functions), [Function Parameters](https://www.khanacademy.org/computing/computer-programming/programming/functions/pt/function-parameters), and [Function Return Values]( https://www.khanacademy.org/computing/computer-programming/programming/functions/pt/function-return-values) videos from Khan Academy.
Like variables, functions need to be declared before they are called so this example defines the following functions after the memory variables are defined. We define some helper functions that help further abstract the code from the raw memory address and values which help make it easier to understand.  These helper functions will be used later in the example.
```
// Check if we are in a normal stage
function InNormalStage() => StageType == 0xC

// Check if we are in a special stage
function InSpecialStage() => StageType == 0x10

// Check for the transition between two levels
function Transition(last, next) => prev(Level) == last && Level == next

// The Active function handles the level select, debug, and demo checks.
// This function should be added to each achievement for cheat protection
function Active()
{
    return LevelSelect == 0 &&
        DemoMode == 0 &&
        DebugMode == 0
}
```

The InNormalStage() and InSpecialStage() are used as shortcuts that return a condition to check if player is currently in a normal stage or a special stage. The Active() function returns a more complicated condition that handles the demo and cheat protection for the set.  The benefit of wrapping up all of the protection conditions in one function is that if new type of protection was needed then you could simply update the Active() function and each achievement will get updated with the new protection.

The Transition() function is unique since it takes the parameters *last* and *next* which change how the function operates.  You can use the parameters inside a function like variables that only exist inside of the function.  In this case the function checks if previous (delta) value of the level is the *last* value and current value of the level is the *next* value.  A different condition will be created depending on the parameters that were used.\
\
Links:\
Tutorial #1\
[Example 1A](Example_1A.md)\
[Example 1B](Example_1B.md)\
[Example 1C](Example_1C.md)



