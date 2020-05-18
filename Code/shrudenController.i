# 1 "shrudenController.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "shrudenController.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 67 "myLib.h"
extern unsigned short *videoBuffer;
# 89 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 161 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 204 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 215 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 255 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 346 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "shrudenController.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "shrudenController.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 4 "shrudenController.c" 2
# 1 "shruden.h" 1

typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} BLIP;


typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} BLOP;


typedef struct {
    int row;
    int col;
    int vRow;
    int vCol;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} BOOP;


typedef struct {
    int row;
    int col;
    unsigned short color;
    int active;
} COIN;






extern BLIP blip;
extern BLOP blop;
extern BOOP boop;
extern COIN coins[8];
extern int coinsRemaining;


void initShruden();
void goToShruden();
void updateShruden();
void drawInit();
void drawShruden();

void initBlip();
void updateBlip();
void drawBlip();

void initCoins();
void updateCoin(COIN*);
void drawCoin(COIN*);

void initBlop();
void updateBlop();
void drawBlop();

void initBoop();
void updateBoop();
void drawBoop();

void drawWin();
void drawLose();

void checkBlipWallCollision();
void checkBlopWallCollision();
void checkBoopCollision();
void checkBlipCoinCollision();
void checkBlipBlopCollision();
# 5 "shrudenController.c" 2
# 1 "shrudenController.h" 1

void goTosStartState();
void goTosGameState();
void goTosPauseState();
void goTosWinState();
void goTosLoseState();

void sstartState();
void sgameState();
void spauseState();
void swinState();
void sloseState();

void shrudenInitialize();
int shrudenController();
# 6 "shrudenController.c" 2


enum States {SSTART, SGAME, SPAUSE, SWIN, SLOSE};
int sstate;
unsigned short sOldButtons;
unsigned short sButtons;

int shrudenController() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    shrudenInitialize();

    while (1) {


        sOldButtons = sButtons;
        sButtons = (*(volatile unsigned short *)0x04000130);

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


void sstartState() {
    initShruden();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        drawInit();
        goTosGameState();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goTosPauseState();
    }
}


void sgameState() {
    updateShruden();
    waitForVBlank();
    drawShruden();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goTosPauseState();
    }
    if (!coinsRemaining) {
        goTosWinState();
    }
    if (coinsRemaining == -1) {
        goTosLoseState();
    }
}


void spauseState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        waitForVBlank();
        drawInit();
        goTosGameState();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goTosStartState();
    }
}


void swinState() {
    waitForVBlank();
    drawWin();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goTosStartState();
    }
}


void sloseState() {
    waitForVBlank();
    drawLose();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goTosStartState();
    }
}


void goTosStartState() {
    sstate = SSTART;
    waitForVBlank();
    fillScreen(((15) | (4)<<5 | (21)<<10));
    drawRect(54, 90, 16, 62, ((31) | (31)<<5 | (31)<<10));
    drawString(58, 100, "SHRUDEN", ((0) | (31)<<5 | (31)<<10));
    drawString(57, 99, "SHRUDEN", ((15) | (4)<<5 | (21)<<10));
    drawString(130, 66, "Press START to Play", ((31) | (31)<<5 | (31)<<10));
    drawString(142, 36, "Press SELECT for Instructions", ((31) | (31)<<5 | (31)<<10));
}


void goTosGameState() {
    waitForVBlank();
    drawShruden();
    sstate = SGAME;
}


void goTosPauseState() {
    sstate = SPAUSE;
    waitForVBlank();
    fillScreen(((31) | (31)<<5 | (31)<<10));
    drawRect(16, 6, 94, 240 - 12, ((15) | (4)<<5 | (21)<<10));
    drawString(24, 9, "Use UP, DOWN, LEFT, and RIGHT to move", ((31) | (31)<<5 | (31)<<10));
    drawString(60, 60, "Collect COINS to win", ((31) | (31)<<5 | (31)<<10));
    drawString(96, 42, "Don't let ENEMIES touch you", ((31) | (31)<<5 | (31)<<10));
    drawString(130, 54, "Press START to Continue", ((15) | (4)<<5 | (21)<<10));
    drawString(142, 66, "Press SELECT to End", ((15) | (4)<<5 | (21)<<10));
}


void goTosWinState() {
    sstate = SWIN;
    waitForVBlank();
    fillScreen(((0) | (31)<<5 | (0)<<10));
    drawString(110, 88, "Press START", ((31) | (31)<<5 | (31)<<10));
}


void goTosLoseState() {
    sstate = SLOSE;
    waitForVBlank();
    fillScreen(0);
    drawString(110, 88, "Press START", ((31) | (31)<<5 | (31)<<10));
}


void shrudenInitialize() {

    goTosStartState();
}


void drawChar(int row, int col, char ch, unsigned short color) {


    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 * ch + i + 6 * j]) {
                setPixel(row + j, col + i, color);
            }
        }
    }
}


void drawString(int row, int col, char *str, unsigned short color) {


    int count = 0;
    char current = str[count];
    while (current != '\0') {
        drawChar(row, col + (6 * count), current, color);
        current = str[++count];
    }
}
