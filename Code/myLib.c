#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Delays the next fn by the given amount, in milliseconds
void delay(int amount) {
    volatile int trash = 0;
    for (int i = 0; i < amount * 1000; i++) {
        trash++;
    }
}

// Hides all the sprites in the OAM
void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 512);
}

void setPixel(int row, int col, unsigned short color) {

    videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
    for (int i = 0; i < height; i++) {
        volatile unsigned short c = color;
        dma[3].cnt = 0;
        dma[3].src = &c;
        dma[3].dst = &videoBuffer[OFFSET(row + i, col, SCREENWIDTH)];
        dma[3].cnt = DMA_ON | DMA_SOURCE_FIXED | width;
    }
}

void fillScreen(unsigned short color) {
    volatile unsigned short c = color;
    dma[3].cnt = 0;
    dma[3].src = &c;
    dma[3].dst = videoBuffer;
    dma[3].cnt = DMA_ON | DMA_SOURCE_FIXED | 38400;
}

// // Set a pixel on the screen in Mode 4
// void setPixel(int row, int col, unsigned char colorIndex) {

//     unsigned short pixelData = videoBuffer[OFFSET(row, col, SCREENWIDTH)/2];
//     if (col & 1) {
//         pixelData &= 0x00FF;
//         pixelData |= (colorIndex << 8);
//     } else {
//         pixelData &= 0xFF00;
//         pixelData |= colorIndex;
//     }
//     videoBuffer[OFFSET(row, col, SCREENWIDTH)/2] = pixelData;
// }

// // Draw a rectangle at the specified location and size in Mode 4
// void drawRect(int row, int col, int height, int width, volatile unsigned char colorIndex) {

//     volatile unsigned short pixelData = colorIndex | (colorIndex<<8);
//     for (int r = 0; r < height; r++) {
//         if (col & 1) {
//             if (width & 1) {  // Odd col, odd width
//                 setPixel(row + r, col, colorIndex);
//                 if (width > 1) {
//                     DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col+1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
//                 }
//             } else {  // Odd col, even width
//                 setPixel(row + r, col, colorIndex);
//                 if (width > 2) {
//                     DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col+1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | (width/2-1));
//                 }
//                 setPixel(row + r, col+width-1, colorIndex);
//             }
//         } else {
//             if (width & 1) {  // Even col, odd width
//                 if (width > 1) {
//                     DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
//                 }
//                 setPixel(row + r, col+width-1, colorIndex);
//             } else {  // Even col, even width
//                 DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
//             }
//         }
//     }
// }

// // Fill the entire screen with a single color in Mode 4
// void fillScreen(volatile unsigned char colorIndex) {

//     volatile unsigned short pixelData = colorIndex | (colorIndex<<8);
//     DMANow(3, &pixelData, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT / 2));
// }

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)/2], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], width/2);
    }
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}