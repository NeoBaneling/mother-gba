#include "myLib.h"
#include "hackingl.h"
#include <stdlib.h>

// Screens and Sprites
#include "hackingbg.h"
#include "hackingcm.h"
#include "spritesheet.h"

// Sound
#include "sound.h"
#include "Scifi.h"
#include "VangReset.h"
#include "CollisionBody.h"
#include "Blaster.h"

// Our lovely player sprite
ANISPRITE vang;

// The enemy Sprite
ANISPRITE avara;

// Bullet stuff
ANISPRITE playerBullets[BULLETCOUNT];
ANISPRITE enemyBullets[BULLETCOUNT];

// Vars
int vangOrient;
int vangHOff;
int vangFOff;
int vangFWidth;
int vangSOff;
int vangSWidth;

int avaraOrient;
int enemyLife;

int hackingHOff;
int hackingVOff;

int hCheckRow;
int hCheckCol;
int hCheckHOff;
int hCheckVOff;

void initHacking() {

    hCheckRow = SU(42);
    hCheckCol = 32;

    initVang();
    initAvara();
    initBullets();

    hCheckHOff = 0;
    hCheckVOff = 0;

    hackingHOff = hCheckHOff;
    hackingVOff = hCheckVOff;

    invincible = 0;
}

void goToHacking() {

    // BG setup
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);

    DMANow(3, hackingbgPal, PALETTE, 256);

    DMANow(3, hackingbgTiles, &CHARBLOCK[0], 2592);
    DMANow(3, hackingbgMap, &SCREENBLOCK[30], 2048);

    playSoundA(Scifi, SCIFILEN, SCIFIFREQ, 1);
}

void updateHacking() {

    updateVang();
    updateAvara();

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!playerBullets[i].hide) {
            updatePlayerBullet(&playerBullets[i], i + 2);
        }
        if (!enemyBullets[i].hide) {
            updateEnemyBullet(&enemyBullets[i], i + BULLETCOUNT + 2);
        }
    }

    // The cheat
    if (BUTTON_PRESSED(BUTTON_L)) {
        invincible = (invincible + 1) & 1;
    }
}

void drawHacking() {

    drawVang();
    drawAvara();

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!playerBullets[i].hide) {
            drawBullet(&playerBullets[i], i + 2);
        }
        if (!enemyBullets[i].hide) {
            drawBullet(&enemyBullets[i], i + BULLETCOUNT + 2);
        }
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hackingHOff;
    REG_BG0VOFF = hackingVOff;
}

// Sets up player varaibles
void initVang() {

    vang.worldRow = hCheckRow;
    vang.worldCol = hCheckCol;
    vang.rdel = 0;
    vang.cdel = 1;
    vang.width = 16;
    vang.height = 16;

    vang.aniCounter = 0;
    vang.curFrame = 0;
    vang.numFrames = 4;
    vang.aniState = VANGIDLE;

    vangOrient = 0 << 12;
    isJumping = 0;

    vangHOff = 2;
    vangFOff = 5;
    vangFWidth = 5;
    vangSOff = 3;
    vangSWidth = 10;
}

void updateVang() {

    // Dashing
    if (BUTTON_PRESSED(BUTTON_A)) {
        vang.cdel = 6;
    }

    if (vang.cdel > 1) {
        vang.cdel--;
        vang.rdel = 0;
    }

    // Jumping and gravity
    vang.rdel += GRAVITY;

    if (BUTTON_PRESSED(BUTTON_UP) && !isJumping) {
        vang.rdel -= 1700;
        for (int i = 0; i > vang.rdel; i--) {
            if (!hackingcmBitmap[OFFSET(SD(vang.worldRow + i) - vang.height + vangHOff, vang.worldCol + vangFOff, MAPWIDTH)] ||
                !hackingcmBitmap[OFFSET(SD(vang.worldRow + i) - vang.height + vangHOff, vang.worldCol + vangFOff + vangFWidth - 1, MAPWIDTH)]) {

                vang.rdel = GRAVITY*-1;
                vang.worldRow += i - SU(vang.height);
                break;
            }
        }
        isJumping = 1;
    }

    for (int i = 0; i < vang.rdel; i++) { // Checking every row between the player and the player's possible position
        if (!hackingcmBitmap[OFFSET(SD(vang.worldRow + i) + vang.height - 1, vang.worldCol + vangFOff, MAPWIDTH)] ||
            !hackingcmBitmap[OFFSET(SD(vang.worldRow + i) + vang.height - 1, vang.worldCol + vangFOff + vangFWidth - 1, MAPWIDTH)]) {

            vang.rdel = i-1;
            isJumping = 0;
            break;
        }
            // Checking collision against lava
        if (hackingcmBitmap[OFFSET(SD(vang.worldRow + i), vang.worldCol + vangFOff, MAPWIDTH)] == CM_RED || // top left
            hackingcmBitmap[OFFSET(SD(vang.worldRow + i) + vang.height - 1, vang.worldCol + vangFOff, MAPWIDTH)] == CM_RED || // bottom left
            hackingcmBitmap[OFFSET(SD(vang.worldRow + i), vang.worldCol + vangFOff + vangFWidth - 1, MAPWIDTH)] == CM_RED || // top right
            hackingcmBitmap[OFFSET(SD(vang.worldRow + i) + vang.height - 1, vang.worldCol + vangFOff + vangFWidth - 1, MAPWIDTH)] == CM_RED) { // bottom right

            if (invincible) {
                vang.rdel = i-1;
                isJumping = 0;
                break;
            } else {
                vang.worldRow = hCheckRow;
                vang.worldCol = hCheckCol;

                hackingHOff = hCheckHOff;
                hackingVOff = hCheckVOff;

                vang.rdel = 0;
                vang.cdel = 1;

                playSoundB(VangReset, VANGRESETLEN, VANGRESETFREQ, 0);
            }
        }
    }

    vang.worldRow += vang.rdel;

    // Basic movement
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (vang.worldCol - vang.cdel > 0 &&
            hackingcmBitmap[OFFSET(SD(vang.worldRow), vang.worldCol + vangSOff - vang.cdel, MAPWIDTH)] &&
            hackingcmBitmap[OFFSET(SD(vang.worldRow) + vang.height - 1, vang.worldCol + vangSOff - vang.cdel, MAPWIDTH)]) {

            vang.worldCol -= vang.cdel;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (vang.worldCol + vang.cdel < MAPWIDTH - vang.width &&
            hackingcmBitmap[OFFSET(SD(vang.worldRow), vang.worldCol + vangSOff + vangSWidth - 1 + vang.cdel, MAPWIDTH)] &&
            hackingcmBitmap[OFFSET(SD(vang.worldRow) + vang.height - 1, vang.worldCol + vangSOff + vangSWidth - 1 + vang.cdel, MAPWIDTH)]) {

            vang.worldCol += vang.cdel;
        }
    }

    // Checking collisoin for checkpoints
    if (hackingcmBitmap[OFFSET(SD(vang.worldRow), vang.worldCol, MAPWIDTH)] == CM_CYAN || // top left
        hackingcmBitmap[OFFSET(SD(vang.worldRow) + vang.height - 1, vang.worldCol, MAPWIDTH)] == CM_CYAN || // bottom left
        hackingcmBitmap[OFFSET(SD(vang.worldRow), vang.worldCol + vang.width - 1, MAPWIDTH)] == CM_CYAN || // top right
        hackingcmBitmap[OFFSET(SD(vang.worldRow) + vang.height - 1, vang.worldCol + vang.width - 1, MAPWIDTH)] == CM_CYAN) { // bottom right

        hCheckRow = vang.worldRow;
        hCheckCol = vang.worldCol;

        hCheckHOff = hackingHOff;
        hCheckVOff = hackingVOff;
    }

    // Shooting the gun
    if (BUTTON_PRESSED(BUTTON_B)) {
        for (int i = 0; i < BULLETCOUNT; i++) {
            if (playerBullets[i].hide) {
                initBullet(&playerBullets[i], SD(vang.worldRow), vang.worldCol, vangOrient);
                break;
            }
        }
    }

    vang.screenRow = SD(vang.worldRow) - hackingVOff;
    vang.screenCol = vang.worldCol - hackingHOff;

    if (hackingVOff > 0 && vang.screenRow + vang.height/2 <= SCREENHEIGHT/2) {
        hackingVOff--;
    }
    if (hackingVOff < MAPHEIGHT - SCREENHEIGHT && vang.screenRow + vang.height/2 >= SCREENHEIGHT/2) {
        if (vang.rdel > 0) {
            hackingVOff += SD(vang.rdel);
        }
        while (hackingVOff > MAPHEIGHT - SCREENHEIGHT) { // Compensates for falling too far
            hackingVOff--;
        }
    }
    if (hackingHOff > 0 && vang.screenCol + vang.width/2 <= SCREENWIDTH/2) {
        hackingHOff--;
    }
    if (hackingHOff < MAPWIDTH - SCREENWIDTH && vang.screenCol + vang.width/2 >= SCREENWIDTH/2) {
        hackingHOff++;
    }

    animateVang();
}

void animateVang() {

    if (vang.aniState != VANGIDLE) {
        vang.prevAniState = vang.aniState;
    }
    vang.aniState = VANGIDLE;

    // Changes the current frame
    if (!(vang.aniCounter % 12)) {
        vang.curFrame = (vang.curFrame + 1) % vang.numFrames;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        vang.aniState = VANGWALK;
        vangOrient = 0 << 12;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        vang.aniState = VANGWALK;
        vangOrient = 1 << 12;
    }

    // Checking jumps
    if (isJumping) {
        vang.aniState = VANGJUMP;
    }

    // Checking gun shoot
    if (BUTTON_PRESSED(BUTTON_B)) {
        vang.aniState = VANGSHOOT;
        vang.curFrame = 0;
    }
    if (vang.prevAniState == VANGSHOOT) {
        if (vang.curFrame == 3) {
            vang.aniState = VANGIDLE;
            vang.prevAniState = VANGIDLE;
        } else {
            vang.aniState = VANGSHOOT;
        }
    }

    vang.aniCounter++;
}

void drawVang() {
    shadowOAM[0].attr0 = (vang.screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (vang.screenCol & COLMASK) | ATTR1_SMALL | vangOrient;
    shadowOAM[0].attr2 = ATTR2_TILEID(vang.curFrame * 2, vang.aniState * 2) | ATTR2_PALROW(2);
}

void initAvara() {

    avara.worldRow = 232;
    avara.worldCol = 408;
    avara.rdel = 1;
    avara.cdel = 1;
    avara.width = 16;
    avara.height = 16;

    avara.aniCounter = 0;
    avara.curFrame = 0;
    avara.numFrames = 4;
    avara.aniState = AVARAIDLE;

    avaraOrient = 0 << 12;
    enemyLife = ENEMYLIFE;
}

void updateAvara() {

    if (avara.aniState != AVARAIDLE) {
        avara.prevAniState = avara.aniState;
    }
    avara.aniState = AVARAIDLE;

    if (!(avara.aniCounter % 12)) {
        avara.curFrame = (avara.curFrame + 1) % avara.numFrames;
    }

    if (avara.worldCol > vang.worldCol + vang.width + 20 &&
        hackingcmBitmap[OFFSET((avara.worldRow), avara.worldCol - avara.cdel, MAPWIDTH)] &&
        hackingcmBitmap[OFFSET((avara.worldRow) + avara.height - 1, avara.worldCol - avara.cdel, MAPWIDTH)]) {
        avara.worldCol -= avara.cdel;

        avaraOrient = 1 << 12;
        avara.aniState = AVARAWALK;
    }
    if (avara.worldCol + avara.width + 20 < vang.worldCol &&
        hackingcmBitmap[OFFSET((avara.worldRow), avara.worldCol + avara.width - 1 + avara.cdel, MAPWIDTH)] &&
        hackingcmBitmap[OFFSET((avara.worldRow) + avara.height - 1, avara.worldCol + avara.width - 1 + avara.cdel, MAPWIDTH)]) {
        avara.worldCol += avara.cdel;

        avaraOrient = 0 << 12;
        avara.aniState = AVARAWALK;
    }

    if (collision(avara.worldRow - 8, avara.worldCol - 48, avara.height, avara.width + 48, SD(vang.worldRow), vang.worldCol - 16, vang.height, vang.width + 16)) {
        for (int i = 0; i < BULLETCOUNT; i++) {
            if (enemyBullets[i].hide) {
                initBullet(&enemyBullets[i], avara.worldRow, avara.worldCol, avaraOrient);
                avara.aniState = AVARASHOOT;
                avara.curFrame = 0;
            }
        }
    }

    if (avara.prevAniState == AVARASHOOT) {
        if (avara.curFrame == 3) {
            avara.aniState = AVARAIDLE;
            avara.prevAniState = AVARAIDLE;
        } else {
            avara.aniState = AVARASHOOT;
        }
    }

    avara.screenRow = avara.worldRow - hackingVOff;
    avara.screenCol = avara.worldCol - hackingHOff;

    avara.aniCounter++;
}

void drawAvara() {
    shadowOAM[1].attr0 = (avara.screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[1].attr1 = (avara.screenCol & COLMASK) | ATTR1_SMALL | avaraOrient;
    shadowOAM[1].attr2 = ATTR2_TILEID(avara.curFrame * 2, avara.aniState * 2) | ATTR2_PALROW(0);
}

void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {

        playerBullets[i].worldRow = 0;
        playerBullets[i].worldCol = 0;
        playerBullets[i].rdel = 0;
        playerBullets[i].cdel = 4;
        playerBullets[i].width = 8;
        playerBullets[i].height = 8;

        playerBullets[i].aniCounter = 0;
        playerBullets[i].curFrame = 0;
        playerBullets[i].numFrames = 0;
        playerBullets[i].aniState = 0;

        playerBullets[i].hide = 1;
    }
}

void initBullet(ANISPRITE* bullet, int row, int col, int orient) {
    bullet -> worldRow = row + 6;
    bullet -> worldCol = col;
    bullet -> cdel = 4;
    if (orient) { // If shooter is facing left
        bullet -> cdel *= -1;
    }

    bullet -> hide = 0;

    playSoundB(Blaster, BLASTERLEN, BLASTERFREQ, 0);
}

void updatePlayerBullet(ANISPRITE* bullet, int id) {

    if (collision(avara.worldRow, avara.worldCol, avara.height, avara.width, bullet->worldRow, bullet->worldCol, bullet->height, bullet->width)) {
        enemyLife--;
        hideBullet(bullet, id);
    }

    if (bullet -> worldCol + bullet -> cdel > 0 &&
        bullet -> worldCol + bullet -> width + bullet -> cdel < MAPWIDTH &&
        hackingcmBitmap[OFFSET(bullet -> worldRow, bullet -> worldCol - bullet -> cdel, MAPWIDTH)] && // top left
        hackingcmBitmap[OFFSET(bullet -> worldRow + bullet -> height -1, bullet -> worldCol - bullet -> cdel, MAPWIDTH)] && // bottom left
        hackingcmBitmap[OFFSET(bullet -> worldRow, bullet -> worldCol + bullet -> width + bullet -> cdel - 1, MAPWIDTH)] && // top right
        hackingcmBitmap[OFFSET(bullet -> worldRow + bullet -> height -1, bullet -> worldCol + bullet -> width + bullet -> cdel - 1, MAPWIDTH)]) { // bottom right
        bullet -> worldCol += bullet -> cdel;
    } else {
        hideBullet(bullet, id);
    }

    bullet -> screenRow = bullet -> worldRow - hackingVOff;
    bullet -> screenCol = bullet -> worldCol - hackingHOff;
}

void updateEnemyBullet(ANISPRITE* bullet, int id) {

    if (collision(SD(vang.worldRow), vang.worldCol, vang.height, vang.width, bullet->worldRow, bullet->worldCol, bullet->height, bullet->width)) {

        vang.worldRow = hCheckRow;
        vang.worldCol = hCheckCol;

        hackingHOff = hCheckHOff;
        hackingVOff = hCheckVOff;

        hideBullet(bullet, id);
    }

    if (bullet -> worldCol + bullet -> cdel > 0 &&
        bullet -> worldCol + bullet -> width + bullet -> cdel < MAPWIDTH &&
        hackingcmBitmap[OFFSET(bullet -> worldRow, bullet -> worldCol - bullet -> cdel, MAPWIDTH)] && // top left
        hackingcmBitmap[OFFSET(bullet -> worldRow + bullet -> height -1, bullet -> worldCol - bullet -> cdel, MAPWIDTH)] && // bottom left
        hackingcmBitmap[OFFSET(bullet -> worldRow, bullet -> worldCol + bullet -> width + bullet -> cdel - 1, MAPWIDTH)] && // top right
        hackingcmBitmap[OFFSET(bullet -> worldRow + bullet -> height -1, bullet -> worldCol + bullet -> width + bullet -> cdel - 1, MAPWIDTH)]) { // bottom right
        bullet -> worldCol += bullet -> cdel;
    } else {
        hideBullet(bullet, id);
    }

    bullet -> screenRow = bullet -> worldRow - hackingVOff;
    bullet -> screenCol = bullet -> worldCol - hackingHOff;
}

void hideBullet(ANISPRITE* bullet, int id) {
    shadowOAM[id].attr0 |= ATTR0_HIDE;
    bullet -> hide = 1;
}

void drawBullet(ANISPRITE* bullet, int id) {
    shadowOAM[id].attr0 = (bullet -> screenRow & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[id].attr1 = (bullet -> screenCol & COLMASK) | ATTR1_TINY;
    shadowOAM[id].attr2 = ATTR2_TILEID(12, 0) | ATTR2_PALROW(4);
}