ArrayList<Tile> tiles;
//identical to the board that is displayed on the screen
char[][] board;
//copy of the original board that can be manipulated and reset
char[][] tempBoard;
Tree dict;
Tree foundWords;
Board game;

void setup() {
  size(400, 400);
  dict = new Tree();
  //Calls the import function below to create the Dictionary Tree
  importTextFile();
  game = new Board();
  foundWords = new Tree();
  board = new char[4][4];
    }


void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  game.display();
  }


//Import tree reads in the wordList text file and adds all these words to the tree
void importTextFile(){
  String[] words = loadStrings("wordList.txt");
  for (int i=0; i<words.length; i++){
    dict.insert(words[i]);
  }
}


//Methods that will be later used to check if the entered word is valid!

//Checks to see in the entered word is the dict tree
boolean isWordInDict(String word) {
  return dict.find(word);
}

//Checks to see in the foundWords if the word is already entered
boolean isWordDuplicate(String word) {
  return foundWords.find(word);
}

//you cant have one letter words
boolean appropLength(String word){
  if (word == null && word.length() <2){
    return false;
  }else {
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
  for (int i=0; i<word.length(); i++) {
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
