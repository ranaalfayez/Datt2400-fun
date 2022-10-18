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
  //background(255);

  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; j++) {
  //    //variables for our x and y positions
  //    float x = i*stepx;
  //    float y = j*stepy;

  //    stroke(random(255), random(255), random(255));
  //    strokeWeight(1.5); //thickness of ring
  //    rect(x, y, stepx, stepy);
  //    ellipse( x + stepx/2, y + stepy/2, stepx, stepy);

  //    for (float k=random(12, 20); k>0; k--) { //number of rings
  //      stroke(random(255), random(255), random(255));
  //      //strokeWeight(random(1, 3)); //thickness of ring
  //      float w = random(5);
  //      strokeWeight((int)w);
  //      float num = random(12, 15); //gaps between rings
  //      ellipse(x + stepx/2, y + stepy/2, k*num, k*num);


  translate(0.5 * width, 0.5 * height);

  for (float k=random(25, 30); k>0; k--) { //number of rings
    float w = random(5);
    stroke(random(255), random(255), random(255));
    strokeWeight((int)w);
    noFill();

    beginShape();
    for (int l = 0; l < N; l++)
      curveVertex(strandX[l], strandY[l]);
    curveVertex(strandX[0], strandY[0]);
    curveVertex(strandX[1], strandY[1]);
    curveVertex(strandX[2], strandY[2]);
    endShape();

    for (int m = 0; m < N; m++) {
      float s = random(5, 15) + w; // random(1)
      float theta = m * TWO_PI / N;
      strandX[m] += s * cos(theta);
      strandY[m] += s * sin(theta);
    }
  }
}

void mouseClicked() {
  redraw();
}
