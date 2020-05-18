
//{{BLOCK(menu)

//======================================================================
//
//	menu, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 109 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3488 + 2048 = 6048
//
//	Time-stamp: 2019-04-17, 11:46:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MENU_H
#define GRIT_MENU_H

#define menuTilesLen 3488
extern const unsigned short menuTiles[1744];

#define menuMapLen 2048
extern const unsigned short menuMap[1024];

#define menuPalLen 512
extern const unsigned short menuPal[256];

#endif // GRIT_MENU_H

//}}BLOCK(menu)
