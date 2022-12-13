import processing.sound.*;
SoundFile windambiance;
SoundFile musicofthebees;
String checksprite1;
String checksprite2;
String checksprite3;
boolean checkCollision;

PFont titlefont;
PFont textfont;
PImage bg;
PImage sprite1;
PImage sprite2;
PImage sprite3;
PImage heart;

Hexaboard hexaboard;

float sd = 200;
float mean = 600;

//Setup page and text navigation variables
int page = 1;
int counter = 0; //trigger text to appear on the screen
int counter2 = 1; //trigger text to appear on the screen
boolean progress1 = false;
boolean progress2 = false;
boolean progress3 = false;

boolean showText1 = false;

//declare global variables
Sprite player;
Sprite border;
//Sprite sprite1;
//Sprite sprite2;
//Sprite sprite3;
String text = "This is sample text. ";
int c = 0;
int textcounter = 0;
int textsize = 60;
float textX = 200;
float textY = 300;
float locXb, locYb, speedX, speedY, dirX, dirY;  //automated movement variables
float fX, fY;  //follower variables

final static float MOVE_SPEED = 5;
final static float SPRITE_SCALE = 50.0/128;
final static float SPRITE_SIZE = 50;

final static float RIGHT_MARGIN = 75;
final static float LEFT_MARGIN = 75;
final static float TOP_MARGIN = 75;
final static float BOTTOM_MARGIN = 75;


// unlike from our game, we'll make the boundary variables global
// and draw lines to see them to visualize how scrolling works.
float left_bd, right_bd; // the x-coordinates of left and right boundaries
float top_bd, bottom_bd; // the y-coordinates of top and bottom boundaries

float view_x = 0;
float view_y = 0;

int cols = 100;
int rows = 100;

//variables to hold grid grid spacing
int stepx;
int stepy;

//variables to hold Sprite X and Y
float spritex1;
float spritey1;
float spritex2;
float spritey2;
float spritex3;
float spritey3;

//colony hive simulation variables
float acc = .05;
float vel = .4;
float z_limit = 6;

Colony bc = new Colony();


//initialize them in setup().
void setup() {
  size(800, 600);
  imageMode(CENTER);
  player = new Sprite("player.png", 1.0, 0, 0);
  player.center_x = 0;
  player.center_y = 0;
  hexaboard = new Hexaboard();

  titlefont= loadFont("Gamer-48.vlw");

  windambiance = new SoundFile (this, "493770__quetzalcontla__wind-whistling-sound-2.wav"); //Source: https://freesound.org/people/quetzalcontla/sounds/493770/
  windambiance.play();
  windambiance.loop();

  musicofthebees = new SoundFile (this, "Moon Moon - Marriage - Pianocover Yamaha.mp3"); //source: https://www.youtube.com/watch?v=_-iZmCHCS0U&ab_channel=GraceTV
  checksprite1 = "false";
  checksprite2 = "false";
  checksprite3 = "false";
  checkCollision = false;

  locXb = width/2;
  locYb = height/2;

  dirX = 1;
  dirY = 1;

  speedX = random(1, 3);
  speedY = random(1, 3);

  bg = loadImage("Vignette.png");
  sprite1 = loadImage("treeSprite1.png");
  sprite2 = loadImage("treeSprite2.png");
  sprite3 = loadImage("treeSprite3.png");
  heart = loadImage ("heart.png");

  smooth();
  noStroke();
  //calculation for the stepsize
  stepx = width / cols;
  stepy = height / rows;

  spritex1 = random(-200, 1700);
  spritey1 = random(-200, 1700);
  spritex2 = random(-200, 1700);
  spritey2 = random(-200, 1700);
  spritex3 = random(-200, 1700);
  spritey3 = random(-200, 1700);

  for (int i=0; i<80; i++) {
    bc.add(new Bee(7, random(width), random(height)));
  }
}

// modify and update them in draw().
void draw() {

  if (page == 1) {
    intro();
  }

  if (page == 2) {
    extendedintro();
  }

  if (page == 3) {
    navigate();
  }
  if (page == 4) {
    theEnd();
  }
}


// called whenever a key is pressed.
void keyPressed() {
  if (keyCode == RIGHT) {
    player.change_x = MOVE_SPEED;
  } else if (keyCode == LEFT) {
    player.change_x = -MOVE_SPEED;
  } else if (keyCode == UP) {
    player.change_y = -MOVE_SPEED;
  } else if (keyCode == DOWN) {
    player.change_y = MOVE_SPEED;
  } else if ((keyCode == 32) && (page ==1)) {
    page = 2;
  } else if ((keyCode == 32) && (page ==2) && (counter <6)) {
    counter = counter + 1;
  } else if ((keyCode == 32) && (page ==2) && (counter == 6)) {
    page = page + 1;
    musicofthebees.amp(0.01);
    musicofthebees.play();
      windambiance.amp(0);
    musicofthebees.loop();
  } else if ((keyCode == 32) && (page ==3) && (counter >= 6) && (progress1 == true) && (progress2 == true) && (progress3 == true)) {
    page = page +1;
  } else if (keyCode == 32 && page ==4) {
    counter2 = counter2 +1;
  }
}

// called whenever a key is released.
void keyReleased() {
  if (keyCode == RIGHT) {
    player.change_x = 0;
  } else if (keyCode == LEFT) {
    player.change_x = 0;
  } else if (keyCode == UP) {
    player.change_y = 0;
  } else if (keyCode == DOWN) {
    player.change_y = 0;
  }
}
