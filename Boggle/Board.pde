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
  char[] allLetters = {
    'A', 'A', 'E', 'E', 'G', 'N', 'E', 'L', 'R', 'T', 'T', 'Y', 'A', 'O', 'O', 'T', 'T', 'W', 
    'A', 'B', 'B', 'J', 'O', 'O', 'E', 'H', 'R', 'T', 'V', 'W', 'C', 'I', 'M', 'O', 'T', 'U', 'D', 'I', 'S', 'T', 'T', 'Y', 
    'E', 'I', 'O', 'S', 'S', 'T', 'D', 'E', 'L', 'R', 'V', 'Y', 'A', 'C', 'H', 'O', 'P', 'S', 'H', 'I', 'M', 'N', 'Q', 'U', 
    'E', 'E', 'I', 'N', 'S', 'U', 'E', 'E', 'G', 'H', 'N', 'W', 'A', 'F', 'F', 'K', 'P', 'S', 'H', 'L', 'N', 'N', 'R', 'Z', 
    'D', 'E', 'I', 'L', 'R', 'X'
  };
  char[] pickedLetters;
  Tile[][] gameBoard;
  int[] pickPowers;
  int[][] powerUps;

  PFont a = createFont("Arial", 20, true);


  public Board() {
    setUpLetters();
    gameBoard = new Tile[4][4];
    fillBoard();
    giveTilesPower();
  }

  Tile getTile(int r, int c) {
    return gameBoard[r][c];
  }



  void display() {
    for (int i =0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        Tile m = getTile(i, k);
        m.display();
        
      }
    }
<<<<<<< HEAD
   fill(0);
   rect(300, 340, 80, 40);
   fill(255);
   text("End", 310, 370);
   fill(0);
   rect(120, 340, 80, 40);
   fill(255);
   text("Start", 120, 370);
   fill(0);
   rect(10, 340, 80, 55);
   fill(255);
   textSize(20);
   text("New \nGame", 22, 360);
    
=======
>>>>>>> 5d97c466ee9465f67cfb3629a5b0c2ad505f08cc
  }

  void reset() {
    for (int i =0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        Tile m = getTile(i, k);
        m.reset();
      }
    }
  }


  void fillBoard() {
    int tracker = 0;
    for (int i=0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        gameBoard[i][k] = new Tile(80*i+10, 80*k+10, pickedLetters[tracker], i, k);
        tracker++;
      }
    }
  }


//1=Tw, 2=Dw, 3=Tl, 4=Dl
//one tw, two dw, two tl, one dl
  void attributePowerUps(){
    pickPowers = new int[16];
    powerUps = new int[4][4];
    int r = int(random(16));
    pickPowers[r] = 1;
    boolean s1 = true;
    while (s1){
      r = int(random(16));
      if (pickPowers[r]==0){
        pickPowers[r] = 2;
        s1 = false;
      }
    }
    boolean s2 = true;
    while(s2){
      r = int(random(16));
      if (pickPowers[r]==0){
        pickPowers[r] = 2;
        s2 = false;
      }
    }
    boolean s3 = true;
    while(s3){
      r = int(random(16));
      if (pickPowers[r]==0){
        pickPowers[r] = 3;
        s3 = false;
      }
    }
    boolean s4 = true;
    while(s4){
      r = int(random(16));
      if (pickPowers[r]==0){
        pickPowers[r] = 3;
        s4 = false;
      }
    }
    boolean s5 = true;
    while(s5){
      r = int(random(16));
      if (pickPowers[r]==0){
        pickPowers[r] = 4;
        s5 = false;
      } 
    }
    int tracker = 0;
    for (int i=0; i<4; i++){
      for (int j=0; j<4; j++){
        powerUps [i][j] = pickPowers[tracker];
        tracker++;
      }
    }
  }
  
  void giveTilesPower(){
    attributePowerUps();
    for (int i=0; i<4; i++){
      for (int j=0; j<4; j++){
        Tile temp = getTile(i,j);
        int a = powerUps[i][j];
        setPowerUps(temp, a);
      }
    }
  }
  
  void setPowerUps(Tile m, int n){
    if (n==1){
      m.setTW();}
    if (n==2){
      m.setDW();}
    if (n==3){
      m.setTL();}
    if (n==4){
      m.setDL();}
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

