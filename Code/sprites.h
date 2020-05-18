
//{{BLOCK(sprites)

//======================================================================
//
//	sprites, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 32768 + 2048 = 34848
//
//	Time-stamp: 2019-03-18, 18:05:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPRITES_H
#define GRIT_SPRITES_H

#define spritesTilesLen 32768
extern const unsigned short spritesTiles[16384];

#define spritesMapLen 2048
extern const unsigned short spritesMap[1024];

#define spritesPalLen 32
extern const unsigned short spritesPal[16];

#endif // GRIT_SPRITES_H

//}}BLOCK(sprites)
