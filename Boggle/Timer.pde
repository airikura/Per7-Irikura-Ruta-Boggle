public class Timer{
  int initialTime;
  int totalTime;
  
  Timer(int totalTime){
    this.totalTime = totalTime;
  }
  
  
  
  void start(){
    initialTime = millis();
  }
  
  boolean isFinished(){
    int passedTime = millis() - initialTime;
    if (passedTime > totalTime){
      return true;
    }
    return false;
  
  }
  
  int getElapsedTime(){
      return (millis() - initialTime);
  }
  
  int getElapsedTimeSeconds(){
      return (millis() - initialTime)/ 100;
  }
  
   int getRemainingTimeSeconds(){
      return (totalTime - (millis() - initialTime)/1000);
}
  
   
}
