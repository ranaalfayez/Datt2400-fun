int hexW = 10; //enough rows and columns to fill the screen
int hexH = 15;
int radius = 50; //decide how big the hexagon is
int radius2 = 50; //decide how big the hexagon is

Hexagon[][] hexa = new Hexagon[hexW][hexH]; //Object oriented approach

void setup() {
  size(700, 700);
  stroke(255);
  background(255, 235, 190);
  smooth();

  //Create our grid using a nested loop to be able to lay our hexagons atypicaly so that they 'fit' together
  for (int i = 0; i < hexW; i++) {
    for (int j = 0; j < hexH; j++) {
      hexa[i][j] = new Hexagon();
    }
  }
}

void draw() {
  background(255, 235, 190);
  pushMatrix();
  translate(hexW, hexH);
  float shift = 0;

  //This is our hexagon shapes
  for (int i = 0; i < hexW; i++) {
    for (int j = 0; j < hexH; j++) {
      if (j % 2 == 0) {
        shift = radius*3.5 / 2;
      } else {
        shift = 0;
      }

      hexa[i][j].shapedraw(i*radius*3.5+shift, j*radius);
    }
  }
  popMatrix();
  saveFrame("####_out.png");
}


class Hexagon {
  Hexagon() {
  }

  //amount of rotation. How much does the cross rotate each time we draw it
  float rot = (0.03);

  //starting rotation - all start from 0
  float sr = 0;
  float sr2 = 0;

  void shapedraw(float x, float y) {

    if (sr < PI) {
      sr+=rot;
    }
    pushMatrix();
    strokeWeight(6);
    stroke(255, 255, 224);
    noFill();
    translate(x, y);
    rotate(sr);
    beginShape();
    for (int i = 0; i < 7; i++) {
      vertex(radius * cos(radians(360*i/6)), radius * sin(radians(360*i/6)));
    }
    endShape();
    popMatrix();
  }
}
