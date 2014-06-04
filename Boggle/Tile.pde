public class Tile{
  
color c = color(255);
int width = 80;
int height = 80;
int x = 200;
int y = 200;
char letter;
Coordinate coor;
boolean isSelected;

public Tile(int x, int y, char c, int row, int col){
    this.x = x;
    this.y = y;
    letter = c;  
    coor = new Coordinate(row, col);  
    isSelected = false;
}


public Tile(char c){
  letter = c;
}

boolean inBounds(int mouseX, int mouseY){
  if ((abs(x - mouseX) < 80) && abs(y - mouseY) < 80){
     return true;
  }
  return false;
}

char getLetter(){ return letter;}
Coordinate getCoordinate(){ return coor;}
boolean getIsSelected(){ return isSelected;}

void setColor(int a, int b, int c){
  c = color(a, b, c);
}

void setup(){
   size(width,height);
   
   
   
}
void draw(){
   background(255);
 
  
}

void wrong(){
  c = color(255,0,0);
}

void correct(){
  c = color(0,255,0);
}

void select(){
    if (isSelected){
       c = color(255,255,255);
    }
    else{
      c = color(0,0,255);
    }
    isSelected = !isSelected;
}

void reset(){
  c = color(255,255,255);
  isSelected = false;
}

void display(){
   fill(c);
   rect(x,y,80,80);
   fill(0);
   textSize(32);
   text(getLetter(), x + width/2 - 10,y + height/2 + 5);
}
       
}

