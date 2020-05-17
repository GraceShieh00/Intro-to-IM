//Computer Graphics Art Inspired Art Piece
//This piece was originally created on March 31 as a replicate of a 
//computer graphic art Roger Vilder created in 1976
//the piece is modified with half translucent rectangles of various colors 
//the piece is given a radiating effect 

void picture1() 
{ 
  picture5isshown = false;
  background(0);
  noStroke();
  fill(0);
  square(0, 0, 100); //creats a base for the square on the top left, which is a replica of a computer graphics art
  stroke(211, 211, 211);
  for (int i=0; i<100; i=i+100)
  {//draws the five vertical squares on the canvas
    drawSquare(i, 0); //upper left  
    drawSquare(i, 200); //lower left
    drawSquare(100, i+100); //center 
    drawSquare(200, i); //upper right
    drawSquare(200, i+200); //lower right
    fill(255, 0, 0, 140);
    noStroke();
    rect(0, 0, 640, 80);
    rect(0, 280, 640, 80);
  }
  fill(255, 255, 0, 140); //*here the rectangles with different colors and locations are created, horizontal or vertical
  rect(0, 400, 640, 480);
  fill(0, 255, 255, 140);
  rect(480, 0, 80, 480);         
  rect(380, 0, 80, 480);
  rect(180, 0, 80, 480);
  rect(0, 0, 40, 480);

  for (int i=0; i<300; i=i+100)
  {  //draws the horizontal shapes
    stroke(211, 211, 211);
    pushMatrix();
    drawRotatesquare(i+100, -300);
    popMatrix();//right horizontal shape
    drawRotatesquare(i+100, -100); //upper one in the center
    rect(0, 320, 640, 480); //*this creates another rectangle with colors 
    fill(0, 255, 140, 140);
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
  //this unit is then brought to different positions to create the art
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
