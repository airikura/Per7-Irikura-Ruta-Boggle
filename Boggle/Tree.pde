public class Tree{

  public class Node{
      char letter;
      //True if the node marks the end of a possible word
      boolean endWord;
      Node[] nextLetter;
  
      //Used to set the root (hold the char '3')
      Node(){
          letter = '3';
          endWord = false;
          nextLetter = new Node[26];
           for (int i =0; i<26; i++){
            nextLetter[i] = null;
        }
      }
     Node(char c){
        letter = c;
        endWord = false;
         nextLetter = new Node[26];
        for (int i =0; i<26; i++){
            nextLetter[i] = null;
        }
     }
     
     char getCharacter(){  
       return letter;}
     boolean isEndWord(){ 
       return endWord;}
     Node getNextLetter(int index){  
       return nextLetter[index];}
     
     void setNextNode(Node n, int index){
       if(index>-1 && index<26){
           nextLetter[index] = n;
       }
     }
     
     void setCharacter(char c){   
       letter = c;}
     void setWord(){  
       endWord = true;}
  }

  Node root;
  //number of words in the tree
  int totalWords;
  
  public Tree(){
      root = new Node();
      totalWords = 0;
  }
  
  //inserting a word into a tree
  //using UpperCase Letters
  void insert(String word){
    Node tracker= root;
    int charIndex = 0;
    while (charIndex < word.length()){
      char current = word.charAt(charIndex);
      int currentASCII = (int) current;
      if (tracker.getNextLetter(currentASCII - 65) == null){
        Node temp = new Node(current);
        tracker.setNextNode(temp, currentASCII-65);
      }
      if(charIndex == word.length()-1){
        if (!tracker.getNextLetter(currentASCII-65).isEndWord()){
          tracker.getNextLetter(currentASCII - 65).setWord();
          totalWords++;
        }
      }
      tracker = tracker.getNextLetter(currentASCII - 65);
      charIndex++;
    }
  }

  int getTotalWords(){
    return totalWords;}
  
  //Returns true if the word is found, false if not
  //Does NOT remove word from the dictionary/tree
  boolean find(String word){
    Node tracker = root;
    char current;
    int currentASCII;
    for (int i=0; i<word.length()-1; i++){
      current = word.charAt(i);
      currentASCII = (int) current;
      if (tracker.getNextLetter(currentASCII - 65) == null){
        return false;
      } else {
          tracker = tracker.getNextLetter(currentASCII - 65);
        }
      }  
      //Checks to see if the last letter is a valid node
      //Returns true if it is a valid node and is marked by endWord
      currentASCII = (int) word.charAt(word.length()-1);
      if (tracker.getNextLetter(currentASCII - 65) == null){
          return false;
      } else {
        return tracker.getNextLetter(currentASCII - 65).isEndWord();
    }
  }
}



