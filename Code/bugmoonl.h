// Constants
#define MAPWIDTH 256
#define MAPHEIGHT 256
#define LASERCOUNT 16
#define SHIPCOUNT 3
#define ASTEROIDCOUNT 64
#define PLAYERHEALTH 8
#define PADDING 16 // distance between enemies
#define DISTANCE 5000 // distance the player must travel in stage 2

// States used for mussel.aniSprite
enum {MUSSELIDLE, JUSTFIRED, MID, GUNIDLE};

// Laser pool and states
enum {BRED, BWHITE, BGREEN, BBLUE};
extern ANISPRITE lasers[LASERCOUNT];

// Enemy pool
enum {EGREEN, EBLUE, EPURPLE};
extern ANISPRITE ships[SHIPCOUNT];

// Asteroid pool
extern ANISPRITE asteroids[ASTEROIDCOUNT];

// Variables
int shipsRemaining;
int playerHealth;
int bugHOff;
int bugVOff;
int stage;
int bugMoonWon;

// Prototypes
void initBugMoon();
void goToBugMoon();
void updateBugMoon();
void drawBugMoon();

void initStage1();
void initStage2();
void initStage3();
void updateStage1();
void updateStage2();
void updateStage3();

void initMussel();
void updateMussel();
void animateMussel();
void drawMussel();

void initLasers();
void initLaser(ANISPRITE* laser, int, int);
void updateLaser(ANISPRITE* laser, int);
void hideLaser(ANISPRITE* laser, int);
void drawLaser(ANISPRITE* laser, int);

void initShips();
void updateShips();
void hideShip(ANISPRITE* ship, int);
void drawShip(ANISPRITE* ship, int);

void initAsteroids();
void initAsteroid(ANISPRITE* asteroid);
void updateAsteroid(ANISPRITE* asteroid, int);
void animateAsteroid(ANISPRITE* asteroid);
void hideAsteroid(ANISPRITE* asteroid, int);
void drawAsteroid(ANISPRITE* asteroid, int);