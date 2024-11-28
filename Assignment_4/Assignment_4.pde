/* Mini game mayhem by Nicolas Ajurias
multitask and play 4 different games at once to get a high score!
failing to earn points in a minigame for too long or reaching a fail state
will lose a life, lose all 4 you have and its GAME OVER */
import processing.sound.*;

int gameState;
PImage Title;
PImage Tutorial;
PImage Start;

// sets up the frame rate, canvas size, image mode, and the intial game state of the game (the title screen)
void setup(){
 frameRate(60);
 size(400, 400);
 imageMode(CENTER);
 gameState = 0;
}

void draw(){
  
  // using an if, else if ladder to check the gamestate and load the proper graphics and code
  // 0 = title screen, 1 = tutorial, 2 = in game, 3 = game over
  if (gameState == 0){
   background(0); 
  } else if (gameState == 1){
   background(255);
  } else if (gameState == 2){
    background(0, 50, 255);
  } else if (gameState == 3){
    background(255, 0, 0);
  }
}

void mouseClicked(){
  gameState += 1;
  println(gameState);
}
