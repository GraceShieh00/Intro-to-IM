//This is the "inside view" of the museum, featuring the collection of art pieces on the wall in the gallery
//the five pictures and poem are included and displayed on the wall 
//the gallery provides textual instruction on its interactivity-
//by pressing certain number or letters on the keyboard,
//the canvas will display the selected art piece for the viewer
//Grace Shieh, Intro to IM
//May 10, 2020

void gallery() //this is collection of codes that make up the gallery, which will be called in the final code tab
{ 
  picture5isshown = false;
  image(inside2, 0, 0, 640, 480); //displays the image of the gallery interior; image source link can be found in the final code comments
  fill(0);

  PImage pic1; //displays picture 1- the black square first from the left in the frame
  pic1 = loadImage("pic1.png"); //uploads an image of picture 1 to be displayed in the frame
  image(pic1, 146, 146, 65, 69); //size and location of picture 1
  textSize(20);
  text("1", 100, 241); ////displays 1 on the placard on the bottom left of the piece, signaling which key to press

  PImage pic2; //displays picture 2- orange self potrait second from the left
  pic2 = loadImage("pic2.png"); //uploads an image of picture 2 to be displayed in the frame
  image(pic2, 30, 160, 50, 50); //size and location of picture 2
  textSize(20);
  text("2", 228, 241); //displays 2 on the placard on the bottom left of the piece, signaling which key to press

  PImage pic3; // displays picture 3- the modification of Professor Sherwood's codes
  pic3 = loadImage("pic3.png");
  image(pic3, 275, 145, 90, 70);
  textSize(20);
  text("3", 380, 241);

  PImage pic4; //displays picture 4- black and white data visualization picture fourth from the left
  pic4 = loadImage("pic4.png");
  image(pic4, 430, 155, 50, 50);
  textSize(20);
  text("4", 504, 241);

  PImage pic5; //displays picture 5- data visualization bubbles at the right end of the display
  pic5 = loadImage("pic5.png");
  image(pic5, 550, 155, 70, 50);
  textSize(20);
  text("5", 628, 241);

  fill(222, 184, 135);
  rect(253, 120, 134, 2); //creates the ledge for the art frame of the poem display
  fill(140); //creates the poem display on top of center image
  rect(255, 70, 130, 50);
  noStroke();

  textSize(20); //writes the words on the poem display
  fill(255);
  textAlign(CENTER);
  text("I Feel Poetic", 320, 105);

  fill(255);
  rect(392, 110, 15, 20); //creates the poem placard at the bottom right of the poem display
  fill(0);
  textSize(17);
  text("p", 399, 123); //writes the letter "p" on the poem placard

  // provides textual instruction at the buttom of the gallery to show audience how to use it
  text("Press the corresponding placards numbers/ letter on your keyboard ", 340, 420);
  text("to view a variation of the art pieces closeup!", 320, 440);
  textSize(13);
  text("Press the space bar to return to the gallery", 325, 460);
}
