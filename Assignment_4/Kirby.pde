//Kirby's feeding frenzy has the player move Kirby left and right to grab the tomato and avoid the gordo
class Kirby {
  // the variables for the kirby minigame
  PVector gordo;
  PVector gordo2;
  PVector maximTomato;
  PVector speed;
  PVector acceleration;
  PVector Kirby;
  PVector grass;
  int interval;
  int direction;
  int spacing;
  float timer;
  PImage player;
  PImage tomato;
  PImage enemy;
  PImage ground;

  Kirby() {
    // giving the variables their values and the images their sprites
    player = loadImage("Kirby.png");
    tomato = loadImage("tomato.png");
    enemy = loadImage("gordo.png");
    ground = loadImage("grass.png");
    interval = 40;
    spacing = 15;
    timer = 300.0;
    speed = new PVector(0, 0.3);
    acceleration = new PVector(0, 0.05);
    grass = new PVector(width/4, 370);

    // initializing the positions of the gordos and tomato
    gordo = new PVector((interval * int(random(1, 5))), 220);
    gordo2 = new PVector((interval * int(random(1, 5))), 220);
    maximTomato = new PVector((interval * int(random(1, 5))), 220);
    if (maximTomato.x == gordo.x || maximTomato.x == gordo2.x) {
      maximTomato = new PVector((interval * int(random(1, 5))), 220);
    }
  }

  void display() {
    //displays the sprites and timers
    image(ground, grass.x, grass.y);
    image(enemy, gordo.x, gordo.y);
    image(enemy, gordo2.x, gordo2.y);
    image(tomato, maximTomato.x, maximTomato.y);
  }
}
