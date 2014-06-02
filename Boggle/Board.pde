public class Board {

  public class Die {
    char[] sides;

    public Die(char[] letters) {
      sides = new char[6];
      if (letters.length == sides.length) {
        for (int i =0; i<sides.length; i++) {
          sides[i] = letters[i];
        }
      }
    }

     char selectRandLetter() {
      int index = int(random(6));
      return sides[index];
    }
  }

  Die[] bag;
  char[] allLetters = {'A', 'A', 'E', 'E', 'G', 'N', 'E', 'L', 'R', 'T', 'T', 'Y', 'A', 'O', 'O', 'T', 'T', 'W',
  'A', 'B', 'B', 'J', 'O', 'O', 'E', 'H', 'R', 'T', 'V', 'W', 'C', 'I', 'M', 'O', 'T', 'U', 'D', 'I', 'S', 'T', 'T', 'Y',
  'E', 'I', 'O', 'S', 'S', 'T', 'D', 'E', 'L', 'R', 'V', 'Y', 'A', 'C', 'H', 'O', 'P', 'S', 'H', 'I', 'M', 'N', 'Q', 'U',
  'E', 'E', 'I', 'N', 'S', 'U', 'E', 'E', 'G', 'H', 'N', 'W', 'A', 'F', 'F', 'K', 'P', 'S', 'H', 'L', 'N', 'N', 'R', 'Z',
  'D', 'E', 'I', 'L', 'R', 'X'};
  char[] pickedLetters;
  Tile[][] gameBoard;


  public Board() {
    setUpLetters();
    gameBoard = new Tile[4][4];
    fillBoard();
  }
  
  Tile getTile(int r, int c){
    return gameBoard[r][c];
  }

  void display(){
    for (int i =0; i<gameBoard.length; i++){
      for (int k=0; k<gameBoard[0].length; k++){
        Tile m = getTile(i, k);
        m.display();
      }
    }
  }

  void fillBoard() {
    int tracker = 0;
    for (int i=0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        gameBoard[i][k] = new Tile(80*i, 80*k, pickedLetters[tracker]);
        tracker++;
      }
    }
  }

  void setUpLetters() {
    bag = new Die[16];
    int diceCount = 0;
    int startInd = 0;
    if (allLetters.length == 96) {
      while (diceCount <16) {
        bag[diceCount] = makeDie(startInd);
        startInd = startInd + 6;
        diceCount++;
      }
    }
    pickedLetters = new char[16];
    for (int i =0; i<16; i++) {
      pickedLetters[i] = bag[i].selectRandLetter();
    }
    scrammbleOrder();
  }

  Die makeDie(int startIndex) {
    char[] temp = new char[6];
    if (startIndex+6 <= allLetters.length) {
      for (int i = 0; i<6; i++) {
        temp[i] = allLetters[startIndex+i];
      }
    }
    Die d = new Die(temp);
    return d;
  }

  void scrammbleOrder() {
    int tracker = 0;
    int a = 0;
    int b =0;
    while (tracker < 15) {
      a = int(random(16));
      b = int(random(16));
      exchange(a, b);
      tracker++;
    }
  }

  public void exchange(int a, int b) {
    if (a>-1 && b>-1 && a<pickedLetters.length && b<pickedLetters.length) {
      char temp = pickedLetters[a];
      pickedLetters[a] = pickedLetters[b];
      pickedLetters[b] = temp;
    }
  }
}

