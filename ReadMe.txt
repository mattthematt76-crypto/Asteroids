****************************************************************************
                                   READ ME
****************************************************************************
The game is broken up into 5 screens (states):
	1.) The Start state is noted by a pink screen. The user is able to
	    press Start (enter on the keyboard) to transition into the Game
            state or Select (backspace on the keyboard) to transition into
            the Pause state.

	2.) The Game state is where the enemies and player interaction
            takes place. The goal of the game is to eliminate all of the
            blue asteroids as well as all of the red asteroids that are
            produced when a blue asteroid is hit with a bullet. The player
            is allowed to move across the screen by holding "W" to move
            upward, "S" to move downward, "A" to move left, and "D" to move
            right. The player is allowed to shoot by pressing "K". If the
            player is successful at clearing all of the asteroids, they will
            be transitioned into the Win state. If the player collided with
            an asteroid before shooting all of them, they have lost and will
            be transfered to the Lose state.

	3.) The Lose state is noted by a red screen. The user is able to
	    go to the Start state by pressing Start (enter on the keyboard).

	4.) The Win state is noted by a green screen. The user is able to
	    go to the Start state by pressing Start (enter on the keyboard).

	5.) The Pause state is noted by a gold screen. The user is able to
	    go to the Start state by pressing Select (backspace on the
            keyboard) or go to the Game state by pressing Start (enter on
            keyboard).
****************************************************************************