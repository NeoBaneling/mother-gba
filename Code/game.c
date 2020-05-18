#include "myLib.h"
#include "spaceInvaders.h"
#include "sprites.h"

// Variables
PLAYER player;
ENEMY enemies[ENEMYCOUNT];
BULLET bullets[BULLETCOUNT];
LIFE lifeIcons[LIVES - 1];
OBJ_ATTR shadowOAM[128];
int playerBullets;
int enemiesRemaining;
int enemyMvt;
int lives;

// initializes the gmae
void initGame() {

	DMANow(3, spritesPal, SPRITEPALETTE, 16);
	DMANow(3, spritesTiles, &CHARBLOCK[4], 16384 / 2);
	playerBullets = 0;
	enemiesRemaining = ENEMYCOUNT;
	lives = LIVES;

	// Handles enemy movement speed and direction
	enemyMvt = 1;

	initPlayer();
	initEnemies();
	initBullets();
	initLives();
}

// Updates all game variables and checks collisions
void updateGame() {

	updatePlayer();
	updateEnemies();

	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active) {
			updateBullet(&bullets[i]);
		}
	}
	// Fires bullets
	if (BUTTON_PRESSED(BUTTON_A) && playerBullets < PLAYERBULLETS) {
		playerFire();
	}

	// Collision checks
	checkPlayerEnemyCollision();
	checkBulletPlayerCollision();
	checkBulletEnemyCollision();
}

// Draws the new frame of the game
void drawGame() {

	drawPlayer();
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (enemies[i].active) {
			drawEnemy(&enemies[i]);
		}
	}
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active) {
			drawBullet(&bullets[i]);
		}
	}
	for (int i = 0; i < LIVES; i++) {
		if (lifeIcons[i].active) {
			drawLife(&lifeIcons[i]);
		}
	}
}

void initPlayer() {
	player.row = 132;
	player.col = 116;
	player.tileRow = 0;
	player.tileCol = 0;
	player.drow = 0;
	player.bulletFired = 0;
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[0].attr1 = player.col | ATTR1_TINY;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.tileRow, player.tileCol);
}

void updatePlayer() {

	// Player movement
	if (BUTTON_HELD(BUTTON_LEFT) && player.col != BORDER) {
		player.col--;
	}
	if (BUTTON_HELD(BUTTON_RIGHT) && player.col + 8 != SCREENWIDTH - BORDER) {
		player.col++;
	}

	// Does player animation
	player.tileCol += 1;
	if ((player.tileCol >> 3) >= 4) {
		player.tileCol = 0;
	}

	// Affects player firing animation
	if ((player.bulletFired >> 3) >= 0) {
		player.bulletFired--;
		if (!player.bulletFired) {
			player.drow = 0;
		}
	}
}

void playerFire() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			initBullet(&bullets[i], player.row, player.col, 1);
			break;
		}
	}
	playerBullets++;
	player.drow = 1;
	player.tileCol = 0;
	player.bulletFired = (4 << 3);
}

void drawPlayer() {
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = player.col | ATTR1_TINY;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.tileRow + player.drow, (player.tileCol >> 3));
}

void initEnemies() {

	// ID for location in OAM and shadowOAM
	int id = 1;

	for (int i = 0; i < ENEMYCOUNT; i++) {
		enemies[i].row = 16 + 16 * (i / ENEMYROW);
		enemies[i].col = (20 + 16 * (i % ENEMYROW)) << 3;
		enemies[i].tileRow = 0;
		enemies[i].tileCol = 4 + (4 * ((i / ENEMYROW) % 4));
		enemies[i].drow = 0;
		enemies[i].dtile = 0;
		enemies[i].bulletFired = 0;
		enemies[i].id = id;
		enemies[i].active = 1;

		shadowOAM[id].attr0 = enemies[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[id].attr1 = enemies[i].col | ATTR1_TINY;
		shadowOAM[id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i].tileRow, enemies[i].tileCol);

		id++;
	}
}

void updateEnemies() {

	int levelShift = 0;
	// Checks if the enemies are encountering either border
	if ((enemies[0].col >> 3) == BORDER || (enemies[ENEMYROW - 1].col >> 3) == SCREENWIDTH - BORDER - 8) {
		enemyMvt = -1 * enemyMvt;
		levelShift = 1;
	}
	for (int i = 0; i < ENEMYCOUNT; i++) {

		updateEnemy(&enemies[i], levelShift);

		if (enemies[i].active && !(rand() % (160 * enemiesRemaining))) {
			enemyFire(&enemies[i]);
		}
	}

}

void updateEnemy(ENEMY *enemy, int levelShift) {
	enemy -> row += levelShift;
	enemy -> col += enemyMvt;
	enemy -> dtile += 1;

	// Enemy animation
	if ((enemy -> dtile >> 3) >= 4) {
		enemy -> dtile = 0;
	}

	// Enemy firing animation
	if ((enemy -> bulletFired >> 3) >= 0) {
		enemy -> bulletFired--;
		if (!enemy -> bulletFired) {
			enemy -> drow = 0;
		}
	}
}

// initialzies and fires a bullet against the player
void enemyFire(ENEMY *enemy) {
	int i = 0;
	while (i < BULLETCOUNT - PLAYERBULLETS) {
		if (!bullets[i].active) {
			initBullet(&bullets[i], enemy -> row, (enemy -> col >> 3), -1);
			i = BULLETCOUNT;
		} else {
			i++;
		}
	}
	enemy -> drow = 1;
	enemy -> dtile = 0;
	enemy -> bulletFired = (4 << 3);
}

void hideEnemy(ENEMY *enemy) {
	enemy -> active = 0;
	shadowOAM[enemy -> id].attr0 |= ATTR0_HIDE;
}

void drawEnemy(ENEMY *enemy) {
	shadowOAM[enemy -> id].attr0 = enemy -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[enemy -> id].attr1 = (enemy -> col >> 3) | ATTR1_TINY;
	shadowOAM[enemy -> id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy -> tileRow + enemy -> drow, enemy -> tileCol + (enemy -> dtile >> 3));
}

void initBullets() {

	int id = 1 + ENEMYCOUNT; // Bullets are placed after player and enemies

	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].row = 0;
		bullets[i].col = 0;
		bullets[i].tileRow = 0;
		bullets[i].tileCol = 20;
		bullets[i].id = id;
		bullets[i].active = 0;
		bullets[i].orientation = 0; // Given no orientation

		shadowOAM[id].attr0 = bullets[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		shadowOAM[id].attr1 = bullets[i].col | ATTR1_TINY;
		shadowOAM[id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullets[i].tileRow, bullets[i].tileCol);

		id++;
	}
}

void initBullet(BULLET *bullet, int row, int col, int orient) {
	bullet -> row = row - (4 * orient);
	bullet -> col = col;
	bullet -> orientation = orient;
	bullet -> active = 1;
	// if (orient == -1) {
	// 	bullet -> tileCol = 21;
	// }
	shadowOAM[bullet -> id].attr0 = bullet -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[bullet -> id].attr1 = bullet -> col | ATTR1_TINY;
	shadowOAM[bullet -> id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet -> tileRow, bullet -> tileCol);
}

void updateBullet(BULLET *bullet) {
	bullet -> row -= 2 * (bullet -> orientation);
	if (bullet -> row <= -2 || bullet -> row >= 154) {
		hideBullet(bullet);
	}
}

void hideBullet(BULLET *bullet) {
	bullet -> active = 0;
	if (bullet -> orientation == 1) {
		playerBullets--;
	}
	bullet -> orientation = 0;
	bullet -> tileCol = 20;
	shadowOAM[bullet -> id].attr0 |= ATTR0_HIDE;
}

void drawBullet(BULLET *bullet) {
	shadowOAM[bullet -> id].attr0 = bullet -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[bullet -> id].attr1 = bullet -> col | ATTR1_TINY;
	shadowOAM[bullet -> id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet -> tileRow, bullet -> tileCol);
}

void initLives() {
 	int id = 1 + ENEMYCOUNT + BULLETCOUNT; // Appears after all these boys in OAM and shadowOAM
	for (int i = 0; i < LIVES - 1; i++) {
		lifeIcons[i].row = 148;
		lifeIcons[i].col = BORDER + 2 + (8 * i);
		lifeIcons[i].tileRow = 0;
		lifeIcons[i].tileCol = 24;
		lifeIcons[i].id = id;
		lifeIcons[i].active = 1;
		shadowOAM[id].attr0 = lifeIcons[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[id].attr1 = lifeIcons[i].col | ATTR1_TINY;
		shadowOAM[id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lifeIcons[i].tileRow, lifeIcons[i].tileCol);

		id++;
	}
}

void hideLife(LIFE *life) {
	life -> active = 0;
	shadowOAM[life -> id].attr0 |= ATTR0_HIDE;
}

void drawLife(LIFE *life) {
	shadowOAM[life -> id].attr0 = life -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[life -> id].attr1 = life -> col | ATTR1_TINY;
}

// Checks enemy collision into the player (based solely on row)
void checkPlayerEnemyCollision() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (enemies[i].active &&
			collision (player.row, BORDER, 8, SCREENWIDTH - BORDER, enemies[i].row, BORDER, 8, SCREENWIDTH - BORDER)) {
				enemiesRemaining = -1;
		}
	}
}

// Checks enemy-oriented bullet collision into player
void checkBulletPlayerCollision() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active && bullets[i].orientation == -1 &&
			collision(bullets[i].row, bullets[i].col, 8, 8, player.row, player.col, 8, 8)) {
			lives--;
			hideBullet(&bullets[i]);
			hideLife(&lifeIcons[lives - 1]);
		}
	}
}

// Checks player-oriented bullet collision into enemies
void checkBulletEnemyCollision() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		for (int j = 0; j < ENEMYCOUNT; j++) {
			if (bullets[i].active && enemies[j].active && bullets[i].orientation == 1 &&
				collision(bullets[i].row, bullets[i].col, 8, 8, enemies[j].row, (enemies[j].col >> 3), 8, 8)) {
				hideEnemy(&enemies[j]);
				hideBullet(&bullets[i]);
				enemiesRemaining--;
			}
		}
	}
}