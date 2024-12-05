/* Mini game mayhem by Nicolas Ajurias
 multitask and play 4 different games at once to get a high score!
 failing to earn points in a minigame for too long or reaching a fail state
 will lose a life, lose all 4 you have and its GAME OVER */
Button buttonGame;

int gameState;
PImage Title;
PImage Tutorial;
PImage Start;
boolean inGame;
int lives;
int score;

// sets up the frame rate, canvas size, image mode, and the intial game state of the game (the title screen)
void setup() {
  frameRate(60);
  size(400, 400);
  imageMode(CENTER);
  gameState = 0;

  Title = loadImage("minigame.png");
  Tutorial = loadImage("tutorial.png");
  Start = loadImage("play.png");
  
  buttonGame = new Button();
}

void draw() {

  // using an if, else if ladder to check the gamestate and load the proper graphics and code
  // 0 = title screen, 1 = tutorial, 2 = in game, 3 = game over
  if (gameState == 0) {
    // background and graphics for the title screen
    background(0);
    image(Title, width/2, height/4);
    image(Tutorial, 100, 290);
    image(Start, 300, 300);
  } else if (gameState == 1) {
    // background and text for the tutorial screen
    background(255);
  } else if (gameState == 2) {
    // draws the backgrounds of the minigames
    background(0, 150, 255);
    fill(255, 200, 100);
    rect(0, 0, width/2, height/2);
    fill(175, 175, 175);
    rect(width/2, 0, width, height/2);
    fill(0, 25, 175);
    rect(width/2, height/2, width, height);
    // sets the amount of lives for the game
    lives = 4;
    buttonGame.display();
    buttonGame.update();
  } else if (gameState == 3) {
    // background screen for game over
    background(255, 0, 0);
  }
}

void mouseClicked() {
  // checks where the mouse is hovering over when the mouse is clicked, and sets the game state to what the player clicked on, this is disabled when in game
  if (mouseX > 0 && mouseX < width/2 && mouseY > height/2 && mouseY < height && inGame == false) {
    gameState = 1;
    inGame = true;
  }
  if (mouseX > width/2 && mouseX < width && mouseY > height/2 && mouseY < height && inGame == false) {
    gameState = 2;
    inGame = true;
  }
  println(gameState);
}

void keyPressed(){
  // pressing r will reset the game back to the title screen, whether you are on the tutorial screen, in game, or in game over screen
  if(keyCode == 'R'){
    gameState = 0;
    inGame = false;
  }
}
