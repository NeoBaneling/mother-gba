
//{{BLOCK(winbg)

//======================================================================
//
//	winbg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 85 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5440 + 2048 = 8000
//
//	Time-stamp: 2019-03-18, 18:37:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINBG_H
#define GRIT_WINBG_H

#define winbgTilesLen 5440
extern const unsigned short winbgTiles[2720];

#define winbgMapLen 2048
extern const unsigned short winbgMap[1024];

#define winbgPalLen 512
extern const unsigned short winbgPal[256];

#endif // GRIT_WINBG_H

//}}BLOCK(winbg)
