// creates the class Block, which will be the building blocks of the rain droplets
class Block { 
  color c;
  float xpos;
  float ypos;
  float yspeed;

  // The Constructor is defined with arguments.
  Block(color tempC, float tempXpos, float tempYpos, float tempyspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempyspeed;
  }

  void display() {
    noStroke();
    fill(c);
    rect(xpos, ypos, 10, 30);
    // creates the shape and color of the rain droplets
  }

  void rain() {
    ypos = ypos+ yspeed/2;
    if (ypos > height) {
      ypos = 0;
    } //dictates the speed of the rain droplets
  }
}
