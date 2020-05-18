// Player Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int drow; // Affects the display of player actions
    int bulletFired; // Tick timer for animation
} PLAYER;

// Enemy Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol; // The start of the enemy tiles (should be a multiple of 4)
    int drow;
    int dtile; // Affects the enemy tile position
    int bulletFired;
    int id; // The index in the OAM and shadowOAM for a given enemy
    int active;
} ENEMY;

// Bullet Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int id;
    int active;
    int orientation; // 1 indicates player bullet, -1 indicates enemy bullet
} BULLET;

// Life struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int id;
    int active;
} LIFE;

// Constants
#define ENEMYCOUNT 60
#define ENEMYROW 12
#define BULLETCOUNT 8
#define PLAYERBULLETS 3 // 3 of the 8 bullets are saved for the player
#define BORDER 16
#define LIVES 3

// Variables
extern PLAYER player;
extern ENEMY enemies[ENEMYCOUNT];
extern BULLET bullets[BULLETCOUNT];
extern LIFE lifeIcons[LIVES - 1]; // Solely for drawing purposes
int playerBullets; // Bullets currently fired by the player
int enemiesRemaining;
int enemyMvt;
int lives;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void playerFire();
void drawPlayer();

void initEnemies();
void updateEnemies();
void updateEnemy(ENEMY *, int);
void enemyFire(ENEMY *enemy);
void hideEnemy(ENEMY *);
void drawEnemy(ENEMY *);

void initBullets();
void initBullet(BULLET *, int, int, int);
void updateBullet(BULLET *);
void hideBullet(BULLET *);
void drawBullet(BULLET *);

void initLives();
void hideLife(LIFE *);
void drawLife(LIFE *);

void checkPlayerEnemyCollision();
void checkBulletPlayerCollision();
void checkBulletEnemyCollision();