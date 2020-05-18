
//{{BLOCK(startbg)

//======================================================================
//
//	startbg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 90 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5760 + 2048 = 8320
//
//	Time-stamp: 2019-03-18, 18:26:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTBG_H
#define GRIT_STARTBG_H

#define startbgTilesLen 5760
extern const unsigned short startbgTiles[2880];

#define startbgMapLen 2048
extern const unsigned short startbgMap[1024];

#define startbgPalLen 512
extern const unsigned short startbgPal[256];

#endif // GRIT_STARTBG_H

//}}BLOCK(startbg)
