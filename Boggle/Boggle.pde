//identical to the board that is displayed on the screen
char[][] board;
//copy of the original board that can be manipulated and reset
char[][] tempBoard;
ArrayList<Coordinate> coors = new ArrayList<Coordinate>();
String current;
int currScoreTracker;
int score;
int totalWords;
Tree dict;
Tree foundWords;
Board game;
Timer time;
boolean doubleWord1;
boolean doubleWord2;
boolean tripleWord;


PFont a = createFont("Arial", 20, true);
PFont b = createFont("Arial", 60, true);



void setup() {
  size(500, 415);
  dict = new Tree();
  //Calls the import function below to create the Dictionary Tree
  importTextFile();
  game = new Board();
  foundWords = new Tree();
  board = new char[4][4];
  current = "";
  score=0;
  currScoreTracker=0;
  doubleWord1=false;
  doubleWord2=false;
  tripleWord=false;
  time = new Timer(120);
  time.start();
}





void draw() {
  if (time.getRemainingTimeSeconds() >= 0){
    displayGame();
  }
  else{
    displayResults();
  }
}

void displayGame(){
  background(0, 0, 255);
  fill(0, 255, 0);
  game.display();
  timerDisplay();
  scoreDisplay();
  totalWordsDisplay();
  wordAddedDisplay();
}

void displayResults(){
  background(0,255,0);
  
}



String currScore() {
  String str = ""+score;
  return str;
}

String currTotalWords() {
  int words = foundWords.getTotalWords();
  String str = ""+words;
  return str;
}


void wordAddedDisplay(){
  textSize(18);
  textAlign(LEFT);
  fill(0);
  rect(10, 340, 275, 30);
  fill(255);
  text(current, 10,360);
}



void timerDisplay(){
  fill(255,0,0);
  rect(360,220,100,80);
  textAlign(CENTER);
  textFont(b);
  fill(255);
  if (time==null){
    text("120", 410,280);
  } else{
  text(time.getRemainingTimeSeconds(), 410, 280);
  }
}


void totalWordsDisplay() {
  textAlign(CENTER);
  textFont(a);
  fill(0);
  text("TOTAL WORDS", 410, 140);
  fill(0);
  rect(360, 150, 100, 40);
  fill(255);
  text(currTotalWords(), 410, 175);
}



void scoreDisplay() {
  textAlign(CENTER);
  textFont(a);
  fill(0);
  text("SCORE", 410, 40);
  fill(0);
  rect(360, 50, 100, 40);
  fill(255);
  text(currScore(), 410, 75);
}


Tile getTileWithCoor(Coordinate c) {
  int row = c.getR();
  int col = c.getC();
  return game.getTile(row, col);
}



boolean inBoundsRect(int x, int y, int width, int height, 
int mouseX, int mouseY) {
  if ((mouseX < (x + width)) && (mouseX > x) && (mouseY< (y+ height))
    && (mouseY > y)) {
    return true;
  }
  return false;
}

//Changes the color of tile pressed to blue, and adds it to end of word
//Reminder: ArrayLists add to the end of the list!!!
void mousePressed() {
  //if game has already started, only check tiles 

  if (time != null) {
    if ((mouseX < 390) && (mouseX > 300) && (mouseY > 340) 
      && (mouseY < 430)) {
      time = null;
      setup();
    }
    for (int i =0; i < 4; i ++) {
      for (int j =0; j < 4; j++) {
        Tile selected = game.getTile(i, j);
        if (selected.inBounds(mouseX, mouseY)) {
          //The first tile selected for the new word
          if (coors.size() == 0) {
            selected.select();
            coors.add(selected.getCoordinate());
            current = current + selected.getLetter();
            currScoreTracker = currScoreTracker + selected.getPointValue();
            if (selected.getTW()) {
              tripleWord = true;
            }
            if (selected.getDW()) {
              doubleWord1 = true;
            }
            return;
          } else {
            Coordinate prev = coors.get(coors.size()-1);
            if (selected.getCoordinate().isAdjacentTo(prev)) {
              if (!selected.getIsSelected()) {
                selected.select();
                coors.add(selected.getCoordinate());
                current = current + selected.getLetter();
                currScoreTracker = currScoreTracker + selected.getPointValue();
                if (selected.getTW()) {
                  tripleWord = true;
                } 
                if (selected.getDW()) {
                  if (!doubleWord1) {
                    doubleWord1 = true;
                  } else {
                    doubleWord2 = true;
                  }
                }
                return;
              } else {
                reset();
                return;
              }
              //reset all of the tiles and get rid of the word
            } else {
              reset();
              return;
            }
          }
        }
      }
    }
  }



  //if game hasn't started, see if start button is clicked
  else {
    if (inBoundsRect(120, 340, 80, 40, mouseX, mouseY)) {

      // ((mouseX < 200) && (mouseX > 120) && (mouseY > 340) 
      //&& (mouseY < 380)){

      time = new Timer(120);
      time.start();
    }
  }
  if ((mouseX < 460 && mouseX > 360) && (mouseY <370 && mouseY > 340)) {
    setup();
  }
}




int currScoreTracker() {
  int before = currScoreTracker;
  if (tripleWord) {
    before = before*3;
  }
  if (doubleWord1) {
    before = before*2;
  }
  if (doubleWord2) {
    before = before*2;
  }
  return before;
}


String getCurrScore(){
  String str = ""+currScoreTracker();
  str = "+"+str;
  return str;
}

void tempWordPoints(){
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text(getCurrScore(), 250, 360);
}


void keyPressed() {
  if (key == ENTER) {
    if (valid(current)) {
      foundWords.insert(current);
      score = score + currScoreTracker();
      totalWords++;
      //tempWordPoints();
      for (int k=0; k<coors.size (); k++) {
        Tile temp = getTileWithCoor(coors.get(k));
        temp.correct();
      }
    } else if  (isWordDuplicate(current)) {
      for (int k=0; k<coors.size (); k++) {
        Tile temp = getTileWithCoor(coors.get(k));
        temp.dup();
      }
    } else {
      for (int k=0; k<coors.size (); k++) {
        Tile temp = getTileWithCoor(coors.get(k));
        temp.wrong();
      }
    }
  }
}


void keyReleased() {
  if (key == ENTER) {
    reset();
  }
} 

void reset() {
  game.reset();
  coors = new ArrayList<Coordinate>();
  current = "";
  currScoreTracker = 0;
  tripleWord = false;
  doubleWord1 = false;
  doubleWord2 = false;
}


//Import tree reads in the wordList text file and adds all these words to the tree
void importTextFile() {
  String[] words = loadStrings("wordList.txt");
  for (int i=0; i<words.length; i++) {
    dict.insert(words[i]);
  }
}

//for a 4x4 board
void createCharBoard() {
  for (int i=0; i<4; i++) {
    for (int k=0; k<4; k++) {
      board[i][k] = game.getTile(i, k).getLetter();
    }
  }
}

//Methods that will be later used to check if the entered word is valid!

boolean valid(String word) {
  if (appropLength(word) && !isWordDuplicate(word) && isWordInDict(word)) {
    return true;
  } else {
    return false;
  }
}


//Checks to see in the entered word is the dict tree
boolean isWordInDict(String word) {
  return dict.find(word);
}

//Checks to see in the foundWords if the word is already entered
boolean isWordDuplicate(String word) {
  return foundWords.find(word);
}

//you cant have one letter words
boolean appropLength(String word) {
  if (word == null || word.length() <3) {
    return false;
  } else {
    return true;
  }
}

void createTempBoard() {
  tempBoard = new char[board.length][board[0].length];
  for (int i=0; i<board.length; i++) {
    for (int k=0; k<board[0].length; k++) {
      tempBoard[i][k]= board[i][k];
    }
  }
}

//We dont really need this if the user is only going to be clicking
//We will need this if the user is going to be typing in the input
//Checks to see if the letters are even on the board
boolean areLettersOnBoard(String word) {
  createTempBoard();
  boolean result;
  char letter;
  for (int i=0; i<word.length (); i++) {
    letter = word.charAt(i);
    result =false;
    for (int j=0; j<tempBoard.length; j++) {
      for (int k=0; k<tempBoard[0].length; k++) {
        if (tempBoard[j][k] == letter) {
          result = true;
          tempBoard[j][k] = '-';
          j = tempBoard.length;
        }
      }
    }
    if (result==false) {
      return false;
    }
  }
  return true;
}

