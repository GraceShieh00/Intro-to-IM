void setup()
{
  size(500, 500);
}

void draw()
{
  background(255, 160, 87);

  //face
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
}
