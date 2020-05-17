//Grace Shieh, Intro to IM
//Originally created on April 14 as a visual display assignment which 
//displays numerical information in the text file and display them accordingly in circles
//creates a reflection along y=x for artistic effects
//Data Visualization- Geometric Style
//the circles represent the data
//Code is modified in May 2020, providing a more artistic feeling to it

int[] data;
void picture4() {
  picture5isshown = false; //makes sure mousePressed for picture 5 has no effect here
  String[] stuff = loadStrings("text1.txt"); //loads text file as a String
  // Convert string into an array of integers using ',' as a delimiter
  data = int(split(stuff[0], ','));

  background(120);
  noStroke();
  for (int i = 0; i<data.length; i++) { //creates the shape in teh top left 
    fill(i*20, i*20, i*20); //creates the gradient effect of the bubbles
    ellipse(i*20, 50, data[i]*10, data[i]*10); //draws the horizontal circles
    ellipse(50, i*20, data[i]*10, data[i]*10); //draws the verticel circles

    fill(i*20, i*20, i*20);  //draws the same shapes as above, but now at bottom right
    ellipse(580-i*20, 500, data[i]*10, data[i]*10);
    ellipse(580, 500-i*20, data[i]*10, data[i]*10);

    fill(i*30, i*30, i*30); //creates the gradient effect of the bubbles
    ellipse(i*30, 400, data[i]*20, data[i]*20); //draws the circles in the center
    ellipse(400, i*30, data[i]*20, data[i]*20);

    fill(0, 140); //creates the transparent effect of the bubbles
    ellipse(i*70, 200, data[i]*30, data[i]*30); //draws the half transparent circles in the middle
    ellipse(200, i*70, data[i]*30, data[i]*30);
  }
}
