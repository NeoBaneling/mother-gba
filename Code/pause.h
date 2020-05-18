
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 140 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8960 + 2048 = 11520
//
//	Time-stamp: 2019-04-04, 21:51:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 8960
extern const unsigned short pauseTiles[4480];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)
