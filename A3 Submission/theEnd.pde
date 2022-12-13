void theEnd() {
  musicofthebees.amp(0.8);
  background(25);
    textSize(40);

  locXb += (speedX * dirX);
  locYb += (speedY * dirY);

  //"wall sides"

  if (locXb > width) {
    dirX = -1;
    speedX = random(1, 4);
  }
  if (locXb < 0) {
    dirX = 1;
    speedX = random(1, 4);
  }

  //wall top and bottom
  if (locYb > height) {
    dirY = -1;
    speedY = random(1, 4);
  }
  if (locYb < 0) {
    dirY = 1;
    speedY = random(1, 4);
  }


  if (mousePressed) {
    fX += (mouseX - fX) * .05;  //easing for X
    fY += (mouseY - fY) * .05;  //easing for Y
  } else {

    fX += (locXb - fX) * .05;  //easing for X
    fY += (locYb - fY) * .05;  //easing for Y
  }

  println(counter2);
  println(page);

  if (counter2 == 1) {
    text("I am not sure how I got here... ", width/2, 350);
      text("PRESS SPACEBAR ", 550, 550);
  } else if (counter2 == 2) {
    text("All I know is that I am the last of my kind.", width/2, 300);
      text("PRESS SPACEBAR ", 550, 550);

  } else if (counter2 == 3) {
    text("I am busier than ever.", width/2, 350);
    text("...but the world has changed so much.", width/2, 400);
    text("I wonder what's next for me... ", width/2, 440);
  text("PRESS SPACEBAR ", 550, 550);

  } else if (counter2 == 4) {
    text("I'm not worried.", width/2, 300);
    text("Afterall,", width/2, 350);
    text("I heard that all bees go to heaven...", width/2, 400);
      text("PRESS SPACEBAR ", 550, 550);

  } else if (counter2 >= 5) {
    text("THE END.", width/2, 350);
    bc.run();
  }


  //Bee body
  noStroke();
  fill(255, 233, 59);
  ellipse(fX, fY, 30, 20);
  //Bee eyes
  fill(0);
  ellipse(fX-2, fY-2, 2, 2);
  ellipse(fX-10, fY-2, 2, 2);
  //Bee mouth
  noFill();
  stroke(0);
  strokeWeight(1);
  arc(fX-6, fY, 5, 5, 0, PI);
  //Bee stripe
  strokeWeight(3);
  fill(0);
  arc(fX+4, fY, 12, 12, PI+HALF_PI, TWO_PI+HALF_PI);
  //Bee wings
  strokeWeight(2);
  stroke(150);
  fill(220);
  arc(fX+6, fY-10, 10, 10, -PI, 0);
  arc(fX-4, fY-10, 10, 10, -PI, 0);
}


class Bee
{
  int diameter;
  float x, y;
  float dx, dy, dz;

  Bee() {
  }

  Bee(int D, float X, float Y)
  {
    diameter = D;
    x = X;
    y = Y;
    dx = random(-vel, vel);
    dy = random(-vel, vel);
  }

  void run()
  {
    move();
    change_momentum();
    display();
  }

  void move()
  {

    float targetX;
    float targetY;
    float easing = 0.02;

    if (x - mouseX >= -100 && x - mouseX <= 100 && y- mouseY >= -100  && y- mouseY <= 100) {

      targetX = mouseX;
      dx = targetX - x;

      if (abs(dx) > 1) {
        x += dx * easing;
      }

      targetY = mouseY;
      dy = targetY - y;

      if (abs(dy) > 1) {
        y += dy * easing;
      }
    } else {

      x += dx;
      y += dy;

      if (x > width) {
        x = width;
        dx = 0;
      }
      if (x < 0) {
        x = 0;
        dx = 0;
      }
      if (y > height) {
        y = height;
        dy = 0;
      }
      if (y < 0) {
        y = 0;
        dy = 0;
      }
    }
  }

  void change_momentum()
  {
    dx += random(-acc, acc);
    dy += random(-acc, acc);

    if (dx >  vel) dx =  vel;
    if (dx < -vel) dx = -vel;
    if (dy >  vel) dy =  vel;
    if (dy < -vel) dy = -vel;
  }

  void display()
  {
    noStroke();
    fill(random(200, 255));
    ellipse (x+2, y-2, 10, random(30));
    fill(255, 219, 13);
    ellipse (x, y, 15, 10);
  }
}

class Colony
{
  ArrayList bees = new ArrayList();

  Colony() {
  }

  void add(Bee b)
  {
    bees.add(b);
  }

  void run()
  {
    for (int i = 0; i < bees.size(); i++)
    {
      Bee b = (Bee)bees.get(i);
      b.run();
    }
  }
}
