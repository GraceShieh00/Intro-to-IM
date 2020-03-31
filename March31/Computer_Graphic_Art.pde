void setup()
{
  background(0);
  size(300, 300);
  noFill();
  stroke(211, 211, 211);
  drawSquare();
}
void draw()
{//duplicates the center block into the four corners
  block();
  pushMatrix();
  translate(-100, -100);//draws the upper left block
  block();
  translate(0, 200);//draws the lower left block
  block();
  popMatrix();
  pushMatrix();
  translate(100, 100);//draws the lower right block
  block();
  translate(0, -200);//draws the upper right block
  block();
  popMatrix();
  pushMatrix();
  rotatedBlock();
  popMatrix();//block left of the central block
  pushMatrix();
  translate(200, 0);
  rotatedBlock();
  popMatrix();//block right of the central block
  pushMatrix();
  translate(100, 100);
  rotatedBlock();
  popMatrix();//block below the central block
  pushMatrix();
  translate(100, -100);
  rotatedBlock();
  popMatrix();//block above the central block
}

void drawSquare()
{
  //square at the center
  pushMatrix();
  translate(100, 100);
  square(0, 0, 100);
  popMatrix();
}

void drawRectangle()
{
  //rectangles inside the square
  pushMatrix();
  scale(0.5, 1.2);
  translate(150, -25);
  drawSquare();
  popMatrix();//outermost rectangle
  pushMatrix();
  scale(0.25, 1.3);
  translate(450, -34);
  drawSquare();
  popMatrix();//second outer rectangle
  pushMatrix();
  scale(0.2, 1.35);
  translate(600, -38);
  drawSquare();
  popMatrix();//third outer rectangle
  pushMatrix();
  scale(0.25, 1.35);
  translate(450, -38);
  drawSquare();
  popMatrix();//fourth rectangle
  pushMatrix();
  scale(0.1, 1.35);
  translate(1353, -38);
  drawSquare();
  popMatrix();//fifth rectangle (as counted from outside)
  pushMatrix();
  scale(0.05, 1.38);
  translate(2850, -40.5);
  drawSquare();
  popMatrix();//sixth rectangle (as counted from outside); also the innermost rectangle
}

void block()
{//draws the central block that consists of the square and all of the rectangles within
  drawSquare();
  drawRectangle();
}

void rotatedBlock()
{//one unit of block rotated so the longer rectangle lines are now horizonal instead of vertical
  rotate(radians(90));
  translate(0, -200);
  block();
}
