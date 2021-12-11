// Star Fox 64 [Bonus]
// #ID = 10630


// $0C189B: possibly related to audio tracks?
// $0C2F04: dialog boxes
// $0C5838: cockpit view 1.1
// $0D8E92: c-up=08 c-down=04 c-left=04 c-right=01L=20 R=10
// $0D8E93: start=10 A=80 B=40 Z=20
// $0DDBA8: solar fake leaderboard temp
// $0DEFAA: another x cooridnate 64 logo
// $0FA313: wtf
// $100F11: cursor?
// $100F21: ship cursor?  0c is forward, 20 hard left, 01 hard up, f9=hard right
// $108938: higher value when lower (for solar leaderboard)
// $137BA8: Venom II camera controller
// $137BAC: which ship type in multi (player 1)
//          0=Arwing
//          1=Landmaster
//          2=crash emulator
//          3=on foot
//          >4=nothing
// $137C18: cockpit view 1.2. writable.
// $137C44: [16-bit] Health bar uneven levels e.g 1,3,5
function Health() => word(0x137C44)

// $137C4C: does something when get's life, 20 and goes down on silver, gold is same
// $137C9E: Boost meter uneven levels e.g 1,3,5
// $137CA4: deflect counter uneven levels e.g 1,3,5
// $137E7E: Left wing health: 0=No wing, 1= 1 wing, 2=2 wings
// $137E7F: Right wing health: 0=No wing, 1= 1 wing, 2=2 wings
// $13AA88: Sector Z camera and control settings. (writable) a=going into great fox. Every value < b has various triggers. 0=hide ship and ui, 1=start mission ui and heading, 2=a cutscene view, 3=normal view, 4=destroy ship, 5=u-turn or return to camera, 6=end mission or after died -- can trigger mission complete sometimes, 7=another cinematic view, 8=wierd stuff, 9=makes jet fly hard right -- does other stuff with 8, upper nibble: any val causes ship to stop moving
// $13AA9C: many address around this region are connected to player actions like barrel roll
// $13AAB8: timer on some cinematic views (sector Z ending)
// $13AB04: count down from 7 ever time a laser is shot
// $13AB24: health bar even levels e.g 2,4,6
// $13AB7E: boost meter even levels e.g 2,4,6
// $13AB84: deflect counter even levels e.g 2,4,6
// $13AD5E: wings, even levels
// $13AD5F: wings, even levels
// $13AD8B: 1 when player is going into the great fox
// $144062: (16bit) changes from 8015 to 800c as the bill is stamped on the invoice
// $144085: becomes 10 when you stamp (from 0)
// $146602: [8-bit] Music track? ff=boss died, 26=fanfare ff=exiting area, 3c=map, ff=starting area, 2c=starting area 2, ff=about to play, 0x=in area (x is stage specific), switches to ff between transions of things, like corneria it goes from 2>>ff>>12 when switching to all range, 40=victory, 24=rank in,
function Music() => byte(0x146602)
// $146E78: turns 33 when barrel roll
// $146E79: turns 33 when barrel roll
// $146E7A: turns d3 when barrel roll
// $146E7C: animation timer of the barrel roll
// $14783A: opening demo =1?, also 1 during gameplay
// $147A20: 1=title/in game in control, 2=main menu, 0 everywhere else?
// $149B48: e0=in game in control/at very start briefly, 20=map/briefing/cutscenes/game-start
// $149B4B: [8-bit] a0=music paused, 80=music playing (writable) a4x=will pause tone on music
function MusicStatus() => byte(0x149B4B)
// $149B52: (testing address for in game in control)
//          0e10=in control blue marine
//          1aa0=in game in control Corneria
//          1c20=in game in control Metos
//          1aa0=after warping in metos
//          1770=briefly after reset
//          1680=loading up game/cutscene/map
//          14a0=title/main menu
// $149B5A: music timing, master
// $149B70: 1a34=map/intro/cutscenes, 0000=in control of ship, goes back to 1a34 a bit after boss fight ends (when fanfare starts), for metos it didn't chnage to 1a34 until returing ot the map.
// $149B80: aaa0 in ship in control/main menu, e5f8 intro/bosses, switches other times
// $149BB4: only af50 during the title screen?
// $14A082: horizontal
// $14A906: [8-bit] Solar Temp Indicator 1
function SolarTemp1() => byte(0x14A906)
// $14A9CE: [8-bit] solar temp indicator 2
function SolarTemp2() => byte(0x14A9CE)
// $14D313: becomes 4 when you stamp (from 0)
// $14E709: clock
// $155792: Katina, counter of Bill's ships killed
// $155793: offended bill flag? goes to 1 after one of his ships is killed with a laser
// $155794: becomes 1 when the mid mothership cutscene starts
// $155799: seems to trigger some dialogue for katina
// $1557A4: Seconds katina timer
// $1557A8: miliseconds katina timer
// $1574F7: zones search lights flag.
// $157584: (16bit) total hits, at end game if 782--1093 pepper says "this is one steep bill but it's worth it." Above 1093 and he says "Whaatt?"
// $157598: cccd
// $15759A: 3ecc
// $15759C: another hit/kill counter. specifically the display counter
// $157680: 1=paused 0=upaused
// $157722: this is a timer, its not in seconds though...it starts really fast and then goes slower
// $157723: if the timer hits ff this goes  1
// $157898: Multiplayer Level selection (0--1)
// $15789F: [16-bit] 1=player in control (most), 0=cutscenes and stuff. tag: cinematic
function Player1Control() => word(0x15789F)
// $1578B3: Related to background stuff (like fog)
// $1578D2: is 00 all the time flickers with some values in between last shot and cinematic
// $157903: Gold rings (>3 lifebar grows), rests on death, new stage to < 3. Player gets a 1up at 6 golden rings
// $157908: [16-bit] active hit/kill counter (hex), max: 3e7/999(dec) tag: current, hits
function Hits() => word(0x157908)
// $15790C: kill counter saved to checkpoint
// $157912: Lives
// $157918: Laser powerups 0=green laser 1=double green laser 2= double blue laser. tag: weapon
// $159270: object first?
// $1592BC: object
// $159308: object
// $159354: object
// $1593A0: object
// $1593EC: object
// $159438: object
// $159484: object
// $1594D0: object
// $15951C: object
// $159568: object
// $1595B4: object
// $159600: object
// $15964C: object
// $159698: object
// $1596E4: object
// $159730: object
// $15977C: object
// $1597C8: object
// $159814: object
// $1598AC: object
// $1598F8: object
// $159944: object
// $159E50: c1=satalite dish object id, c8=plain ship? fc=searchlight
// $159E52: 200=ojbect here, 0=object destroyed, 200=ship going down?
// $159F0E: object took damage (red)
// $159F10: counts down from 2 to 0 when object hit
// $159F23: 1
// $15A144: object
// $15A204: sat death indicator
// $15A438: object
// $15A72C: object
// $15AA20: object
// $15AAE0: sat death indicator
// $15AAEC: Wolf Life
// $15AD14: object
// $15ADD4: sat death indicator
// $15ADE0: leon life
// $15B008: object
// $15B0C8: sat death indicator
// $15B0D4: pigma Life
// $15B2FC: train 13, slot 1, flatcar missile object id
// $15B378: train 13, slot 1, missile lifebar
// $15B380: train 13, slot 1, flatcar missile, 1=case destroyed, 2=missile destroyed
// $15B3B6: train 13, slot 1, flatcar missile, death indicator
//          2=object on top destroyed, 3=car is destroyed
// $15B3BA: satalite death indicator 1
// $15B3BC: satalite death indicator 2
// $15B3C8: andrew life
// $15B5F0: train 12, slot 1, gun 4, object id
// $15B66C: train 12, slot 1, gun 4, health
// $15B6AA: train 12, slot 1, gun 4, death indicator
//          2=contents, 3=car
// $15B8E4: train 11 slot 1, fuel tanker 2 object id
// $15B960: train 11 slot 1, fuel tanker 2 health
// $15B99E: train 11 slot 1, fuel tanker 2, death indicator
//          2=contents, 3=car
// $15BBD8: Train 10 flatcar, slot 1, object id
// $15BC80: train 10, slot 1, flatcar (2box1robot) bits 0-2 for objects destroyed. When all 3 are destroyed the car is destructable
// $15BC92: train 10, slot 1, flatcar, death indicator
//          2=object on top destroyed, 3=car is destroyed
// $15BC96: 1 for satalite dish
// $15BC98: count from 2 for satalite dish
// $15BCA4: Training: Wolfen ship lifebar
// $15BECC: train 9, slot 1, dumper 4 object id
// $15BF48: train 9, slot 1, dumper 4 health
// $15BF86: train 9, slot 1, dumper 4, death indicator
//          2=contents, 3=car
// $15C1C0: train 8, slot 1, gun 3 start of object and id,
// $15C23C: train 8, slot 1, gun 3 health,
// $15C27A: train 8, slot 1, gun 3 health, death indicator
//          2=contents, 3=car
// $15C4B4: train 7, slot 1, fuel wagon 1,start of object, object id
// $15C530: train 7, slot 1, fuel wagon 1, health
// $15C56E: train 7, slot 1, fuel wagon 1, death indicator
//          2=contents, 3=car
//          and train 13, slot 2, flatcar missle,
// $15C7A8: train 6, slot 1, gun 2 start of ojbect
// $15C824: train 6, slot 1, guncar 2, health
// $15C862: train 6, slot 1, guncar 2, death indicator
//          2=conents, 3=car
//          and train 12, slot 2, gun 4,
// $15CA9C: train 5, slot 1, dumper 3, object id
// $15CB18: Train 5, slot 1, dumper 3 health
// $15CB56: Train 5, slot 1, dumper 3 death indicator
//          2= contents, 3=car
//          and train 11, slot 2, tanker 2,
// $15CD90: Train 4, slot 1, dumper 2, object id
// $15CE0C: Train 4, slot 1, dumper 2 life
// $15CE4A: Train 4, slot 1, dumper 2 death indicator
//          2=contents destroyed 3=car destroyed
//          and train 10, slot 2, flatcar
// $15D084: Train 3, slot 1, dumper 1 - ojbect id
// $15D100: Train 3, slot 1, dumper 1
// $15D13E: Train 3, slot 1, dumper 1 death indicator
//          2=contents destroyed, 3=car destroyed
//          and train 9, slot 2, dumper 4
// $15D378: train 2, slot 1, object id
// $15D3A0: train 2, slot 1, 4f0c=load dies, 749c car dies after, 5a20=car doesn't die
// $15D3B6: 100
// $15D3CC: if 0x15d3dc is 0 this is 1, and the gun aims down and shoots
// $15D3E4: e
// $15D3F4: train 2, slot 1, guncar 1, health
// $15D432: *train 2, slot 1, guncar 1
//          2=gun destroyed 3=car destroyed
//          and train 8, slot 2
// $15D66C: train 1, flatcar: ojbect id, d0=unused boxes, d1=flatcar with 2 boxes, 1 robot , d2=dumpcar, d4=gun car, d5=tanker car, d6=empty flatcar, c8=mecha
// $15D6D0: train 1, near box, can't hit again timer.
//          13 when destroyed
// $15D6D8: train 1, far box, can't hit again timer.
//          13 when destroyed
// $15D6DC: train 1, robot-box, can't hit again timer.
//          13 when destroyed
// $15D6E4: train 1, far box, 2=damaged, 4=destroyed
// $15D6E8: train 1, far box health
// $15D6F0: train 1, farbox visual damage,
//          1=1 hit, 2=destroyed
// $15D6F4: train 1, robot-box, 2=damaged, 4=destroyed
// $15D6F8: train 1, slot 1, robot-box health
// $15D700: train 1, robot-box visual damage,
//          1=1 hit, 2=destroyed
// $15D704: train 1, near box, 2=damaged, 4=destroyed
// $15D708: train 1, slot 1, near box health
// $15D710: train 1, near box visual damage,
//          1=1 hit, 2=destroyed
// $15D714: train 1, slot 1, flatcar (2box1robot) bits 0-2 for objects destroyed.  When all 3 are destroyed the car is destructable
// $15D726: *train 1, slot 1, flatcar, 2=object on top destroyed, 3=car is destroyed
//          and train 7, slot 2 (tanker)
// $15D740: train 1, slot 1 this row makes changes when train is shot at
// $15DA1A: train 6, guncar 2, slot 2 damage indicator
// $15DD0E: train 5, dumper 3, slot 2 damage indicator
// $15DFC4: train car 4 - wagon 2, slot 2
// $15E002: train 4 - dumper 2, slot 2 damage indicator
// $15E2B8: train car 3, slot 2 health
// $15E2F6: Train 3, slot 2, damage indicator
// $15E5AC: train 2, slot 2, gun-car 1 health
// $15E5EA: train 2, slot 2, gun-car 1 damage indicator
// $15E824: train 1, slot 2, object id, start of object,
// $15E82A: object y position (32bit)
// $15E832: (32bit) object z position
// $15E84E: if != 8025 doesnt interact with shots
// $15E8A0: train 1, slot 2, furthest box health,
// $15E8B0: train 1, slot 2, robot-box health,
// $15E8C0: train 1, slot 2, nearest box health,
// $15E8CC: train 1, slot 2, flatcar (2box1robot) bits 0-2 for objects destroyed. When all 3 are destroyed the car is destructable
// $15E8DE: train 1, slot 2, flatcar, damage indicator
//          2=object on top destroyed, 3=car is destroyed
// $164FCC: =6 death indication of sub boss (zoness)
// $164FE2: health bar carrier and sub final phase, aquas enemy bio weapon final phase
// $165008: Granga right shoulder 3e8=destroyed
// $16500C: Granga head 3e8=destroyed
// $16500E: Granga left shoulder 3e8=destroyed
// $165010: Granga left calf 3e0=destroyed. 6>>7 on golemech death?
// $165012: Granga left foot 3e0=destroyed
// $165014: Granga right foot 3e0=destroyed
// $165016: Granga left thigh 3e0=destroyed
// $165018: Granga right thigh 3e0=destroyed, also also hits left on right pearl shooter
// $16501A: Granga left calf 3e0=destroyed, also hits left on right pearl shooter
// $165038: Granga right leg health
// $16503A: Granga left leg health
// $16503C: Granga right shoulder
// $16503E: Granga left shoulder health
// $165040: main Health bar granga
// $165042: Corneria all range boss head life bar
// $165046: golemech total life bar
// $165F80: near start of small object data
// $169650: start of ring slot 1 object. 142=laser, 150=gold ring, 147=bomb, 143=checkpoint, 144=silver ring, 145=star ring
// $169653: if 2 collectable is shown
// $169654: (32bit) collect slot 1  x coordinate
// $169658: (32bit) collect slot 1 y coordinate
// $16965C: (32bit) collect slot 1 z coordinate (depth)
// $169664: flux vals as collected
// $169666: rotation
// $16966A: flux vals as collected, slower rate of change than 0x4
// $169695: item slot 1. 1=item collected, setting to 0 will restart the animation and sound, setting to 2 will leave the ring behind
// $169698: , (16bit) countdown timer related to the rings. not sure what, it doesn't activate when you get a ring, but turns off when out of the loaded ring's area
// $16969A: item slot 1 collected timer
// $16969F: item slot 1.2
// $1696A0: used for "Landmaster Collector", this adr stays 0
// $1696A2: (16bit overflow in0x0) xRRR spin rate(R), 5xxx static, 4xxx rotating, >5xxx gone, <4xxx not accepted
// $1696BA: (16bit) (maybe32) object size (0x8 small)
// $1696BC: start of object 2, object id.
// $169701: item slot 2. 1=item collected
// $169706: (16bit) item collected slot 2 timer
// $169728: Item collect slot 3
// $16976D: item slot 3 collect
// $169772: time slot 3 collect timer
// $169794: item slot 4 id
// $1697D9: item collect slot 4
// $1697DE: item slot 4 timer
// $169800: item slot 5 id
// $169845: item collect slot 5
// $16984A: ring/item collection timer slot 5
// $16986C: Item slot 6 id
// $1698B1: item slot 6 collect
// $1698B6: item slot timer 6
// $1698D8: item slot 7 id
// $16991D: item slot 7 collect
// $169922: item timer slot 7
// $169944: item slot id 8
// $169989: item slot 8 collect
// $16998E: item slot timer 8
// $1699B0: item slot 9 id
// $1699F5: item slot 9 collect
// $1699FA: item slot timer 9
// $169A1C: item slot 10 id
// $169A61: item slot 10 collect
// $169A66: itme slot timer 10
// $169A88: item slot 11 id
// $169ACD: item slot 11 collect
// $169AD2: item slot 11 timer
// $169AF4: item slot 12 id
// $169B39: item slot 12 collect
// $169B3E: item slot 12 timer
// $169B60: item slot 13 id
// $169BA5: item slot 13 collect
// $169BAA: item stot 13 collect timer
// $169BCC: item slot 15 id
// $169C11: item slot 14 collect
// $169C16: item slot 14 timer
// $169C38: item slot 15 id
// $169C7D: item slot 15 collect
// $169C82: item slot 15 timer
// $169EC0: when you charge your shooter this becomes 04
// $169EC3: blaster is shooting, well related to the shot button
// $169F24: re bullets or shots. stops when bulet hits object 0 if it get to infinity
// $16A54F: combo number 1.1 doesn't count boss kills
// $16C2AB: combo number 1.2 display (50 is max)
// $16D6A4: game mode (useful!!)
//          0,64--68,
//          1=init
//          2=intro and title
//          3=name entry, main menu
//          4=map (includes intro)
//          5=game over (brief)
//          6=going to (multi) game
//          7=game
//          8=end creds
function GameMode() => byte(0x16D6A4)
// $16D6B0: short timer after boss dies (train) (mission accomplished)
// $16D6B8: train boss visible display, starts at ff
// $16D708: game mode: 0=transition/load, 1=intro, 2=main menu/score entry, 3=prologue/map/game over, 4=in game, 8=credits,
// $16D70C: mp level
//          corneria = 0
//          katina = 1
//          sector z = 2
// $16D724: Falco's Health meter
// $16D727: ff=falco is down
// $16D728: Slippy's health meter
// $16D72A: ff=slippy is down
// $16D72B: ff=slippy is down
// $16D72C: Peppy's health meter
// $16D72E: ff=peppy is down
// $16D72F: ff=peppy is down
// $16D868: expert mode flag. tag: difficulty, hard
// $16D940: Shield they left out of the game, could come in handy for testing chievs. tag: invincible,
// $16D9B0: Utility: enter 0 at map, will complete some stages
// $16D9B8: how many stages you've completed (how many stages it draws wingmen survival and route color on map -k)
// $16D9C0: (28 bytes) Wingmen survival record (map screen), 8 bytes per stage. any number greater than 0 shows a wingman. xxPPSSFF (32bit)
// $16D9D8: venom falco
// $16D9D9: venom slippy
// $16D9DA: venom peppy
// $16D9E0: (28 bytes) stage hits number on map. 4 bytes per stage
// $16DA00: Stage 1: Plantet drawn on map sqares (0--e)
//          Also the other planets, every 4 bytes.
// $16DA18: (last one) Stage 7: Plantet drawn on map sqares (0--e)
// $16DA20: (32bit) Level 1 (Corneria) medal (map screen)
// $16DA24: (32bit) Level 2 medal (map screen)
// $16DA28: (32bit) Level 3 medal (map screen)
// $16DA2C: (32bit) Level 4 medal (map screen)
// $16DA30: (32bit) Level 5 medal (map screen)
// $16DA34: (32bit) Level 6 medal (map screen)
// $16DA38: (32bit) Level 7 (venom) medal (map screen)
// $16DA48: [8-bit] Level route Corneria --> Meteo (0 = off, 3 = on)
// $16DA4C: [8-bit] Level route Meteo --> Fortuna (0 = off, 3 = on)
// $16DA50: [8-bit] Level route Fortuna --> Sector X (0 = off, 3 = on)
// $16DA54: [8-bit] Level route Sector X --> Titania (0 = off, 3 = on)
// $16DA58: [8-bit] Level route Titania --> Bolse (0 = off, 3 = on)
function RouteTitaniaBolse() => byte(0x16DA58)
// $16DA5C: [8-bit] Level route Katina --> Sector X (0 = off, 3 = on)
// $16DA60: [8-bit] Level route Macbeth -> Bolse (0 = off, 3 = on)
function RouteMacbethBolse() => byte(0x16DA60)
// $16DA64: [8-bit] Level route Sector Z --> Bolse (0 = off, 3 = on)
function SectorZBolse() => byte(0x16DA64)
// $16DA68: [8-bit] Level route Bolse --> Venom (0 = off, 3 = on)
function RouteBolseToVenom() => byte(0x16DA68)

// $16DA6C: [8-bit] Level route Sector Y --> Katina (0 = off, 3 = on)
// $16DA70: [8-bit] Level route Katina --> Solar (0 = off, 3 = on)
// $16DA74: [8-bit] Level route Solar --> Macbeth (0 = off, 3 = on)
// $16DA78: [8-bit] Level route Sector X --> Macbeth (0 = off, 3 = on)
// $16DA7C: [8-bit] Level route Fortuna --> Solar (0 = off, 3 = on)
// $16DA80: [8-bit] Level route Zoness --> Macbeth (0 = off, 3 =16E0A4 on)
// $16DA84: [8-bit] Level route Corneria --> Sector Y (0 = off, 3 = on)
// $16DA88: [8-bit] Level route Sector Y --> Aquas (0 = off, 3 = on)
// $16DA8C: [8-bit] Level route Aquas --> Zoness (0 = off, 3 = on)
// $16DA90: [8-bit] Level route Zoness --> Sector Z (0 = off, 3 = on)
// $16DA94: [8-bit] Level route Sector Z --> Area 6 (0 = off, 3 = on)
function RouteSectorZToArea6() => byte(0x16DA94)
// $16DA98: [8-bit] Level route MacBeth -> Area 6 (0 = off, 3 = on)
function RouteMacBethToArea6() => byte(0x16DA98)
// $16DA9C: [8-bit] Level route Area 6 --> Venom (0 = off, 3 = on)
function RouteArea6ToVenom() => byte(0x16DA9C)

// $16DAA2: p1 hit count controller in multi, time trial
// $16DB92: [16-bit] Scroll distance
function ScrollDistanceUpper() => high4(0x16DB92)
function ScrollDistance() => word(0x16DB92)

// $16DB93: [8-bit] Scroll distance upper byte
function ScrollBig() => byte(0x16DB93)
// $16DBDA: (16 bit) npcs speaking 41a0=Slippy, 4120=Falco, 41f0=Peppy
//          4348=Wolf, 435c=Leon, 4352=pigma, 4366=Andrew, 4220=Kat
// $16DC10: Bombs
// $16DC20: [32-bIt] frame clock that pauses when the player pauses and resets at the start of stages
function FrameCount() => dword(0x16dc20)

// $16DC38: [16-bit] Level Scroll (start at 0)
function LevelScroll() => word(0x16DC38)

// $16DCE0: Related to which teammate is getting chased

// $16DCF0: training mode ring counter
function ComboRings() => byte(0x16DCF0)

// $16E0A4: [8-bit] Level id, do not manipulate. ffff when game is finished.
//          00 = Corneria
//          01 = Meteo
//          02 = Sector X
//          03 = Area 6
//          05 = Sector Y
//          06 = Venom 1
//          07 = Solar
//          08 = Zoness
//          09 = Venom (fighting andross 1or2)
//          0a = training
//          0B = Macbeth
//          0C = Titania
//          0D = Aquas
//          0E = Fortuna
//          10 = Katina
//          11 = Bolse
//          12 = Sector Z
//          13 = Venom both/outer (ending)
//          14 = multiplayer
function Level() => byte(0x16E0A4)

// $16E10C: Sets to 04 when dialogs appear
// $16E5D8: minutes time trial
// $16E5DC: seconds time trial
// $16E5E0: miliseconds time trial
// $16E5E8: multi mode =
//          0 = in menu or after restart
//          1= about to start
//          2 = countdown to start
//          8 = game in action (no timer)
//          a = game in action (timed)
//          b = time up
//          3--6 = winner declared
//          7 = retry?
// $16E67A: p1 hits time trial for multi counter thingy
//          see 0x16e67a


LevelTypes = {
    "completed level": 0,
    "normal medal" :1,
    "entered mission": 2,
    "completed mission" : 3,
    "expert medal": 4
}
// $16E6E0: [8-bit] Medal - Sector Z:
//          bit0=completed level
//          bit1=normal medal
//          bit2=entered mission
//          bit3=completed mission on expert
//          bit4=medal expert
function MedalSectorZ(type) => bit(LevelTypes[type], 0x16E6E0)
// $16E6E1: [8-bit] Medal - Bolse
function MedalBolse(type) => bit(LevelTypes[type], 0x16E6E1)
// $16E6E2: [8-bit] Medal - Area 6
function MedalArea6(type) => bit(LevelTypes[type], 0x16E6E2)
// $16E6E3: [8-bit] Medal - Meteo
function MedalMeteo(type) => bit(LevelTypes[type], 0x16E6E3)
// $16E6E4: [8-bit] Medal - Macbeth
function MedalMacbeth(type) => bit(LevelTypes[type], 0x16E6E4)
// $16E6E5: [8-bit] Medal - Katina
function MedalKatina(type) => bit(LevelTypes[type], 0x16E6E5)
// $16E6E6: [8-bit] Medal - Sector Y
function MedalSectorY(type) => bit(LevelTypes[type], 0x16E6E6)
// $16E6E7: [8-bit] Medal - Sector X
function MedalSectorX(type) => bit(LevelTypes[type], 0x16E6E7)
// $16E6E8: [8-bit] Medal - Aquas
function MedalAquas(type) => bit(LevelTypes[type], 0x16E6E8)
// $16E6E9: [8-bit] Medal - Titania
function MedalTitania(type) => bit(LevelTypes[type], 0x16E6E9)
// $16E6EA: [8-bit] Medal - Corneria
function MedalCorneria(type) => bit(LevelTypes[type], 0x16E6EA)
// $16E6EB: [8-bit] Medal - Zoness
function MedalZoness(type) => bit(LevelTypes[type], 0x16E6EB)
// $16E6EC: [8-bit] Medal - Venom (Hard Path)
function MedalVenomHard(type) => bit(LevelTypes[type], 0x16E6EC)
// $16E6ED: [8-bit] Medal - Venom (Easy Path)
function MedalVenomEasy(type) => bit(LevelTypes[type], 0x16E6ED)
// $16E6EE: [8-bit] Medal - Solar
function MedalSolar(type) => bit(LevelTypes[type], 0x16E6EE)
// $16E6EF: [8-bit] Medal - Fortuna
function MedalFortuna(type) => bit(LevelTypes[type], 0x16E6EF)

// $16E6F8: Rankings (initials) - 2nd Place, 1st letter
// $16E6F9: Rankings (initials) - 1st Place, 3rd letter
// $16E6FA: Rankings (initials) - 1st Place, 2nd letter
// $16E6FB: Rankings (initials) - 1st Place, 1st letter
// $16E73C: Rankings - 1st Place, 1st Planet: b0=Slippy, b1=Falco, b2=Peppy; b3=?, b4-b7=Planet
// $16E73D: Rankings - 1st Place, 1st Planet: Points
// $16E743: Rankings - 1st Place, 2nd Planet: Points
// $16E74F: Rankings - 2nd Place: Corneria Points
// $1AE018: rank 1 slot survial count of peppy
// $1AE090: [4 byte] Rankings - 1st Place: Total Hits (Points)
// $1AE094: [4 byte] Rankings - 2nd Place: Total Hits (Points)
// $1AE098: [4 byte] Rankings - 3rd Place: Total Hits (Points)
// $1AE09C: [4 byte] Rankings - 4th Place: Total Hits (Points)
// $1AE0A0: [4 byte] Rankings - 5th Place: Total Hits (Points)
// $1AE0A4: [4 byte] Rankings - 6th Place: Total Hits (Points)
// $1AE0A8: [4 byte] Rankings - 7th Place: Total Hits (Points)
// $1AE0AC: [4 byte] Rankings - 8th Place: Total Hits (Points)
// $1AE0B0: [4 byte] Rankings - 9th Place: Total Hits (Points)
// $1AE0B4: [4 byte] Rankings - 10th Place: Total Hits (Points)
// $1AE0B8: [4 byte] Rankings - 1st Place: Initials
// $1AEECE: 64 on title x coordinate
// $1AEED2: 64 on title y coordinate
// $1AEF08: rank in letter enter slot
// $1AEF10: letter 1//3 in rank in 0=a, 1=b...
// $1AEF14: letter 2//3 in rank in 0=a, 1=b...
// $1AEF18: letter 2//3 in rank in 0=a, 1=b...
// $1AF014: Main Menu item selection [0--5]
// $1AF018: vs mode selector
// $1AF24C: minutes selected - mp battle
// $1B417C: 1
// $1B4198: 1
// $1B419C: 1
// $1B41A0: true Macbeth train boss life bar 2
// $1B41A6: true Macbeth train boss life bar 1
// $1B41C8: true Macbeth train boss life bar 3
// $1C36AC: (16bit) top hits (map and highscore)
// $2FAB19: solar temp indicator 3

PausedLookup = {
    0: "",
    1: "▌▌ ",
}

ModeLookup = {
    0: "",
    1: "[Intro] ",
    2: "[☰|Rank] ",
    3: "[⭐Map] ",
    4: "",
    5: "",
    6: "",
    7: "",
    8: "|Credits| ",
}

ExpertLookup = {
    0: "",
    1: " Expert",
}

StageLookup = {
    0xff: "Victory",
    0: "Corneria",
    1: "Meteo",
    2: "Sector X",
    3: "Area 6",
    4: "",
    5: "Sector Y",
    6: "Venom",
    7: "Solar",
    8: "Zoness",
    9: "Andross",
    0xa: "training",
    0xB: "Macbeth",
    0xC: "Titania",
    0xD: "Aquas",
    0xE: "Fortuna",
    0x10: "Katina",
    0x11: "Bolse",
    0x12: "Sector Z",
    0x13: "Venom",
    0x14: "Multiplayer",
}

LaserLookup = {
    0: "1",
    1: "2",
    2: "2🔷",
}

PeppyLookup = {
    0: "🆗",
    0xff: "X",
}

SlippyLookup = {
    0: "🆗",
    0xff: "X",
}

FalcoLookup = {
    0: "🆗",
    0xff: "X",
}


function Fixed()
{
    achievement(
        title = "Solar Daredevil 8000", description = "Survive most of the stage above 7800 degrees  - vid guide available on game page", points = 25,
        id = 57631, badge = "51204", published = "2/8/2018 10:19:41 PM", modified = "6/29/2020 1:14:51 AM",
        trigger = unless(MusicStatus() == 160) && 
                  never(ScrollDistance() < 17920) && 
                  never(ScrollDistance() > 18474) &&
                  never(ScrollBig() < 68) && 
                  never(Level() != 7) &&
                  measured(
                      repeated(420, 
                          SolarTemp1() >= 19 &&
                          ScrollDistance() != prev(ScrollDistance())
                      )
                  ) || 
                  unless(MusicStatus() == 160) && 
                  never(ScrollDistance() < 17920) && 
                  never(ScrollDistance() > 18474) &&
                  never(ScrollBig() < 68) && 
                  never(Level() != 7) &&
                  SolarTemp1() >= 19 &&
                  trigger_when(
                      repeated(420, 
                          SolarTemp1() >= 19 &&
                          ScrollDistance() != prev(ScrollDistance())
                      )
                  )
    )    
}
Fixed()


function Test()
{
    achievement(
        title = "Full Solar Daredevil 8000", description = "Survive most of the stage above 7800 degrees  - vid guide available on game page", points = 25,
        trigger = unless(MusicStatus() == 160) && 
                  never(ScrollDistance() < 17920) && 
                  never(ScrollDistance() > 18474) &&
                  never(ScrollBig() < 68) && 
                  never(Level() != 7) &&
                  measured(
                      repeated(554, 
                          SolarTemp1() >= 19 &&
                          ScrollDistance() != prev(ScrollDistance())
                      )
                  ) || 
                  unless(MusicStatus() == 160) && 
                  never(ScrollDistance() < 17920) && 
                  never(ScrollDistance() > 18474) &&
                  never(ScrollBig() < 68) && 
                  never(Level() != 7) &&
                  SolarTemp1() >= 19 &&
                  trigger_when(
                      repeated(554, 
                          SolarTemp1() >= 19 &&
                          ScrollDistance() != prev(ScrollDistance())
                      )
                  )
    )    
}
Test()

function Original() 
{
    achievement(
        title = "Wright Brothers True Master Pilot Award", description = "Complete the game on Expert without ever losing a wing", points = 100,
        id = 57622, badge = "60554", published = "2/8/2018 10:19:15 PM", modified = "6/29/2020 1:15:05 AM",
        trigger = never(byte(0x137E7E) == 1) && never(byte(0x137E7F) == 1) && byte(0x16D868) == 1 && word(0x16E0A4) == 65535 && 
                  repeated(10, byte(0x147A20) == 2) && prev(byte(0x16E0A4)) == 19 && never(byte(0x13AD5E) == 1) && never(byte(0x13AD5F) == 1) &&
                  ((unless(word(0x137E7E) == 16488) && repeated(10, byte(0x137E7F) == 2) && 
                    repeated(10, byte(0x137E7E) == 2) && never(byte(0x137E7F) == 1) && never(byte(0x137E7E) == 1)) ||
                   (unless(word(0x13AD5E) == 16488) && repeated(10, byte(0x13AD5E) == 2) && 
                    repeated(10, byte(0x13AD5F) == 2) && never(byte(0x13AD5E) == 1) && never(byte(0x13AD5F) == 1)))
    )

    achievement(
        title = "Rogue Fox", description = "Clear the game on Expert without wingmen completing any stage", points = 50,
        id = 57623, badge = "51201", published = "2/8/2018 10:19:19 PM", modified = "6/29/2020 1:15:04 AM",
        trigger = byte(0x16D9C0) == 0 && byte(0x16D9C2) == 0 && byte(0x16D9C4) == 0 && byte(0x16D9C5) == 0 && 
                  byte(0x16D9C6) == 0 && byte(0x16D9C8) == 0 && byte(0x16D9C1) == 0 && byte(0x16D9C9) == 0 && byte(0x16D9CA) == 0 && 
                  byte(0x16D9CC) == 0 && byte(0x16D9CD) == 0 && byte(0x16D9CE) == 0 && byte(0x16D9D0) == 0 && byte(0x16D9D1) == 0 && 
                  byte(0x16D9D2) == 0 && byte(0x16D9D4) == 0 && byte(0x16D9D5) == 0 && byte(0x16D9D6) == 0 && byte(0x16D9D8) == 0 && 
                  byte(0x16D9D9) == 0 && byte(0x16D9DA) == 0 && word(0x16E0A4) == 65535 && byte(0x16D868) == 1 && prev(byte(0x16E0A4)) == 19
    )

    achievement(
        title = "CCCC (200 Corneria City)", description = "Break 200 hits on Corneria and complete the stage", points = 10,
        id = 57624, badge = "51202", published = "2/8/2018 10:19:23 PM", modified = "6/29/2020 1:15:01 AM",
        trigger = never(byte(0x16E0A4) != 0) && byte(0x157908) >= 200 && ScrollDistance()  > 0
    )

    achievement(
        title = "4x4", description = "In Metos get four plus4 combos in a row (hint R and Z prevents lock on)", points = 10,
        id = 57625, badge = "51178", published = "2/8/2018 10:19:26 PM", modified = "6/29/2020 1:15:00 AM",
        trigger = unless(prev(byte(0x16A54F)) == 4) && never(byte(0x16A54F) == 1) && never(byte(0x16A54F) == 2) && 
                  never(byte(0x16A54F) == 3) && repeated(4, byte(0x16A54F) == 4) && never(byte(0x157912) < prev(byte(0x157912))) && 
                  never(byte(0x16E0A4) != 1)
    )

    achievement(
        title = "Untouchable", description = "Complete Sector Y on expert without taking damage", points = 25,
        id = 57626, badge = "51003", published = "2/8/2018 10:19:29 PM", modified = "6/29/2020 1:14:59 AM",
        trigger = repeated(5, word(0x0C2F04) == 14020) && never(word(0x13AB24) < prev(word(0x13AB24))) && 
                  byte(0x16E0A4) == 5 && Music() == 38 && byte(0x16D868) == 1
    )

    achievement(
        title = "Blaster Master (Sector Y)", description = "Get 120 hits before the boss using charged shot and bombs (no laser)", points = 25,
        id = 57627, badge = "51005", published = "2/8/2018 10:19:31 PM", modified = "6/29/2020 1:14:58 AM",
        trigger = repeated(120, byte(0x15759C) > prev(byte(0x15759C))) && never(byte(0x13AB04) == 7) && 
                  never(byte(0x16E0A4) != 5) && never(byte(0x157912) < prev(byte(0x000000))) && never(word(0x0C2F04) == 20180)
    )

    achievement(
        title = "ID4 Finish on Katina", description = "Destroy the mothership core with less that 3 seconds on the clock", points = 10,
        id = 57628, badge = "51187", published = "2/8/2018 10:19:34 PM", modified = "6/29/2020 1:14:57 AM",
        trigger = never(byte(0x16E0A4) != 16) && byte(0x1557A8) > 0 && byte(0x1557A4) < 3 && unless(MusicStatus() == 160) && 
                  repeated(110, word(0x0C2F04) == 18066) && never(byte(0x157912) < prev(byte(0x157912))) && repeated(10, word(0x0C2F04) == 18050)
    )

    achievement(
        title = "Clam on a halfshell", description = "Destroy Bio-Weapon, killing barnicles, with left and right side down as it dies", points = 10,
        id = 57629, badge = "51165", published = "2/8/2018 10:19:36 PM", modified = "6/29/2020 1:14:53 AM",
        trigger = never(byte(0x16E0A4) != 13) && never(byte(0x0C2F04) == 15100) && repeated(2, byte(0x16C2AB) == 3) && 
                  unless(prev(byte(0x16C2AB)) == 3) && byte(0x16501A) == 0 && byte(0x165018) == 0 && ScrollDistance()  >= 18361 && byte(0x164FE2) == 0
    )

    achievement(
        title = "Silverless Solar Survival", description = "Finish Solar. Don't get any s. rings or let your life empty (star, g. rings ok)", points = 10,
        id = 57630, badge = "51171", published = "2/8/2018 10:19:39 PM", modified = "6/29/2020 1:14:55 AM",
        trigger = never(byte(0x16E0A4) != 7) && Music() == 38 && once(byte(0x16DB93) == 69) && 
                  never(byte(0x16DB93) <= 68) && never(Health() == 0) &&
                  ((never((byte(0x169650) + byte(0x16969F) + byte(0x169695)) == 70)) ||
                   (never((byte(0x1696BC) + byte(0x16970B) + byte(0x169701)) == 70)) ||
                   (never((byte(0x169728) + byte(0x169777) + byte(0x16976D)) == 70)) ||
                   (never((byte(0x169794) + byte(0x1697E3) + byte(0x1697D9)) == 70)) ||
                   (never((byte(0x169800) + byte(0x16984F) + byte(0x169845)) == 70)) ||
                   (never((byte(0x16986C) + byte(0x1698BB) + byte(0x1698B1)) == 70)) ||
                   (never((byte(0x1698D8) + byte(0x169927) + byte(0x16991D)) == 70)) ||
                   (never((byte(0x169944) + byte(0x169993) + byte(0x169989)) == 70)) ||
                   (never((byte(0x1699B0) + byte(0x1699FF) + byte(0x1699F5)) == 70)) ||
                   (never((byte(0x169A1C) + byte(0x169A6B) + byte(0x169A61)) == 70)))
    )

    achievement(
        title = "Arwing action", description = "Play through Zoness in Cockpit view", points = 10,
        id = 57632, badge = "51006", published = "2/8/2018 10:19:43 PM", modified = "2/8/2018 10:23:53 PM",
        trigger = never(byte(0x137C18) == 0) && byte(0x164FCC) == 6 && byte(0x16E0A4) == 8 && 
                  repeated(5, ScrollDistance()  < 17967)
    )

    achievement(
        title = "Lone Defender Sector Z", description = "Destroy all the missiles and complete the mission without any allies around", points = 25,
        id = 57633, badge = "51000", published = "2/8/2018 10:19:46 PM", modified = "6/29/2020 1:14:50 AM",
        trigger = never(once(byte(0x16D726) != 255)) && never(once(byte(0x16D72A) != 255)) && 
                  never(once(byte(0x16D72E) != 255)) && byte(0x16E0A4) == 18 && once(word(0x0C2F04) == 16050) && Music() == 38 && 
                  never(word(0x0C2F04) == 16120)
    )

    achievement(
        title = "In charge without charge", description = "Get 280 kills in Area 06 Expert without using the charged laser or bombs", points = 25,
        id = 57634, badge = "51172", published = "2/8/2018 10:19:48 PM", modified = "6/29/2020 1:14:49 AM",
        trigger = never(byte(0x169EC0) == 4) && byte(0x16E0A4) == 3 && repeated(5, word(0x0C2F04) == 7012) && 
                  never(byte(0x16DC10) < prev(byte(0x16DC10))) && byte(0x16D868) == 1 && Hits() >= 280
    )

    achievement(
        title = "Arwing Item Hunter", description = "Collect 19 items in Area 6 ~(5 rings, 4 bombs, 6 gold rings, 6 lasers)", points = 10,
        id = 57635, badge = "51012", published = "2/8/2018 10:19:51 PM", modified = "3/18/2019 7:30:53 PM",
        trigger = tally(19, repeated(20, byte(0x16969A) == 20), repeated(20, byte(0x169706) == 20), repeated(20,
                   byte(0x169772) == 20), repeated(20, byte(0x1697DE) == 20), repeated(20, byte(0x16984A) == 20),
                   repeated(20, byte(0x169922) == 20), repeated(20, byte(0x16998E) == 20), byte(0x1698B6) == 20) && 
                  unless(prev(byte(0x16969A)) == 20) && unless(prev(byte(0x169706)) == 20) && unless(prev(byte(0x169772)) == 20) && 
                  unless(prev(byte(0x1697DE)) == 20) && unless(prev(byte(0x16984A)) == 20) && unless(prev(byte(0x1698B6)) == 20) && 
                  unless(prev(byte(0x169922)) == 20) && unless(prev(byte(0x16998E)) == 20) && never(byte(0x157912) < prev(byte(0x157912))) && 
                  never(byte(0x16E0A4) != 3)
    )

    achievement(
        title = "Venom Flyby", description = "Reach the temple in Expert without killing an enemy", points = 10,
        id = 57636, badge = "51347", published = "2/8/2018 10:19:53 PM", modified = "2/8/2018 10:24:05 PM",
        trigger = repeated(5, ScrollDistance()  >= 18480) && repeated(5, ScrollDistance()  <= 17712) && never(Hits() > 0) && 
                  byte(0x16E0A4) == 6 && byte(0x16D868) == 1
    )

    achievement(
        title = "Ancient Robot Chase (Venom I)", description = "Destroy Golemech before 66 on the leaderboard. Hint- listen to Falco", points = 10,
        id = 57637, badge = "51200", published = "2/8/2018 10:19:56 PM", modified = "2/8/2018 10:24:07 PM",
        trigger = never(byte(0x16E0A4) != 6) && never(ScrollDistance()  < 18473) && once(word(0x165046) == 1620) && 
                  byte(0x165046) == 0 && never(ScrollDistance()  >= 18539) && byte(0x165010) >= 6 && byte(0x165010) <= 7
    )

    achievement(
        title = "Outgunned (Venom II)", description = "Defeat all 4 Starwolf using single laser and getting plus50 combos from each", points = 10,
        id = 57638, badge = "51348", published = "2/8/2018 10:19:59 PM", modified = "2/8/2018 10:24:10 PM",
        trigger = never(byte(0x16E0A4) != 19) && repeated(4, byte(0x16C2AB) == 50) && unless(prev(byte(0x16C2AB)) == 50) && 
                  never(byte(0x157918) > 0) && never(word(0x16DC20) == 0) && repeated(10, word(0x16DC20) < 32)
    )
}

rich_presence_display("{0}Fox in {1}{2}:{3}{4} Hits:{5} | T.Hits:{6} Medals:{7} Peppy {8} Slippy {9} Falco {10}",
    rich_presence_lookup("Paused", byte(0x157680), PausedLookup),
    rich_presence_lookup("Mode", byte(0x16D708), ModeLookup),
    rich_presence_value("Level", byte(0x16D9B8) + 1),
    rich_presence_lookup("Stage", byte(0x16E0A4), StageLookup),
    rich_presence_lookup("Expert", byte(0x16D868), ExpertLookup),
    rich_presence_value("Hits", Hits()),
    rich_presence_value("TotalHits", word(0x157584)),
    rich_presence_value("Medals", bit1(0x16E6E0) + bit1(0x16E6E1) + bit1(0x16E6E2) + bit1(0x16E6E3) + bit1(0x16E6E4) + bit1(0x16E6E5) + bit1(0x16E6E6) + bit1(0x16E6E7) + bit1(0x16E6E8) + bit1(0x16E6E9) + bit1(0x16E6EA) + bit1(0x16E6EB) + bit1(0x16E6EC) + bit1(0x16E6EE) + bit1(0x16E6EF) + bit4(0x16E6E0) + bit4(0x16E6E1) + bit4(0x16E6E2) + bit4(0x16E6E3) + bit4(0x16E6E4) + bit4(0x16E6E5) + bit4(0x16E6E6) + bit4(0x16E6E7) + bit4(0x16E6E8) + bit4(0x16E6E9) + bit4(0x16E6EA) + bit4(0x16E6EB) + bit4(0x16E6EC) + bit4(0x16E6EE) + bit4(0x16E6EF)),
    rich_presence_lookup("Peppy", byte(0x16D72B), PeppyLookup),
    rich_presence_lookup("Slippy", byte(0x16D72B), SlippyLookup),
    rich_presence_lookup("Falco", byte(0x16D727), FalcoLookup)
)
