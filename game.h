typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
    int rdel;
	int height;
	int width;
    int size;
	unsigned short color;
    int bulletTimer;
} PLAYER;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
	int count;
} BALL;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
    int direction;
} BULLET;

#define BULLETCOUNT 5
#define BALLCOUNT 5
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;
extern int playerRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initCannon();
void updateCannon();
void drawCannon();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initBalls();
void initTinyBalls();
void updateBall(BALL *);
void updateTinyBall(BALL *);
void drawBall(BALL *);
