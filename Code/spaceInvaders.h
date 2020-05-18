// Player Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int drow; // Affects the display of player actions
    int projectileFired; // Tick timer for animation
} PLAYER;

// Enemy Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol; // The start of the enemy tiles (should be a multiple of 4)
    int drow;
    int dtile; // Affects the enemy tile position
    int projectileFired;
    int id; // The index in the OAM and shadowOAM for a given enemy
    int active;
} ENEMY;

// Projectile Struct
typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int id;
    int active;
    int orientation; // 1 indicates player projectile, -1 indicates enemy projectile
} PROJECTILE;

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
#define PROJECTILECOUNT 8
#define PLAYERPROJECTILES 3 // 3 of the 8 projectiles are saved for the player
#define BORDER 16
#define LIVES 3

// Variables
extern PLAYER player;
extern ENEMY enemies[ENEMYCOUNT];
extern PROJECTILE projectiles[PROJECTILECOUNT];
extern LIFE lifeIcons[LIVES - 1]; // Solely for drawing purposes
int playerProjectiles; // Projectiles currently fired by the player
int enemiesRemaining;
int enemyMvt;
int lives;

int spHOff;
int spVOff;

// Prototypes
void initSpaceInvaders();
void goToSpaceInvaders();
void updateSpaceInvaders();
void drawSpaceInvaders();

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

void initProjectiles();
void initProjectile(PROJECTILE *, int, int, int);
void updateProjectile(PROJECTILE *);
void hideProjectile(PROJECTILE *);
void drawProjectile(PROJECTILE *);

void initLives();
void hideLife(LIFE *);
void drawLife(LIFE *);

void checkPlayerEnemyCollision();
void checkProjectilePlayerCollision();
void checkProjectileEnemyCollision();