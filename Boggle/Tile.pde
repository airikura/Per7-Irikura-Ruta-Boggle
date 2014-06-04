public class Tile{
  
  public class Coordinate{
    int row;
    int col;
    
    public Coordinate(int r, int c){
      row = r;
      col = c;
    }
    
    int getRow(){
      return row;}
    int getCol(){
      return col;}
    
    //Adjacent meaing veritically, horizontally and diagonally
    boolean isAdjacentTo(Coordinate coor){
      int otherRow = coor.getRow();
      int otherCol = coor.getCol();
      if ((abs(row-otherRow))<2 && (abs(col-otherCol))<2){
          return true;
      }else{
          return false;
      } 
    }
    
    //Checks to see if two coordinates are identical
    boolean repeatCoor(Coordinate coor){
       return (coor.getRow() == row && coor.getCol() == col);
    }
  }  
  
color c = color(255);
int width = 80;
int height = 80;
int x = 200;
int y = 200;
char letter;
boolean isSelected = false;

public Tile(int x, int y, char c){
    this.x = x;
    this.y = y;
    letter = c;    
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

void setup(){
   size(width,height);
   
   
   
}
void draw(){
   background(255);
 
  
}

///Doesnt Work
void select(){
    if (isSelected){
       c = color(255,255,255);
       
    }
    else{
      c = color(0,0,255);
    }
    isSelected = !isSelected;
}

void display(){
   fill(c);
   rect(x,y,80,80);
   fill(0);
   textSize(32);
   text(getLetter(), x + width/2 - 10,y + height/2 + 5);
}
       
}

