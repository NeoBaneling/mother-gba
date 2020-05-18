#include "myLib.h"
#include "game.h"

// Screens
#include "startbg.h"
#include "gamebg.h"
#include "pausebg.h"
#include "winbg.h"
#include "losebg.h"

// Sprites
#include "sprites.h"

// Prototypes
void miniginitialize();
void minigstart();
void miniggame();
void minigpause();
void minigwin();
void miniglose();
void miniggoToStart();
void miniggoToGame();
void miniggoToPause();
void miniggoToWin();
void miniggoToLose();

// States
enum {MGSTART, MGGAME, MGPAUSE, MGWIN, MGLOSE};
int state;

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;

// Text Buffer
char buffer[41];

int spaceInvadersMain() {

	initialize();

	while(1) {

		// Update button variables
		oldButtons = buttons;
		buttons = BUTTONS;

		// State Machine
		switch(state) {
			case MGSTART:
				minigstart();
				break;
			case MGGAME:
				miniggame();
				break;
			case MGPAUSE:
				minigpause();
				break;
			case MGWIN:
				minigwin();
				break;
			case MGLOSE:
				miniglose();
				break;
		}
	}
}

// Initializes the game on launch
void miniginitialize() {

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	// Set up backgrounds
	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	DMANow(3, startbgPal, PALETTE, 256);

	hOff = 0;
	vOff = 0;

	buttons = BUTTONS;

	miniggoToStart();
}

// Sets up start state
void miniggoToStart() {

	hideSprites();

	DMANow(3, startbgTiles, &CHARBLOCK[0], 2880);
	DMANow(3, startbgMap, &SCREENBLOCK[31], 1024);

	hOff = 0;
	vOff = 0;

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	state = MGSTART;
}

// Runs every frame of the start state
void minigstart() {

	waitForVBlank();

	initGame();

	if (BUTTON_PRESSED(BUTTON_START)) {
		miniggoToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		miniggoToPause();
	}
}

// Sets up game state
void miniggoToGame() {

	hideSprites();

	DMANow(3, gamebgTiles, &CHARBLOCK[0], 1088);
	DMANow(3, gamebgMap, &SCREENBLOCK[31], 1024);

	hOff = BORDER / 2;

	REG_BG0HOFF = hOff;

	state = MGGAME;
}

// Runs the game state
void miniggame() {

	updateGame();
	drawGame();
	if (BUTTON_PRESSED(BUTTON_START)) {
		miniggoToPause();
	}
	if (!enemiesRemaining) {
		miniggoToWin();
	}
	if (enemiesRemaining == -1 || !lives) {
		miniggoToLose();
	}

	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

	vOff++;

	REG_BG0VOFF = (vOff >> 3);
}

// Sets up pause state
void miniggoToPause() {

	hideSprites();

	DMANow(3, pausebgTiles, &CHARBLOCK[0], 2528);
	DMANow(3, pausebgMap, &SCREENBLOCK[31], 1024);

	hOff = 0;
	vOff = 0;

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	state = MGPAUSE;
}

// Runs the pause state
void minigpause() {

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		miniggoToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		miniggoToStart();
	}
}

// Sets up win state
void miniggoToWin() {

	hideSprites();

	DMANow(3, winbgTiles, &CHARBLOCK[0], 2720);
	DMANow(3, winbgMap, &SCREENBLOCK[31], 1024);

	hOff = 0;
	vOff = 0;

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	state = MGWIN;
}

// Runs the win state
void minigwin() {

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		miniggoToStart();
	}
}

// Sets up lose state
void miniggoToLose() {

	hideSprites();

	DMANow(3, losebgTiles, &CHARBLOCK[0], 1312);
	DMANow(3, losebgMap, &SCREENBLOCK[31], 1024);

	hOff = 0;
	vOff = 0;

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	state = MGLOSE;
}

void miniglose() {

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		miniggoToStart();
	}
}