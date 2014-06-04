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
