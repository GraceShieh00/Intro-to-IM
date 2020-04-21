Rotater[] rotaters;
Circle myCircle1; //rain droplets
Circle[] myCircle1Array = new Circle[10]; //first group of rain droplets
int blocklocation = 20;
float x, y;

void setup() {
  size(640, 360);
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
  for (int i=0; i< myCircle1Array.length; i++) {
    myCircle1Array[i] = new Circle(color(200, 228, 255), random(blocklocation, width-blocklocation), 
      random(blocklocation, height-blocklocation), 15);
  }
}

void draw() {
  background(0);
  stroke(135, 206, 235);
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
  }
  if (mousePressed == true) {
    for (int i=0; i< myCircle1Array.length; i++) {
      myCircle1Array[i].rain();
      myCircle1Array[i].display();
    }
  }
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //each rotater has a direction, make a coin flip initially to determine dir.
    direction=-1;
    float coinflip = random(1);
    if (coinflip>.5)
      direction=1;
  }


  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=.98;
    acceleration=0.0001;
    line(x, y, 2, 2);
    stroke(205, 205, 158);

    if (mousePressed == true) {
      circle(x, y, 5);
    } else {
      line(x, y, 2, 2);
      stroke(135, 206, 255);
    }
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is close enough give some acceleration
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
      circle(x, y, random(y/3));
      fill(255, 255, 158);
      circle(x, y, random(y/3));
      fill(116, 187, 251);
    }
  }
}

class Circle { 
  color c;
  float xpos;
  float ypos;
  float yspeed;


  Circle(color tempC, float tempXpos, float tempYpos, float tempyspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempyspeed;
  }

  void display() {
    noStroke();
    fill(c);
    circle(xpos, ypos, 20);
    // creates the shape and color of the droplets
  }

  void rain() {
    ypos = ypos+ yspeed/2;
    if (ypos > height) {
      ypos = 0;
    } //dictates the speed of the droplets
  }
}
