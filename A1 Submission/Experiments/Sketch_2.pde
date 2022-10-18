//how many collumns and rows in my grid
int cols = 2;
int rows = 2;

//variables to hold stepsize (spacing in the grid)
int stepx, stepy;

//variables for column and row position
int col = 0;
int row = 0;

float num = random(10, 25); // how many circles are drawn (these become our rings)

void setup() {
  size (800, 800);
  //setup the size of my canvas
  //value of stepsizes
  stepx = (width / cols);
  stepy = (height / rows);

  ellipseMode(CENTER);
  rectMode(CORNER);

  //set the fill color to 0 - effects the ellipse fill
  fill(0);
  noLoop();
}

void draw() {
  background(255);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //variables for our x and y positions
      float x = i*stepx;
      float y = j*stepy;

      stroke(random(255), random(255), random(255));
      strokeWeight(1.5); //thickness of ring
      rect(x, y, stepx, stepy);
      ellipse( x + stepx/2, y + stepy/2, stepx, stepy);

      for (float k=random(12, 20); k>0; k--) { //number of rings
        stroke(random(255), random(255), random(255));
        strokeWeight(random(1,3)); //thickness of ring
        float num = random(12, 15); //gaps between rings
        ellipse(x + stepx/2, y + stepy/2, k*num, k*num);
      }
    }
  }
}

void mouseClicked(){
  redraw();
}
