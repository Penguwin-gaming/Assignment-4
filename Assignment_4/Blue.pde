// is it blue gives the player a sprite to look at, if the sprite is mostly blue. then hit y (yes), if not, then n (no). and vice versa
class Blue {
  // declaring all the 
  PVector yes;
  PVector no;
  PVector colourSprite;
  int randomSprite;
  float timer;
  PImage bF, bP, bR, bC, gR, yF, rP, pC;
  PImage yButton;
  PImage nButton;
  
  Blue() {
    // giving the variables their values
    yes = new PVector(220, 180);
    no = new PVector(380, 180);
    colourSprite = new PVector(300, 100);
    timer = 420.0;
    randomSprite = int(random(1, 8));
    
    // loading the images
    yButton = loadImage ("Y.png");
    nButton = loadImage ("N.png");
    bF = loadImage ("bluefruit.png");
    bP = loadImage ("bluepresent.png");
    bR = loadImage ("bluerobot.png");
    bC = loadImage ("bluecandy.png");
    gR = loadImage ("greenrobot.png");
    yF = loadImage ("yellowfruit.png");
    rP = loadImage ("redpresent.png");
    pC = loadImage ("purplecandy.png");
  }
  
  void display(){
    // draws the sprite that is rolled, the y and n buttons and the timer
   if(randomSprite == 1){
     image (gR, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 2){
     image (bR, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 3){
     image (yF, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 4){
     image (bF, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 5){
     image (rP, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 6){
     image (bP, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 7){
     image (pC, colourSprite.x, colourSprite.y);
   } else if(randomSprite == 8){
     image (bC, colourSprite.x, colourSprite.y);
   }
   
    image (yButton, yes.x, yes.y);
    image (nButton, no.x, no.y);
    fill(255, 0, 0);
    rect(width/2, 0, map(timer, 0, 420.0, 0, width/2), 20);
  }
  
  void update(){
    // ticks down the timer
    timer = timer - (1.0 + (score / 100));
  }
  
  void winCondition(){
    
  }
  
}
