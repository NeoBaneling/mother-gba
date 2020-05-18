# 1 "portelythl.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "portelythl.c"
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
# 2 "portelythl.c" 2
# 1 "portelythl.h" 1
# 10 "portelythl.h"
typedef struct ARCADE {
    int row;
    int col;
    int height;
    int width;
    int active;
} ARCADE;


int gameStage;
int gamesCompleted;
int portelythWon;
int curArcade;

int orient;
int isClimbing;
int isJumping;
int meufordFOff;
int meufordFWidth;
int meufordSOff;
int meufordSWidth;

int portelythHOff;
int portelythVOff;
int portelythfarHOff;
int portelythfarVOff;

int pCheckRow;
int pCheckCol;
int pChecKHOff;
int pCheckVOff;


enum {MEUFORDIDLE = 12, MEUFORDWALK, MEUFORDJUMP, MEUFORDCLIMB};


enum {LPORTELYTH, LSPACEINVADERS, LSHRUDEN};


extern ARCADE arcades[5];


extern ANISPRITE lights[5];


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
# 3 "portelythl.c" 2
# 1 "spaceInvaders.h" 1

typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int drow;
    int projectileFired;
} PLAYER;


typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int drow;
    int dtile;
    int projectileFired;
    int id;
    int active;
} ENEMY;


typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int id;
    int active;
    int orientation;
} PROJECTILE;


typedef struct {
    int row;
    int col;
    int tileRow;
    int tileCol;
    int id;
    int active;
} LIFE;
# 54 "spaceInvaders.h"
extern PLAYER player;
extern ENEMY enemies[60];
extern PROJECTILE projectiles[8];
extern LIFE lifeIcons[3 - 1];
int playerProjectiles;
int enemiesRemaining;
int enemyMvt;
int lives;

int spHOff;
int spVOff;


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
# 4 "portelythl.c" 2
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
# 5 "portelythl.c" 2
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 16 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 216 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4

# 216 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 149 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 1 3 4
# 9 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 3 4
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 2 3 4
# 6 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 357 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;



typedef unsigned long __clock_t;


typedef long __time_t;


typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 571 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
  void *deviceData;
};
# 769 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 46 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 133 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;
# 154 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 186 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 197 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 219 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 258 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 279 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);






char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 316 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 333 "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 6 "portelythl.c" 2


# 1 "portelythbg.h" 1
# 22 "portelythbg.h"

# 22 "portelythbg.h"
extern const unsigned short portelythbgTiles[656];


extern const unsigned short portelythbgMap[4096];


extern const unsigned short portelythbgPal[256];
# 9 "portelythl.c" 2
# 1 "portelythFar.h" 1
# 22 "portelythFar.h"
extern const unsigned short portelythFarTiles[14176];


extern const unsigned short portelythFarMap[1024];


extern const unsigned short portelythFarPal[256];
# 10 "portelythl.c" 2
# 1 "portelythcm.h" 1
# 20 "portelythcm.h"
extern const unsigned short portelythcmBitmap[262144];
# 11 "portelythl.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 12 "portelythl.c" 2


# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 15 "portelythl.c" 2
# 1 "Scare.h" 1
# 20 "Scare.h"
extern const unsigned char Scare[491904];
# 16 "portelythl.c" 2
# 1 "MeufordReset.h" 1
# 20 "MeufordReset.h"
extern const unsigned char MeufordReset[18698];
# 17 "portelythl.c" 2
# 1 "CollisionBody.h" 1
# 20 "CollisionBody.h"
extern const unsigned char CollisionBody[10231];
# 18 "portelythl.c" 2




ANISPRITE meuford;


ANISPRITE lights[5];

ARCADE arcades[5];


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
    pCheckCol = 512/2;

    initMeuford();
    initLights();
    initSpaceInvaders();
    initShruden();
    initArcades();

    portelythHOff = 512/2 - 240/2;
    portelythVOff = 0;
    portelythfarHOff = (256/2-240/2) << 3;
    portelythfarVOff = (256/2-160/2) << 2;

    pCheckHOff = 512/2 - 240/2;
    pCheckVOff = 512/2 - 160/2;

    gameStage = LPORTELYTH;
    gamesCompleted = 0;
    portelythWon = 0;
}

void goToPortelythLevel() {

    hideSprites();

    DMANow(3, portelythbgPal, ((unsigned short *)0x5000000), 256);

    switch (gameStage) {
        case LPORTELYTH:
            DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
            DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
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

    (*(volatile unsigned short*)0x4000008) = (3<<14) | ((0)<<2) | ((28)<<8);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((1)<<2) | ((27)<<8);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

    DMANow(3, portelythbgTiles, &((charblock *)0x6000000)[0], 1312/2);
    DMANow(3, portelythbgMap, &((screenblock *)0x6000000)[28], 4096);
    DMANow(3, portelythFarTiles, &((charblock *)0x6000000)[1], 28352/2);
    DMANow(3, portelythFarMap, &((screenblock *)0x6000000)[27], 1024);

    playSoundA(Scare, 491904, 11025, 1);
}

void updatePortelyth() {

    switch (gameStage) {
        case LPORTELYTH:
            updateMeuford();
            for (int i = 0; i < 5; i++) {
                if (!lights[i].hide) {
                    updateLight(&lights[i]);
                }
            }


            if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
                for (int i = 0; i < 5 -1; i++) {
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
            for (int i = 0; i < 5; i++) {
                if (!lights[i].hide) {
                    drawLight(&lights[i], i + 1);
                }
            }
            (*(volatile unsigned short *)0x04000010) = portelythHOff;
            (*(volatile unsigned short *)0x04000012) = portelythVOff;
            (*(volatile unsigned short *)0x04000014) = portelythfarHOff >> 3;
            (*(volatile unsigned short *)0x04000016) = portelythfarVOff >> 2;
            break;
        case LSPACEINVADERS:
            drawSpaceInvaders();
            break;
        case LSHRUDEN:
            drawShruden();
            break;
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
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

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {

        if (gamesCompleted == 5 &&
            (portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol))] == 0x03E0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol))] == 0x03E0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meuford.width - 1))] == 0x03E0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meuford.width - 1))] == 0x03E0)) {

            portelythWon = 1;

        } else if (portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol))] == 0x7FE0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol))] == 0x7FE0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meuford.width - 1))] == 0x7FE0 ||
            portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meuford.width - 1))] == 0x7FE0) {

            for (int i = 0; i < 5; i++) {
                if (arcades[i].active && collision(arcades[i].row, arcades[i].col, arcades[i].height, arcades[i].width,
                    ((meuford.worldRow) >> 8), meuford.worldCol, meuford.height, meuford.width)) {

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
                if (!(portelythcmBitmap[((((meuford.worldRow + i) >> 8) - meuford.height)*(512)+(meuford.worldCol))]) ||
                    !(portelythcmBitmap[((((meuford.worldRow + i) >> 8) - meuford.height)*(512)+(meuford.worldCol + meuford.width - 1))])) {

                    meuford.rdel = 0;
                    meuford.worldRow += i - ((meuford.height) << 8);
                    break;
                }
            }
            isJumping = 1;
        }
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<1))) &&
        (!portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meufordSOff - meuford.cdel))] ||
        !portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff - meuford.cdel))]||
        !portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meufordSOff + meufordSWidth - 1 + meuford.cdel))]||
        !portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff + meufordSWidth - 1 + meuford.cdel))])) {

        meuford.cdel = 1;
        meuford.rdel = ((1) << 8);
        isClimbing = 1;
        isJumping = 0;

        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) &&
            portelythcmBitmap[((((meuford.worldRow - meuford.rdel) >> 8) - 1)*(512)+(meuford.worldCol + meufordSOff))] &&
            portelythcmBitmap[((((meuford.worldRow - meuford.rdel) >> 8) - 1)*(512)+(meuford.worldCol + meufordSOff + meufordSWidth - 1))]) {
            meuford.worldRow -= meuford.rdel;
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) &&
            portelythcmBitmap[((((meuford.worldRow + meuford.rdel) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff))] &&
            portelythcmBitmap[((((meuford.worldRow + meuford.rdel) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff + meufordSWidth - 1))]) {
            meuford.worldRow += meuford.rdel;
        }

    } else {

        isClimbing = 0;


        meuford.rdel += 160;

        for (int i = 0; i < meuford.rdel; i++) {
            if (!portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordFOff))] ||
                !portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordFOff + meufordFWidth - 1))]) {

                isJumping = 0;
                meuford.rdel = 0;
                meuford.cdel = 1;
                break;
            }


            if (portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8))*(512)+(meuford.worldCol + meufordFOff))] == 0x001F ||
                portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordFOff))] == 0x001F ||
                portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8))*(512)+(meuford.worldCol + meufordFOff + meufordFWidth - 1))] == 0x001F ||
                portelythcmBitmap[((((meuford.worldRow + meuford.rdel - i) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordFOff + meufordFWidth - 1))] == 0x001F) {

                meuford.worldRow = pCheckRow;
                meuford.worldCol = pCheckCol;

                portelythHOff = pCheckHOff;
                portelythVOff = pCheckVOff;

                meuford.rdel = 0;
                meuford.cdel = 1;

                playSoundB(MeufordReset, 18698, 11025, 0);
                break;
            }
        }

        meuford.worldRow += meuford.rdel;


        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            if (meuford.worldCol - meuford.cdel > 0 &&
                portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meufordSOff - meuford.cdel))] &&
                portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff - meuford.cdel))]) {

                meuford.worldCol -= meuford.cdel;
            }
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
            if (meuford.worldCol + meuford.cdel < 512 - meuford.width &&
                portelythcmBitmap[((((meuford.worldRow) >> 8))*(512)+(meuford.worldCol + meufordSOff + meufordSWidth))] &&
                portelythcmBitmap[((((meuford.worldRow) >> 8) + meuford.height - 1)*(512)+(meuford.worldCol + meufordSOff + meufordSWidth))]) {

                meuford.worldCol += meuford.cdel;
            }
        }
    }

    meuford.screenRow = ((meuford.worldRow) >> 8) - portelythVOff;
    meuford.screenCol = meuford.worldCol - portelythHOff;

    if (portelythVOff > 0 && meuford.screenRow + meuford.height/2 <= 160/2) {
        portelythVOff--;
    }
    if (portelythVOff < 512 - 160 && meuford.screenRow + meuford.height/2 >= 160/2) {
        portelythVOff += ((meuford.rdel) >> 8);
        while (portelythVOff > 512 - 160) {
            portelythVOff--;
        }
    }
    if (portelythHOff > 0 && meuford.screenCol + meuford.width/2 <= 240/2) {
        portelythHOff--;
        portelythfarHOff--;
    }
    if (portelythHOff < 512 - 240 && meuford.screenCol + meuford.width/2 >= 240/2) {
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


    if (!(meuford.aniCounter % 12)) {
        meuford.curFrame = (meuford.curFrame + 1) % meuford.numFrames;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        meuford.aniState = MEUFORDWALK;
        orient = 0 << 12;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
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
    shadowOAM[0].attr0 = (meuford.screenRow & 0xFF) | (0<<14);
    shadowOAM[0].attr1 = (meuford.screenCol & 0x1FF) | (1<<14) | orient;
    shadowOAM[0].attr2 = ((meuford.curFrame * 2)*32+(meuford.aniState * 2)) | ((3)<<12);
}

void initLights() {

    for (int i = 0; i < 5; i++) {

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

    int hidden = (0<<8);

    if (light->screenRow < light->height*-1 || light->screenRow > 160 ||
        light->screenCol < light->width*-1 || light->screenCol > 240) {
        hidden = (2<<8);
    }
    shadowOAM[id].attr0 = (light -> screenRow & 0xFF) | hidden | (0<<14);
    shadowOAM[id].attr1 = (light -> screenCol & 0x1FF) | (0<<14);
    shadowOAM[id].attr2 = ((12)*32+(light -> aniState)) | ((4)<<12);
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

    for (int i = 0; i < 5; i++) {
        arcades[i].height = 15;
        arcades[i].width = 10;
        arcades[i].active = 1;
    }
}
