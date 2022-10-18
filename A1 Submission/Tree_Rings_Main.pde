import processing.svg.*;
boolean record;

int N = int(random(15, 20));
float[] ringX = new float[N]; //Ring X array
float[] ringY = new float[N]; //Ring Y array

//how many collumns and rows in my grid
int cols = 2;
int rows = 1;

//variables to hold stepsize (spacing in the grid)
int stepx, stepy;

//variables for column and row position
int col = 0;
int row = 0;

void setup() {
  size (1600, 800);
  clear();
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
  if (record){
    beginRecord(SVG, "frame-####.svg");
  }
  background(26, 23, 24);
  stroke(random(255), random(255), random(255));
  strokeWeight(1.5);
  fill (0);
  rect(0, 0, width/2, height);

///randomly coloured Tree Rings
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //variables for our x and y positions
      float x = i*stepx;
      float y = j*stepy;

      for (float k=random(20, 30); k>0; k--) { //number of rings
        float w = random(5); //thickness of rings
        strokeWeight((int)w);
        stroke(random(255), random(255), random(255));
        noFill();

        pushMatrix();
        translate(x + stepx/2, y + stepy/2);
        beginShape();
        for (int l = 0; l < N; l++)
          curveVertex(ringX[l], ringY[l]);
        curveVertex(ringX[0], ringY[0]);
        curveVertex(ringX[1], ringY[1]);
        curveVertex(ringX[2], ringY[2]);
        endShape();

        popMatrix();
        for (int m = 0; m < N; m++) {
          float gap = random(5, 10); // gaps between rings
          float wave = m * TWO_PI / N;
          ringX[m] += gap * cos(wave);
          ringY[m] += gap * sin(wave);
        }
      }
    }
  }
  
/// Outline Circle for first Tree Ring set
  stroke(random(255), random(255), random(255));
  strokeWeight(1.5);
  ellipse( width/4, height/2, width/2, height);
  
  if (record) {
    endRecord();
    record = false;
  }
}

void mouseClicked() {
  record = true;
  clear();
  redraw();
}

void clear() {
  for (int i = 0; i < N; i++) {
    ringX[i] = 0;
    ringY[i] = 0;
  }
  background(26, 23, 24);
}
