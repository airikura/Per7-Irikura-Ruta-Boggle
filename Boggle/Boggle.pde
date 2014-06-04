//identical to the board that is displayed on the screen
char[][] board;
//copy of the original board that can be manipulated and reset
char[][] tempBoard;
ArrayList<Coordinate> coors = new ArrayList<Coordinate>();
String current;
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
  current = "";
}


void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  game.display();
}

//Returns true if the cooridnate was already selected
boolean AlreadyPressed(Coordinate c) {
  for (int i =0; i<coors.size (); i++) {
    if (coors.get(i).repeatCoor(c)) {
      return true;
    }
  }
  return false;
}

Tile getTileWithCoor(Coordinate c) {
  int row = c.getRow();
  int col = c.getCol();
  return game.getTile(row, col);
}

//Changes the color of tile pressed to blue, and adds it to end of word
//Reminder: ArrayLists add to the end of the list!!!
void mousePressed() {
  for (int i =0; i < 4; i ++) {
    for (int j =0; j < 4; j++) {
      Tile selected = game.getTile(i, j);
      if (selected.inBounds(mouseX, mouseY)) {
        //The first tile selected for the new word
        if (coors.size() == 0) {
          selected.select();
          coors.add(selected.getCoordinate());
          current = current + selected.getLetter();
          return;
        } else {
          if (selected.getCoordinate().isAdjacentTo(coors.get(coors.size()-1))) {
            if (!selected.getIsSelected()) {
              selected.select();
              coors.add(selected.getCoordinate());
              current = current + selected.getLetter();
              return;
            } else {
              reset();
              return;
            }
            //reset all of the tiles and get rid of the word
          } else {
            reset();
          }
        }
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    if (valid(current)) {
      foundWords.insert(current);
      for (int k=0; k<coors.size (); k++) {
        Tile temp = getTileWithCoor(coors.get(k));
        temp.correct();
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

