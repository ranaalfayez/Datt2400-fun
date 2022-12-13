void intro() {
  background(25);
  textFont(titlefont);

  text = "SONG OF THE BEES ";
  textsize = 60;
  textX = 225;
  textY = 300;
  typewriteText();

  if (frameCount >125) {
    textSize(40);
    text("PRESS SPACEBAR ", 550, 550);
    textSize(30);
    text ("(Headphones Reccommended)", 460, 565, 20);
  }
}

void extendedintro() {
  background(25);
  text("PRESS SPACEBAR ", width/2, 500);
  textsize = 10;
  textX = 225;
  textY = 500;

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
  background(25);
  textSize(40);

  text("PRESS SPACEBAR ", 550, 550);
  println(counter);
  println(page);
  textAlign(CENTER);

  if (counter == 1) {
    text("Hello There ", width/2, 350);
  } else if (counter == 2) {
    text("I am not sure how I got here...", width/2, 350);
    text("All I know is that I am the last of my kind", width/2, 400);
  } else if (counter == 3) {
    text("Sometimes... ", width/2, 250);
    text(" faintly... ", width/2, 300);
    text("when the work is the hardest ", width/2, 350);
    text("and the pollen is the most scarce... ", width/2, 400);

  } else if (counter == 4) {
    text("I can hear the song of my sisters. ", width/2, 350);
  } else if (counter == 5) {
    text("Use the ARROW KEYS to assist me on my journey. ", width/2, 300);
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
