#include "myLib.h"
#include "bugmoonl.h"
#include <stdlib.h>

// Screens and Sprites
#include "bugMoonStarsFar.h"
#include "bugMoonStarsNear.h"
#include "spritesheet.h"

// Sound
#include "sound.h"
#include "VangIsSomewhatIntenseAtTimes.h"
#include "MusselReset.h"
#include "CollisionBody.h"
#include "Blaster.h"

// Our lovely player sprite
ANISPRITE mussel;

// Pools
ANISPRITE lasers[LASERCOUNT];
ANISPRITE ships[SHIPCOUNT];
ANISPRITE asteroids[ASTEROIDCOUNT];

int shipsRemaining;
int playerHealth;
int bugHOff;
int bugVOff;
int stage;
int bugMoonWon;

void initBugMoon() {

    initMussel();
    initLasers();
    initShips();
    initAsteroids();

    bugHOff = 0;
    bugVOff = 0;

    stage = 1;
    bugMoonWon = 0;
}

void goToBugMoon() {

    // BG Setup
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    DMANow(3, bugMoonStarsFarPal, PALETTE, 256);

    DMANow(3, bugMoonStarsNearTiles, &CHARBLOCK[1], bugMoonStarsNearTilesLen/2);
    DMANow(3, bugMoonStarsNearMap, &SCREENBLOCK[30], 1024);
    DMANow(3, bugMoonStarsFarTiles, &CHARBLOCK[0], bugMoonStarsFarTilesLen/2);
    DMANow(3, bugMoonStarsFarMap, &SCREENBLOCK[31], 1024);

    playSoundA(VangIsSomewhatIntenseAtTimes, VANGISSOMEWHATINTENSEATTIMESLEN, VANGISSOMEWHATINTENSEATTIMESFREQ, 1);
}

void updateBugMoon() {

    updateMussel();

    switch(stage) {
        case 1:
            updateShips();
            if (!shipsRemaining) {
                stage = 2;
            }
            break;
        case 2:
            for (int i = 0; i < ASTEROIDCOUNT; i++) {
                if (!asteroids[i].hide) {
                    updateAsteroid(&asteroids[i], i + LASERCOUNT + SHIPCOUNT + 1);
                }
                if (asteroids[i].hide && !(rand() % (6492 - mussel.worldCol))) {
                    initAsteroid(&asteroids[i]);
                }
            }
            mussel.worldCol++;
            if (mussel.worldCol == DISTANCE) {
                stage = 3;
                initLasers();
                initShips();
            }
            break;
        case 3:
            for (int i = 0; i < ASTEROIDCOUNT; i++) {
                if (!asteroids[i].hide) {
                    updateAsteroid(&asteroids[i], i + LASERCOUNT + SHIPCOUNT + 1);
                }
                if (asteroids[i].hide && !(rand() % (6492 - mussel.worldCol))) {
                    initAsteroid(&asteroids[i]);
                }
            }
            updateShips();
            if (!shipsRemaining) {
                bugMoonWon = 1;
            }
            break;
    }
    for (int i = 0; i < LASERCOUNT; i++) {
        if (!lasers[i].hide) {
            updateLaser(&lasers[i], i + 1);
        }
    }

    if (!playerHealth) {

        for (int i = 0; i < ASTEROIDCOUNT; i++) {
            hideAsteroid(&asteroids[i], i + LASERCOUNT + SHIPCOUNT + 1);
        }

        initMussel();
        initLasers();
        initShips();
        initAsteroids();

        bugHOff = 0;
        bugVOff = 0;

        playSoundB(MusselReset, MUSSELRESETLEN, MUSSELRESETFREQ, 0);
    }

    // The cheat
    if (BUTTON_PRESSED(BUTTON_L)) {
        mussel.worldCol = DISTANCE - 5;
    }

    bugHOff++;
}

void drawBugMoon() {

    drawMussel();
    for (int i = 0; i < LASERCOUNT; i++) {
        if (!lasers[i].hide) {
            drawLaser(&lasers[i], i + 1);
        }
    }
    for (int i = 0; i < SHIPCOUNT; i++) {
        if (!ships[i].hide) {
            drawShip(&ships[i], i + LASERCOUNT + 1);
        }
    }
    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        if (!asteroids[i].hide) {
            drawAsteroid(&asteroids[i], i + LASERCOUNT + SHIPCOUNT + 1);
        }
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = bugHOff >> 2;
    REG_BG0VOFF = bugVOff >> 1;
    REG_BG1HOFF = bugHOff >> 3;
    REG_BG1VOFF = bugVOff >> 3;
}

void initMussel() {

    mussel.worldRow = 0;
    mussel.worldCol = 0;
    mussel.rdel = 1;
    mussel.cdel = 1;
    mussel.width = 64;
    mussel.height = 32;

    mussel.aniCounter = 0;
    mussel.curFrame = 0;
    mussel.numFrames = 0;
    mussel.aniState = MUSSELIDLE;

    mussel.screenRow = SCREENHEIGHT/2-mussel.height/2;
    mussel.screenCol = SCREENWIDTH/2-mussel.width/2;

    playerHealth = PLAYERHEALTH;
}

void updateMussel() {

    if (BUTTON_HELD(BUTTON_UP)) {
        bugVOff--;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        bugVOff++;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        for (int i = 0; i < LASERCOUNT; i++) {
            if (lasers[i].hide) {
                initLaser(&lasers[i], mussel.screenRow + 16, mussel.screenCol + 8);
            }
        }
    }

    animateMussel();
}

void animateMussel() {

    if (mussel.aniState != MUSSELIDLE && !(mussel.aniCounter % 12)) {
        mussel.aniState--;
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        mussel.aniState = GUNIDLE;
        mussel.aniCounter = 0;
    }

    mussel.aniCounter++;
}

void drawMussel() {
    shadowOAM[0].attr0 = (mussel.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[0].attr1 = (mussel.screenCol & COLMASK) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(mussel.curFrame + 8, mussel.aniState * 8) | ATTR2_PALROW(1);
}

void initLasers() {

    for (int i = 0; i < LASERCOUNT; i++) {

        lasers[i].worldRow = 0;
        lasers[i].worldCol = 0;
        lasers[i].rdel = 0;
        lasers[i].cdel = -4;
        lasers[i].width = 8;
        lasers[i].height = 8;

        lasers[i].aniCounter = 0;
        lasers[i].curFrame = 0;
        lasers[i].numFrames = 0;
        lasers[i].aniState = BRED;

        lasers[i].hide = 1;
    }
}

void initLaser(ANISPRITE* laser, int row, int col) {
    laser -> screenRow = row;
    laser -> screenCol = col;
    laser -> cdel = -4;

    if (col < SCREENWIDTH/4) { // Checks if laser was fired by a ship
        laser -> cdel *= -1;
        laser -> aniState = (rand() % 3) + 1;
    } else {
        laser -> aniState = BRED;
    }

    laser -> hide = 0;

    playSoundB(Blaster, BLASTERLEN, BLASTERFREQ, 0);
}

void updateLaser(ANISPRITE* laser, int id) {

    if (BUTTON_HELD(BUTTON_UP)) {
        laser -> screenRow++;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        laser -> screenRow--;
    }

    if (laser -> screenCol + laser -> width + laser -> cdel > 0 &&
        laser -> screenCol + laser -> cdel < SCREENWIDTH) {
        laser -> screenCol += laser -> cdel;
    } else {
        hideLaser(laser, id);
    }

    for (int i = 0; i < SHIPCOUNT; i++) {
        if (laser -> cdel < 0 && !ships[i].hide && collision(laser -> screenRow, laser -> screenCol, laser -> height, laser -> width,
            ships[i].screenRow, ships[i].screenCol, ships[i].height, ships[i].width)) {
            hideLaser(laser, id);
            hideShip(&ships[i], i + LASERCOUNT + 1);
            shipsRemaining--;
        }
    }

    if (laser -> cdel > 0 && collision(laser -> screenRow, laser -> screenCol, laser -> height, laser -> width,
        mussel.screenRow, mussel.screenCol, mussel.height, mussel.width)) {
        hideLaser(laser, id);
        playerHealth--;
    }
}

void hideLaser(ANISPRITE* laser, int id) {
    shadowOAM[id].attr0 |= ATTR0_HIDE;
    laser -> hide = 1;
}

void drawLaser(ANISPRITE* laser, int id) {
    shadowOAM[id].attr0 = (laser -> screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[id].attr1 = (laser -> screenCol & COLMASK) | ATTR1_TINY;
    shadowOAM[id].attr2 = ATTR2_TILEID(laser -> curFrame + 12, laser -> aniState + 2) | ATTR2_PALROW(4);
}

void initShips() {
    for (int i = 0; i < SHIPCOUNT; i++) {

        ships[i].screenRow = (i * 42) + 20;
        ships[i].screenCol = -36;
        ships[i].rdel = 1;
        ships[i].cdel = 1;
        ships[i].width = 16;
        ships[i].height = 32;

        ships[i].curFrame = 0;
        ships[i].aniState = EGREEN + i;

        ships[i].hide = 0;

        shipsRemaining = SHIPCOUNT;
    }
}

void updateShips() {

    for (int i = 0; i < SHIPCOUNT; i++) {
        if (ships[i].screenCol < 0) {
            ships[i].screenCol += ships[i].cdel;
        }
        if (!ships[i].hide && !(rand() % (128*(shipsRemaining + 1)))) {
            for (int j = 0; j < LASERCOUNT - 3; j++) {
                if (lasers[j].hide) {
                    initLaser(&lasers[j], ships[i].screenRow + ships[i].height/2, ships[i].screenCol);
                    break;
                }
            }
        }
    }

    if (!(ships[0].hide) && !(collision(ships[0].screenRow, ships[0].screenCol, ships[0].height, ships[0].width,
        ships[1].screenRow, ships[1].screenCol, ships[1].height, ships[1].width))) {

        // Controls center ship mvt
        if (BUTTON_HELD(BUTTON_DOWN)) {
            ships[1].screenRow -= ships[1].rdel << 1;
        }
        if (ships[1].screenRow + ships[1].height/2 > mussel.screenRow + mussel.height/2) {
            ships[1].screenRow -= ships[1].rdel;
        }

        // Checks spacing between top ship and center ship
        if (ships[0].screenRow + ships[0].height + PADDING > ships[1].screenRow && ships[0].screenRow > 0) {
            ships[0].screenRow -= ships[0].rdel;
        }
        if (ships[0].screenRow + ships[0].height + PADDING < ships[1].screenRow) {
            ships[0].screenRow += ships[0].rdel;
        }
    }

    if (!(ships[2].hide) && !(collision(ships[2].screenRow, ships[2].screenCol, ships[2].height, ships[2].width,
        ships[1].screenRow, ships[1].screenCol, ships[1].height, ships[1].width))) {

        // Controls center ship mvt
        if (BUTTON_HELD(BUTTON_UP)) {
            ships[1].screenRow += ships[1].rdel << 1;
        }
        if (ships[1].screenRow + ships[1].height/2 < mussel.screenRow + mussel.height/2) {
            ships[1].screenRow += ships[1].rdel;
        }

        // Checks spacing between bottom ship and center ship
        if (ships[2].screenRow - PADDING < ships[1].screenRow + ships[1].height && ships[2].screenRow + ships[2].height < SCREENHEIGHT) {
            ships[2].screenRow += ships[2].rdel;
        }
        if (ships[2].screenRow - PADDING > ships[1].screenRow + ships[1].height) {
            ships[2].screenRow -= ships[2].rdel;
        }
    }

    if (ships[1].hide) {

        if (BUTTON_HELD(BUTTON_UP)) {
            ships[0].screenRow += ships[0].rdel;
            if (ships[2].screenRow + ships[2].height < SCREENHEIGHT) {
                ships[2].screenRow += ships[2].rdel;
            }
        }
        if (BUTTON_HELD(BUTTON_DOWN)) {
            if (ships[0].screenRow > 0) {
                ships[0].screenRow -= ships[0].rdel;
            }
            ships[2].screenRow -= ships[2].rdel;
        }

        if (ships[0].hide) {
            if (ships[2].screenRow + ships[2].height/2 > mussel.screenRow + mussel.height/2) {
                ships[2].screenRow -= ships[2].rdel;
            }
            if (ships[2].screenRow + ships[2].height/2 < mussel.screenRow + mussel.height/2) {
                ships[2].screenRow += ships[2].rdel;
            }
        }
        if (ships[2].hide){
            if (ships[0].screenRow + ships[0].height/2 < mussel.screenRow + mussel.height/2) {
                ships[0].screenRow += ships[0].rdel;
            }
            if (ships[0].screenRow + ships[2].height/2 > mussel.screenRow + mussel.height/2) {
                ships[0].screenRow -= ships[0].rdel;
            }
        }
        if (!collision(ships[0].screenRow, ships[0].screenCol, ships[0].height, ships[0].width,
        ships[2].screenRow - PADDING*2, ships[2].screenCol, ships[2].height, ships[2].width)) {

            ships[0].screenRow += ships[0].rdel;
            ships[2].screenRow -= ships[2].rdel;
        }
    }
}

void hideShip(ANISPRITE* ship, int id) {
    ship -> hide = 1;
    shadowOAM[id].attr0 |= ATTR0_HIDE;
}

void drawShip(ANISPRITE* ship, int id) {
    shadowOAM[id].attr0 = (ship -> screenRow & ROWMASK) | ATTR0_TALL;
    shadowOAM[id].attr1 = (ship -> screenCol & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[id].attr2 = ATTR2_TILEID(ship -> curFrame + 12, ship -> aniState * 2 + 6) | ATTR2_PALROW(5);
}

void initAsteroids() {
    for (int i = 0; i < ASTEROIDCOUNT; i++) {

        asteroids[i].screenRow = (rand() % (SCREENHEIGHT - 20)) + 10;
        asteroids[i].screenCol = SCREENWIDTH << 2;
        asteroids[i].rdel = 1;
        asteroids[i].cdel = -2 * ((rand() % 3) + 1);
        asteroids[i].width = 16;
        asteroids[i].height = 16;

        asteroids[i].aniCounter = 0;
        asteroids[i].curFrame = 0;
        asteroids[i].numFrames = 4;

        asteroids[i].hide = 1;
    }
}

void initAsteroid(ANISPRITE* asteroid) {
    asteroid -> screenCol = SCREENWIDTH << 2;
    asteroid -> aniState = (rand() % 3) * 2;
    asteroid -> hide = 0;
}

void updateAsteroid(ANISPRITE* asteroid, int id) {
    asteroid -> screenCol += asteroid -> cdel;
    if (BUTTON_HELD(BUTTON_UP)) {
        asteroid -> screenRow += asteroid -> rdel;

        if (asteroid -> screenRow > SCREENHEIGHT) {
            asteroid -> screenRow = asteroid -> height * -1;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        asteroid -> screenRow -= asteroid -> rdel;

        if (asteroid -> screenRow < -8) {
            asteroid -> screenRow = SCREENHEIGHT;
        }
    }

    if (asteroid -> screenCol + asteroid -> width + asteroid -> cdel < 0) {
        hideAsteroid(asteroid, id);
    } else if (collision(asteroid -> screenRow, (asteroid -> screenCol >> 2), asteroid -> height, asteroid -> width,
        mussel.screenRow, mussel.screenCol, mussel.height, mussel.width)) {

        playerHealth--;
        playSoundB(CollisionBody, COLLISIONBODYLEN, COLLISIONBODYFREQ, 0);
        hideAsteroid(asteroid, id);
    } else {
        animateAsteroid(asteroid);
    }
}

void animateAsteroid(ANISPRITE* asteroid) {

    if (!(asteroid -> aniCounter % (36 / asteroid -> cdel))) {
        asteroid -> curFrame = (asteroid -> curFrame + 1) % asteroid -> numFrames;
    }

    asteroid -> aniCounter++;
}

void hideAsteroid(ANISPRITE* asteroid, int id) {
    shadowOAM[id].attr0 |= ATTR0_HIDE;
    asteroid -> hide = 1;
}

void drawAsteroid(ANISPRITE* asteroid, int id) {
    shadowOAM[id].attr0 = (asteroid -> screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[id].attr1 = ((asteroid -> screenCol >> 2) & COLMASK) | ATTR1_SMALL;
    shadowOAM[id].attr2 = ATTR2_TILEID((asteroid -> curFrame)*2 + 13, asteroid -> aniState) | ATTR2_PALROW(5);
}