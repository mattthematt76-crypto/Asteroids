# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 42 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 67 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
typedef unsigned short u16;
typedef unsigned char u8;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}
void drawArrowUp(u8 x, u8 y, u8 size, u16 color) {
    for (u8 i = 0; i < size; i++) {
        setPixel(x, y + i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x + i, y + i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x - i, y + i, color);
    }
}
void drawArrowDown(u8 x, u8 y, u8 size, u16 color) {
    for (u8 i = 0; i < size; i++) {
        setPixel(x, y + i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x + i, y + 10 - i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x + i - 5, y + i + 5, color);
    }
}
void drawArrowRight(u8 x, u8 y, u8 size, u16 color) {
    for (u8 i = 0; i < size; i++) {
        setPixel(x + i, y, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x - i + 10, y + i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x + i + 5, y + i -5, color);
    }
}
void drawArrowLeft(u8 x, u8 y, u8 size, u16 color) {
    for (u8 i = 0; i < size; i++) {
        setPixel(x + i, y, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x + i, y + i, color);
    }
    for (u8 i = 0; i < size/2; i++) {
        setPixel(x - i + 5, y + i - 5, color);
    }
}
void fillScreen(unsigned short color) {
    for(int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while((*(volatile unsigned short *)0x4000006) > 160);
    while((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
