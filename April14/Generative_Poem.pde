//generative text- poem- randomly generates words from a poem in new orders to create new lines //<>//
//text from "The Road Not Taken" by Robert Frost
//code references: https://www.youtube.com/watch?v=TaPVzWBWqd4&t=1s

String[] words;
int index=0;
void setup() {
  size(300, 300);
  background(255);
  String[] lines = loadStrings("pp.txt"); //text file loaded as String
  String entireplay = join(lines, " "); //space as the delimeter, joins all texts
  //println(entireplay); //shows the entire play down in the program
  words = split(entireplay, " "); //splits the poem into single words
  frameRate(.5); //controls the speed of the word display
}

void draw() {
  background(0);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  int index = int(random(words.length)); //randomly chooses words from the text file 
  int index1 = int(random(words.length));//generates three different words at a time
  int index2 = int(random(words.length));

  text(words[index].toLowerCase(), width/2, 100); //displays these words on the screen
  text(words[index1].toLowerCase(), width/2, 150);
  text(words[index2].toLowerCase(), width/2, 200);
  loop();
}
