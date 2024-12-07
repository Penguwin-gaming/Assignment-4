//button pusher requires the player to push a button a certain number of times before the timer ticks to zero
class Button {
  // the variables for the positions of the sprites in the minigame, and the images for them. as well as the timer and player pushes
  PVector button;
  PVector playerCounter;
  PVector counter;
  PImage buttonSprite;
  PImage[] playerSprite;
  PImage[] gameSprite;
  int playerPress;
  int press;
  Float timer;

  Button() {
    // giving the variables their values and loading the sprites
    button = new PVector(100, 150);
    playerCounter = new PVector(40, 80);
    counter = new PVector(160, 80);
    timer = 480.0;
    playerPress = 0;
    press = int(random(1, 9));

    // the sprites and the array for the button counter sprites
    buttonSprite = loadImage("button.png");

    playerSprite = new PImage[10];
    for (int i = 0; i < playerSprite.length; i++) {
      playerSprite[i] = loadImage("counter-" + (i+1) + ".png");
    }

    gameSprite = new PImage[10];
    for (int i = 0; i < gameSprite.length; i++) {
      gameSprite[i] = loadImage("counter-" + (i+1) + ".png");
    }
  }

  void display() {
    // displays the sprites at the coordinates listed above
    image(buttonSprite, button.x, button.y);
    image(playerSprite[playerPress], playerCounter.x, playerCounter.y);
    image(gameSprite[press], counter.x, counter.y);
    fill(255, 0, 0);
    rect(0, 0, map(timer, 0, 480.0, 0, width/2), 20);
  }

  void update() {
    // ticks down the timer
    timer = timer - (1.0 + (score / 100));
  }


  void winCondition() {
    // checks when the timer runs out if the player has clicked the button the right amount of times and resets the timer
    if (timer < 0 && playerPress == press) {
      score = score + 1;
    }
    if (timer < 0 && playerPress != press) {
      lives = lives - 1;
    }
    if (timer < 0) {
      playerPress = 0;
      press = int(random(1, 9));
      timer = 480.0;
    }
  }


  void input() {
    // a function that increments the player counter when it is called
    playerPress ++;

    if (playerPress > 9) {
      playerPress = 9;
    }
  }
}
