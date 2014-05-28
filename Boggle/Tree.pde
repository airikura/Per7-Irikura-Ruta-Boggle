public class Tree{

  public class Node{
      char letter;
      //True if the node marks the end of a possible word
      boolean word?;
      //Each char node has 26 children (UpperCase Letters)
      Node[] nextLetter = new Node[26];
  
      //Used to set the root (hold the char '3')
      Node(){
          letter = '3';
          word? = false;
           for (int i =0; i<26; i++){
            nextLetter[i] = null;
        }
      }
     Node(char c){
        letter = c;
        word? = false;
        for (int i =0; i<26; i++){
            nextLetter[i] = null;
        }
     }
     
     char getCharacter(){  return letter;}
     
     Node getNextLetter(int index){  return nextLetter[i];}
     
     void setCharacter(char c){   letter = c;}
     void setWord(){   word? = true;}
  }

  Node root;
  
  public Tree(){
      root = new Node();
  }
  
  //inserting a word into a tree
  //using UpperCase Letters
  public void insert(String word){
    Node tracker= root
    int charIndex = 0;
  
    while (charIndex > word.length()){
      char current = word.charAt(charIndex);
      int currentASCII = (int) current;
      if (tracker.getNextLetter(currentASCII - 65) == null){
        tracker.getNextLetter(currentASCII - 65) = new Node(current);
      }
      if(charIndex == word.length()-1){
        tracker.getNextLetter(currentASCII - 65).setWord();
      }
      tracker = tracker.getNextLetter(currentASCII - 65);
      charIndex++;
    }
  }
   
   
  }

