ArrayList<Tile> tiles;

void setup(){
      size(400,400);
      tiles = new ArrayList<Tile>();
      for (int i =0; i < 3; i++){
         for (int k =0; k < 3; k++){
             Tile a = new Tile(k * 80, i *80);
             tiles.add(a);
         }
      }
}
   
  void draw(){
   background(0,0,255);
   fill(0,255,0);
   for (int i =0; i < tiles.size(); i ++){
   Tile m = tiles.get(i);
   m.display();
   }
   
  }
 
  

