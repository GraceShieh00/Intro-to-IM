PImage umbrella; 
PImage apple;
Apple myApple1; //rain droplets
Apple[] myApple1Array = new Apple[10];
int applelocation = 20;
float x, y;
int value=0;
void setup() {
  size (400, 600);
  umbrella = loadImage("Umbrella.jpg");
  apple = loadImage("Apple.png");
  for (int i=0; i< myApple1Array.length; i++) {
    myApple1Array[i] = new Apple(color(255), random(applelocation, width-applelocation), 
      random(applelocation, height-applelocation), 15);
  }
}
void draw() {
  background(255);
  image(umbrella, 0, 200, 400, 400);
  for (int i=0; i< myApple1Array.length; i++) {
    myApple1Array[i].rain();
    myApple1Array[i].display();
  }
}

class Apple { 
  color c;
  float xpos;
  float ypos;
  float yspeed;

  // The Constructor is defined with arguments.
  Apple(color tempC, float tempXpos, float tempYpos, float tempyspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempyspeed;
  }

  void display() {
    noStroke();
    fill(c);
    circle(xpos, ypos, 1);
    image(apple, xpos, ypos, 50, 50);
    // creates the shape and color of the rain droplets
  }

  void rain() {
    ypos = ypos+ yspeed/2;
    if (ypos > height) {
      ypos = 0;
    } //dictates the speed of the rain droplets
  }
}
