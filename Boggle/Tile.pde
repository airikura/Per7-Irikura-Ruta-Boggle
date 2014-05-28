public class Tile{
color c = color(255);
int width = 80;
int height = 80;
int x = 200;
int y = 200;
char letter = (char) int(random(25) + 97);
boolean isSelected = false;

Tile(int x, int y){
    this.x = x;
    this.y = y;
    
}

void setup(){
   size(width,height);
   
   
   
}
void draw(){
   background(255);
 
  
}

void mouseClicked(){
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
   text(letter, x + width/2 - 10,y + height/2 + 5);
}
       
}
