
//{{BLOCK(losebg)

//======================================================================
//
//	losebg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 41 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2624 + 2048 = 5184
//
//	Time-stamp: 2019-03-18, 18:45:38
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEBG_H
#define GRIT_LOSEBG_H

#define losebgTilesLen 2624
extern const unsigned short losebgTiles[1312];

#define losebgMapLen 2048
extern const unsigned short losebgMap[1024];

#define losebgPalLen 512
extern const unsigned short losebgPal[256];

#endif // GRIT_LOSEBG_H

//}}BLOCK(losebg)
