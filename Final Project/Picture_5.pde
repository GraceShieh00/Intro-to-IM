//Data Visualization- Interactive Bubbles
//code reference: https://processing.org/tutorials/data/
//modified based on the code above
//displays ten bubbles, each scaled according to the numerical value they display
//when the mouse is clicked, creates a new bubble according to the x and y location of the bubble
//if hold the mouse, random colors will fill the specific bubble the mouse just clicked on
//the tenth bubble is outlined with black stroke; it signals that this is the bubble that will
//disappera if the mouse is clicked again
//code originally written on April 14, modified in May

Table table; //retreives information as a table
Bubble[] bubbles;
boolean picture5isshown = false;

void picture5() {
  picture5isshown = true; //sets the condition that the mousePress on this image will lead to the mousepress result related to it
  loadData();

  background(255, 137, 80);
  stroke(0);
  // Display all bubbles
  for (int i = 0; i<bubbles.length; i++) {
    bubbles[i].display(); //draws the bubbles
  }
}

void loadData() {

  table = loadTable("Text4.csv", "header");
  bubbles = new Bubble[table.getRowCount()];


  for (int i = 0; i<table.getRowCount(); i++) {
    // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);


    // Access the fields via their column name (or index).
    float x = row.getFloat("Q1");
    float y = row.getFloat("Q2");
    float d = row.getFloat("Q3");
    String n = row.getString("Q4");
    // Make a Bubble object out of the data from each row.
    bubbles[i] = new Bubble(x, y, d, n);
  }
}


void mousePressed() {
  // When the mouse is pressed, creates a new row and set the values for each column of that row.
  if (picture5isshown == true) {
    TableRow row = table.addRow();
    row.setFloat("Q1", mouseX);
    row.setFloat("Q2", mouseY);
    row.setFloat("Q3", random(40, 80));
    row.setString("Q4", "New");



    // the table will only have ten rows; the last row and bubble will be deleted
    if (table.getRowCount()>10) {
      table.removeRow(0);
    }

    // This writes the table back to the original CSV file
    // and reloads the file so that what's drawn matches.
    saveTable(table, "data/Text4.csv");
    loadData();
  }
}

//draws the bubbles based on the four rows and columns of the text
class Bubble {
  float Q1, Q2;
  float Q3;
  String Q4;

  boolean over = false;

  Bubble(float tempX, float tempY, float tempD, String s) {
    Q1 = tempX;
    Q2 = tempY;
    Q3 = tempD;
    Q4 = s;
  }


  void display() {
    //if click on the mouse, random colors will fill the newly created bubble while other bubbles and
    //the background turns black
    if (mousePressed == true) {
      background(0);
      fill(random(0, 255), random(0, 255), random(0, 255)); //fills bubble with random colors like its blinking
    }
    ellipse(Q1, Q2, Q3, Q3);
    noStroke();
    fill(125, 100, 200); 
    textAlign(CENTER);
    text(Q3, Q1, Q2+Q3/2+20); //writes the number of the bubbles below
  }
}
