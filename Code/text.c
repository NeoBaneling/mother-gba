#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location
void drawChar(int row, int col, char ch, unsigned short color) {

    // TODO 1.0: Complete this function
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 * ch + i + 6 * j]) {
                setPixel(row + j, col + i, color);
            }
        }
    }
}

// Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {

    // TODO 2.0: Complete this function
    int count = 0;
    char current = str[count];
    while (current != '\0') {
        drawChar(row, col + (6 * count), current, color);
        current = str[++count];
    }
}