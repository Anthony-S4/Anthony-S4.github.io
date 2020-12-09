Hello Professor, I just want to say I've learned a lot in this course and I think the biggest thing I have learned is how to properly develop algorithms in a much more efficient way.
I just want to thank you for this experience as I believe it will greatly benefit me in my educational journey.
Happy Holidays.
:)

maze 01 
works as requested

maze 02 
works as requested

maze03
I had difficulty making the projectile method continue independent of the character but the collision with maze walls still occurs.
And the projectile appears when the user presses the space bar and it has been implemented to spawn to the right of the current character position 

maze04 
I was able to get the enemies to move randomly within the maze restrictions but since I had trouble with the projectile in maze03 I could not implement the enemies disappearing on
collision with the projectile block.

game.js:219 RuntimeError: memory access out of bounds
    at collide_right_enemies (<anonymous>:wasm-function[10]:0x256)
    at step (<anonymous>:wasm-function[17]:0x632)
    at step (http://wasm.cdm.depaul.edu/asafoadu/project/game.js:213:26)
step @ game.js:219
requestAnimationFrame (async)
(anonymous) @ game.js:222
Promise.then (async)
canvasApp @ game.js:172

This error occurs when I try to make the projectile not draw when it will collide with an enemy. I could not quite figure out what it meant so I was not able to implement the method.
It has been commented out so the program still runs.
The function which causes this error is $collide_right_enemies

