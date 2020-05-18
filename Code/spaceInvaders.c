#include "myLib.h"
#include <stdlib.h>
#include "spaceInvaders.h"

// Screens and Sprites
#include "sprites.h"
#include "gamebg.h"

// Sound
#include "sound.h"
#include "Levels.h"

// Variables
PLAYER player;
ENEMY enemies[ENEMYCOUNT];
PROJECTILE projectiles[PROJECTILECOUNT];
LIFE lifeIcons[LIVES - 1];
OBJ_ATTR shadowOAM[128];
int playerProjectiles;
int enemiesRemaining;
int enemyMvt;
int lives;
int spHOff;
int spVOff;

// initializes the gmae
void initSpaceInvaders() {

	playerProjectiles = 0;
	enemiesRemaining = ENEMYCOUNT;
	lives = LIVES;

	// Handles enemy movement speed and direction
	enemyMvt = 1;

	initPlayer();
	initEnemies();
	initProjectiles();
	initLives();
}

// Sets up game state
void goToSpaceInvaders() {

	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	DMANow(3, spritesPal, SPRITEPALETTE, 16);
	DMANow(3, spritesTiles, &CHARBLOCK[4], 16384 / 2);

	DMANow(3, gamebgTiles, &CHARBLOCK[0], gamebgTilesLen/2);
	DMANow(3, gamebgMap, &SCREENBLOCK[31], gamebgMapLen/2);

	spHOff = BORDER / 2;

	REG_BG0HOFF = spHOff;

	playSoundA(Levels, LEVELSLEN, LEVELSFREQ, 1);
}

// Updates all game variables and checks collisions
void updateSpaceInvaders() {

	updatePlayer();
	updateEnemies();

	for (int i = 0; i < PROJECTILECOUNT; i++) {
		if (projectiles[i].active) {
			updateProjectile(&projectiles[i]);
		}
	}
	// Fires projectiles
	if (BUTTON_PRESSED(BUTTON_A) && playerProjectiles < PLAYERPROJECTILES) {
		playerFire();
	}

	// Collision checks
	checkPlayerEnemyCollision();
	checkProjectilePlayerCollision();
	checkProjectileEnemyCollision();

	spVOff++;
	REG_BG0VOFF = (spVOff >> 3);
}

// Draws the new frame of the game
void drawSpaceInvaders() {

	drawPlayer();
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (enemies[i].active) {
			drawEnemy(&enemies[i]);
		}
	}
	for (int i = 0; i < PROJECTILECOUNT; i++) {
		if (projectiles[i].active) {
			drawProjectile(&projectiles[i]);
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
	player.projectileFired = 0;
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
	if ((player.projectileFired >> 3) >= 0) {
		player.projectileFired--;
		if (!player.projectileFired) {
			player.drow = 0;
		}
	}
}

void playerFire() {
	for (int i = 0; i < PROJECTILECOUNT; i++) {
		if (!projectiles[i].active) {
			initProjectile(&projectiles[i], player.row, player.col, 1);
			break;
		}
	}
	playerProjectiles++;
	player.drow = 1;
	player.tileCol = 0;
	player.projectileFired = (4 << 3);
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
		enemies[i].projectileFired = 0;
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
	if ((enemy -> projectileFired >> 3) >= 0) {
		enemy -> projectileFired--;
		if (!enemy -> projectileFired) {
			enemy -> drow = 0;
		}
	}
}

// initialzies and fires a projectile against the player
void enemyFire(ENEMY *enemy) {
	int i = 0;
	while (i < PROJECTILECOUNT - PLAYERPROJECTILES) {
		if (!projectiles[i].active) {
			initProjectile(&projectiles[i], enemy -> row, (enemy -> col >> 3), -1);
			i = PROJECTILECOUNT;
		} else {
			i++;
		}
	}
	enemy -> drow = 1;
	enemy -> dtile = 0;
	enemy -> projectileFired = (4 << 3);
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

void initProjectiles() {

	int id = 1 + ENEMYCOUNT; // Projectiles are placed after player and enemies

	for (int i = 0; i < PROJECTILECOUNT; i++) {
		projectiles[i].row = 0;
		projectiles[i].col = 0;
		projectiles[i].tileRow = 0;
		projectiles[i].tileCol = 20;
		projectiles[i].id = id;
		projectiles[i].active = 0;
		projectiles[i].orientation = 0; // Given no orientation

		shadowOAM[id].attr0 = projectiles[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		shadowOAM[id].attr1 = projectiles[i].col | ATTR1_TINY;
		shadowOAM[id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(projectiles[i].tileRow, projectiles[i].tileCol);

		id++;
	}
}

void initProjectile(PROJECTILE *projectile, int row, int col, int orient) {
	projectile -> row = row - (4 * orient);
	projectile -> col = col;
	projectile -> orientation = orient;
	projectile -> active = 1;
	// if (orient == -1) {
	// 	projectile -> tileCol = 21;
	// }
	shadowOAM[projectile -> id].attr0 = projectile -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[projectile -> id].attr1 = projectile -> col | ATTR1_TINY;
	shadowOAM[projectile -> id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(projectile -> tileRow, projectile -> tileCol);
}

void updateProjectile(PROJECTILE *projectile) {
	projectile -> row -= 2 * (projectile -> orientation);
	if (projectile -> row <= -2 || projectile -> row >= 154) {
		hideProjectile(projectile);
	}
}

void hideProjectile(PROJECTILE *projectile) {
	projectile -> active = 0;
	if (projectile -> orientation == 1) {
		playerProjectiles--;
	}
	projectile -> orientation = 0;
	projectile -> tileCol = 20;
	shadowOAM[projectile -> id].attr0 |= ATTR0_HIDE;
}

void drawProjectile(PROJECTILE *projectile) {
	shadowOAM[projectile -> id].attr0 = projectile -> row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[projectile -> id].attr1 = projectile -> col | ATTR1_TINY;
	shadowOAM[projectile -> id].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(projectile -> tileRow, projectile -> tileCol);
}

void initLives() {
 	int id = 1 + ENEMYCOUNT + PROJECTILECOUNT; // Appears after all these boys in OAM and shadowOAM
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

// Checks enemy-oriented projectile collision into player
void checkProjectilePlayerCollision() {
	for (int i = 0; i < PROJECTILECOUNT; i++) {
		if (projectiles[i].active && projectiles[i].orientation == -1 &&
			collision(projectiles[i].row, projectiles[i].col, 8, 8, player.row, player.col, 8, 8)) {
			lives--;
			hideProjectile(&projectiles[i]);
			hideLife(&lifeIcons[lives - 1]);
		}
	}
}

// Checks player-oriented projectile collision into enemies
void checkProjectileEnemyCollision() {
	for (int i = 0; i < PROJECTILECOUNT; i++) {
		for (int j = 0; j < ENEMYCOUNT; j++) {
			if (projectiles[i].active && enemies[j].active && projectiles[i].orientation == 1 &&
				collision(projectiles[i].row, projectiles[i].col, 8, 8, enemies[j].row, (enemies[j].col >> 3), 8, 8)) {
				hideEnemy(&enemies[j]);
				hideProjectile(&projectiles[i]);
				enemiesRemaining--;
			}
		}
	}
}