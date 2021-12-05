// Star Fox 64
// #ID = 10248

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
// $137C44: health bar uneven levels e.g 1,3,5
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
// $146602: Music track? ff=boss died, 26=fanfare ff=exiting area, 3c=map, ff=starting area, 2c=starting area 2, ff=about to play, 0x=in area (x is stage specific), switches to ff between transions of things, like corneria it goes from 2>>ff>>12 when switching to all range, 40=victory, 24=rank in,
function Music() => byte(0x146602)
// $146E78: turns 33 when barrel roll
// $146E79: turns 33 when barrel roll
// $146E7A: turns d3 when barrel roll
// $146E7C: animation timer of the barrel roll
// $14783A: opening demo =1?, also 1 during gameplay
// $147A20: 1=title/in game in control, 2=main menu, 0 everywhere else?
// $149B48: e0=in game in control/at very start briefly, 20=map/briefing/cutscenes/game-start
// $149B4B: a0=music paused, 80=music playing (writable) a4x=will pause tone on music
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
// $14A906: solar temp indicator 1
// $14A9CE: solar temp indicator 2
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
// $15789F: 1=player in control (most), 0=cutscenes and stuff. tag: cinematic
function Player1Control() => word(0x15789F)
// $1578B3: Related to background stuff (like fog)
// $1578D2: is 00 all the time flickers with some values in between last shot and cinematic
// $157903: Gold rings (>3 lifebar grows), rests on death, new stage to < 3. Player gets a 1up at 6 golden rings
// $157908: (16 bit) active hit/kill counter (hex), max: 3e7/999(dec) tag: current, hits
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
// $16DA80: [8-bit] Level route Zoness --> Macbeth (0 = off, 3 = on)
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
// $16DB92: scroll distance, speed isn't static?
function ScrollDistanceSpeed() => word(0x16DB92)

// $16DB93: scroll distance big
// $16DBDA: (16 bit) npcs speaking 41a0=Slippy, 4120=Falco, 41f0=Peppy
//          4348=Wolf, 435c=Leon, 4352=pigma, 4366=Andrew, 4220=Kat
// $16DC10: Bombs
// $16DC20: frame clock that pauses when the player pauses and resets at the start of stages
function FrameCount() => dword(0x16dc20)

// $16DC38: [16-bit] Level Scroll (start at 0)
function LevelScroll() => word(0x16DC38)

// $16DCE0: Related to which teammate is getting chased

// $16DCF0: training mode ring counter
function ComboRings() => byte(0x16DCF0)

// $16E0A4: Level id, do not manipulate. ffff when game is finished.
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
// $16E6E0: Medal - Sector Z:
//          bit0=completed level
//          bit1=normal medal
//          bit2=entered mission
//          bit3=completed mission on expert
//          bit4=medal expert
function MedalSectorZ(type) => bit(LevelTypes[type], 0x16E6E0)
// $16E6E1: Medal - Bolse
function MedalBolse(type) => bit(LevelTypes[type], 0x16E6E1)
// $16E6E2: Medal - Area 6
function MedalArea6(type) => bit(LevelTypes[type], 0x16E6E2)
// $16E6E3: Medal - Meteo
function MedalMeteo(type) => bit(LevelTypes[type], 0x16E6E3)
// $16E6E4: Medal - Macbeth
function MedalMacbeth(type) => bit(LevelTypes[type], 0x16E6E4)
// $16E6E5: Medal - Katina
function MedalKatina(type) => bit(LevelTypes[type], 0x16E6E5)
// $16E6E6: Medal - Sector Y
function MedalSectorY(type) => bit(LevelTypes[type], 0x16E6E6)
// $16E6E7: Medal - Sector X
function MedalSectorX(type) => bit(LevelTypes[type], 0x16E6E7)
// $16E6E8: Medal - Aquas
function MedalAquas(type) => bit(LevelTypes[type], 0x16E6E8)
// $16E6E9: Medal - Titania
function MedalTitania(type) => bit(LevelTypes[type], 0x16E6E9)
// $16E6EA: Medal - Corneria
function MedalCorneria(type) => bit(LevelTypes[type], 0x16E6EA)
// $16E6EB: Medal - Zoness
function MedalZoness(type) => bit(LevelTypes[type], 0x16E6EB)
// $16E6EC: Medal - Venom (Hard Path)
function MedalVenomHard(type) => bit(LevelTypes[type], 0x16E6EC)
// $16E6ED: Medal - Venom (Easy Path)
function MedalVenomEasy(type) => bit(LevelTypes[type], 0x16E6ED)
// $16E6EE: Medal - Solar
function MedalSolar(type) => bit(LevelTypes[type], 0x16E6EE)
// $16E6EF: Medal - Fortuna
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

function MeasureMedals(type, count)
{
    return GameMode() >= 3 &&
           GameMode() <= 4 &&
           measured(
                MedalSectorZ(type) +
                MedalBolse(type) + 
                MedalArea6(type) + 
                MedalMeteo(type) + 
                MedalMacbeth(type) + 
                MedalKatina(type) +
                MedalSectorY(type) +
                MedalSectorX(type) +
                MedalAquas(type) + 
                MedalTitania(type) + 
                MedalCorneria(type) + 
                MedalZoness(type) +
                MedalVenomHard(type) + 
                MedalVenomEasy(type) +
                MedalSolar(type) + 
                MedalFortuna(type) == count
            ) &&
            (   prev(MedalSectorZ(type)) +
                prev(MedalBolse(type)) +
                prev(MedalArea6(type)) +
                prev(MedalMeteo(type)) + 
                prev(MedalMacbeth(type)) +
                prev(MedalKatina(type)) +
                prev(MedalSectorY(type)) + 
                prev(MedalSectorX(type)) + 
                prev(MedalAquas(type)) + 
                prev(MedalTitania(type)) +
                prev(MedalCorneria(type)) +
                prev(MedalZoness(type)) +
                prev(MedalVenomHard(type)) +
                prev(MedalVenomEasy(type)) +
                prev(MedalSolar(type)) +
                prev(MedalFortuna(type)) == count - 1
            )
}


function LevelStart(level)
{
    return Level() == level && 
           LevelScroll() == 0 &&
           GameMode() == 7
}

function Fixed()
{
    
    achievement(
        title = "M1 - Legion of Merit", description = "Defeat Andross going through Bolse", points = 25,
        id = 48894, badge = "50997", published = "5/28/2017 6:20:16 PM", modified = "7/10/2021 4:10:01 PM",
        trigger = Level() == 19 && 
                  Music() == 64 && 
                  (
                      RouteTitaniaBolse()  == 3 ||
                      RouteMacbethBolse() == 3 || 
                      SectorZBolse() == 3
                  )
    )

    achievement(
        title = "M1 - Air Force Cross", description = "Defeat Andross going through Area 6", points = 25,
        id = 48895, badge = "50996", published = "5/28/2017 6:20:47 PM", modified = "7/10/2021 4:10:00 PM",
        trigger = Level() == 19 && 
                  Music() == 64 && 
                  (
                      RouteSectorZToArea6() == 3 ||
                      RouteMacBethToArea6() == 3
                  ) 
    )    
    achievement(
        title = "M1 - Bronze Star Medal", description = "Earn a medal on any stage (normal)", points = 5,
        id = 49264, badge = "50990", published = "6/3/2017 5:35:04 PM", modified = "7/10/2021 4:10:01 PM",
        trigger = MeasureMedals("normal medal",1)
    )
    
    achievement(
        title = "C2 - Cornerian Flyby", description = "Complete Corneria destroying no enemies except the boss and not taking any hits", points = 10,
        id = 48716, badge = "50999", published = "5/26/2017 6:36:25 PM", modified = "2/11/2021 2:54:22 AM",
        trigger = once(LevelStart(0)) &&
                  never(Hits() > 0 && Hits() < 11) &&
                  never(Hits() > 11) &&
                  never(Health() < prev(Health())) && 
                  trigger_when(
                      Hits() == 11 && 
                      Music() == 255
                  )
    )
}
Fixed()


function AddMeasure()
{

    achievement(
        title = "TR - Air Force Training Ribbon", description = "Get max ring combo in the training (100)", points = 5,
        id = 49031, badge = "51193", published = "6/1/2017 2:44:58 AM", modified = "2/7/2018 5:36:54 AM",
        trigger = measured(ComboRings() == 100) && Level() == 10
    )
       
    achievement(
        title = "M1 - Cornerian Defense Service Award", description = "Earn a medal on 5 stages (normal)", points = 10,
        id = 49268, badge = "51235", published = "6/3/2017 7:55:15 PM", modified = "10/22/2019 5:02:02 PM",
        trigger = MeasureMedals("normal medal", 5)
    )

    achievement(
        title = "M1 - Distinguished Service Award", description = "Earn a medal on 10 stages (normal)", points = 10,
        id = 49269, badge = "50994", published = "6/3/2017 7:57:56 PM", modified = "2/11/2021 2:53:29 AM",
        trigger = MeasureMedals("normal medal", 10)
    )

    achievement(
        title = "M1 - Superior Service Award", description = "Earn all medals and unlock Expert (normal) (wait until rank in)", points = 50,
        id = 49265, badge = "50991", published = "6/3/2017 7:10:02 PM", modified = "7/10/2021 4:10:02 PM",
        trigger = MeasureMedals("normal medal", 15)
    )
    
    achievement(
        title = "M1 - Outstanding Airman", description = "Earn a medal on 5 stages (Expert)", points = 25,
        id = 49271, badge = "51179", published = "6/3/2017 8:07:20 PM", modified = "2/11/2021 2:53:25 AM",
        trigger = MeasureMedals("expert medal", 5)
    )

    achievement(
        title = "M1 - Distinguished Flying Cross", description = "Earn a medal on 10 stages (Expert)", points = 25,
        id = 49270, badge = "50995", published = "6/3/2017 8:07:16 PM", modified = "2/11/2021 2:53:23 AM",
        trigger =  MeasureMedals("expert medal", 10)
    )

    achievement(
        title = "M1 - Medal of Honor", description = "Earn all medals (Expert) (wait until rank in)", points = 50,
        id = 49267, badge = "50993", published = "6/3/2017 7:41:48 PM", modified = "7/10/2021 4:10:01 PM",
        trigger =  MeasureMedals("expert medal", 15)
    )
    
    achievement(
        title = "C1 - Lylat System complete tour", description = "Complete each stage once on normal", points = 25,
        id = 49272, badge = "51182", published = "6/3/2017 8:15:52 PM", modified = "7/10/2021 4:09:58 PM",
        trigger =  MeasureMedals("completed level", 16)
    )
	
	achievement(
        title = "SP - Tanks for the Memories", description = "Using the Landmaster get 15 kills in the VS. time trial", points = 5,
        id = 57568, badge = "60580", published = "2/7/2018 5:03:04 AM", modified = "2/11/2021 2:56:13 AM",
        trigger = byte(0x16E67A) >= 15 && prev(byte(0x16E67A)) < 15 && Level() == 20 && byte(0x137BAC) == 1
    )

    achievement(
        title = "SP - Doing the Foxtrot", description = "On foot get 15 kills in the VS. time trail", points = 10,
        id = 57569, badge = "60581", published = "2/7/2018 5:03:09 AM", modified = "7/10/2021 4:10:05 PM",
        trigger = byte(0x16E67A) >= 15 && prev(byte(0x16E67A)) < 15 && Level() == 20 && byte(0x137BAC) == 3
    )
	
}

function AddTrigger()
{
    
    achievement(
        title = "C1 - Gallant Unit Citation", description = "Complete the game (Expert) without losing a wingman, can retry stages", points = 50,
        id = 49277, badge = "51009", published = "6/3/2017 9:47:04 PM", modified = "7/10/2021 4:09:58 PM",
        trigger = byte(0x16D9C0) > 0 && byte(0x16D9C2) > 0 && byte(0x16D9C4) > 0 && byte(0x16D9C5) > 0 && byte(0x16D9C6) > 0 && 
                  byte(0x16D9C8) > 0 && byte(0x16D9C1) > 0 && byte(0x16D9C9) > 0 && byte(0x16D9CA) > 0 && byte(0x16D9CC) > 0 && 
                  byte(0x16D9CD) > 0 && byte(0x16D9CE) > 0 && byte(0x16D9D0) > 0 && byte(0x16D9D1) > 0 && byte(0x16D9D2) > 0 && 
                  byte(0x16D9D4) > 0 && byte(0x16D9D5) > 0 && byte(0x16D9D6) > 0 && byte(0x16D9D8) > 0 && byte(0x16D9D9) > 0 && 
                  byte(0x16D9DA) > 0 && word(0x16E0A4) == 65535 && byte(0x16D868) == 1 && byte(0x16D9B8) == 6 && prev(Level()) == 19
    )

    achievement(
        title = "C1 - Air Force Meritorious Unit Award", description = "Complete the game (Normal) without losing wingmen or a life", points = 25,
        id = 49276, badge = "51236", published = "6/3/2017 9:47:00 PM", modified = "7/10/2021 4:09:57 PM",
        trigger = byte(0x16D9C0) > 0 && byte(0x16D9C2) > 0 && byte(0x16D9C4) > 0 && byte(0x16D9C5) > 0 && byte(0x16D9C6) > 0 && 
                  byte(0x16D9C8) > 0 && byte(0x16D9C1) > 0 && byte(0x16D9C9) > 0 && byte(0x16D9CA) > 0 && byte(0x16D9CC) > 0 && 
                  byte(0x16D9CD) > 0 && byte(0x16D9CE) > 0 && byte(0x16D9D0) > 0 && byte(0x16D9D1) > 0 && byte(0x16D9D2) > 0 && 
                  byte(0x16D9D4) > 0 && byte(0x16D9D5) > 0 && byte(0x16D9D6) > 0 && byte(0x16D9D8) > 0 && byte(0x16D9D9) > 0 && 
                  byte(0x16D9DA) > 0 && word(0x16E0A4) == 65535 && byte(0x16D9B8) == 6 && never(byte(0x157912) < prev(byte(0x157912))) && 
                  byte(0x16D868) == 0 && never(GameMode() == 1) && repeated(10, GameMode() == 2) && prev(Level()) == 19
    )

    achievement(
        title = "C1 - Wright Brothers Master Pilot Award", description = "Complete the game on Expert without ever dying", points = 50,
        id = 49340, badge = "51234", published = "6/4/2017 7:15:40 AM", modified = "7/10/2021 4:09:59 PM",
        trigger = word(0x16E0A4) == 65535 && byte(0x16D868) == 1 && byte(0x16D9B8) == 6 && repeated(10, byte(0x147A20) == 2) && 
                  never(byte(0x157912) < prev(byte(0x157912))) && prev(Level()) == 19
    )
}

function Original()
{
    achievement(
        title = "TR - Do a barrel roll", description = "Deflect shots when Peppy says \"Do a barrel roll\" in Corneria", points = 2,
        id = 48717, badge = "50987", published = "5/26/2017 6:36:31 PM", modified = "7/10/2021 4:11:39 PM",
        trigger = word(0x146E78) == 13107 && word(0x0C2F04) == 2110 && Level() == 0
    )

    achievement(
        title = "TR - Do a wet barrel roll", description = "Deflect shots when Peppy says \"Do a barrel roll\" on Aquas", points = 5,
        id = 49347, badge = "51346", published = "6/4/2017 9:18:55 PM", modified = "3/29/2020 3:00:13 PM",
        trigger = word(0x137CA4) > prev(word(0x137CA4)) && word(0x16E0A4) == 13 && word(0x0C2F04) == 2110
    )

    achievement(
        title = "TR - Locked and Loaded", description = "Weapon Maxed, Lifbar extended, max bombs (9)", points = 5,
        id = 49026, badge = "51192", published = "5/31/2017 11:51:16 PM", modified = "2/7/2018 5:24:56 AM",
        trigger = byte(0x16DC10) == 9 && byte(0x157903) >= 3 && byte(0x157918) == 2
    )

    
    achievement(
        title = "TR - Combat Flight School Graduate", description = "Get 100 hits in training and then destroy a Wolfen fighter", points = 5,
        id = 49035, badge = "51195", published = "6/1/2017 3:24:01 AM", modified = "2/7/2018 5:36:52 AM",
        trigger = never(Level() != 10) && byte(0x157908) >= 100 && repeated(10, byte(0x15BCA4) == 50) && 
                  byte(0x15BCA4) == 0
    )

    achievement(
        title = "M1 - Just like dad", description = "Complete the Game on Expert", points = 25,
        id = 49273, badge = "51184", published = "6/3/2017 8:44:20 PM", modified = "2/11/2021 2:53:26 AM",
        trigger = repeated(10, byte(0x16D868) == 1) && Music() == 64 && never(byte(0x16D868) == 0) &&
                  ((Level() == 19) ||
                   (Level() == 6))
    )

    achievement(
        title = "M2 - Warp Speed", description = "Enter the secret Warp Zone in Metos", points = 5,
        id = 49348, badge = "51196", published = "6/4/2017 11:00:35 PM", modified = "2/7/2018 5:36:45 AM",
        trigger = Level() == 1 && Music() == 58
    )

    achievement(
        title = "M2 - Don't touch my friends", description = "Prevent Slippy from geting knocked down by the boss of Sector X", points = 5,
        id = 49450, badge = "51173", published = "6/8/2017 10:17:11 PM", modified = "2/8/2018 9:40:26 PM",
        trigger = never(word(0x0C2F04) == 4111) && repeated(5, word(0x0C2F04) == 5473) && Level() == 2 && 
                  Music() == 38
    )

    achievement(
        title = "M2 - Deploy the Blue-Marine", description = "Get in the Blue Marine for the first time", points = 5,
        id = 49259, badge = "50988", published = "6/3/2017 4:34:00 AM", modified = "2/7/2018 5:36:44 AM",
        trigger = prev(word(0x149B70)) == 6708 && byte(0x149B70) == 0 && Level() == 13
    )

    achievement(
        title = "M2 - Deploy the Landmaster", description = "Get in the Landmaster for the first time", points = 5,
        id = 49260, badge = "51239", published = "6/3/2017 5:07:46 AM", modified = "2/7/2018 5:36:41 AM",
        trigger = prev(word(0x149B70)) == 6708 && byte(0x149B70) == 0 &&
                  ((Level() == 12) ||
                   (Level() == 11))
    )

    achievement(
        title = "M2 - Train without brakes", description = "Shoot 8 switches and the switcher in Macbeth", points = 5,
        id = 49689, badge = "51167", published = "6/18/2017 9:05:15 PM", modified = "2/7/2018 5:25:36 AM",
        trigger = Level() == 11 && word(0x0C2F04) == 17472
    )

    achievement(
        title = "M2 - Warp Gate", description = "Enter the secret Warp Zone on Sector X", points = 5,
        id = 49349, badge = "51194", published = "6/4/2017 11:15:33 PM", modified = "10/22/2019 6:20:57 PM",
        trigger = Level() == 2 && Music() == 58
    )

    achievement(
        title = "M2 - An ally in the Waste", description = "Get a visit by Katt on Zoness", points = 5,
        id = 49351, badge = "51343", published = "6/5/2017 12:09:24 AM", modified = "2/7/2018 5:36:40 AM",
        trigger = byte(0x16E10C) == 4 && repeated(180, word(0x16DBDA) == 16928) && never(Level() != 8)
    )

    achievement(
        title = "M2 - Lights out", description = "Destroy all the Searchlights on Zoness and pass undetected", points = 5,
        id = 50069, badge = "51198", published = "6/28/2017 11:29:16 PM", modified = "2/7/2018 5:26:20 AM",
        trigger = never(byte(0x1574F7) == 1) && ScrollDistanceSpeed() == 18568 && never(Level() != 8)
    )

    achievement(
        title = "M2 - Just cruising", description = "Take the easy route to Venom", points = 5,
        id = 49025, badge = "51190", published = "5/31/2017 11:51:06 PM", modified = "2/7/2018 2:20:37 AM",
        trigger = byte(0x16DA48) == 3 && byte(0x16DA4C) == 3 && byte(0x16DA50) == 3 && byte(0x16DA54) == 3 && 
                  byte(0x16DA58) == 3 && Level() == 6
    )

    achievement(
        title = "M2 - You're as tough as they come!", description = "take the hardest route to Venom", points = 10,
        id = 49017, badge = "51183", published = "5/31/2017 6:00:19 PM", modified = "7/10/2021 4:10:04 PM",
        trigger = byte(0x16DA84) == 3 && byte(0x16DA88) == 3 && byte(0x16DA8C) == 3 && byte(0x16DA90) == 3 && 
                  byte(0x16DA94) == 3 && Level() == 19
    )

    achievement(
        title = "M2 - He's Alive!", description = "Get help from someone special", points = 5,
        id = 50198, badge = "51344", published = "6/30/2017 1:52:50 PM", modified = "2/7/2018 5:36:31 AM",
        trigger = prev(word(0x0C2F04)) == 19468 && word(0x0C2F04) == 0
    )

    achievement(
        title = "M2 - A Steep bill, but worth it", description = "Get paid $50k to $70k by the Cornerian Army", points = 10,
        id = 49274, badge = "51186", published = "6/3/2017 9:08:19 PM", modified = "7/10/2021 4:10:02 PM",
        trigger = word(0x157584) >= 782 && word(0x157584) <= 1093 && byte(0x14406F) == 4 && byte(0x144085) == 16 && 
                  word(0x144062) == 32780
    )

    achievement(
        title = "M2 - One Rich Fox", description = "Get paid $70k or more by the Cornerian Army", points = 10,
        id = 49275, badge = "51188", published = "6/3/2017 9:08:38 PM", modified = "7/10/2021 4:10:03 PM",
        trigger = word(0x157584) > 1093 && byte(0x14406F) == 4 && byte(0x144085) == 16 && word(0x144062) == 32780
    )

    achievement(
        title = "C1 - Air and Space Campaign Medal", description = "Earn a medal on every level in one playthrough", points = 50,
        id = 49266, badge = "50992", published = "6/3/2017 7:30:28 PM", modified = "7/10/2021 4:09:57 PM",
        trigger = byte(0x16DA20) == 1 && byte(0x16DA24) == 1 && byte(0x16DA28) == 1 && byte(0x16DA2C) == 1 && 
                  byte(0x16DA30) == 1 && byte(0x16DA34) == 1 && byte(0x16DA38) == 1
    )

    achievement(
        title = "C1 - Nebulophiliac", description = "Visit sector X, Y, and Z in one run", points = 10,
        id = 49350, badge = "51191", published = "6/4/2017 11:51:34 PM", modified = "10/22/2019 6:20:57 PM",
        trigger = byte(0x16DA04) == 5 && byte(0x16DA0C) == 4 && byte(0x16DA10) == 3 && Level() == 18 && 
                  Music() == 255 && word(0x16DC20) == 0
    )


    achievement(
        title = "C2 - Flies over a sitting duck", description = "Fighting Granga (Corneria All-range boss) Destoy 5 inessential parts", points = 3,
        id = 50033, badge = "51177", published = "6/28/2017 3:18:31 AM", modified = "7/10/2021 4:12:52 PM",
        trigger = word(0x165008) == 1000 && word(0x16500E) == 1000 && word(0x165012) == 1000 && word(0x165014) == 1000 && 
                  word(0x16500C) == 1000
    )

    achievement(
        title = "C2 - Hey, He was Mine!", description = "Steal 1 kill from every wingman in Fichina", points = 10,
        id = 50031, badge = "51004", published = "6/27/2017 10:10:05 PM", modified = "2/11/2021 2:54:52 AM",
        trigger = once(word(0x0C2F04) == 20150) && once(word(0x0C2F04) == 20160) && once(word(0x0C2F04) == 20170) && 
                  never(Level() != 14) && never(byte(0x16D708) != prev(byte(0x16D708)))
    )

    achievement(
        title = "C2 - Katina Outstanding Service Medal", description = "Get \"Mission Acomplished\" without killing any of Bill's ships", points = 10,
        id = 49620, badge = "51237", published = "6/15/2017 2:56:29 PM", modified = "2/11/2021 2:55:33 AM",
        trigger = byte(0x155792) == 0 && Music() == 38 && Level() == 16
    )

    achievement(
        title = "C2 - \"Friendly\" Fire", description = "Kill 80 of the Bulldog and Husky Squadron's (ally ships) on Katina", points = 10,
        id = 49619, badge = "51189", published = "6/15/2017 2:56:23 PM", modified = "2/11/2021 2:55:31 AM",
        trigger = byte(0x155792) >= 80 && Level() == 16
    )

    achievement(
        title = "C2 - Landmaster Item Hunter", description = "Collect 31 items in Titania - guide available on game page", points = 25,
        id = 49595, badge = "51014", published = "6/14/2017 8:37:25 PM", modified = "7/10/2021 4:09:59 PM",
        trigger = tally(31, repeated(20, byte(0x16969A) == 20), repeated(20, byte(0x169706) == 20), repeated(20,
                   byte(0x169772) == 20), repeated(20, byte(0x1697DE) == 20), repeated(20, byte(0x16984A) == 20),
                   repeated(20, byte(0x169922) == 20), repeated(20, byte(0x16998E) == 20), byte(0x1698B6) == 20) && 
                  unless(prev(byte(0x16969A)) == 20) && unless(prev(byte(0x169706)) == 20) && unless(prev(byte(0x169772)) == 20) && 
                  unless(prev(byte(0x1697DE)) == 20) && unless(prev(byte(0x16984A)) == 20) && unless(prev(byte(0x1698B6)) == 20) && 
                  unless(prev(byte(0x169922)) == 20) && unless(prev(byte(0x16998E)) == 20) && never(byte(0x157912) < prev(byte(0x157912))) && 
                  never(Level() != 12)
    )

    achievement(
        title = "C2 - Train Totaller", description = "Destroy every part of the train in Macbeth, and boss without switches", points = 25,
        id = 49688, badge = "51166", published = "6/18/2017 8:49:26 PM", modified = "7/10/2021 4:10:00 PM",
        trigger = Level() == 11 && never(word(0x16DC20) == 0) && Music() == 255 && word(0x0C2F04) == 17450 && 
                  never(prev(byte(0x157912)) > byte(0x157912)) &&
                  ((once(byte(0x15D432) == 3) && once(byte(0x15D13E) == 3) && once(byte(0x15CE4A) == 3) && 
                    once(byte(0x15CB56) == 3) && once(byte(0x15C862) == 3) && once(byte(0x15C56E) == 3) && once(byte(0x15C27A) == 3) && 
                    once(byte(0x15BF86) == 3) && once(byte(0x15BC92) == 3) && once(byte(0x15B99E) == 3) && once(byte(0x15B6AA) == 3) && 
                    once(byte(0x15B3B6) == 3) && once(byte(0x15B2FC) == 208)) ||
                   (once(byte(0x15E5EA) == 3) && once(byte(0x15E2F6) == 3) && once(byte(0x15E002) == 3) && 
                    once(byte(0x15DD0E) == 3) && once(byte(0x15DA1A) == 3) && once(byte(0x15D726) == 3) && once(byte(0x15D432) == 3) && 
                    once(byte(0x15D13E) == 3) && once(byte(0x15CE4A) == 3) && once(byte(0x15CB56) == 3) && once(byte(0x15C862) == 3) && 
                    once(byte(0x15C56E) == 3) && once(byte(0x15E824) == 209)))
    )

    achievement(
        title = "C2 - The Great Defender", description = "Deflect 200 shots in Sector X before reaching Spyborg or warping", points = 10,
        id = 49452, badge = "51175", published = "6/8/2017 10:17:23 PM", modified = "2/11/2021 2:55:27 AM",
        trigger = repeated(5, word(0x13AB84) >= 200) && Level() == 2 && never(ScrollDistanceSpeed() > 18528)
    )

    achievement(
        title = "C2 - Defender of the Deep", description = "Deflect 250 shots on Aquas before reaching the boss", points = 10,
        id = 50192, badge = "51164", published = "6/30/2017 2:33:38 AM", modified = "2/11/2021 2:55:25 AM",
        trigger = word(0x137CA4) >= 250 && never(Level() != 13) && never(word(0x0C2F04) == 15100) && 
                  once(ScrollDistanceSpeed() < 17152) && unless(word(0x149B52) != 3600)
    )

    achievement(
        title = "C2 - Quick Finish", description = "Complete Sector Z as quickly as is possible", points = 10,
        id = 50089, badge = "51001", published = "6/29/2017 11:59:51 AM", modified = "2/11/2021 2:55:24 AM",
        trigger = never(prev(byte(0x157912)) > byte(0x157912)) && once(word(0x0C2F04) == 16050) && 
                  prev(word(0x0C2F04)) == 16090 && never(word(0x0C2F04) == 16100) && byte(0x13AA88) == 7 && never(Level() != 18) && 
                  word(0x0C2F04) == 0
    )

    achievement(
        title = "C2 - Slippy's Savior", description = "Save Slippy 5 times in Bolse", points = 5,
        id = 50030, badge = "51176", published = "6/27/2017 9:26:09 PM", modified = "2/7/2018 5:35:55 AM",
        trigger = repeated(5, word(0x0C2F04) == 9170) && Level() == 17 && unless(prev(word(0x0C2F04)) == 9170)
    )

    achievement(
        title = "C2 - Power Path", description = "On Venom II on the way to andross take that path gives 3 gold rings", points = 10,
        id = 50085, badge = "51013", published = "6/29/2017 6:22:55 AM", modified = "2/11/2021 2:55:53 AM",
        trigger = never(Level() != 9) && never(ScrollDistanceSpeed() != 0) && 
                  repeated(3, byte(0x157903) > prev(byte(0x157903))) && never(byte(0x157912) < prev(byte(0x157912)))
    )

    achievement(
        title = "SP - Where'd it go?", description = "Get the 64 off screen on the title screen", points = 1,
        id = 49285, badge = "51010", published = "6/3/2017 10:27:02 PM", modified = "2/7/2018 2:21:45 AM",
        trigger = unless(word(0x149BB4) != 44880) && GameMode() == 2 &&
                  ((word(0x1AEED2) >= 17344) ||
                   (word(0x0DEFAA) > 192 && word(0x0DEFAA) < 65312 && word(0x0DEFAA) != 0 && word(0x0DEFAA) != 201))
    )

    achievement(
        title = "SP - Purple Heart", description = "Complete any mission without wings", points = 1,
        id = 49341, badge = "50998", published = "6/4/2017 8:44:38 AM", modified = "2/7/2018 2:21:26 AM",
        trigger = always_true() &&
                  ((unless(word(0x137E7E) == 16488) && word(0x137E7E) == 257 && Music() == 38) ||
                   (unless(word(0x13AD5E) == 16488) && word(0x13AD5E) == 257 && Music() == 38) ||
                   (Music() == 64 && unless(word(0x137E7E) == 16488) && word(0x137E7E) == 257) ||
                   (Music() == 64 && unless(word(0x13AD5E) == 16488) && byte(0x13AD5E) == 257))
    )

    achievement(
        title = "SP - Pit Stop", description = "Repair a broken wing in the Great Fox repair bay", points = 10,
        id = 50088, badge = "51207", published = "6/29/2017 11:16:17 AM", modified = "7/10/2021 4:10:05 PM",
        trigger = Level() == 18 && byte(0x13AA88) == 10 &&
                  ((prev(byte(0x13AD5E)) == 1 && byte(0x13AD5E) == 2) ||
                   (prev(byte(0x13AD5F)) == 1 && byte(0x13AD5F) == 2))
    )
}

rich_presence_display("{0}Fox in {1}{2}:{3}{4} Hits:{5} | T.Hits:{6} Medals:{7} Peppy{8} Slippy{9} Falco{10}",
    rich_presence_lookup("Paused", byte(0x157680), PausedLookup),
    rich_presence_lookup("Mode", byte(0x16D708), ModeLookup),
    rich_presence_value("Level", byte(0x16D9B8) + 1),
    rich_presence_lookup("Stage", Level(), StageLookup),
    rich_presence_lookup("Expert", byte(0x16D868), ExpertLookup),
    rich_presence_value("Hits", Hits()),
    rich_presence_value("TotalHits", word(0x157584)),
    rich_presence_value("Medals", MedalSectorZ("normal medal") +
                                  MedalBolse("normal medal") + 
                                  MedalArea6("normal medal") + 
                                  MedalMeteo("normal medal") +
                                  MedalMacbeth("normal medal") +
                                  MedalKatina("normal medal") + 
                                  MedalSectorY("normal medal") +
                                  MedalSectorX("normal medal") + 
                                  MedalAquas("normal medal") + 
                                  MedalTitania("normal medal") + 
                                  MedalCorneria("normal medal") +
                                  MedalZoness("normal medal") + 
                                  MedalVenomEasy("normal medal") +
                                  MedalVenomHard("normal medal") +
                                  MedalSolar("normal medal") +
                                  MedalFortuna("normal medal") +
                                  MedalSectorZ("expert medal") +
                                  MedalBolse("expert medal") + 
                                  MedalArea6("expert medal") + 
                                  MedalMeteo("expert medal") +
                                  MedalMacbeth("expert medal") +
                                  MedalKatina("expert medal") + 
                                  MedalSectorY("expert medal") +
                                  MedalSectorX("expert medal") + 
                                  MedalAquas("expert medal") + 
                                  MedalTitania("expert medal") + 
                                  MedalCorneria("expert medal") +
                                  MedalZoness("expert medal") + 
                                  MedalVenomEasy("expert medal") +
                                  MedalVenomHard("expert medal") +
                                  MedalSolar("expert medal") +
                                  MedalFortuna("expert medal")),
    rich_presence_lookup("Peppy", byte(0x16D72B), PeppyLookup),
    rich_presence_lookup("Slippy", byte(0x16D72B), SlippyLookup),
    rich_presence_lookup("Falco", byte(0x16D727), FalcoLookup)
)

