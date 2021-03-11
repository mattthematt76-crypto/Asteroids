#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// variables

// typedef unsigned short u16;
// typedef unsigned char u8;
unsigned short buttons;
unsigned short oldButtons;
typedef unsigned char u8;
// prototypes
void initialize();
void updateGame();
void setPixel(int, int, unsigned short);
void waitForVBlank();
void drawArrow(u8, u8, u8, u16);

void goToStart();
void goToLose();
void goToWin();
void goToGame();
void goToPause();

void Start();
void Lose();
void Win();
void Game();
void Pause();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here


// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();
    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine  
        switch(state) {
            case START: {
                state = START;
                Start();
                break;
            }
            case PAUSE: {
                state = PAUSE;
                Pause();
                break;
            }
            case LOSE: {
                state = LOSE;
                Lose();
                break;
            }
            case WIN: {
                state = WIN;
                Win();
                break;
            }
            case GAME: {
                state = GAME;
                Game();
                break;
            }
        }
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    goToStart();
}

void goToStart() {
    seed = 0;
    state = START;
    fillScreen(PINK);
}
void goToPause() {
    state = PAUSE;
    fillScreen(GOLD);
}
void goToWin() {
    state = WIN;
    fillScreen(GREEN);
}
void goToLose() {
    state = LOSE;
    fillScreen(RED);
}
void goToGame() {
    state = GAME;
    fillScreen(BLACK);
}
void Start() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
}
void Pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}
void Game() {
    updateGame();
    drawGame();
    waitForVBlank();
    if (playerRemaining == 0) {
        goToLose();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}
void Win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void Lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
