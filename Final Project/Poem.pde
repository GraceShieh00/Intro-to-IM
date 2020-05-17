//Generative Text Poem- this code randomly generates words from a poem in new orders to create new lines 
//the words the code draws from are from "The Road Not Taken" by Robert Frost
//code references: https://www.youtube.com/watch?v=TaPVzWBWqd4&t=1s
//Grace Shieh, Intro to IM
//Originally created on April 14, 2020; modified May, 2020

String[] words;
int index=0;
void poem() {
  picture5isshown = false;
  String[] lines = loadStrings("pp.txt"); //text file loaded as String
  String entireplay = join(lines, " "); //space as the delimeter, joins all texts
  //println(entireplay); //shows the entire play down in the program
  words = split(entireplay, " "); //splits the poem into single words
  frameRate(.5); //controls the speed of the word display; slower rate down so the words can be read

  background(0);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  int index = int(random(words.length)); //randomly chooses words from the text file 
  int index1 = int(random(words.length));//generates five different words at a time
  int index2 = int(random(words.length));
  int index3 = int(random(words.length));
  int index4 = int(random(words.length));

  text(words[index].toLowerCase(), width/2, height/7); //displays the words above on the screen in rows of five
  text(words[index1].toLowerCase(), width/2, height*2/7);
  text(words[index2].toLowerCase(), width/2, height*3/7);
  text(words[index3].toLowerCase(), width/2, height*4/7);
  text(words[index4].toLowerCase(), width/2, height*5/7);
  loop();
}
