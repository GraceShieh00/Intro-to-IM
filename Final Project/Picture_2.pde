//Self Portrait + Celebrating the Graduating Seniors
//This self portrait was first created in March 19 after the class' first introduction to processing
//therefore this code was written without the knowledge of functions, hence its long nature
//Grace Shieh, Intro to IM
//March 19, 2020; modified May, 2020
//The self portrait is a message to celebrate those graduating despite of the graduation ceremony change
//The year 2020 rains down, symnbolizing that it will eventually be washed away, 
//and wishes congratulations to the seniors with spotlights on them.

void picture2() { //this creates the second picture from the left inside the gallery

  picture5isshown = false; //sets specific condition mousepress will only affect the corresponding image
  background(255, 160, 87);

  //creates face
  fill(245, 203, 156);
  noStroke();
  ellipse(250, 150, 150, 180);


  //nose
  strokeWeight(2);
  stroke(58, 36, 11);
  fill(242, 204, 179);
  arc(250, 160, 20, 33, radians(180), radians(270));

  //sclera
  fill(255, 255, 255);
  noStroke();
  circle(220, 130, 30);
  circle(280, 130, 30);

  //pupil
  fill(91, 53, 28);
  noStroke();
  circle(220, 122, 15);
  circle(280, 122, 15);

  //glasses
  noFill();
  stroke(4);
  strokeWeight(3);
  circle(220, 130, 50);
  circle(280, 130, 50);
  line(245, 132, 255, 132); //on top of nose
  line(172, 132, 195, 132); //left 
  line(305, 132, 328, 132); //right 

  //hair
  stroke(48, 34, 24);
  strokeWeight(12);
  line(200, 80, 170, 240);
  line(190, 80, 150, 250);
  line(190, 80, 130, 250);
  line(300, 80, 320, 240);
  line(310, 80, 340, 250);
  line(310, 80, 360, 250);
  arc(250, 90, 120, 80, PI, TWO_PI);
  arc(250, 100, 120, 80, PI, TWO_PI);
  arc(250, 110, 120, 80, PI, TWO_PI);
  arc(250, 120, 120, 80, PI, TWO_PI);

  //mouth
  stroke(236, 47, 85);
  strokeWeight(4);
  fill(236, 47, 85);
  arc(250, 190, 30, 10, PI+HALF_PI, TWO_PI);

  //neck
  fill(87, 6, 140);
  noStroke();
  rect(230, 240, 40, 40);

  //body- black shirt
  fill(0, 0, 0);
  triangle(130, 500, 170, 280, 250, 500);
  triangle(250, 500, 330, 280, 370, 500);

  //hands
  fill(245, 203, 156);
  circle(16, 260, 60);
  circle(484, 260, 60);

  //arms
  fill(0, 0, 0);
  triangle(10, 300, 50, 250, 230, 400);
  triangle(270, 400, 450, 250, 490, 300);

  //body- white top
  fill(245, 238, 239);
  triangle(170, 280, 250, 500, 290, 280);
  triangle(250, 280, 250, 500, 330, 280);

  //body- purple tie
  fill(87, 6, 140);
  triangle(210, 280, 250, 450, 290, 280);

  textSize(70);//*modified, spells "congrats"
  fill(253, 111, 158);
  text("C", width*6/7, height*2/9);
  text("O", width*6/7, height*3/9);
  text("G", width*6/7, height*4/9);
  text("R", width*6/7, height*5/9);
  text("A", width*6/7, height*6/9);
  text("T", width*6/7, height*7/9);
  text("S", width*6/7, height*8/9);
}

class Block { //*creates the 2020 that rains down from the top
  color c;
  float xpos;
  float ypos;
  float yspeed;

  //constructor 
  Block(color tempC, float tempXpos, float tempYpos, float tempyspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempyspeed;
  }

  void display() {
    noStroke();
    pushMatrix();
    fill(255, 255, 173, 140);
    quad(xpos+30, ypos+50, 640, 480, 600, 380, 600, 430); 
    //the quad nature allows the yellow spotlight to be shine on the character while constantly changing
    popMatrix();
    pushMatrix();
    fill(c);
    textSize(40);
    text("2020", xpos, ypos); //the text of 2020
    popMatrix();
  }

  void rain() {
    ypos = ypos+ yspeed/2;
    if (ypos > height) {
      ypos = 0;
    } //dictates the speed of the rain droplets
  }
}
