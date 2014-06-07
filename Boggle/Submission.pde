  public class Submission{
  
      String word;
      int pointValue;
      
      public Submission(String s, int p){
        word = s;
        pointValue = p;
      }
      
      String getWord(){ return word;}
      int getPointValue() {return pointValue;}
      
      String printout(){
        String str = word+ "......... "+ ""+pointValue;
        return str;
      }
      
  
  }
