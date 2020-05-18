#include <stdlib.h>
#include "myLib.h"
#include "shruden.h"

#include "sound.h"
#include "Tagirijus.h"

// Variables
BLIP blip;
BLOP blop;
BOOP boop;
COIN coins[COINCOUNT];
int coinsRemaining;

void initShruden() {
    initBlip();
    initCoins();
    initBlop();
    initBoop();
}

void goToShruden() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    playSoundA(Tagirijus, TAGIRIJUSLEN, TAGIRIJUSFREQ, 1);
    drawInit();
}

// Updates game logic
void updateShruden() {
    updateBlip();
    updateBlop();
    updateBoop();

    // collision checks
    checkBlipWallCollision();
    checkBlopWallCollision();
    checkBoopCollision();
    checkBlipCoinCollision();
    checkBlipBlopCollision();
}

void drawInit() {
    fillScreen(BG_COLOR);
    // Border
    drawRect(0, 0, SCREENHEIGHT, 2, PURPLE);
    drawRect(0, SCREENWIDTH - 2, SCREENHEIGHT, 2, PURPLE);
    drawRect(0, 0, 2, SCREENWIDTH, PURPLE);
    drawRect(SCREENHEIGHT - 2, 0, 2, SCREENWIDTH, PURPLE);
}

// Redraws all game logic
void drawShruden() {
    for (int i = 0; i < COINCOUNT; i++) {
        if (coins[i].active) {
            drawCoin(&coins[i]);
        }
    }
    drawBlip();
    drawBoop();
    drawBlop();

    // Update Blip, Blop, and Boop previous variables
    blip.oldRow = blip.row;
    blip.oldCol = blip.col;

    blop.oldRow = blop.row;
    blop.oldCol = blop.col;

    boop.oldRow = boop.row;
    boop.oldCol = boop.col;
}

// Initializes blip variables
void initBlip() {
    blip.row = SCREENHEIGHT / 2 - 4;
    blip.col = SCREENWIDTH / 3 - 4;
    blip.height = 8;
    blip.oldRow = 2;
    blip.oldCol = 2;
    blip.color1 = CYAN;
    blip.color2 = BLUE;
}

// Updates blip variables based on input
void updateBlip() {
    if (BUTTON_HELD(BUTTON_UP)) {
        blip.row -= 2;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        blip.col -= 2;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        blip.col += 2;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        blip.row += 2;
    }
}

// Draw Blip Icon
void drawBlip() {
    int row = blip.row;
    int col = blip.col;
    int height = blip.height;
    unsigned short color1 = blip.color1;
    unsigned short color2 = blip.color2;

    // Erase old blip
    drawRect(blip.oldRow, blip.oldCol, height, height, BG_COLOR);

    // Draw current blip
    drawRect(row, col, height, height, color1);

    // Eyebrows
    drawRect(row + 1, col + 1, 1, 2, color2);
    drawRect(row + 1, col + 5, 1, 2, color2);

    // Eyes
    drawRect(row + 2, col + 1, 2, 2, WHITE);
    drawRect(row + 2, col + 5, 2, 2, WHITE);

    // Mouth
    drawRect(row + 6, col + 5, 1, 1, color2);

    // Pupils
    int pupilUp = (row < blip.oldRow) ? -1 : 0;
    int pupilRight = (col > blip.oldCol) ? 1 : 0;
    int pupilLeft = (col < blip.oldCol) ? -1 : 0;
    drawRect(row + 3 + pupilUp, col + 2 + pupilLeft, 1, 1, BLACK);
    drawRect(row + 3 + pupilUp, col + 5 + pupilRight, 1, 1, BLACK);
}

// Initialize coins in coins array
void initCoins() {
    coinsRemaining = COINCOUNT;
    for (int i = 0; i < COINCOUNT; i++) {
        coins[i].row = rand() % 140 + 10;
        coins[i].col = rand() % 200 + 20;
        coins[i].color = GREEN;
        coins[i].active = 1;
    }
}

// Updates a passed in coin to inactive
void updateCoin(COIN* coin) {
    coin -> active = 0;
    drawRect(coin -> row, coin -> col, 6, 3, WHITE);
}

// Draw Coin Icon
void drawCoin(COIN* coin) {
    drawRect(coin -> row, coin -> col, 6, 3, coin -> color);
}

// Initializes blop variables
void initBlop() {
    blop.row = 60;
    blop.col = 180;
    blop.height = 16;
    blop.oldRow = 2;
    blop.oldCol = 2;
    blop.color1 = RED;
    blop.color2 = COLOR(9,0,0);
}

// Updates the blop's position based on blip position
void updateBlop() {
    if (blip.row - blip.height / 2 < blop.row) {
        blop.row -= 1;
    }
    if (blip.row - blip.height / 2 > blop.row) {
        blop.row += 1;
    }
    if (blip.col - blip.height / 2 < blop.col) {
        blop.col -= 1;
    }
    if (blip.col - blip.height / 2 > blop.col) {
        blop.col += 1;
    }
}

// Draw Blop Icon
void drawBlop() {
    int row = blop.row;
    int col = blop.col;
    int height = blop.height;
    unsigned short color1 = blop.color1;
    unsigned short color2 = blop.color2;

    // Erase old blop
    drawRect(blop.oldRow, blop.oldCol, height, height, BG_COLOR);

    // Draw current blop
    drawRect(row, col, height, height, color1);
    // Eyebrows
    drawRect(row + 2, col + 1, 1, 1, color2);
    drawRect(row + 3, col + 2, 1, 4, color2);
    drawRect(row + 4, col + 6, 1, 1, color2);
    drawRect(row + 2, col + 14, 1, 1, color2);
    drawRect(row + 3, col + 10, 1, 4, color2);
    drawRect(row + 4, col + 9, 1, 1, color2);

    // Angry eyes
    drawRect(row + 4, col + 2, 4, 4, WHITE);
    drawRect(row + 4, col + 10, 4, 4, WHITE);

    // Angry disappointed mouth
    drawRect(row + 13, col + 2, 1, 1, color2);
    drawRect(row + 13, col + 13, 1, 1, color2);
    drawRect(row + 12, col + 3, 1, 10, color2);

    // Angry Pupils
    int pupilUp = (row < blop.oldRow) ? -2 : 0;
    int pupilLeft = (col < blop.oldCol) ? -2 : 0;
    int pupilRight = (col > blop.oldCol) ? 2 : 0;
    drawRect(row + 6 + pupilUp, col + 4 + pupilLeft, 2, 2, BLACK);
    drawRect(row + 6 + pupilUp, col + 10 + pupilRight, 2, 2, BLACK);
}


// Initializes boop variables
void initBoop() {
    boop.row = 100;
    boop.col = 120;
    boop.vRow = 1;
    boop.vCol = 1;
    boop.height = 12;
    boop.oldRow = 2;
    boop.oldCol = 2;
    boop.color1 = MAGENTA;
    boop.color2 = PURPLE;
}

// Updates boop position
void updateBoop() {
    boop.row += boop.vRow;
    boop.col += boop.vCol;
}

// Draw Boop Icon
void drawBoop() {
    int row = boop.row;
    int col = boop.col;
    int height = boop.height;
    unsigned short color1 = boop.color1;
    unsigned short color2 = boop.color2;

    // Erase old boop
    drawRect(boop.oldRow, boop.oldCol, height, height, BG_COLOR);

    // Draw current boop
    drawRect(row, col, height, height, color1);

    // Eyebrows
    drawRect(row + 2, col + 2, 1, 3, color2);
    drawRect(row + 2, col + 7, 1, 3, color2);

    // Eyes
    drawRect(row + 3, col + 2, 3, 3, WHITE);
    drawRect(row + 3, col + 7, 3, 3, WHITE);

    // Mouth
    drawRect(row + 9, col + 8, 1, 1, color2);

    // Pupils
    int pupilUp = (row < boop.oldRow) ? -1 : 0;
    int pupilLeft = (col < boop.oldCol) ? -1 : 0;
    int pupilRight = (col > boop.oldCol) ? 1 : 0;
    drawRect(row + 4 + pupilUp, col + 3 + pupilLeft, 2, 2, BLACK);
    drawRect(row + 4 + pupilUp, col + 7 + pupilRight, 2, 2, BLACK);
}

// Draw Win Icon
void drawWin() {
    int row = blip.row;
    int col = blip.col;
    int height = blip.height;
    drawRect(row, col, height, height, WHITE);

    // Eyes
    drawRect(row + 2, col + 2, 1, 1, GREEN);
    drawRect(row + 2, col + 5, 1, 1, GREEN);

    // Frown
    drawRect(row + 5, col + 3, 2, 2, GREEN);
    drawRect(row + 5, col + 2, 1, 4, GREEN);
}

// Draw Lose Icon
void drawLose() {
    int row = blip.row;
    int col = blip.col;
    int height = blip.height;
    drawRect(row, col, height, height, WHITE);

    // Eyes
    drawRect(row + 2, col + 2, 1, 1, BLACK);
    drawRect(row + 2, col + 5, 1, 1, BLACK);

    // Frown
    drawRect(row + 5, col + 3, 2, 2, BLACK);
    drawRect(row + 6, col + 2, 1, 4, BLACK);
}

// Check for blip collisions into walls
void checkBlipWallCollision() {
    int row = blip.row;
    int col = blip.col;
    int height = blip.height;
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        blip.col += 2;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        blip.col -= 2;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        blip.row += 2;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        blip.row -= 2;
    }
}

// Check for blop collisions into walls
void checkBlopWallCollision() {
    int row = blop.row;
    int col = blop.col;
    int height = blop.height;
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        blop.col += 2;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        blop.col -= 2;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        blop.row += 2;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        blop.row -= 2;
    }
}

// Check for boop collisions into walls and blop
void checkBoopCollision() {
    int row = boop.row;
    int col = boop.col;
    int height = boop.height;
    int eRow = blop.row;
    int eCol = blop.col;
    int eHeight = blop.height;
    // Collisions into walls
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        boop.col += 3;
        boop.vCol = -boop.vCol;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        boop.col -= 3;
        boop.vCol = -boop.vCol;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        boop.row += 3;
        boop.vRow = -boop.vRow;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        boop.row -= 3;
        boop.vRow = -boop.vRow;
    }
    // Collisions into blop
    if (collision(row, col, height, height, eRow, eCol + eHeight, eHeight, 1)) {
        boop.col += 3;
        boop.vCol = -boop.vCol;
    }
    if (collision(row, col, height, height, eRow, eCol, eHeight, 1)) {
        boop.col -= 3;
        boop.vCol = -boop.vCol;
    }
    if (collision(row, col, height, height, eRow + eHeight, eCol, 1, eHeight)) {
        boop.row += 3;
        boop.vRow = -boop.vRow;
    }
    if (collision(row, col, height, height, eRow, eCol, 1, eHeight)) {
        boop.row -= 3;
        boop.vRow = -boop.vRow;
    }
}

// Check for blip collisions into coins
void checkBlipCoinCollision() {
    for (int i = 0; i < 8; i++) {
        if (coins[i].active && collision(blip.row, blip.col, blip.height,
            blip.height, coins[i].row, coins[i].col, 6, 3)) {
            coinsRemaining--;
            updateCoin(&coins[i]);
            // Update Boop variables based on blip progression
            if (coinsRemaining == 4) {
                boop.vRow *= 2;
                boop.vCol *= 2;
            }
            if (coinsRemaining == 2) {
                boop.vRow = boop.vRow / 2 * 3;
                boop.vCol = boop.vCol / 2 * 3;
            }
        }
    }
}

// Check for blip collisions into blop and boop
void checkBlipBlopCollision() {
    if (collision(blip.row, blip.col, blip.height, blip.height,
        blop.row, blop.col, blop.height, blop.height)) {
        coinsRemaining = -1;
    }
    if (collision(blip.row, blip.col, blip.height, blip.height,
        boop.row, boop.col, boop.height, boop.height)) {
        coinsRemaining = -1;
    }
}