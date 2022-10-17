/**
 * Playing around with 'Mouse 2D' from processing sample code and the in-class code from Lecture 1
 * September 10, 2022
 *
 * Moving the mouse changes the position and size of each box.
 */

void setup() { //preface function
  size(400, 400); //canvas size
  rectMode(CENTER);
}

void draw() {
  background(75); //grey bg colour
  
  //translate individual square
  pushMatrix();
  translate(mouseY, mouseX);
  rotate(frameCount*0.1);
  fill(200, 500, 100); //
  rectMode(CENTER);
  rect(0, 0, 10, 10);
  popMatrix();

  fill(255, 204);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  
  fill(255, 204);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}
