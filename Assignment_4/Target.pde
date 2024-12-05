// target shooter requires the player to shoot targets that appear on screen and not shoot the anti targets
class Target {

  // all the variables for the minigame and images
  PVector crosshair;
  PVector target[];
  boolean isAnti;
  int targets;
  int antiTargets;
  float timer;
  PImage cross;
  PImage bullsEye;
  PImage antiBullsEye;

  Target() {
    // giving the variables and images their values and sprites
    crosshair = new PVector((constrain(mouseX, width/2, width)), (constrain(mouseY, height/2, height)));
    // goes through the list of arrays to give the targets their x and y values
    for (int a = 0; a < 9; a++){
    for (int i = 240; i < 360; i += 60) {
      for (int h = 240; h < 360; h += 60) {
        target[a] = new PVector(i, h);
      }
    }
    }
    cross = loadImage("crosshair.png");
    bullsEye = loadImage("target.png");
    antiBullsEye = loadImage("anti-target");
  }
}
