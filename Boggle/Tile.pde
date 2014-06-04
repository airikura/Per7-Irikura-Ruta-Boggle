public class Tile {

  color c = color(255);
  int width = 80;
  int height = 80;
  int x;
  int y;
  char letter;
  Coordinate coor;
  boolean isSelected;
  int pointValue;
  
  //Main etter
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

  void setColor(int a, int b, int d) {
    c = color(a, b, d);
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
  }

  //Tile turns green
  void correct() {
    c = color(0, 255, 0);
  }

  //If selected, tile turns blue
  void select() {
    if (isSelected) {
      c = color(255, 255, 255);
    } else {
      c = color(0, 0, 255);
    }
    isSelected = !isSelected;
  }

  void reset() {
    c = color(255, 255, 255);
    isSelected = false;
  }

  void display() {
    fill(c);
    rect(x, y, 80, 80);
    fill(0);
    textFont(a);
    text(getLetter(), x + width/2 - 10, y + height/2 + 5);
    textFont(b);
    text(getPointValue(), x + width - 10, y+height -5);
    
  }
}

