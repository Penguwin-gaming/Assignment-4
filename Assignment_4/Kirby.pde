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
    spacing = 20;
    timer = 300.0;
    speed = new PVector(0, 0.06);
    acceleration = new PVector(0, 0.01);
    grass = new PVector(width/4, 370);
    Kirby = new PVector(20, 340);
    
    // initializing the positions of the gordos and tomato
    gordo = new PVector((interval * int(random(1, 6))) - spacing, 220);
    gordo2 = new PVector((interval * int(random(1, 6))) - spacing, 220);
    maximTomato = new PVector((interval * int(random(1, 6))) - spacing, 220);
  }

  void display() {
    //displays the sprites and timers
    image(ground, grass.x, grass.y);
    image(enemy, gordo.x, gordo.y);
    image(enemy, gordo2.x, gordo2.y);
    image(tomato, maximTomato.x, maximTomato.y);
    fill(255, 0, 0);
    rect(0, 380, map(timer, 0, 300.0, 0, width/2), 20);
    image(player, Kirby.x, Kirby.y);
  }

  void update() {
    // adds the value of the speed to the gordos and tomatos
    gordo.add(speed);
    gordo2.add(speed);
    maximTomato.add(speed);

    // checks if a tomato is in the same spot as a gordo and moves it
    if (maximTomato.x == gordo.x || maximTomato.x == gordo2.x) {
      maximTomato = new PVector((interval * int(random(1, 6))) - spacing, 220);
    }
    
    // adds the acceleration value to speed
    speed.add(acceleration);
    
    // checks if the objects fell to the bottom of the screen and respawns them, and reduces the speed back to original value
    if (gordo.y > 360){
      gordo = new PVector((interval * int(random(1, 6))) - spacing, 220);
      speed = new PVector(0, 0.20);
    }
    if (gordo2.y > 360){
      gordo2 = new PVector((interval * int(random(1, 6))) - spacing, 220);
      speed = new PVector(0, 0.20);
    }
    if (maximTomato.y > 360){
      maximTomato = new PVector((interval * int(random(1, 6))) - spacing, 220);
      speed = new PVector(0, 0.20);
    }
    
    if(Kirby.x < 0){
      Kirby.x += 40;
    } else if(Kirby.x > width/2){
      Kirby.x -= 40;
    }
  }
  
  void winCondition(){
    
    
  }
}
