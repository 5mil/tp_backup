/**
 * win_game.h
 * Windows port game interface
 * 
 * This header defines the interface between the Windows platform layer
 * and the game engine code.
 */

#ifndef WIN_GAME_H
#define WIN_GAME_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Initialize the game engine
 * Called once at startup before the main loop
 */
void game_init(void);

/**
 * Run one iteration of the game loop
 * Called every frame (typically ~60 FPS)
 */
void game_loop(void);

/**
 * Shutdown the game engine
 * Called once before the application exits
 */
void game_shutdown(void);

#ifdef __cplusplus
}
#endif

#endif /* WIN_GAME_H */
