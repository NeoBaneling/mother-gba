#include "myLib.h"
#include "font.h"
#include "text.h"
#include "shruden.h"
#include "shrudenController.h"

// Game mechanic variables
enum States {SSTART, SGAME, SPAUSE, SWIN, SLOSE};
int sstate;
unsigned short sOldButtons;
unsigned short sButtons;

int shrudenController() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    shrudenInitialize();

    while (1) {

        // Update button variables
        sOldButtons = sButtons;
        sButtons = BUTTONS;

        switch(sstate) {
            case(SSTART):
                sstartState();
                break;
            case(SGAME):
                sgameState();
                break;
            case(SPAUSE):
                spauseState();
                break;
            case(SWIN):
                swinState();
                break;
            case(SLOSE):
                sloseState();
                break;
        }
    }
}

// Controls the start screen
void sstartState() {
    initShruden();
    if (BUTTON_PRESSED(BUTTON_START)) {
        drawInit();
        goTosGameState();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goTosPauseState();
    }
}

// Controls the game screen
void sgameState() {
    updateShruden();
    waitForVBlank();
    drawShruden();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goTosPauseState();
    }
    if (!coinsRemaining) {
        goTosWinState();
    }
    if (coinsRemaining == -1) {
        goTosLoseState();
    }
}

// Controls the pause screen
void spauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        waitForVBlank();
        drawInit();
        goTosGameState();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goTosStartState();
    }
}

// Controls the win screen
void swinState() {
    waitForVBlank();
    drawWin();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goTosStartState();
    }
}

// Controls the lose screen
void sloseState() {
    waitForVBlank();
    drawLose();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goTosStartState();
    }
}

// Initalizes start state
void goTosStartState() {
    sstate = SSTART;
    waitForVBlank();
    fillScreen(PURPLE);
    drawRect(54, 90, 16, 62, WHITE);
    drawString(58, 100, "SHRUDEN", CYAN);
    drawString(57, 99, "SHRUDEN", PURPLE);
    drawString(130, 66, "Press START to Play", WHITE);
    drawString(142, 36, "Press SELECT for Instructions", WHITE);
}

// Initalizes all game variables
void goTosGameState() {
    waitForVBlank();
    drawShruden();
    sstate = SGAME;
}

// Initializes pause state
void goTosPauseState() {
    sstate = SPAUSE;
    waitForVBlank();
    fillScreen(WHITE);
    drawRect(16, 6, 94, SCREENWIDTH - 12, PURPLE);
    drawString(24, 9, "Use UP, DOWN, LEFT, and RIGHT to move", WHITE);
    drawString(60, 60, "Collect COINS to win", WHITE);
    drawString(96, 42, "Don't let ENEMIES touch you", WHITE);
    drawString(130, 54, "Press START to Continue", PURPLE);
    drawString(142, 66, "Press SELECT to End", PURPLE);
}

// Initalizes win state
void goTosWinState() {
    sstate = SWIN;
    waitForVBlank();
    fillScreen(GREEN);
    drawString(110, 88, "Press START", WHITE);
}

// Initalizes lose state
void goTosLoseState() {
    sstate = SLOSE;
    waitForVBlank();
    fillScreen(BLACK);
    drawString(110, 88, "Press START", WHITE);
}

// Initializes background
void shrudenInitialize() {

    goTosStartState();
}

// Draws the specified character at the specified location
void drawChar(int row, int col, char ch, unsigned short color) {

    // TODO 1.0: Complete this function
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 * ch + i + 6 * j]) {
                setPixel(row + j, col + i, color);
            }
        }
    }
}

// Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {

    // TODO 2.0: Complete this function
    int count = 0;
    char current = str[count];
    while (current != '\0') {
        drawChar(row, col + (6 * count), current, color);
        current = str[++count];
    }
}