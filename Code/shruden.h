// Blip Struct
typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} BLIP;

// Blop Struct
typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} BLOP;

// Boop Struct
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

// Coin Struct
typedef struct {
    int row;
    int col;
    unsigned short color;
    int active;
} COIN;

// Constants
#define COINCOUNT 8
#define BG_COLOR WHITE

// Variables
extern BLIP blip;
extern BLOP blop;
extern BOOP boop;
extern COIN coins[COINCOUNT];
extern int coinsRemaining;

// Prototypes
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