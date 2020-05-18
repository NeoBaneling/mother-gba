# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 16 "main.c"
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
# 17 "main.c" 2
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

# 18 "main.c" 2


# 1 "sound.h" 1

# 1 "sound.h"
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
# 21 "main.c" 2
# 1 "MotherMainTheme.h" 1
# 20 "MotherMainTheme.h"
extern const unsigned char MotherMainTheme[392544];
# 22 "main.c" 2
# 1 "CloudlandRegion.h" 1
# 20 "CloudlandRegion.h"
extern const unsigned char CloudlandRegion[917856];
# 23 "main.c" 2
# 1 "MenuNav.h" 1
# 20 "MenuNav.h"
extern const unsigned char MenuNav[3646];
# 24 "main.c" 2
# 1 "WinSound.h" 1
# 20 "WinSound.h"
extern const unsigned char WinSound[10937];
# 25 "main.c" 2


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
# 28 "main.c" 2
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
# 29 "main.c" 2
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
# 30 "main.c" 2


# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 33 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[5792];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 34 "main.c" 2
# 1 "bugMoonStarsNear.h" 1
# 22 "bugMoonStarsNear.h"
extern const unsigned short bugMoonStarsNearTiles[32];


extern const unsigned short bugMoonStarsNearMap[1024];


extern const unsigned short bugMoonStarsNearPal[256];
# 35 "main.c" 2
# 1 "bugMoonStarsFar.h" 1
# 22 "bugMoonStarsFar.h"
extern const unsigned short bugMoonStarsFarTiles[384];


extern const unsigned short bugMoonStarsFarMap[1024];


extern const unsigned short bugMoonStarsFarPal[256];
# 36 "main.c" 2
# 1 "menu.h" 1
# 22 "menu.h"
extern const unsigned short menuTiles[1744];


extern const unsigned short menuMap[1024];


extern const unsigned short menuPal[256];
# 37 "main.c" 2
# 1 "eclipse.h" 1
# 22 "eclipse.h"
extern const unsigned short eclipseTiles[10896];


extern const unsigned short eclipseMap[1024];


extern const unsigned short eclipsePal[256];
# 38 "main.c" 2
# 1 "bugMoonPause.h" 1
# 22 "bugMoonPause.h"
extern const unsigned short bugMoonPauseTiles[3952];


extern const unsigned short bugMoonPauseMap[1024];


extern const unsigned short bugMoonPausePal[256];
# 39 "main.c" 2
# 1 "hackingPause.h" 1
# 22 "hackingPause.h"
extern const unsigned short hackingPauseTiles[5408];


extern const unsigned short hackingPauseMap[1024];


extern const unsigned short hackingPausePal[256];
# 40 "main.c" 2
# 1 "portelythPause.h" 1
# 22 "portelythPause.h"
extern const unsigned short portelythPauseTiles[6224];


extern const unsigned short portelythPauseMap[1024];


extern const unsigned short portelythPausePal[256];
# 41 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[1008];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 42 "main.c" 2
# 1 "sonata.h" 1
# 22 "sonata.h"
extern const unsigned short sonataTiles[8016];


extern const unsigned short sonataMap[1024];


extern const unsigned short sonataPal[256];
# 43 "main.c" 2


void initialize();
void start();
void menu();
void game();
void pause();
void win();
void goToStart();
void goToMenu();
void goToGame();
void goToPause();
void goToWin();


ANISPRITE hackingSprite;
ANISPRITE bugSprite;
ANISPRITE portelythSprite;


enum {START, MENU, GAME, PAUSE, WIN};
int state;

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

int hOff;
int vOff;

int titleVOff;
int titleHasPlayed;


enum {HACKING, BUGMOON, PORTELYTH};
int level;
ANISPRITE levelSprites[3];


char buffer[41];

int main() {

 initialize();

 while(1) {


  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);


  switch(state) {
   case START:
    start();
    break;
   case MENU:
    menu();
    break;
   case GAME:
    game();
    break;
   case PAUSE:
    pause();
    break;
   case WIN:
    win();
    break;
  }
 }
}


void initialize() {


 setupSounds();
 setupInterrupts();


 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);

 buttons = (*(volatile unsigned short *)0x04000130);

 goToStart();
}


void goToStart() {

 hideSprites();

 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<10) | (1<<12);

 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((31)<<8);
 (*(volatile unsigned short*)0x400000A) = (0<<14) | ((2)<<2) | ((30)<<8);
 (*(volatile unsigned short*)0x400000C) = (0<<14) | ((3)<<2) | ((29)<<8);

 DMANow(3, startPal, ((unsigned short *)0x5000000), 256);

 DMANow(3, startTiles, &((charblock *)0x6000000)[0], 11584/2);
 DMANow(3, startMap, &((screenblock *)0x6000000)[31], 1024);
 DMANow(3, bugMoonStarsNearTiles, &((charblock *)0x6000000)[2], 64/2);
    DMANow(3, bugMoonStarsNearMap, &((screenblock *)0x6000000)[30], 1024);
    DMANow(3, bugMoonStarsFarTiles, &((charblock *)0x6000000)[3], 768/2);
    DMANow(3, bugMoonStarsFarMap, &((screenblock *)0x6000000)[29], 1024);

 stopSound();

 hOff = 8;
 titleVOff = -360;
 titleHasPlayed = 0;

 (*(volatile unsigned short *)0x04000010) = hOff;
 (*(volatile unsigned short *)0x04000012) = titleVOff;

 hOff = 0;
 vOff = 10;

 state = START;
}


void start() {

 waitForVBlank();

 if ((titleVOff >> 2) < 40) {
  titleVOff++;
 } else if (!soundA.isPlaying && !titleHasPlayed) {
  playSoundA(MotherMainTheme, 392544, 11025, 0);
  titleHasPlayed = 1;
 }

 vOff--;

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToMenu();
 }

 (*(volatile unsigned short *)0x04000012) = titleVOff >> 2;
 (*(volatile unsigned short *)0x04000014) = hOff >> 2;
 (*(volatile unsigned short *)0x04000018) = hOff >> 3;
 (*(volatile unsigned short *)0x04000016) = vOff >> 4;
 (*(volatile unsigned short *)0x0400001A) = vOff >> 5;
}


void goToMenu() {

 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

 hideSprites();

 (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
 (*(volatile unsigned short*)0x400000A) = (0<<14) | ((1)<<2) | ((30)<<8);

 DMANow(3, menuPal, ((unsigned short *)0x5000000), 256);

 DMANow(3, menuTiles, &((charblock *)0x6000000)[0], 3488/2);
 DMANow(3, menuMap, &((screenblock *)0x6000000)[31], 1024);
 DMANow(3, eclipseTiles, &((charblock *)0x6000000)[1], 21792/2);
 DMANow(3, eclipseMap, &((screenblock *)0x6000000)[30], 1024);

 stopSound();
 playSoundA(CloudlandRegion, 917856, 11025, 1);


 levelSprites[HACKING].aniCounter = 0;
 levelSprites[HACKING].curFrame = 0;
 levelSprites[HACKING].numFrames = 4;
 levelSprites[HACKING].screenRow = 54;
 levelSprites[HACKING].screenCol = 24;
 levelSprites[BUGMOON].aniCounter = 0;
 levelSprites[BUGMOON].curFrame = 0;
 levelSprites[BUGMOON].numFrames = 4;
 levelSprites[BUGMOON].screenRow = 86;
 levelSprites[BUGMOON].screenCol = 24;
 levelSprites[PORTELYTH].aniCounter = 0;
 levelSprites[PORTELYTH].curFrame = 0;
 levelSprites[PORTELYTH].numFrames = 4;
 levelSprites[PORTELYTH].screenRow = 118;
 levelSprites[PORTELYTH].screenCol = 24;

 state = MENU;

 level = HACKING;
}


void menu() {

 (*(volatile unsigned short *)0x04000010) = 12;
 (*(volatile unsigned short *)0x04000012) = -2;
 (*(volatile unsigned short *)0x04000014) = 16;
 (*(volatile unsigned short *)0x04000016) = 26;

 if (!(levelSprites[level].aniCounter%12)) {
  levelSprites[level].curFrame = (levelSprites[level].curFrame+1)%levelSprites[level].numFrames;
 }
 levelSprites[level].aniCounter++;


 shadowOAM[HACKING].attr0 = levelSprites[HACKING].screenRow | (0<<8) | (0<<14);
 shadowOAM[HACKING].attr1 = levelSprites[HACKING].screenCol | (1<<14);
 shadowOAM[HACKING].attr2 = ((levelSprites[HACKING].curFrame*2)*32+(16)) | ((2)<<12);
 shadowOAM[BUGMOON].attr0 = levelSprites[BUGMOON].screenRow | (0<<8) | (0<<14);
 shadowOAM[BUGMOON].attr1 = levelSprites[BUGMOON].screenCol | (1<<14);
 shadowOAM[BUGMOON].attr2 = ((levelSprites[BUGMOON].curFrame*2)*32+(8)) | ((1)<<12);
 shadowOAM[PORTELYTH].attr0 = levelSprites[PORTELYTH].screenRow | (0<<8) | (0<<14);
 shadowOAM[PORTELYTH].attr1 = levelSprites[PORTELYTH].screenCol | (1<<14);
 shadowOAM[PORTELYTH].attr2 = ((levelSprites[PORTELYTH].curFrame*2)*32+(24)) | ((3)<<12);

 waitForVBlank();

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

 if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && level > HACKING) {
  level--;
 }
 if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && level < PORTELYTH) {
  level++;
 }

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

  initBugMoon();
  initHacking();
  initPortelyth();
  goToGame();
 }
}


void goToGame() {

 hideSprites();
 stopSound();

 if (level == BUGMOON) {
  goToBugMoon();
 }
 if (level == HACKING) {
  goToHacking();
 }
 if (level == PORTELYTH) {
  goToPortelythLevel();
 }

 state = GAME;
}


void game() {

 if (level == BUGMOON) {
  updateBugMoon();
  drawBugMoon();
  if (bugMoonWon) {
   goToWin();
  }
 }
 if (level == HACKING) {
  updateHacking();
  drawHacking();
  if (!enemyLife) {
   goToWin();
  }
 }
 if (level == PORTELYTH) {
  updatePortelyth();
  drawPortelyth();
  if (portelythWon) {
   goToWin();
  }
 }

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToPause();
 }
}


void goToPause() {

 hideSprites();

 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

 (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);

 if (level == BUGMOON) {
  DMANow(3, bugMoonPauseTiles, &((charblock *)0x6000000)[0], 7904/2);
  DMANow(3, bugMoonPauseMap, &((screenblock *)0x6000000)[31], 1024);
  hOff = 0;
  vOff = 6;
 }
 if (level == HACKING) {
  DMANow(3, hackingPauseTiles, &((charblock *)0x6000000)[0], 10816/2);
  DMANow(3, hackingPauseMap, &((screenblock *)0x6000000)[31], 1024);
  hOff = 7;
  vOff = 6;
 }
 if (level == PORTELYTH) {
  DMANow(3, portelythPauseTiles, &((charblock *)0x6000000)[0], 12448/2);
  DMANow(3, portelythPauseMap, &((screenblock *)0x6000000)[31], 1024);
  hOff = 6;
  vOff = 6;
 }

 (*(volatile unsigned short *)0x04000010) = hOff;
 (*(volatile unsigned short *)0x04000012) = vOff;

 state = PAUSE;

 pauseSound();
}


void pause() {

 waitForVBlank();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  unpauseSound();
  goToGame();
 }
 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
  DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
  goToMenu();
 }
}


void goToWin() {

 hideSprites();

 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

 (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
 (*(volatile unsigned short*)0x400000A) = (0<<14) | ((2)<<2) | ((30)<<8);

 DMANow(3, winPal, ((unsigned short *)0x5000000), 256);

 DMANow(3, winTiles, &((charblock *)0x6000000)[0], 2016/2);
 DMANow(3, winMap, &((screenblock *)0x6000000)[31], 1024);
 DMANow(3, sonataTiles, &((charblock *)0x6000000)[2], 16032/2);
 DMANow(3, sonataMap, &((screenblock *)0x6000000)[30], 1024);

 hOff = 6;
 vOff = 0;
 (*(volatile unsigned short *)0x04000010) = hOff;
 (*(volatile unsigned short *)0x04000012) = vOff;
 (*(volatile unsigned short *)0x04000014) = 0;
 (*(volatile unsigned short *)0x04000016) = 0;

 state = WIN;

 stopSound();
 playSoundA(WinSound, 10937, 11025, 0);
}


void win() {

 waitForVBlank();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToStart();
 }
}
