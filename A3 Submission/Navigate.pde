void navigate () {
  textsize = 40;
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    float grey = (randomGaussian() * sd) + mean; // value between 0 and 1 (they can be higher or lower but are expected to be between 0 and 1)
    pixels[i] = color(255 * grey);
  }

  updatePixels();
  image(bg, 400, 300);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i*stepx*10;
      float y = j*stepy*15;

      //create a random number using the random function
      float randomvariable = random(10);

      // if statement to see if the random number is bigger than 5
      // if it is we'll draw a randomly colored rectangle
      if (randomvariable > 9) {
        noStroke();
        fill(0, 0, 0);
        rect(x, y, 5, 5);
      }
    }
  }

  scroll(); // scroll() needs to be the first method called!

  //Set border of gameplay
  noFill();
  strokeWeight(200);
  stroke(25, 25, 25);
  rect(-500, -500, 2500, 2500);

  hexaboard.display();
  // sprites to locate.
  image(sprite1, spritex1, spritey1, sprite1.width*0.5, sprite1.height*0.5);
  image(sprite2, spritex2, spritey2, sprite2.width*0.5, sprite2.height*0.5);
  image(sprite3, spritex3, spritey3, sprite3.width*0.5, sprite3.height*0.5);

  player.update();
  player.display();

  if (player.getLeft() <= -430) {
    player.setLeft(-430);
  }
  if (player.getRight() >= 1970) {
    player.setRight(1970);
  }
  if (player.getTop() <= -475) {
    player.setTop(-475);
  }
  if (player.getBottom() >= 1950) {
    player.setBottom(1950);
  }

  fill(0);
  freezing();
  cold();
  warm();
  gettingWarmer();
  activateSprite();

  println(player.center_x + "," + player.center_y);
  println(spritex1 + "," + spritey1);
  println(spritex2 + "," + spritey2);
  println(spritex3 + "," + spritey3);


  println("1:" + checksprite1);
  println("2:" + checksprite2);
  println("3:" + checksprite3);
  println("heart 1:" + progress1);
  println("heart 2:" + progress2);
  println("heart 3:" + progress3);
  println(page);
  println(counter);

  if (progress1 == true) {
    image(heart, view_x + 50, view_y + 50, heart.width*0.15, heart.height*0.15);
  }

  if (progress2 == true) {
    image(heart, view_x + 65, view_y + 50, heart.width*0.15, heart.height*0.15);
  }
  if (progress3 == true) {
    image(heart, view_x + 80, view_y + 50, heart.width*0.15, heart.height*0.15);
  }
  if (progress1 == true && progress2 == true && progress3 == true) {
    text = "PRESS SPACEBAR TO CONTINUE... ";
    textX = view_x + 125;
    textY = view_y + 40;
    typewriteText();
  }
}


void activateSprite () {
  if (dist(player.getLeft(), player.getTop(), spritex1, spritey1) < sprite1.height/3) {
    musicofthebees.amp(0.4);
    checksprite1 = "closest";
    text("I remember the hot season with my sisters...", spritex1 - sprite1.width/2, spritey1 + sprite1.height/3);
    text("The hive would be ALIVE.", spritex1 - sprite1.width/2, spritey1 + sprite1.height/3 + 30);
    text("The gaps between my bones would fill with honeycomb ", spritex1 - sprite1.width/2, spritey1 + sprite1.height/3 + 60);
    progress1 = true;
  } 
  if (dist(player.getLeft(), player.getTop(), spritex2, spritey2) < sprite2.height/3) {
    musicofthebees.amp(0.4);
    checksprite2 = "closest";
    text("I guess some things are just meant to bee...", spritex2- sprite2.width/2, spritey2 + sprite2.height/3);
    progress2 = true;
  }
  if (dist(player.getLeft(), player.getTop(), spritex3, spritey3) < sprite3.height/3) {
    musicofthebees.amp(0.4);
    checksprite3 = "closest";
    text("Today's harvest looks promising.", spritex3 - sprite3.width/2, spritey3 + sprite3.height/3);
    text("I can almost tase the propolis and royal jelly...", spritex3 - sprite3.width/2, spritey3 + sprite3.height/3 + 30);
    progress3  = true;
  }
}

void gettingWarmer () {
  if (dist(player.getLeft(), player.getTop(), spritex1, spritey1) < 100 + sprite1.height/2) {
    musicofthebees.amp(0.30);
    checksprite1 = "closer";
  }
  if (dist(player.getLeft(), player.getTop(), spritex2, spritey2) < 100 + sprite2.height/2) {
    musicofthebees.amp(0.30);
    checksprite2 = "closer";
  }
  if (dist(player.getLeft(), player.getTop(), spritex3, spritey3) < 100 + sprite3.height/2) {
    musicofthebees.amp(0.30);
    checksprite3 = "closer";
  }
}

void warm () {
  if (dist(player.getLeft(), player.getTop(), spritex1, spritey1) < 200 + sprite1.height/2) {
    musicofthebees.amp(0.1);
    checksprite1 = "close";
  }
  if (dist(player.getLeft(), player.getTop(), spritex2, spritey2) < 200 + sprite2.height/2) {
    musicofthebees.amp(0.1);
    checksprite2 = "close";
  }
  if (dist(player.getLeft(), player.getTop(), spritex3, spritey3) < 200 + sprite3.height/2) {
    musicofthebees.amp(0.1);
    checksprite3 = "close";
  }
}

void cold() {
  if (dist(player.getLeft(), player.getTop(), spritex1, spritey1) < 300 + sprite1.height/2) {
    musicofthebees.amp(0.05);
    checksprite1 = "far";
  } else if (dist(player.getLeft(), player.getTop(), spritex2, spritey2) < 300 + sprite2.height/2) {
    musicofthebees.amp(0.05);
    checksprite2 = "far";
  } else if (dist(player.getLeft(), player.getTop(), spritex3, spritey3) < 300 + sprite3.height/2) {
    musicofthebees.amp(0.05);
    checksprite3 = "far";
  }
}

void freezing() {
  if (dist(player.getLeft(), player.getTop(), spritex1, spritey1) < 1000 + sprite1.height/2) {
    musicofthebees.amp(0.01);
    checksprite1 = "not even close";
  } else if (dist(player.getLeft(), player.getTop(), spritex2, spritey2) < 1000 + sprite2.height/2) {
    musicofthebees.amp(0.01);
    checksprite2 = "not even close";
  } else if (dist(player.getLeft(), player.getTop(), spritex3, spritey3) < 1000 + sprite3.height/2) {
    musicofthebees.amp(0.01);
    checksprite3 = "not even close";
  }
}


void scroll() {
  // compute x-coordinate of right boundary
  // if player's right passed this boundary, update view_x
  right_bd = view_x + width - RIGHT_MARGIN;
  if (player.getRight() > right_bd) {
    view_x += player.getRight() - right_bd;
  }
  // compute x-coordinate of left boundary
  // if player's left passed this boundary, update view_x
  left_bd = view_x + LEFT_MARGIN;
  if (player.getLeft() < left_bd) {
    view_x -= left_bd - player.getLeft();
  }
  // compute y-coordinate of bottom boundary
  // if player's bottom passed this boundary, update view_y
  bottom_bd = view_y + height - BOTTOM_MARGIN;
  if (player.getBottom() > bottom_bd) {
    view_y += player.getBottom() - bottom_bd;
  }
  // compute y-coordinate of top boundary
  // if player's top passed this boundary, update view_y
  top_bd = view_y + TOP_MARGIN;
  if (player.getTop() < top_bd) {
    view_y -= top_bd - player.getTop();
  }
  // translate the game world coordinate in the opposite direction
  // of (view_x, view_y).
  translate(-view_x, -view_y);
}
