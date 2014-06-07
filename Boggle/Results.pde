public class Results{

  ArrayList<Submission> result;
  Submission[] sortedResults;
  
  public Results(){
    result = new ArrayList<Submission>();
  }
  
  void insert(Submission s){
    result.add(s);
  }
  
  Submission getSub(int i){
    return sortedResults[i];
  }
  
  int getLength(){
    return sortedResults.length;
  }

  //swaps elements at indexes a and b    
  void swap(Submission[] s, int a, int b){
    if (a>-1 && a<s.length && b>-1 && b<s.length){
      Submission temp = s[a];
      s[a] = s[b];
      s[b] = temp;
    } 
  }
  
  int partition(Submission[] s, int left, int right){
    if (right==left){
      return left;
    }
    int pivot = (right+left)/2;
    Submission pivotValue = s[pivot];
    swap(s, right, pivot);
    for (int i=left; i<right; i++){
       if(s[i].getPointValue() < s[right].getPointValue()){
         swap(s, i, left);
         left++;
       }
    }
    swap(s, right, left);
    return left;
  }

  void qs(Submission[] s, int left, int right){
    if (right-left<1){
      return;
    } else{
      int pivotI = partition(s, left, right);
      qs(s, left, pivotI-1);
      qs(s,pivotI+1, right);
    }
  } 

  void quicksort(Submission[] s){
    qs(s, 0, s.length-1);
  }

  
  void sortByPointValue(){
    sortedResults = new Submission[result.size()]; 
    for (int i =0; i<result.size(); i++){
      sortedResults[i] = result.get(i);
    }
    quicksort(sortedResults);
  }


}
