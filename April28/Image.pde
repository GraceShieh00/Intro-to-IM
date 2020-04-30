//Grace Shieh
//Intro to IM Image Assignment
//April 28, 2020
//This shows an image of a girl in umbrella with apples raining from the sky

PImage umbrella; //image of the girl holding umbrella
PImage apple; //image of an apple
Apple myApple1; //rain droplets
Apple[] myApple1Array = new Apple[10]; //makes ten apples that fall from the sky
int applelocation = 20;
float x, y;
int value=0;
void setup() {
  size (400, 600);
  umbrella = loadImage("Umbrella.jpg");
  apple = loadImage("Apple.png");
  for (int i=0; i< myApple1Array.length; i++) {
    myApple1Array[i] = new Apple(color(255), random(applelocation, width-applelocation), 
      random(applelocation, height-applelocation), 15); //sets the apple to fall from random 
      //locations on the canvas
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

class Apple {// the class of apples
  color c;
  float xpos;
  float ypos;
  float yspeed;


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
    // creates the shape and color of the apples
    // the image here replaces the circles with apple images
  }

  void rain() {
    ypos = ypos+ yspeed/2;
    if (ypos > height) {
      ypos = 0;
    } //dictates the speed of the apples
  }
}

//void mouseClicked() {
//  if(value == 0){
//   tint(205,0,120);
//  } else {
//     value = 0;
//  }
//}
