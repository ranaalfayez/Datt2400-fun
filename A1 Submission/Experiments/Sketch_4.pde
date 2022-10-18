int N = 15;
float[] strandX = new float[N]; //Ring X array
float[] strandY = new float[N]; //Ring Y array

//how many collumns and rows in my grid
int cols = 2;
int rows = 2;

//variables to hold stepsize (spacing in the grid)
int stepx, stepy;

//variables for column and row position
int col = 0;
int row = 0;

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
      strokeWeight(1.5);
      rect(x, y, stepx, stepy);
      ellipse( x + stepx/2, y + stepy/2, stepx, stepy);

      pushMatrix();
      translate(x + stepx/2, y + stepy/2);
      treeRings();
      popMatrix();
    }
  }
}

void treeRings () {
  for (float k=random(10, 15); k>0; k--) { //number of rings
    float w = random(5); //thickness of rings
    strokeWeight((int)w);
    stroke(random(255), random(255), random(255));
    noFill();

    beginShape();
    for (int l = 0; l < N; l++)
      curveVertex(strandX[l], strandY[l]);
    curveVertex(strandX[0], strandY[0]);
    curveVertex(strandX[1], strandY[1]);
    curveVertex(strandX[2], strandY[2]);
    endShape();

    for (int m = 0; m < N; m++) {
      float gap = random(5, 8); // gaps between rings
      float wave = m * TWO_PI / N;
      strandX[m] += gap * cos(wave);
      strandY[m] += gap * sin(wave);
    }
  }
}

void mouseClicked() {
  redraw();
}
