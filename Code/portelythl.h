// Constants
#define MAPWIDTH 512
#define MAPHEIGHT 512
#define LIGHTCOUNT 5
#define CM_RED 0x001F // The color of spikes in the collision map
#define CM_GREEN 0x03E0 // The color of the exit in the map
#define CM_CYAN 0x7FE0 // Arcade machines in the map

// Arcade machine struct
typedef struct ARCADE {
    int row;
    int col;
    int height;
    int width;
    int active; // 1 indicates it hasn't been played
} ARCADE;

// Variables
int gameStage;
int gamesCompleted;
int portelythWon;
int curArcade;

int orient; // 1 for moving left, 0 else
int isClimbing;
int isJumping;
int meufordFOff; // Offset for meuford's left foot and head
int meufordFWidth; // Width of meuford's feet and head
int meufordSOff; // Offset for meuford's left shoulder
int meufordSWidth; // Width of meuford's torso (or shouler to shouler)

int portelythHOff;
int portelythVOff;
int portelythfarHOff;
int portelythfarVOff;

int pCheckRow;
int pCheckCol;
int pChecKHOff;
int pCheckVOff;

// States used for meuford.aniState
enum {MEUFORDIDLE = 12, MEUFORDWALK, MEUFORDJUMP, MEUFORDCLIMB};

// States used for game and minigames
enum {LPORTELYTH, LSPACEINVADERS, LSHRUDEN};

// Arcade pool
extern ARCADE arcades[LIGHTCOUNT];

// Light pool
extern ANISPRITE lights[LIGHTCOUNT];

// Prototypes
void initPortelyth();
void goToPortelythLevel();
void goToPortelyth();
void updatePortelyth();
void drawPortelyth();

void initMeuford();
void updateMeuford();
void animateMeuford();
void drawMeuford();

void initLights();
void initLight(ANISPRITE* light);
void updateLight(ANISPRITE* light);
void drawLight(ANISPRITE* light, int);

void initArcades();