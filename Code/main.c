/**
 * Final Submission of "MOTHER"
 * @author Joey Bishop
 * @version 1.0
 *
 * How to Play the Game:
 *	 So controls for the most part are listed on all the screens, but anything
 *	 not listed out I'll throw here.
 *	 MENU: Use UP and DOWN to select between the three levels. You're "hovering
 *	 over" a level when the sprite is moving.
 *	 ANY GAME STATE: Press START to access the pause/instruction screen.
 *	 That's pretty much it. The rest is in the game.
 *
**/

#include "myLib.h"
#include <stdlib.h>

// Sound Files
#include "sound.h"
#include "MotherMainTheme.h"
#include "CloudlandRegion.h"
#include "MenuNav.h"
#include "WinSound.h"

// Levels
#include "bugmoonl.h"
#include "hackingl.h"
#include "portelythl.h"

// Screens and Sprites
#include "spritesheet.h"
#include "start.h"
#include "bugMoonStarsNear.h"
#include "bugMoonStarsFar.h"
#include "menu.h"
#include "eclipse.h"
#include "bugMoonPause.h"
#include "hackingPause.h"
#include "portelythPause.h"
#include "win.h"
#include "sonata.h"

// Prototypes
void initialize();
void start();
void menu();
void game();
void pause();
void win();
void goToStart();
void goToMenu();
void goToGame();
void goToPause();
void goToWin();

// Menu sprites
ANISPRITE hackingSprite;
ANISPRITE bugSprite;
ANISPRITE portelythSprite;

// States
enum {START, MENU, GAME, PAUSE, WIN};
int state;

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

int hOff;
int vOff;
// Vars for fancy start screen stuff
int titleVOff;
int titleHasPlayed;

// Levels
enum {HACKING, BUGMOON, PORTELYTH};
int level;
ANISPRITE levelSprites[3];

// Text Buffer
char buffer[41];

int main() {

	initialize();

	while(1) {

		// Update button variables
		oldButtons = buttons;
		buttons = BUTTONS;

		// State Machine
		switch(state) {
			case START:
				start();
				break;
			case MENU:
				menu();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case WIN:
				win();
				break;
		}
	}
}

// Initializes the game on launch
void initialize() {

	// Set up sounds
	setupSounds();
	setupInterrupts();

	// Set up sprites
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

	buttons = BUTTONS;

	goToStart();
}

// Sets up start state
void goToStart() {

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
	REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(30);
	REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(3) | BG_SCREENBLOCK(29);

	DMANow(3, startPal, PALETTE, 256);

	DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen/2);
	DMANow(3, startMap, &SCREENBLOCK[31], 1024);
	DMANow(3, bugMoonStarsNearTiles, &CHARBLOCK[2], bugMoonStarsNearTilesLen/2);
    DMANow(3, bugMoonStarsNearMap, &SCREENBLOCK[30], 1024);
    DMANow(3, bugMoonStarsFarTiles, &CHARBLOCK[3], bugMoonStarsFarTilesLen/2);
    DMANow(3, bugMoonStarsFarMap, &SCREENBLOCK[29], 1024);

	stopSound();

	hOff = 8;
	titleVOff = -360;
	titleHasPlayed = 0;

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = titleVOff;

	hOff = 0;
	vOff = 10;

	state = START;
}

// Runs every frame of the start state
void start() {

	waitForVBlank();

	if ((titleVOff >> 2) < 40) {
		titleVOff++;
	} else if (!soundA.isPlaying && !titleHasPlayed) {
		playSoundA(MotherMainTheme, MOTHERMAINTHEMELEN, MOTHERMAINTHEMEFREQ, 0);
		titleHasPlayed = 1;
	}

	vOff--;

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToMenu();
	}

	REG_BG0VOFF = titleVOff >> 2;
	REG_BG1HOFF = hOff >> 2;
	REG_BG2HOFF = hOff >> 3;
	REG_BG1VOFF = vOff >> 4;
	REG_BG2VOFF = vOff >> 5;
}

// Sets up menu state
void goToMenu() {

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	hideSprites();

	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
	REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

	DMANow(3, menuPal, PALETTE, 256);

	DMANow(3, menuTiles, &CHARBLOCK[0], menuTilesLen/2);
	DMANow(3, menuMap, &SCREENBLOCK[31], 1024);
	DMANow(3, eclipseTiles, &CHARBLOCK[1], eclipseTilesLen/2);
	DMANow(3, eclipseMap, &SCREENBLOCK[30], 1024);

	stopSound();
	playSoundA(CloudlandRegion, CLOUDLANDREGIONLEN, CLOUDLANDREGIONFREQ, 1);

	// Initialize menu sprites
	levelSprites[HACKING].aniCounter = 0;
	levelSprites[HACKING].curFrame = 0;
	levelSprites[HACKING].numFrames = 4;
	levelSprites[HACKING].screenRow = 54;
	levelSprites[HACKING].screenCol = 24;
	levelSprites[BUGMOON].aniCounter = 0;
	levelSprites[BUGMOON].curFrame = 0;
	levelSprites[BUGMOON].numFrames = 4;
	levelSprites[BUGMOON].screenRow = 86;
	levelSprites[BUGMOON].screenCol = 24;
	levelSprites[PORTELYTH].aniCounter = 0;
	levelSprites[PORTELYTH].curFrame = 0;
	levelSprites[PORTELYTH].numFrames = 4;
	levelSprites[PORTELYTH].screenRow = 118;
	levelSprites[PORTELYTH].screenCol = 24;

	state = MENU;

	level = HACKING;
}

// Runs every frame of the menu state
void menu() {

	REG_BG0HOFF = 12;
	REG_BG0VOFF = -2;
	REG_BG1HOFF = 16;
	REG_BG1VOFF = 26;

	if (!(levelSprites[level].aniCounter%12)) {
		levelSprites[level].curFrame = (levelSprites[level].curFrame+1)%levelSprites[level].numFrames;
	}
	levelSprites[level].aniCounter++;

	// Draw Sprites
	shadowOAM[HACKING].attr0 = levelSprites[HACKING].screenRow | ATTR0_REGULAR | ATTR0_SQUARE;
	shadowOAM[HACKING].attr1 = levelSprites[HACKING].screenCol | ATTR1_SMALL;
	shadowOAM[HACKING].attr2 = ATTR2_TILEID(levelSprites[HACKING].curFrame*2, 16) | ATTR2_PALROW(2);
	shadowOAM[BUGMOON].attr0 = levelSprites[BUGMOON].screenRow | ATTR0_REGULAR | ATTR0_SQUARE;
	shadowOAM[BUGMOON].attr1 = levelSprites[BUGMOON].screenCol | ATTR1_SMALL;
	shadowOAM[BUGMOON].attr2 = ATTR2_TILEID(levelSprites[BUGMOON].curFrame*2, 8) | ATTR2_PALROW(1);
	shadowOAM[PORTELYTH].attr0 = levelSprites[PORTELYTH].screenRow | ATTR0_REGULAR | ATTR0_SQUARE;
	shadowOAM[PORTELYTH].attr1 = levelSprites[PORTELYTH].screenCol | ATTR1_SMALL;
	shadowOAM[PORTELYTH].attr2 = ATTR2_TILEID(levelSprites[PORTELYTH].curFrame*2, 24) | ATTR2_PALROW(3);

	waitForVBlank();

	DMANow(3, shadowOAM, OAM, 512);

	if (BUTTON_PRESSED(BUTTON_UP) && level > HACKING) {
		level--;
	}
	if (BUTTON_PRESSED(BUTTON_DOWN) && level < PORTELYTH) {
		level++;
	}

	if (BUTTON_PRESSED(BUTTON_START)) {
		// Initialize games
		initBugMoon();
		initHacking();
		initPortelyth();
		goToGame();
	}
}

// Sets up game state
void goToGame() {

	hideSprites();
	stopSound();

	if (level == BUGMOON) {
		goToBugMoon();
	}
	if (level == HACKING) {
		goToHacking();
	}
	if (level == PORTELYTH) {
		goToPortelythLevel();
	}

	state = GAME;
}

// Runs the game state
void game() {

	if (level == BUGMOON) {
		updateBugMoon();
		drawBugMoon();
		if (bugMoonWon) {
			goToWin();
		}
	}
	if (level == HACKING) {
		updateHacking();
		drawHacking();
		if (!enemyLife) {
			goToWin();
		}
	}
	if (level == PORTELYTH) {
		updatePortelyth();
		drawPortelyth();
		if (portelythWon) {
			goToWin();
		}
	}

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
}

// Sets up pause state
void goToPause() {

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	if (level == BUGMOON) {
		DMANow(3, bugMoonPauseTiles, &CHARBLOCK[0], bugMoonPauseTilesLen/2);
		DMANow(3, bugMoonPauseMap, &SCREENBLOCK[31], 1024);
		hOff = 0;
		vOff = 6;
	}
	if (level == HACKING) {
		DMANow(3, hackingPauseTiles, &CHARBLOCK[0], hackingPauseTilesLen/2);
		DMANow(3, hackingPauseMap, &SCREENBLOCK[31], 1024);
		hOff = 7;
		vOff = 6;
	}
	if (level == PORTELYTH) {
		DMANow(3, portelythPauseTiles, &CHARBLOCK[0], portelythPauseTilesLen/2);
		DMANow(3, portelythPauseMap, &SCREENBLOCK[31], 1024);
		hOff = 6;
		vOff = 6;
	}

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	state = PAUSE;

	pauseSound();
}

// Runs the pause state
void pause() {

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		unpauseSound();
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
		DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
		goToMenu();
	}
}

// Sets up win state
void goToWin() {

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
	REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(30);

	DMANow(3, winPal, PALETTE, 256);

	DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCK[31], 1024);
	DMANow(3, sonataTiles, &CHARBLOCK[2], sonataTilesLen/2);
	DMANow(3, sonataMap, &SCREENBLOCK[30], 1024);

	hOff = 6;
	vOff = 0;
	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;
	REG_BG1HOFF = 0;
	REG_BG1VOFF = 0;

	state = WIN;

	stopSound();
	playSoundA(WinSound, WINSOUNDLEN, WINSOUNDFREQ, 0);
}

// Runs the win state
void win() {

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}