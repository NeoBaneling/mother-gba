# 1 "bugmoonl.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "bugmoonl.c"
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
# 2 "bugmoonl.c" 2
# 1 "bugmoonl.h" 1
# 12 "bugmoonl.h"
enum {MUSSELIDLE, JUSTFIRED, MID, GUNIDLE};


enum {BRED, BWHITE, BGREEN, BBLUE};
extern ANISPRITE lasers[16];


enum {EGREEN, EBLUE, EPURPLE};
extern ANISPRITE ships[3];


extern ANISPRITE asteroids[64];


int shipsRemaining;
int playerHealth;
int bugHOff;
int bugVOff;
int stage;
int bugMoonWon;


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
# 3 "bugmoonl.c" 2
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

# 4 "bugmoonl.c" 2


# 1 "bugMoonStarsFar.h" 1
# 22 "bugMoonStarsFar.h"

# 22 "bugMoonStarsFar.h"
extern const unsigned short bugMoonStarsFarTiles[384];


extern const unsigned short bugMoonStarsFarMap[1024];


extern const unsigned short bugMoonStarsFarPal[256];
# 7 "bugmoonl.c" 2
# 1 "bugMoonStarsNear.h" 1
# 22 "bugMoonStarsNear.h"
extern const unsigned short bugMoonStarsNearTiles[32];


extern const unsigned short bugMoonStarsNearMap[1024];


extern const unsigned short bugMoonStarsNearPal[256];
# 8 "bugmoonl.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 9 "bugmoonl.c" 2


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
# 12 "bugmoonl.c" 2
# 1 "VangIsSomewhatIntenseAtTimes.h" 1
# 20 "VangIsSomewhatIntenseAtTimes.h"
extern const unsigned char VangIsSomewhatIntenseAtTimes[654624];
# 13 "bugmoonl.c" 2
# 1 "MusselReset.h" 1
# 20 "MusselReset.h"
extern const unsigned char MusselReset[23755];
# 14 "bugmoonl.c" 2
# 1 "CollisionBody.h" 1
# 20 "CollisionBody.h"
extern const unsigned char CollisionBody[10231];
# 15 "bugmoonl.c" 2
# 1 "Blaster.h" 1
# 20 "Blaster.h"
extern const unsigned char Blaster[13406];
# 16 "bugmoonl.c" 2


ANISPRITE mussel;


ANISPRITE lasers[16];
ANISPRITE ships[3];
ANISPRITE asteroids[64];

int shipsRemaining;
int playerHealth;
int bugHOff;
int bugVOff;
int stage;
int bugMoonWon;

void initBugMoon() {

    initMussel();
    initLasers();
    initShips();
    initAsteroids();

    bugHOff = 0;
    bugVOff = 0;

    stage = 1;
    bugMoonWon = 0;
}

void goToBugMoon() {


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((1)<<2) | ((30)<<8);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((31)<<8);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

    DMANow(3, bugMoonStarsFarPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, bugMoonStarsNearTiles, &((charblock *)0x6000000)[1], 64/2);
    DMANow(3, bugMoonStarsNearMap, &((screenblock *)0x6000000)[30], 1024);
    DMANow(3, bugMoonStarsFarTiles, &((charblock *)0x6000000)[0], 768/2);
    DMANow(3, bugMoonStarsFarMap, &((screenblock *)0x6000000)[31], 1024);

    playSoundA(VangIsSomewhatIntenseAtTimes, 654624, 11025, 1);
}

void updateBugMoon() {

    updateMussel();

    switch(stage) {
        case 1:
            updateShips();
            if (!shipsRemaining) {
                stage = 2;
            }
            break;
        case 2:
            for (int i = 0; i < 64; i++) {
                if (!asteroids[i].hide) {
                    updateAsteroid(&asteroids[i], i + 16 + 3 + 1);
                }
                if (asteroids[i].hide && !(rand() % (6492 - mussel.worldCol))) {
                    initAsteroid(&asteroids[i]);
                }
            }
            mussel.worldCol++;
            if (mussel.worldCol == 5000) {
                stage = 3;
                initLasers();
                initShips();
            }
            break;
        case 3:
            for (int i = 0; i < 64; i++) {
                if (!asteroids[i].hide) {
                    updateAsteroid(&asteroids[i], i + 16 + 3 + 1);
                }
                if (asteroids[i].hide && !(rand() % (6492 - mussel.worldCol))) {
                    initAsteroid(&asteroids[i]);
                }
            }
            updateShips();
            if (!shipsRemaining) {
                bugMoonWon = 1;
            }
            break;
    }
    for (int i = 0; i < 16; i++) {
        if (!lasers[i].hide) {
            updateLaser(&lasers[i], i + 1);
        }
    }

    if (!playerHealth) {

        for (int i = 0; i < 64; i++) {
            hideAsteroid(&asteroids[i], i + 16 + 3 + 1);
        }

        initMussel();
        initLasers();
        initShips();
        initAsteroids();

        bugHOff = 0;
        bugVOff = 0;

        playSoundB(MusselReset, 23755, 11025, 0);
    }


    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        mussel.worldCol = 5000 - 5;
    }

    bugHOff++;
}

void drawBugMoon() {

    drawMussel();
    for (int i = 0; i < 16; i++) {
        if (!lasers[i].hide) {
            drawLaser(&lasers[i], i + 1);
        }
    }
    for (int i = 0; i < 3; i++) {
        if (!ships[i].hide) {
            drawShip(&ships[i], i + 16 + 1);
        }
    }
    for (int i = 0; i < 64; i++) {
        if (!asteroids[i].hide) {
            drawAsteroid(&asteroids[i], i + 16 + 3 + 1);
        }
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = bugHOff >> 2;
    (*(volatile unsigned short *)0x04000012) = bugVOff >> 1;
    (*(volatile unsigned short *)0x04000014) = bugHOff >> 3;
    (*(volatile unsigned short *)0x04000016) = bugVOff >> 3;
}

void initMussel() {

    mussel.worldRow = 0;
    mussel.worldCol = 0;
    mussel.rdel = 1;
    mussel.cdel = 1;
    mussel.width = 64;
    mussel.height = 32;

    mussel.aniCounter = 0;
    mussel.curFrame = 0;
    mussel.numFrames = 0;
    mussel.aniState = MUSSELIDLE;

    mussel.screenRow = 160/2-mussel.height/2;
    mussel.screenCol = 240/2-mussel.width/2;

    playerHealth = 8;
}

void updateMussel() {

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        bugVOff--;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        bugVOff++;
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        for (int i = 0; i < 16; i++) {
            if (lasers[i].hide) {
                initLaser(&lasers[i], mussel.screenRow + 16, mussel.screenCol + 8);
            }
        }
    }

    animateMussel();
}

void animateMussel() {

    if (mussel.aniState != MUSSELIDLE && !(mussel.aniCounter % 12)) {
        mussel.aniState--;
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        mussel.aniState = GUNIDLE;
        mussel.aniCounter = 0;
    }

    mussel.aniCounter++;
}

void drawMussel() {
    shadowOAM[0].attr0 = (mussel.screenRow & 0xFF) | (0<<13) | (1<<14);
    shadowOAM[0].attr1 = (mussel.screenCol & 0x1FF) | (3<<14);
    shadowOAM[0].attr2 = ((mussel.curFrame + 8)*32+(mussel.aniState * 8)) | ((1)<<12);
}

void initLasers() {

    for (int i = 0; i < 16; i++) {

        lasers[i].worldRow = 0;
        lasers[i].worldCol = 0;
        lasers[i].rdel = 0;
        lasers[i].cdel = -4;
        lasers[i].width = 8;
        lasers[i].height = 8;

        lasers[i].aniCounter = 0;
        lasers[i].curFrame = 0;
        lasers[i].numFrames = 0;
        lasers[i].aniState = BRED;

        lasers[i].hide = 1;
    }
}

void initLaser(ANISPRITE* laser, int row, int col) {
    laser -> screenRow = row;
    laser -> screenCol = col;
    laser -> cdel = -4;

    if (col < 240/4) {
        laser -> cdel *= -1;
        laser -> aniState = (rand() % 3) + 1;
    } else {
        laser -> aniState = BRED;
    }

    laser -> hide = 0;

    playSoundB(Blaster, 13406, 11025, 0);
}

void updateLaser(ANISPRITE* laser, int id) {

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        laser -> screenRow++;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        laser -> screenRow--;
    }

    if (laser -> screenCol + laser -> width + laser -> cdel > 0 &&
        laser -> screenCol + laser -> cdel < 240) {
        laser -> screenCol += laser -> cdel;
    } else {
        hideLaser(laser, id);
    }

    for (int i = 0; i < 3; i++) {
        if (laser -> cdel < 0 && !ships[i].hide && collision(laser -> screenRow, laser -> screenCol, laser -> height, laser -> width,
            ships[i].screenRow, ships[i].screenCol, ships[i].height, ships[i].width)) {
            hideLaser(laser, id);
            hideShip(&ships[i], i + 16 + 1);
            shipsRemaining--;
        }
    }

    if (laser -> cdel > 0 && collision(laser -> screenRow, laser -> screenCol, laser -> height, laser -> width,
        mussel.screenRow, mussel.screenCol, mussel.height, mussel.width)) {
        hideLaser(laser, id);
        playerHealth--;
    }
}

void hideLaser(ANISPRITE* laser, int id) {
    shadowOAM[id].attr0 |= (2<<8);
    laser -> hide = 1;
}

void drawLaser(ANISPRITE* laser, int id) {
    shadowOAM[id].attr0 = (laser -> screenRow & 0xFF) | (0<<14);
    shadowOAM[id].attr1 = (laser -> screenCol & 0x1FF) | (0<<14);
    shadowOAM[id].attr2 = ((laser -> curFrame + 12)*32+(laser -> aniState + 2)) | ((4)<<12);
}

void initShips() {
    for (int i = 0; i < 3; i++) {

        ships[i].screenRow = (i * 42) + 20;
        ships[i].screenCol = -36;
        ships[i].rdel = 1;
        ships[i].cdel = 1;
        ships[i].width = 16;
        ships[i].height = 32;

        ships[i].curFrame = 0;
        ships[i].aniState = EGREEN + i;

        ships[i].hide = 0;

        shipsRemaining = 3;
    }
}

void updateShips() {

    for (int i = 0; i < 3; i++) {
        if (ships[i].screenCol < 0) {
            ships[i].screenCol += ships[i].cdel;
        }
        if (!ships[i].hide && !(rand() % (128*(shipsRemaining + 1)))) {
            for (int j = 0; j < 16 - 3; j++) {
                if (lasers[j].hide) {
                    initLaser(&lasers[j], ships[i].screenRow + ships[i].height/2, ships[i].screenCol);
                    break;
                }
            }
        }
    }

    if (!(ships[0].hide) && !(collision(ships[0].screenRow, ships[0].screenCol, ships[0].height, ships[0].width,
        ships[1].screenRow, ships[1].screenCol, ships[1].height, ships[1].width))) {


        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
            ships[1].screenRow -= ships[1].rdel << 1;
        }
        if (ships[1].screenRow + ships[1].height/2 > mussel.screenRow + mussel.height/2) {
            ships[1].screenRow -= ships[1].rdel;
        }


        if (ships[0].screenRow + ships[0].height + 16 > ships[1].screenRow && ships[0].screenRow > 0) {
            ships[0].screenRow -= ships[0].rdel;
        }
        if (ships[0].screenRow + ships[0].height + 16 < ships[1].screenRow) {
            ships[0].screenRow += ships[0].rdel;
        }
    }

    if (!(ships[2].hide) && !(collision(ships[2].screenRow, ships[2].screenCol, ships[2].height, ships[2].width,
        ships[1].screenRow, ships[1].screenCol, ships[1].height, ships[1].width))) {


        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
            ships[1].screenRow += ships[1].rdel << 1;
        }
        if (ships[1].screenRow + ships[1].height/2 < mussel.screenRow + mussel.height/2) {
            ships[1].screenRow += ships[1].rdel;
        }


        if (ships[2].screenRow - 16 < ships[1].screenRow + ships[1].height && ships[2].screenRow + ships[2].height < 160) {
            ships[2].screenRow += ships[2].rdel;
        }
        if (ships[2].screenRow - 16 > ships[1].screenRow + ships[1].height) {
            ships[2].screenRow -= ships[2].rdel;
        }
    }

    if (ships[1].hide) {

        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
            ships[0].screenRow += ships[0].rdel;
            if (ships[2].screenRow + ships[2].height < 160) {
                ships[2].screenRow += ships[2].rdel;
            }
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
            if (ships[0].screenRow > 0) {
                ships[0].screenRow -= ships[0].rdel;
            }
            ships[2].screenRow -= ships[2].rdel;
        }

        if (ships[0].hide) {
            if (ships[2].screenRow + ships[2].height/2 > mussel.screenRow + mussel.height/2) {
                ships[2].screenRow -= ships[2].rdel;
            }
            if (ships[2].screenRow + ships[2].height/2 < mussel.screenRow + mussel.height/2) {
                ships[2].screenRow += ships[2].rdel;
            }
        }
        if (ships[2].hide){
            if (ships[0].screenRow + ships[0].height/2 < mussel.screenRow + mussel.height/2) {
                ships[0].screenRow += ships[0].rdel;
            }
            if (ships[0].screenRow + ships[2].height/2 > mussel.screenRow + mussel.height/2) {
                ships[0].screenRow -= ships[0].rdel;
            }
        }
        if (!collision(ships[0].screenRow, ships[0].screenCol, ships[0].height, ships[0].width,
        ships[2].screenRow - 16*2, ships[2].screenCol, ships[2].height, ships[2].width)) {

            ships[0].screenRow += ships[0].rdel;
            ships[2].screenRow -= ships[2].rdel;
        }
    }
}

void hideShip(ANISPRITE* ship, int id) {
    ship -> hide = 1;
    shadowOAM[id].attr0 |= (2<<8);
}

void drawShip(ANISPRITE* ship, int id) {
    shadowOAM[id].attr0 = (ship -> screenRow & 0xFF) | (2<<14);
    shadowOAM[id].attr1 = (ship -> screenCol & 0x1FF) | (2<<14);
    shadowOAM[id].attr2 = ((ship -> curFrame + 12)*32+(ship -> aniState * 2 + 6)) | ((5)<<12);
}

void initAsteroids() {
    for (int i = 0; i < 64; i++) {

        asteroids[i].screenRow = (rand() % (160 - 20)) + 10;
        asteroids[i].screenCol = 240 << 2;
        asteroids[i].rdel = 1;
        asteroids[i].cdel = -2 * ((rand() % 3) + 1);
        asteroids[i].width = 16;
        asteroids[i].height = 16;

        asteroids[i].aniCounter = 0;
        asteroids[i].curFrame = 0;
        asteroids[i].numFrames = 4;

        asteroids[i].hide = 1;
    }
}

void initAsteroid(ANISPRITE* asteroid) {
    asteroid -> screenCol = 240 << 2;
    asteroid -> aniState = (rand() % 3) * 2;
    asteroid -> hide = 0;
}

void updateAsteroid(ANISPRITE* asteroid, int id) {
    asteroid -> screenCol += asteroid -> cdel;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        asteroid -> screenRow += asteroid -> rdel;

        if (asteroid -> screenRow > 160) {
            asteroid -> screenRow = asteroid -> height * -1;
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        asteroid -> screenRow -= asteroid -> rdel;

        if (asteroid -> screenRow < -8) {
            asteroid -> screenRow = 160;
        }
    }

    if (asteroid -> screenCol + asteroid -> width + asteroid -> cdel < 0) {
        hideAsteroid(asteroid, id);
    } else if (collision(asteroid -> screenRow, (asteroid -> screenCol >> 2), asteroid -> height, asteroid -> width,
        mussel.screenRow, mussel.screenCol, mussel.height, mussel.width)) {

        playerHealth--;
        playSoundB(CollisionBody, 10231, 11025, 0);
        hideAsteroid(asteroid, id);
    } else {
        animateAsteroid(asteroid);
    }
}

void animateAsteroid(ANISPRITE* asteroid) {

    if (!(asteroid -> aniCounter % (36 / asteroid -> cdel))) {
        asteroid -> curFrame = (asteroid -> curFrame + 1) % asteroid -> numFrames;
    }

    asteroid -> aniCounter++;
}

void hideAsteroid(ANISPRITE* asteroid, int id) {
    shadowOAM[id].attr0 |= (2<<8);
    asteroid -> hide = 1;
}

void drawAsteroid(ANISPRITE* asteroid, int id) {
    shadowOAM[id].attr0 = (asteroid -> screenRow & 0xFF) | (0<<14);
    shadowOAM[id].attr1 = ((asteroid -> screenCol >> 2) & 0x1FF) | (1<<14);
    shadowOAM[id].attr2 = (((asteroid -> curFrame)*2 + 13)*32+(asteroid -> aniState)) | ((5)<<12);
}
