public class Tile{
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

