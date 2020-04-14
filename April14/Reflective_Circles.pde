//displays numerical information in the text file and display them accordingly in circles
//creates a reflection along y=x for artistic effects
int[] data;

void setup() {
  size(200, 200);
  String[] stuff = loadStrings("text1.txt"); //loads text file as a String
  // Convert string into an array of integers using ',' as a delimiter
  data = int(split(stuff[0], ','));
}

void draw() {
  background(255);
  noStroke();
  for (int i = 0; i<data.length; i++) { 
    fill(i*20, i*20, i*20); //creates the gradient effect of the bubbles
    ellipse(i*20, 50, data[i]*10, data[i]*10); //draws the horizontal circles
    ellipse(50, i*20, data[i]*10, data[i]*10); //draws the verticel circles
  }
  noLoop();
}
