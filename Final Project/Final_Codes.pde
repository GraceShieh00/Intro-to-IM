//image link of the front photo of the MET https://www.nyc-arts.org/organizations/4/metropolitan-museum-of-art
//image link of the inside gallery picture https://www.vogue.com/article/metropolitan-museum-of-art-coronavirus 
//Grace Shieh, Intro to IM
//May 16, 2020
//This project is an online gallery that showcases the artpieces I created in class this semester, like a class portfolio
//the artpieces included are made in class, but most have gone through modifications to make them more complex
//the first scene is the front of MET, and as one presses the space bar, they will be able to enter the gallery for the interactive exhibition
//every number pressed on the key according to the placard will take one to a full picture of an art piece or poetry generator
//The various pictures and classes are assembled here

PImage met; //image of the MET that appears when the program is first uploaded
PImage inside2; //image of the inside of the MET when presses space bar where all art pieces are shown
Block myBlock1; //snowballs for picture 3
Block[] myBlock1Array = new Block[15]; //creates 15 snowballs for picture 3
PFont f;
//float x, y; 
void setup() {
  size(640, 480);
  strokeWeight(4);
  met = loadImage("Met.jpg");
  inside2 = loadImage("inside2.jpg");
  for (int i=0; i< myBlock1Array.length; i++) { //for the snowballs in picture 3
    myBlock1Array[i] = new Block(color(200, 228, 255), random(blocklocation, width-blocklocation), 
      random(blocklocation, height-blocklocation), 15);
  }
  x=width;
  y=height/3;
}

void draw() {
  {
    background(255);
    image(met, 0, 0, 640, 480); //calls the MET, an uploaded image and draws on it with text and shapes
    textSize(20);
    noStroke();
    rect(30, 380, 500, 30);
    fill(0);
    text("Press the space bar to enter!", 180, 400);
    fill(255);
    noLoop();
  }

  //this following combines the codes for the individual art pieces in other tabs
  if (key == '1') { 
    picture1(); //if key 1 is pressed, picture 1 will display on the canvas; 
    //calls for the code of picture 1
  } else if (key == '2') { //if key 2 is pressed, picture 2 will display on the canvas; others in the same fashion
    picture2();
    for (int i=0; i< myBlock1Array.length; i++) { // calls for the raining 2020 and allows it to rain
      myBlock1Array[i].rain();
      myBlock1Array[i].display();
    }
  } else if (key == '3') {
    picture3();  //picture 3- the modification picture based on Professor Sherwood's codes
  } else if (key == '4') {
    picture4();  //draws picture 4, a data visualization piece
  } else if (key == 'p') {
    poem(); //draws the poem, which displays at the very top of the inside of the gallery
  } else if (key == '5') {
    picture5();
  }//draws picture 5 if key 5 is pressed

  else if (key == ' ') { //draws the gallery- if the space bar is pressed, the audience will be able to enter the gallery space
    gallery();
    textSize(30); 
    fill(255); //displays the text in the gallery
    text("Intro to IM Final", 330, 325);
  }
  loop(); //calls for the code to be continuously ran so the changes on the keyboard will be responded to and kept up to date
}
