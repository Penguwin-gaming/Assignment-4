/* Mini game mayhem by Nicolas Ajurias
 multitask and play 4 different games at once to get a high score!
 failing to earn points in a minigame for too long or reaching a fail state
 will lose a life, lose all 4 you have and its GAME OVER */
// sprites are made by me, kirby is a trade mark of nintendo (please don't sue me)
Button buttonGame;
Target targetGame;
Kirby kirbyGame;
Blue blueGame;

int gameState;
PImage Title;
PImage Tutorial;
PImage Start;
PImage Heart;
boolean inGame;
int lives;
int score;

// sets up the frame rate, canvas size, image mode, and the intial game state of the game (the title screen)
void setup() {
  frameRate(60);
  size(400, 400);
  imageMode(CENTER);
  gameState = 0;
  // sets the amount of lives and score for the game
  lives = 4;
  score = 0;

  // loads the sprites for title screen and hearts
  Heart = loadImage("heart.png");
  Title = loadImage("minigame.png");
  Tutorial = loadImage("tutorial.png");
  Start = loadImage("play.png");

  buttonGame = new Button();
  targetGame = new Target();
  kirbyGame = new Kirby();
  blueGame = new Blue();
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

    // calls on the functions of the button minigame
    buttonGame.display();
    buttonGame.update();
    buttonGame.winCondition();

    // calls on the functions of the target minigame
    targetGame.display();
    targetGame.update();
    targetGame.winCondition();

    // calls on the functions of the kirby minigame
    kirbyGame.display();
    kirbyGame.update();
    kirbyGame.winCondition();

    //calls on the functions of the colour minigame
    blueGame.display();
    blueGame.update();
    blueGame.winCondition();

    // displays the hearts based on the amount of lives you have
    if (lives == 4) {
      image(Heart, width/2, 40);
      image(Heart, width/2, 140);
      image(Heart, width/2, 220);
      image(Heart, width/2, 360);
    } else if (lives == 3) {
      image(Heart, width/2, 40);
      image(Heart, width/2, 140);
      image(Heart, width/2, 220);
    } else if (lives == 2) {
      image(Heart, width/2, 40);
      image(Heart, width/2, 140);
    } else if (lives == 1) {
      image(Heart, width/2, 40);
    } else {
      gameState = 3;
    }
  } else if (gameState == 3) {
    // background screen for game over
    background(255, 0, 0);
    println(score);
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
  if (inGame == true) {
    targetGame.shoot();
  }
}

void keyPressed() {
  // pressing r will reset the game back to the title screen, whether you are on the tutorial screen, in game, or in game over screen
  if (keyCode == 'R') {
    gameState = 0;
    inGame = false;
    lives = 4;
    score = 0;
  }

  // the controls for the button minigame, code will run in it when space is pressed
  if (keyCode == ' ' && inGame == true) {
    buttonGame.input();
  }

  // the controls for the kirby minigame, moves kirby left and right
  if (keyCode == 'A' && inGame == true) {
    kirbyGame.Kirby.x -= 40;
  }
  if (keyCode == 'D' && inGame == true) {
    kirbyGame.Kirby.x += 40;
  }

  // the controls for the colour minigame, if the sprite is blue then hit y, if not then hit n for a point, and vice versa
  if (keyCode == 'Y' && inGame == true && blueGame.randomSprite % 2 == 0) {
    score = score + 1;
    blueGame.timer = 480.0;
    blueGame.randomSprite = int(random(1, 8));
  } else if (keyCode == 'Y' && inGame == true && blueGame.randomSprite % 2 != 0) {
    lives = lives - 1;
    blueGame.timer = 480.0;
    blueGame.randomSprite = int(random(1, 8));
  }
  if (keyCode == 'N' && inGame == true && blueGame.randomSprite % 2 != 0) {
    score = score + 1;
    blueGame.timer = 480.0;
    blueGame.randomSprite = int(random(1, 8));
  } else  if (keyCode == 'N' && inGame == true && blueGame.randomSprite % 2 == 0) {
    lives = lives - 1;
    blueGame.timer = 480.0;
    blueGame.randomSprite = int(random(1, 8));
  }
}
