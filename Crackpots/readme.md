# Crackpots Achievement Design
## Overview
Crackpots is a simply arcade style game where the player controls Potsy, a gardener, who is trying to protect their apartment building from a ravenous hoard of bugs. The bugs climb up the building in waves and will devour an entire floor if more than half on them reach the windows. To stop the climbing bugs Potsy moves from side to side on top of the building while dropping flower pots on the ascending bug horde. Every wave has one of four different coloured bugs, each with their own climbing pattern. If you manage to clear four bug waves in a row without losings a floor your score multiplier increases. Likewise, if you lose and floor you drop a multiplier and start the last wave over again. A high multiplier is the best way to earn the high score however, bugs move much faster at higher multiplier.
## Scripts
This is the 1st game that I wrote completely with **RATools** (https://github.com/Jamiras/RATools). It probably would have been easier to write using **RALibRetro** (https://github.com/Jamiras/RALibretro) however, I wanted to force myself to learn the tools. As such, the highest wave leaderboard didn't work the way I wanted and ended up modifying one of the wave achievements for it.  Regardless, **RATools** was well worth learning for the variable abstraction and the ability to leave comments. I've only scratch the surface of the tools and am looking forward to using it on future projects.
## Excel Workbook
This set used Excel to help design, analyze, and track testing of all the achievements.
### Achievements Spreadsheet
The **Achievement** sheet collects all of the achievements information in one location for sorting and filtering purposes.
### Extras Spreadsheet
The **Extras** sheet collects all of the extra achievements that didn't make the final cut. These achievements are archived here for future reference.
### Leaderboards Spreadsheet
The **Leaderboards** sheet collects all of the leaderboards information in one location for sorting and filtering purposes.
### Checklist Spreadsheet
The **Checklist** sheet was used to systematically track the QA status of the achievements while developing.
### Text Spreadsheet
The **Text** sheet contains the text, descriptions, and point values from the **Achievements** sheets. The **Text** sheet is used to format the achievements in a human readable format.
### Stats Spreadsheet
The **Stats** sheet is used to analyze the point distribution by both achievement type and game mode.
