// target shooter requires the player to shoot targets that appear on screen and to ignore the anti targets
class Target {

  // all the variables for the minigame and images
  int[] targetX = new int[9];
  int[] targetY = new int[9];
  int randomChance;
  int[] target = new int[9];
  int positions;
  float timer;
  PImage cross;
  PImage bullsEye;
  PImage antiBullsEye;

  Target() {
    // giving the variables and images their values and sprites
    positions = 240;
    timer = 300.0;
    randomChance = 2;
    // goes through the list of arrays to give the targets their x and y values
    for (int i = 0; i < 9; i++) {
      targetX[i] = positions;
      positions = positions + 60;
      if (positions > 360) {
        positions = 240;
      }
    }
    for (int i = 0; i < 9; i++) {
      targetY[i] = positions;
      if (i == 2) {
        positions = positions + 60;
      } else if (i == 5) {
        positions = positions + 60;
      }
    }
    // randomizes the target if is a regular one or anti target
    for (int i = 0; i < 9; i++) {
      target[i] = int (random(0, 3));
    }
    // loading the sprites for the minigame
    cross = loadImage("crosshair.png");
    bullsEye = loadImage("target.png");
    antiBullsEye = loadImage("anti-target.png");
  }

  void display() {
    // using a for loop to draw the targets on the screen
    for (int i = 0; i < 9; i++) {
      if (target[i] < randomChance) {
        image(bullsEye, targetX[i], targetY[i]);
      } else {
        image(antiBullsEye, targetX[i], targetY[i]);
      }
    }
    // draws the crosshair and timer
    image(cross, mouseX, mouseY);
    fill(255, 0, 0);
    rect(width/2, height-20, map(timer, 0, 300.0, 0, width/2), 20);
  }

  void update() {
    // ticks down the timer
    timer = timer - (1.0 + (score / 100));
  }

  void winCondition() {
    // checks if the timer runs out. if so then they lose a life
    if (timer < 0) {
      lives = lives - 1;
      timer = 300.0;
      randomize();
    }
  }

  void shoot() {
    // checks the 'hit boxes' of the target when the player shoots
    for (int i = 0; i < 9; i++) {
      if (target[i] < 2 && mouseX > targetX[i] - 20 && mouseX < targetX[i] + 20 && mouseY > targetY[i] - 20 && mouseY < targetY[i] + 20) {
        score = score + 1;
        timer = 300.0;
        randomize();
      } else if (mouseX > targetX[i] - 20 && mouseX < targetX[i] + 20 && mouseY > targetY[i] - 20 && mouseY < targetY[i] + 20) {
        lives = lives - 1;
        randomize();
      }
    }
  }

  void randomize() {
    // re randomizes the anti targets when called for
    for (int i = 0; i < 9; i++) {
      target[i] = int (random(0, 3));
    }
  }
}
