void setup()
{
  background(0); //black background
  size(300, 300);
  noFill();
  stroke(211, 211, 211);
}
void draw()
{
  for (int i=0; i<100; i=i+100)
  {//draws the five vertical squares on the canvas
    drawSquare(i, 0); //upper left  
    drawSquare(i, 200); //lower left
    drawSquare(100, i+100); //center 
    drawSquare(200, i); //upper right
    drawSquare(200, i+200); //lower right
  }

  for (int i=0; i<300; i=i+100)
  {  //draws the horizontal shapes
    pushMatrix();
    drawRotatesquare(i+100, -300);
    popMatrix();//right horizontal shape
    drawRotatesquare(i+100, -100); // upper one in the center
  }

  pushMatrix();
  for (int i=0; i<300; i=i+100)
  {
    drawRotatesquare (0, i-300);//left horizontal shape
  }
  popMatrix();
  for (int i=0; i<300; i=i+100)
  {
    drawRotatesquare (200, i-300); //lower one in the center
  }
}


void drawSquare(int x, int y)
{
  //draws one unit of the shape, which consists of one square and six rectangles
  //draws the upper left unit, in which the rectangle is vertical 
  pushMatrix();
  square(x, y, 100); //draws the square
  rect(x+25, y-8, 50, 116); //outermost rectangle
  rect(x+30, y-10, 40, 120);
  rect(x+35, y-12, 30, 124);
  rect(x+40, y-13, 20, 126);
  rect(x+45, y-14, 10, 128);
  rect(x+47, y-15, 6, 130); //innermost rectangle
  popMatrix();
}

void drawRotatesquare(int x, int y)
{
  //rotates the shape unit so that rectangle is now horizontal
  rotate(radians(90));//rotates the shape by 90 degrees
  drawSquare( x, y);
}
