
//{{BLOCK(pausebg)

//======================================================================
//
//	pausebg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 79 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5056 + 2048 = 7616
//
//	Time-stamp: 2019-03-18, 22:17:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pausebgTilesLen 5056
extern const unsigned short pausebgTiles[2528];

#define pausebgMapLen 2048
extern const unsigned short pausebgMap[1024];

#define pausebgPalLen 512
extern const unsigned short pausebgPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pausebg)
