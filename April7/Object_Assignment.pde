Block myBlock1; //rain droplets
Block[] myBlock1Array = new Block[10]; //first group of rain droplets
Block[] myBlock2Array = new Block[10]; //second group of rain droplets
Block[] myBlock3Array = new Block[10]; //third group of rain droplets
int blocklocation = 20;
// setup for text display
PFont f;
float x, y;
// texts for the messages
String message1= "Warming";
String message2= "3. Press Left Mouse Key";
String message3= "2. Press Right Mouse Key";
String message4= "1. Press Space Bar";
String message5= "Global";
String message6= "???";

void setup() {
  size(400, 200);
  noStroke();
  smooth();
  //duplicates the class Block 
  for (int i=0; i< myBlock1Array.length; i++) {
    myBlock1Array[i] = new Block(color(200, 228, 255), random(blocklocation, width-blocklocation), 
      random(blocklocation, height-blocklocation), 15); //creates rain droplets with speed of 15 and light bluu color, both x and y location are random
    myBlock2Array[i] = new Block(color(150, 218, 255), random(blocklocation, width-blocklocation), 
      random(blocklocation, height-blocklocation), 5);  //creates rain droplets with speed of 5 and bright blude color, both x and y location are random
    myBlock3Array[i] = new Block(color(220, 218, 255), random(blocklocation, width-blocklocation), 
      random(blocklocation, height-blocklocation), 30); ////creates rain droplets with speed of 30 and light purple color, both x and y location are random
  }
  // creates text with typeface of Helvetica
  f = createFont("Helvetica", 14);
  x=width;
  y=height/3;
}

void draw() {
  background(255);
  for (int i=0; i< myBlock1Array.length; i++) {
    myBlock1Array[i].rain();
    myBlock1Array[i].display();
    myBlock2Array[i].rain();
    myBlock2Array[i].display();
    myBlock3Array[i].rain();
    myBlock3Array[i].display(); //shows and presents the movements of all three raindropn groups

    //creates the blue rectangles that will fill the canvas in the blue color of the directional texts
    if (mousePressed == true) { 
      if (mouseButton == LEFT) {
        fill(200, 228, 255);
        rect(0, 130, 400, 70); //bottom rectangle
      } else if (mouseButton == RIGHT) { 
        fill(200, 228, 255);
        rect(0, 60, 400, 70); //middle section rectangle
      }
    } else if (keyPressed == true) {
      fill(200, 228, 255);
      rect(0, 0, 400, 60); //upper rectangle
    } 

    texts(); //displays the texts (both white and blue) on the canvas
  }
}

void texts() {
  textAlign(LEFT);
  textFont(f, 12);
  fill(200, 228, 255);
  text(message4, 5, 20);
  fill(255);
  text(message5, 300, 20);
  fill(200, 228, 255);
  text(message3, 5, 100);
  fill(255);
  text(message1, 200, 100);
  fill(200, 228, 255);
  text(message2, 5, 180);
  fill(255);
  text(message6, 250, 180);
} //function that stores the information of each message, from message one to six, in colors of blue and white
