float num = random(10, 25); // how many circles are drawn (these become our rings)

void setup() {
  size (800, 800);//setup the size of my canvas
  ellipseMode(CENTER);
  rectMode(CORNER);

  //set the fill color to 0 - effects the ellipse fill
  fill(0);
  noLoop();
}

void draw() {
  background(255);
      stroke(random(255), random(255), random(255));
      rect(0, 0, width, height);
      ellipse(0 + width/2, 0 + height/2, width, height);

      for (float k=random(20, 30); k>0; k--) { //number of rings
        stroke(random(255), random(255), random(255));
        strokeWeight(random(1,3)); //thickness of ring
        float num = random(10, 30); //gaps between rings
        ellipse(0 + width/2, 0 + height/2, k*num, k*num);
      }
    }
