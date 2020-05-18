# 1 "hackingl.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hackingl.c"
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
# 2 "hackingl.c" 2
# 1 "hackingl.h" 1
# 11 "hackingl.h"
int invincible;

int vangOrient;
int isJumping;
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


enum {VANGIDLE = 8, VANGWALK, VANGJUMP, VANGSHOOT};


enum {AVARAIDLE, AVARAWALK, AVARAHIT, AVARASHOOT};


extern ANISPRITE playerBullets[8];
extern ANISPRITE enemyBullets[8];


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
# 3 "hackingl.c" 2
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

# 4 "hackingl.c" 2


# 1 "hackingbg.h" 1
# 22 "hackingbg.h"

# 22 "hackingbg.h"
extern const unsigned short hackingbgTiles[528];


extern const unsigned short hackingbgMap[2048];


extern const unsigned short hackingbgPal[256];
# 7 "hackingl.c" 2
# 1 "hackingcm.h" 1
# 20 "hackingcm.h"
extern const unsigned short hackingcmBitmap[131072];
# 8 "hackingl.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 9 "hackingl.c" 2


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
# 12 "hackingl.c" 2
# 1 "Scifi.h" 1
# 20 "Scifi.h"
extern const unsigned char Scifi[3140928];
# 13 "hackingl.c" 2
# 1 "VangReset.h" 1
# 20 "VangReset.h"
extern const unsigned char VangReset[11231];
# 14 "hackingl.c" 2
# 1 "CollisionBody.h" 1
# 20 "CollisionBody.h"
extern const unsigned char CollisionBody[10231];
# 15 "hackingl.c" 2
# 1 "Blaster.h" 1
# 20 "Blaster.h"
extern const unsigned char Blaster[13406];
# 16 "hackingl.c" 2


ANISPRITE vang;


ANISPRITE avara;


ANISPRITE playerBullets[8];
ANISPRITE enemyBullets[8];


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

    hCheckRow = ((42) << 8);
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


    (*(volatile unsigned short*)0x4000008) = (1<<14) | ((0)<<2) | ((30)<<8);

    DMANow(3, hackingbgPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, hackingbgTiles, &((charblock *)0x6000000)[0], 2592);
    DMANow(3, hackingbgMap, &((screenblock *)0x6000000)[30], 2048);

    playSoundA(Scifi, 3140928, 11025, 1);
}

void updateHacking() {

    updateVang();
    updateAvara();

    for (int i = 0; i < 8; i++) {
        if (!playerBullets[i].hide) {
            updatePlayerBullet(&playerBullets[i], i + 2);
        }
        if (!enemyBullets[i].hide) {
            updateEnemyBullet(&enemyBullets[i], i + 8 + 2);
        }
    }


    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        invincible = (invincible + 1) & 1;
    }
}

void drawHacking() {

    drawVang();
    drawAvara();

    for (int i = 0; i < 8; i++) {
        if (!playerBullets[i].hide) {
            drawBullet(&playerBullets[i], i + 2);
        }
        if (!enemyBullets[i].hide) {
            drawBullet(&enemyBullets[i], i + 8 + 2);
        }
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hackingHOff;
    (*(volatile unsigned short *)0x04000012) = hackingVOff;
}


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


    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        vang.cdel = 6;
    }

    if (vang.cdel > 1) {
        vang.cdel--;
        vang.rdel = 0;
    }


    vang.rdel += 200;

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !isJumping) {
        vang.rdel -= 1700;
        for (int i = 0; i > vang.rdel; i--) {
            if (!hackingcmBitmap[((((vang.worldRow + i) >> 8) - vang.height + vangHOff)*(512)+(vang.worldCol + vangFOff))] ||
                !hackingcmBitmap[((((vang.worldRow + i) >> 8) - vang.height + vangHOff)*(512)+(vang.worldCol + vangFOff + vangFWidth - 1))]) {

                vang.rdel = 200*-1;
                vang.worldRow += i - ((vang.height) << 8);
                break;
            }
        }
        isJumping = 1;
    }

    for (int i = 0; i < vang.rdel; i++) {
        if (!hackingcmBitmap[((((vang.worldRow + i) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangFOff))] ||
            !hackingcmBitmap[((((vang.worldRow + i) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangFOff + vangFWidth - 1))]) {

            vang.rdel = i-1;
            isJumping = 0;
            break;
        }

        if (hackingcmBitmap[((((vang.worldRow + i) >> 8))*(512)+(vang.worldCol + vangFOff))] == 0x001F ||
            hackingcmBitmap[((((vang.worldRow + i) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangFOff))] == 0x001F ||
            hackingcmBitmap[((((vang.worldRow + i) >> 8))*(512)+(vang.worldCol + vangFOff + vangFWidth - 1))] == 0x001F ||
            hackingcmBitmap[((((vang.worldRow + i) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangFOff + vangFWidth - 1))] == 0x001F) {

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

                playSoundB(VangReset, 11231, 11025, 0);
            }
        }
    }

    vang.worldRow += vang.rdel;


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (vang.worldCol - vang.cdel > 0 &&
            hackingcmBitmap[((((vang.worldRow) >> 8))*(512)+(vang.worldCol + vangSOff - vang.cdel))] &&
            hackingcmBitmap[((((vang.worldRow) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangSOff - vang.cdel))]) {

            vang.worldCol -= vang.cdel;
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (vang.worldCol + vang.cdel < 512 - vang.width &&
            hackingcmBitmap[((((vang.worldRow) >> 8))*(512)+(vang.worldCol + vangSOff + vangSWidth - 1 + vang.cdel))] &&
            hackingcmBitmap[((((vang.worldRow) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vangSOff + vangSWidth - 1 + vang.cdel))]) {

            vang.worldCol += vang.cdel;
        }
    }


    if (hackingcmBitmap[((((vang.worldRow) >> 8))*(512)+(vang.worldCol))] == 0x7FE0 ||
        hackingcmBitmap[((((vang.worldRow) >> 8) + vang.height - 1)*(512)+(vang.worldCol))] == 0x7FE0 ||
        hackingcmBitmap[((((vang.worldRow) >> 8))*(512)+(vang.worldCol + vang.width - 1))] == 0x7FE0 ||
        hackingcmBitmap[((((vang.worldRow) >> 8) + vang.height - 1)*(512)+(vang.worldCol + vang.width - 1))] == 0x7FE0) {

        hCheckRow = vang.worldRow;
        hCheckCol = vang.worldCol;

        hCheckHOff = hackingHOff;
        hCheckVOff = hackingVOff;
    }


    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        for (int i = 0; i < 8; i++) {
            if (playerBullets[i].hide) {
                initBullet(&playerBullets[i], ((vang.worldRow) >> 8), vang.worldCol, vangOrient);
                break;
            }
        }
    }

    vang.screenRow = ((vang.worldRow) >> 8) - hackingVOff;
    vang.screenCol = vang.worldCol - hackingHOff;

    if (hackingVOff > 0 && vang.screenRow + vang.height/2 <= 160/2) {
        hackingVOff--;
    }
    if (hackingVOff < 256 - 160 && vang.screenRow + vang.height/2 >= 160/2) {
        if (vang.rdel > 0) {
            hackingVOff += ((vang.rdel) >> 8);
        }
        while (hackingVOff > 256 - 160) {
            hackingVOff--;
        }
    }
    if (hackingHOff > 0 && vang.screenCol + vang.width/2 <= 240/2) {
        hackingHOff--;
    }
    if (hackingHOff < 512 - 240 && vang.screenCol + vang.width/2 >= 240/2) {
        hackingHOff++;
    }

    animateVang();
}

void animateVang() {

    if (vang.aniState != VANGIDLE) {
        vang.prevAniState = vang.aniState;
    }
    vang.aniState = VANGIDLE;


    if (!(vang.aniCounter % 12)) {
        vang.curFrame = (vang.curFrame + 1) % vang.numFrames;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        vang.aniState = VANGWALK;
        vangOrient = 0 << 12;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        vang.aniState = VANGWALK;
        vangOrient = 1 << 12;
    }


    if (isJumping) {
        vang.aniState = VANGJUMP;
    }


    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
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
    shadowOAM[0].attr0 = (vang.screenRow & 0xFF) | (0<<14);
    shadowOAM[0].attr1 = (vang.screenCol & 0x1FF) | (1<<14) | vangOrient;
    shadowOAM[0].attr2 = ((vang.curFrame * 2)*32+(vang.aniState * 2)) | ((2)<<12);
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
    enemyLife = 8;
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
        hackingcmBitmap[(((avara.worldRow))*(512)+(avara.worldCol - avara.cdel))] &&
        hackingcmBitmap[(((avara.worldRow) + avara.height - 1)*(512)+(avara.worldCol - avara.cdel))]) {
        avara.worldCol -= avara.cdel;

        avaraOrient = 1 << 12;
        avara.aniState = AVARAWALK;
    }
    if (avara.worldCol + avara.width + 20 < vang.worldCol &&
        hackingcmBitmap[(((avara.worldRow))*(512)+(avara.worldCol + avara.width - 1 + avara.cdel))] &&
        hackingcmBitmap[(((avara.worldRow) + avara.height - 1)*(512)+(avara.worldCol + avara.width - 1 + avara.cdel))]) {
        avara.worldCol += avara.cdel;

        avaraOrient = 0 << 12;
        avara.aniState = AVARAWALK;
    }

    if (collision(avara.worldRow - 8, avara.worldCol - 48, avara.height, avara.width + 48, ((vang.worldRow) >> 8), vang.worldCol - 16, vang.height, vang.width + 16)) {
        for (int i = 0; i < 8; i++) {
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
    shadowOAM[1].attr0 = (avara.screenRow & 0xFF) | (0<<14);
    shadowOAM[1].attr1 = (avara.screenCol & 0x1FF) | (1<<14) | avaraOrient;
    shadowOAM[1].attr2 = ((avara.curFrame * 2)*32+(avara.aniState * 2)) | ((0)<<12);
}

void initBullets() {
    for (int i = 0; i < 8; i++) {

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
    if (orient) {
        bullet -> cdel *= -1;
    }

    bullet -> hide = 0;

    playSoundB(Blaster, 13406, 11025, 0);
}

void updatePlayerBullet(ANISPRITE* bullet, int id) {

    if (collision(avara.worldRow, avara.worldCol, avara.height, avara.width, bullet->worldRow, bullet->worldCol, bullet->height, bullet->width)) {
        enemyLife--;
        hideBullet(bullet, id);
    }

    if (bullet -> worldCol + bullet -> cdel > 0 &&
        bullet -> worldCol + bullet -> width + bullet -> cdel < 512 &&
        hackingcmBitmap[((bullet -> worldRow)*(512)+(bullet -> worldCol - bullet -> cdel))] &&
        hackingcmBitmap[((bullet -> worldRow + bullet -> height -1)*(512)+(bullet -> worldCol - bullet -> cdel))] &&
        hackingcmBitmap[((bullet -> worldRow)*(512)+(bullet -> worldCol + bullet -> width + bullet -> cdel - 1))] &&
        hackingcmBitmap[((bullet -> worldRow + bullet -> height -1)*(512)+(bullet -> worldCol + bullet -> width + bullet -> cdel - 1))]) {
        bullet -> worldCol += bullet -> cdel;
    } else {
        hideBullet(bullet, id);
    }

    bullet -> screenRow = bullet -> worldRow - hackingVOff;
    bullet -> screenCol = bullet -> worldCol - hackingHOff;
}

void updateEnemyBullet(ANISPRITE* bullet, int id) {

    if (collision(((vang.worldRow) >> 8), vang.worldCol, vang.height, vang.width, bullet->worldRow, bullet->worldCol, bullet->height, bullet->width)) {

        vang.worldRow = hCheckRow;
        vang.worldCol = hCheckCol;

        hackingHOff = hCheckHOff;
        hackingVOff = hCheckVOff;

        hideBullet(bullet, id);
    }

    if (bullet -> worldCol + bullet -> cdel > 0 &&
        bullet -> worldCol + bullet -> width + bullet -> cdel < 512 &&
        hackingcmBitmap[((bullet -> worldRow)*(512)+(bullet -> worldCol - bullet -> cdel))] &&
        hackingcmBitmap[((bullet -> worldRow + bullet -> height -1)*(512)+(bullet -> worldCol - bullet -> cdel))] &&
        hackingcmBitmap[((bullet -> worldRow)*(512)+(bullet -> worldCol + bullet -> width + bullet -> cdel - 1))] &&
        hackingcmBitmap[((bullet -> worldRow + bullet -> height -1)*(512)+(bullet -> worldCol + bullet -> width + bullet -> cdel - 1))]) {
        bullet -> worldCol += bullet -> cdel;
    } else {
        hideBullet(bullet, id);
    }

    bullet -> screenRow = bullet -> worldRow - hackingVOff;
    bullet -> screenCol = bullet -> worldCol - hackingHOff;
}

void hideBullet(ANISPRITE* bullet, int id) {
    shadowOAM[id].attr0 |= (2<<8);
    bullet -> hide = 1;
}

void drawBullet(ANISPRITE* bullet, int id) {
    shadowOAM[id].attr0 = (bullet -> screenRow & 0xFF) | (0<<14);
    shadowOAM[id].attr1 = (bullet -> screenCol & 0x1FF) | (0<<14);
    shadowOAM[id].attr2 = ((12)*32+(0)) | ((4)<<12);
}
