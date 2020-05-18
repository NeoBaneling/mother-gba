// Constants
#define MAPWIDTH 512
#define MAPHEIGHT 256
#define GRAVITY 200
#define BULLETCOUNT 8
#define CM_RED 0x001F // The color that marks lava on the collision map
#define CM_CYAN 0x7FE0 // checkpoints
#define ENEMYLIFE 8

// Vairables
int invincible; // The CHEAT (toggled with L)

int vangOrient; // If Vang is moving left, 1; else, 0
int isJumping;
int vangHOff; // Height offset to match Vang's head
int vangFOff; // Offset for Vang's left foot and head
int vangFWidth; // Width of Vang's feet and head
int vangSOff; // Offset for Vang's left shoulder
int vangSWidth; // Width of Vang's torso (or shouler to shouler)

int avaraOrient;
int enemyLife;
int hackingHOff;
int hackingVOff;

int hCheckRow; // Checkpoint location
int hCheckCol;
int hCheckHOff;
int hCheckVOff;

// States used for vang.aniState
enum {VANGIDLE = 8, VANGWALK, VANGJUMP, VANGSHOOT};

// States used for avara.aniState
enum {AVARAIDLE, AVARAWALK, AVARAHIT, AVARASHOOT};

// Bullet pool
extern ANISPRITE playerBullets[BULLETCOUNT];
extern ANISPRITE enemyBullets[BULLETCOUNT];

// Prototypes
void initHacking();
void goToHacking();
void updateHacking();
void drawHacking();

void initVang();
void updateVang();
void animateVang();
void drawVang();

void initAvara();
void updateAvara();
void drawAvara();

void initBullets();
void initBullet(ANISPRITE* bullet, int, int, int);
void updatePlayerBullet(ANISPRITE* bullet, int);
void updateEnemyBullet(ANISPRITE* bullet, int);
void hideBullet(ANISPRITE* bullet, int);
void drawBullet(ANISPRITE* bullet, int);