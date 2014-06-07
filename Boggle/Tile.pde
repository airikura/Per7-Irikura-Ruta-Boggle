public class Tile {

  color c = color(255);
  color textC = color(0);
  color otextC = color(0);
  int width = 80;
  int height = 80;
  int x;
  int y;
  char letter;
  Coordinate coor;
  boolean isSelected;
  //Actual pointValue afterPowerUp
  int pointValue;
  //pointValue before powerUp
  int originalValue;
  
  //DoubleWord
  boolean DW;
  //Triple Word
  boolean TW;
  //Triple Letter
  boolean TL;
  //Double Letter
  boolean DL;
  boolean hasPowerUp;
  
  //Main letter
  PFont a = createFont("Arial", 32, true);
  //Point Value
  PFont b = createFont("Arial", 10, true);
  

  public Tile(int x, int y, char c, int row, int col) {
    this.x = x;
    this.y = y;
    letter = c;  
    coor = new Coordinate(row, col);  
    isSelected = false;
    pointValue = setPointValue();
    originalValue = setPointValue();
    DW = false;
    TW = false;
    TL = false;
    DL = false;
    hasPowerUp = false;
  }


  public Tile(char c) {
    letter = c;
  }



  int setPointValue() {
    if (letter == 'D' || letter == 'U') {
      return 2;
    } else if (letter == 'M' || letter == 'G' || letter == 'F') {
      return 3;
    } else if (letter == 'Y' || letter == 'C' || letter == 'P' || letter == 'H' || letter == 'W' || letter == 'B' || letter == 'V') {
      return 4;
    } else if (letter == 'K'){
      return 5;
    } else if (letter == 'X'){
      return 8;
    } else if (letter == 'Z' || letter == 'J' || letter == 'V' || letter == 'Q'){
      return 10;
    } else{
      return 1;
    }
  }



  boolean inBounds(int mouseX, int mouseY) {
    if ((abs(x - mouseX) < 80) && abs(y - mouseY) < 80) {
      return true;
    }
    return false;
  }

  char getLetter() { 
    return letter;
  }
  Coordinate getCoordinate() { 
    return coor;
  }
  boolean getIsSelected() { 
    return isSelected;
  }
  int getPointValue(){
    return pointValue;
  }
  int getOriginalValue(){
     return originalValue;
  }
  
  boolean getDW(){ return DW;}
  boolean getTW(){ return TW;}
  boolean getTL(){ return TL;}
  boolean getDL(){ return DL;}
  boolean getHasPowerUp(){ return hasPowerUp;}
  
  String getPowerUp(){
    String str = "";
    if (getDW()){
      return "DW";
    } else if (getTW()){
      return "TW";
    } else if (getDL()){
      return "DL";
    }else if (getTL()){
      return "TL";
    }else{
      return str;
    } 
  }
  

  void setColor(int a, int b, int d) {
    c = color(a, b, d);
  }
  
  void setDW(){
    DW = true;
    hasPowerUp = true;
    otextC = color (255,255,0);
    textC = color(255,255,0);
  }
  
  void setTW(){
    TW = true;
    hasPowerUp = true;
    otextC = color (255,0,0);
    textC = color(255,0,0);
  }
  
  void setTL(){
    TL = true;
    hasPowerUp = true;
    otextC = color (0,0,225);
    textC = color(0,0,255);
    pointValue = pointValue*3;
  }
  
  void setDL(){
    DL = true;
    hasPowerUp = true;
    otextC = color (0,255,0);
    textC = color(0,255,0);
    pointValue = pointValue*2;
  }

  void setup() {
    size(width, height);
  }

  void draw() {
    background(255);
  }

  //Tile turns red
  void wrong() {
    c = color(255, 0, 0);
    textC = color(255,255,255);
  }

  //Tile turns green
  void correct() {
    c = color(0, 255, 0);
    textC = color(255,255,255);
  }
  
  //Tile turns yellow if part of duplicate word
  void dup(){
    c = color(255,255,0);
    textC = color(225, 255, 255);
  }

  //If selected, tile turns orange
  void select() {
    if (!isSelected) {
      c = color(255, 170, 0);
    } else {
      c = color(255, 255, 255);
    }
    isSelected = !isSelected;
  }

  void reset() {
    c = color(255, 255, 255);
    isSelected = false;
    textC = otextC;
  }
  
  
  void getTextC(){
    textC = otextC;
  }

  void display() {
    fill(c);
    rect(x, y, 80, 80);
    fill(0);
    textAlign(CENTER);
    textFont(b);
    text(getOriginalValue(), x + width - 10, y+height -5);
    textFont(a);
    fill(textC);
    text(getLetter(), x + width/2, y + height/2 +5);
    textFont(b);
    text(getPowerUp(), x+10, y+10);
  }
}

