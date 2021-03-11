#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
BALL tinyBalls[BALLCOUNT * 4];
int ballsRemaining;
int direction = 0;
int prevdirection = 0;
int playerRemaining;

// Initialize the game
void initGame() {
	initPlayer();
	initBullets();
	initBalls();
	initTinyBalls();
	ballsRemaining = BALLCOUNT;
	playerRemaining = 1;
}

// Updates the game each frame
void updateGame() {
	updatePlayer();
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}
	for (int i = 0; i < BALLCOUNT; i++) {
		updateBall(&balls[i]);
	}
	for (int i = 0; i < BALLCOUNT * 4; i++) {
		updateTinyBall(&tinyBalls[i]);
	}
}

// Draws the game each frame
void drawGame() {
	drawPlayer();
	for (int i = 0; i < BULLETCOUNT; i++) {
		drawBullet(&bullets[i]);
	}
	for (int i = 0; i < BALLCOUNT; i++) {
		drawBall(&balls[i]);
	}
	for (int i = 0; i < BALLCOUNT * 4; i++) {
		drawBall(&tinyBalls[i]);
	}
}

// // Initialize the cannon
void initPlayer() {
	player.row = 140;
	player.col = 118;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 1;
    player.rdel = 1;
	player.height = 10;
	player.width = 5;
    player.size = 10;
	player.color = COLOR(255, 175, 75);
	player.bulletTimer = 20;
}
//updates Player
void updatePlayer() {
	if (BUTTON_HELD(BUTTON_LEFT)
		&& 10 <= player.col) {
		player.col -= player.cdel;
        direction = 1;

	} if (BUTTON_HELD(BUTTON_RIGHT)
		&& SCREENWIDTH - 10 - player.cdel > player.col) {
		player.col += player.cdel;
        direction = 2;

	} if (BUTTON_HELD(BUTTON_UP) && player.row - player.size >= player.rdel) {
        player.row -= player.rdel;
        direction = 3;

    } if (BUTTON_HELD(BUTTON_DOWN) && player.row + player.size < SCREENHEIGHT - player.rdel) {
        player.row += player.rdel;
        direction = 4;
    }

	
 	//Fire bullets
	if (BUTTON_PRESSED(BUTTON_B) && player.bulletTimer >= 20) {
 		fireBullet();  
		player.bulletTimer = 0;
	}
	player.bulletTimer++;
}
//draws Player
void drawPlayer() {
    if (prevdirection == 1) {
        drawArrowLeft(player.oldCol, player.oldRow, 10, BLACK);
    } else if (prevdirection == 2) {
        drawArrowRight(player.oldCol, player.oldRow, 10, BLACK);
    } else if (prevdirection == 3 || prevdirection == 0) {
        drawArrowUp(player.oldCol, player.oldRow, 10, BLACK);
    } else if (prevdirection == 4) {
        drawArrowDown(player.oldCol, player.oldRow, 10, BLACK);
    }

    if (direction == 1) {
        drawArrowLeft(player.col, player.row, 10, player.color);
    } else if (direction == 2) {
	    drawArrowRight(player.col, player.row, 10, player.color);
    } else if (direction == 3 || direction == 0) {
	    drawArrowUp(player.col, player.row, 10, player.color);
    } else if (direction == 4) {
	    drawArrowDown(player.col, player.row, 10, player.color);
    }
    prevdirection = direction;
	player.oldRow = player.row;
	player.oldCol = player.col;
}

// Initialize the pool of bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 2;
		bullets[i].width = 1;
		bullets[i].row = -1 * bullets->height;
		bullets[i].col = 0;
		bullets[i].oldRow = player.oldRow;
		bullets[i].oldCol = player.oldCol;
		bullets[i].rdel = -2;
		bullets[i].color = WHITE;
		bullets[i].active = 0;
        bullets[i].direction = 0;
	}
}

// Spawn a bullet
void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
            if (direction == 3 || direction == 0) {
                bullets[i].row = player.row;
                bullets[i].col = player.col;
                bullets[i].active = 1;
                bullets[i].erased = 0;
                bullets[i].direction = 3;
                break;
            } else if (direction == 1) {
                bullets[i].row = player.row;
                bullets[i].col = player.col;
                bullets[i].active = 1;
                bullets[i].erased = 0;
                bullets[i].direction = 1;
                break;
            } else if (direction == 2) {
                bullets[i].row = player.row;
                bullets[i].col = player.col;
                bullets[i].active = 1;
                bullets[i].erased = 0;
                bullets[i].direction = 2;
                break;
            } else if (direction == 4) {
                bullets[i].row = player.row;
                bullets[i].col = player.col;
                bullets[i].active = 1;
                bullets[i].erased = 0;
                bullets[i].direction = 4;
                break;
            }
		}
	}
}

// // Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {
    if (b->active == 1) {
        if (b->col > 0 && b->direction == 1) {
            b->col = b->col - 1;
        } else if (b->direction == 1) {
            b->active = 0;
        } else if (b->row > 0 && b->direction == 3) {
            b->row = b->row - 1;
        } else if (b->direction == 3) {
            b->active = 0;
        } else if (b->col < SCREENWIDTH && b->direction == 2) {
            b->col = b->col + 1;
        } else if (b->direction == 2){
            b->active = 0;
        } else if (b->row < SCREENHEIGHT && b->direction == 4) {
            b->row = b->row + 1;
        } else if (b->direction == 4) {
            b->active = 0;
        }
    }
}

// // Draw a bullet
void drawBullet(BULLET* b) {
	if(b->active) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		drawRect(b->col, b->row, b->width, b->height, b->color);
	} 
	else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Initialize the balls
void initBalls() {
	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].height = 10;
		balls[i].width = 10;
		balls[i].row = rand() % 110;
		balls[i].col = rand() % 130 + 10;
		balls[i].oldRow = balls[i].row;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].color = BLUE;
		balls[i].active = 1;
		balls[i].erased = 0;
		balls[i].count = 0;
	}
}
//initilaize the tiny balls
void initTinyBalls() {
	for (int i = 0; i < BALLCOUNT * 4; i++) {
		tinyBalls[i].height = 5;
		tinyBalls[i].width = 5;
		tinyBalls[i].row = rand() % 110;
		tinyBalls[i].col = rand() % 130 + 10;
		tinyBalls[i].oldRow = tinyBalls[i].row;
		tinyBalls[i].oldCol = tinyBalls[i].col;
		tinyBalls[i].rdel = 1;
		tinyBalls[i].cdel = 1;
		tinyBalls[i].color = RED;
		tinyBalls[i].active = 0;
		tinyBalls[i].erased = 0;
		tinyBalls[i].count = 0;
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		// Bounce the ball off the sides of the box
		if (b->row <= 0 || b->row + b->height-1 >= SCREENHEIGHT-1)
			b->rdel *= -1;
		if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
			b->cdel *= -1;

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;
		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active == 1 && bullets[i].row + bullets[i].height - 1 > b->row && bullets[i].row < b->row + b->height - 1 && bullets[i].col + bullets[i].width - 1 > b->col && bullets[i].col < b->col + b->width - 1) {
				bullets[i].active = 0;
				b->active = 0;
				ballsRemaining--;
				for (int i = 0; i < BALLCOUNT * 4; i++) {
					if (tinyBalls[i].active == 0) {
						tinyBalls[i].col = b->oldCol + 10;
						tinyBalls[i].row = b->oldRow + 6;
						tinyBalls[i].active = 1;
						ballsRemaining++;
						tinyBalls[i].count = tinyBalls[i].count + 1;
						break;
					}
				}
				for (int i = 0; i < BALLCOUNT * 4; i++) {
					if (tinyBalls[i].active == 0) {
						tinyBalls[i].col = (b->oldCol) - 10;
						tinyBalls[i].row = (b->oldRow) - 4;
						tinyBalls[i].active = 1;
						ballsRemaining++;
						break;
					}
				}
			}
		}
        if (player.row + player.size - 1 > b->row && player.row < b->row + b->height - 1 && player.col + player.size - 1 > b->col && player.col < b->col + b->width - 1) {
            playerRemaining = 0;
        }
	}
}
void updateTinyBall(BALL* b) {

	if (b->active) {

		// Bounce the ball off the sides of the box
		if (b->row <= 0 || b->row + b->height-1 >= SCREENHEIGHT-1)
			b->rdel *= -1;
		if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
			b->cdel *= -1;

		// Move the ball
		if (b->count % 2 == 0) {
			b->row += b->rdel;
			b->col += b->cdel;
		} else {
			b->row -= b->rdel;
			b->col -= b->cdel;
		}

		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active == 1 && bullets[i].row + bullets[i].height - 1 > b->row && bullets[i].row < b->row + b->height - 1 && bullets[i].col + bullets[i].width - 1 > b->col && bullets[i].col < b->col + b->width - 1) {
				drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
				bullets[i].active = 0;
				b->active = 0;
				ballsRemaining--;
			}
		}
        if (player.row + player.size - 1 > b->row && player.row < b->row + b->height - 1 && player.col + player.size - 1 > b->col && player.col < b->col + b->width - 1) {
            playerRemaining = 0;
        }
	}
}

// Draw a ball
void drawBall(BALL* b) {
	if(b->active) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		drawRect(b->col, b->row, b->width, b->height, b->color);
	} else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}