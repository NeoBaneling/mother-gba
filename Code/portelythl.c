#include "myLib.h"
#include "portelythl.h"
#include "spaceInvaders.h"
#include "shruden.h"
#include <stdlib.h>

// Screens and Sprites
#include "portelythbg.h"
#include "portelythFar.h"
#include "portelythcm.h"
#include "spritesheet.h"

// Sound
#include "sound.h"
#include "Scare.h"
#include "MeufordReset.h"
#include "CollisionBody.h"

#define GRAVITY 160

// our lovely player sprite
ANISPRITE meuford;

// Light pool
ANISPRITE lights[LIGHTCOUNT];
// Arcade pool
ARCADE arcades[LIGHTCOUNT];

// Vars
int orient;

int gameStage;
int gamesCompleted;
int portelythWon;

int portelythHOff;
int portelythVOff;
int portelythfarHOff;
int portelythfarVOff;

int pCheckRow;
int pCheckCol;
int pCheckHOff;
int pCheckVOff;

void initPortelyth() {

    pCheckRow = 224<<8;
    pCheckCol = MAPWIDTH/2;

    initMeuford();
    initLights();
    initSpaceInvaders();
    initShruden();
    initArcades();

    portelythHOff = MAPWIDTH/2 - SCREENWIDTH/2;
    portelythVOff = 0;
    portelythfarHOff = (256/2-SCREENWIDTH/2) << 3;
    portelythfarVOff = (256/2-SCREENHEIGHT/2) << 2;

    pCheckHOff = MAPWIDTH/2 - SCREENWIDTH/2;
    pCheckVOff = MAPHEIGHT/2 - SCREENHEIGHT/2;

    gameStage = LPORTELYTH;
    gamesCompleted = 0;
    portelythWon = 0;
}

void goToPortelythLevel() {

    hideSprites();

    DMANow(3, portelythbgPal, PALETTE, 256);

    switch (gameStage) {
        case LPORTELYTH:
            DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
            DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
            goToPortelyth();
            break;
        case LSPACEINVADERS:
            goToSpaceInvaders();
            break;
        case LSHRUDEN:
            goToShruden();
            break;
    }
}

void goToPortelyth() {

    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(27);

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    DMANow(3, portelythbgTiles, &CHARBLOCK[0], portelythbgTilesLen/2);
    DMANow(3, portelythbgMap, &SCREENBLOCK[28], 4096);
    DMANow(3, portelythFarTiles, &CHARBLOCK[1], portelythFarTilesLen/2);
    DMANow(3, portelythFarMap, &SCREENBLOCK[27], 1024);

    playSoundA(Scare, SCARELEN, SCAREFREQ, 1);
}

void updatePortelyth() {

    switch (gameStage) {
        case LPORTELYTH:
            updateMeuford();
            for (int i = 0; i < LIGHTCOUNT; i++) {
                if (!lights[i].hide) {
                    updateLight(&lights[i]);
                }
            }

            // The cheat
            if (BUTTON_PRESSED(BUTTON_L)) {
                for (int i = 0; i < LIGHTCOUNT-1; i++) {
                    gamesCompleted++;
                    initLight(&lights[i]);
                }
            }
            break;
        case LSPACEINVADERS:
            updateSpaceInvaders();
            if (!enemiesRemaining) {
                gameStage = LPORTELYTH;
                initLight(&lights[gamesCompleted]);
                gamesCompleted++;
                arcades[curArcade].active = 0;
                initSpaceInvaders();
                goToPortelythLevel();
            }
            if (!lives) {
                initSpaceInvaders();
            }
            break;
        case LSHRUDEN:
            updateShruden();
            if (!coinsRemaining) {
                gameStage = LPORTELYTH;
                initLight(&lights[gamesCompleted]);
                gamesCompleted++;
                arcades[curArcade].active = 0;
                initShruden();
                goToPortelythLevel();
            } if (coinsRemaining == -1) {
                drawInit();
                initShruden();
            }
            break;
    }
}

void drawPortelyth() {

    switch (gameStage) {
        case LPORTELYTH:
            drawMeuford();
            for (int i = 0; i < LIGHTCOUNT; i++) {
                if (!lights[i].hide) {
                    drawLight(&lights[i], i + 1);
                }
            }
            REG_BG0HOFF = portelythHOff;
            REG_BG0VOFF = portelythVOff;
            REG_BG1HOFF = portelythfarHOff >> 3;
            REG_BG1VOFF = portelythfarVOff >> 2;
            break;
        case LSPACEINVADERS:
            drawSpaceInvaders();
            break;
        case LSHRUDEN:
            drawShruden();
            break;
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void initMeuford() {

    meuford.worldRow = -10*8;
    meuford.worldCol = pCheckCol;
    meuford.rdel = 0;
    meuford.cdel = 1;
    meuford.width = 16;
    meuford.height = 16;

    meuford.aniCounter = 0;
    meuford.curFrame = 0;
    meuford.numFrames = 4;
    meuford.aniState = MEUFORDIDLE;

    isClimbing = 0;
    isJumping = 0;
    meufordFOff = 5;
    meufordFWidth = 5;
    meufordSOff = 3;
    meufordSWidth = 10;

    orient = 0 << 12;
}

void updateMeuford() {

    if (BUTTON_PRESSED(BUTTON_A)) {

        if (gamesCompleted == 5 &&
            (portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol, MAPWIDTH)] == CM_GREEN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol, MAPWIDTH)] == CM_GREEN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meuford.width - 1, MAPWIDTH)] == CM_GREEN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meuford.width - 1, MAPWIDTH)] == CM_GREEN)) {

            portelythWon = 1;

        } else if (portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol, MAPWIDTH)] == CM_CYAN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol, MAPWIDTH)] == CM_CYAN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meuford.width - 1, MAPWIDTH)] == CM_CYAN ||
            portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meuford.width - 1, MAPWIDTH)] == CM_CYAN) {

            for (int i = 0; i < LIGHTCOUNT; i++) {
                if (arcades[i].active && collision(arcades[i].row, arcades[i].col, arcades[i].height, arcades[i].width,
                    SD(meuford.worldRow), meuford.worldCol, meuford.height, meuford.width)) {

                    curArcade = i;
                    gameStage = rand()%2+1;
                    goToPortelythLevel();
                    break;
                }
            }

        } else if (!isJumping) {

            if (isClimbing) {
                meuford.cdel = 3;
                isClimbing = 0;
            }

            meuford.rdel -= 1700;
            for (int i = 0; i > meuford.rdel; i--) {
                if (!(portelythcmBitmap[OFFSET(SD(meuford.worldRow + i) - meuford.height, meuford.worldCol, MAPWIDTH)]) ||
                    !(portelythcmBitmap[OFFSET(SD(meuford.worldRow + i) - meuford.height, meuford.worldCol + meuford.width - 1, MAPWIDTH)])) {

                    meuford.rdel = 0;
                    meuford.worldRow += i - SU(meuford.height);
                    break;
                }
            }
            isJumping = 1;
        }
    }

    // Wall climbing
    if (BUTTON_HELD(BUTTON_B) &&
        (!portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meufordSOff - meuford.cdel, MAPWIDTH)] || // Top left
        !portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meufordSOff - meuford.cdel, MAPWIDTH)]|| // Bottom left
        !portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meufordSOff + meufordSWidth - 1 + meuford.cdel, MAPWIDTH)]|| // Top right
        !portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meufordSOff + meufordSWidth - 1 + meuford.cdel, MAPWIDTH)])) { // Bottom right

        meuford.cdel = 1;
        meuford.rdel = SU(1);
        isClimbing = 1;
        isJumping = 0;

        if (BUTTON_HELD(BUTTON_UP) &&
            portelythcmBitmap[OFFSET(SD(meuford.worldRow - meuford.rdel) - 1, meuford.worldCol + meufordSOff, MAPWIDTH)] && // Top left
            portelythcmBitmap[OFFSET(SD(meuford.worldRow - meuford.rdel) - 1, meuford.worldCol + meufordSOff + meufordSWidth - 1, MAPWIDTH)]) { // Top right
            meuford.worldRow -= meuford.rdel;
        }
        if (BUTTON_HELD(BUTTON_DOWN) &&
            portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel) + meuford.height - 1, meuford.worldCol + meufordSOff, MAPWIDTH)] && // Bottom left
            portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel) + meuford.height - 1, meuford.worldCol + meufordSOff + meufordSWidth - 1, MAPWIDTH)]) { // Bottom right
            meuford.worldRow += meuford.rdel;
        }

    } else {

        isClimbing = 0;

        // Jumping and gravity
        meuford.rdel += GRAVITY;

        for (int i = 0; i < meuford.rdel; i++) { // Checking every row between the player and the player's possible position
            if (!portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i) + meuford.height - 1, meuford.worldCol + meufordFOff, MAPWIDTH)] ||
                !portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i) + meuford.height - 1, meuford.worldCol + meufordFOff + meufordFWidth - 1, MAPWIDTH)]) {

                isJumping = 0;
                meuford.rdel = 0;
                meuford.cdel = 1;
                break;
            }

            // Checking collision against spikes
            if (portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i), meuford.worldCol + meufordFOff, MAPWIDTH)] == CM_RED || // top left
                portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i) + meuford.height - 1, meuford.worldCol + meufordFOff, MAPWIDTH)] == CM_RED || // bottom left
                portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i), meuford.worldCol + meufordFOff + meufordFWidth - 1, MAPWIDTH)] == CM_RED || // top right
                portelythcmBitmap[OFFSET(SD(meuford.worldRow + meuford.rdel - i) + meuford.height - 1, meuford.worldCol + meufordFOff + meufordFWidth - 1, MAPWIDTH)] == CM_RED) { // bottom right

                meuford.worldRow = pCheckRow;
                meuford.worldCol = pCheckCol;

                portelythHOff = pCheckHOff;
                portelythVOff = pCheckVOff;

                meuford.rdel = 0;
                meuford.cdel = 1;

                playSoundB(MeufordReset, MEUFORDRESETLEN, MEUFORDRESETFREQ, 0);
                break;
            }
        }

        meuford.worldRow += meuford.rdel;

        // Basic movement
        if (BUTTON_HELD(BUTTON_LEFT)) {
            if (meuford.worldCol - meuford.cdel > 0 &&
                portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meufordSOff - meuford.cdel, MAPWIDTH)] &&
                portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meufordSOff - meuford.cdel, MAPWIDTH)]) {

                meuford.worldCol -= meuford.cdel;
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            if (meuford.worldCol + meuford.cdel < MAPWIDTH - meuford.width &&
                portelythcmBitmap[OFFSET(SD(meuford.worldRow), meuford.worldCol + meufordSOff + meufordSWidth, MAPWIDTH)] &&
                portelythcmBitmap[OFFSET(SD(meuford.worldRow) + meuford.height - 1, meuford.worldCol + meufordSOff + meufordSWidth, MAPWIDTH)]) {

                meuford.worldCol += meuford.cdel;
            }
        }
    }

    meuford.screenRow = SD(meuford.worldRow) - portelythVOff;
    meuford.screenCol = meuford.worldCol - portelythHOff;

    if (portelythVOff > 0 && meuford.screenRow + meuford.height/2 <= SCREENHEIGHT/2) {
        portelythVOff--;
    }
    if (portelythVOff < MAPHEIGHT - SCREENHEIGHT && meuford.screenRow + meuford.height/2 >= SCREENHEIGHT/2) {
        portelythVOff += SD(meuford.rdel);
        while (portelythVOff > MAPHEIGHT - SCREENHEIGHT) { // Compensates for falling too far
            portelythVOff--;
        }
    }
    if (portelythHOff > 0 && meuford.screenCol + meuford.width/2 <= SCREENWIDTH/2) {
        portelythHOff--;
        portelythfarHOff--;
    }
    if (portelythHOff < MAPWIDTH - SCREENWIDTH && meuford.screenCol + meuford.width/2 >= SCREENWIDTH/2) {
        portelythHOff++;
        portelythfarHOff++;
    }

    animateMeuford();
}

void animateMeuford() {

    if (meuford.aniState != MEUFORDIDLE) {
        meuford.prevAniState = meuford.aniState;
    }
    meuford.aniState = MEUFORDIDLE;

    // Changes the current frame
    if (!(meuford.aniCounter % 12)) {
        meuford.curFrame = (meuford.curFrame + 1) % meuford.numFrames;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        meuford.aniState = MEUFORDWALK;
        orient = 0 << 12;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        meuford.aniState = MEUFORDWALK;
        orient = 1 << 12;
    }

    if (isJumping) {
        meuford.aniState = MEUFORDJUMP;
    }

    if (isClimbing) {
        meuford.aniState = MEUFORDCLIMB;
    }

    meuford.aniCounter++;
}

void drawMeuford() {
    shadowOAM[0].attr0 = (meuford.screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (meuford.screenCol & COLMASK) | ATTR1_SMALL | orient;
    shadowOAM[0].attr2 = ATTR2_TILEID(meuford.curFrame * 2, meuford.aniState * 2) | ATTR2_PALROW(3);
}

void initLights() {

    for (int i = 0; i < LIGHTCOUNT; i++) {

        lights[i].aniState = 3;
        lights[i].hide = 1;
    }

    lights[0].worldRow = 224;
    lights[0].worldCol = 224;
    lights[1].worldRow = 224;
    lights[1].worldCol = 280;
    lights[2].worldRow = 208;
    lights[2].worldCol = 224;
    lights[3].worldRow = 208;
    lights[3].worldCol = 280;
    lights[4].worldRow = 192;
    lights[4].worldCol = 252;
}

void initLight(ANISPRITE* light) {
    light -> hide = 0;
}

void updateLight(ANISPRITE* light) {

    light -> screenRow = light -> worldRow - portelythVOff;
    light -> screenCol = light -> worldCol - portelythHOff;
}

void drawLight(ANISPRITE* light, int id) {

    int hidden = ATTR0_REGULAR;

    if (light->screenRow < light->height*-1 || light->screenRow > SCREENHEIGHT ||
        light->screenCol < light->width*-1 || light->screenCol > SCREENWIDTH) {
        hidden = ATTR0_HIDE;
    }
    shadowOAM[id].attr0 = (light -> screenRow & ROWMASK) | hidden | ATTR0_SQUARE;
    shadowOAM[id].attr1 = (light -> screenCol & COLMASK) | ATTR1_TINY;
    shadowOAM[id].attr2 = ATTR2_TILEID(12, light -> aniState) | ATTR2_PALROW(4);
}

void initArcades() {
    curArcade = 0;

    arcades[0].row = 72;
    arcades[0].col = 169;
    arcades[1].row = 376;
    arcades[1].col = 9;
    arcades[2].row = 488;
    arcades[2].col = 249;
    arcades[3].row = 168;
    arcades[3].col = 457;
    arcades[4].row = 24;
    arcades[4].col = 337;

    for (int i = 0; i < LIGHTCOUNT; i++) {
        arcades[i].height = 15;
        arcades[i].width = 10;
        arcades[i].active = 1;
    }
}