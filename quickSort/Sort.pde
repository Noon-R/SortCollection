public class QuickSort{
  int mCulculationCount = 0;
  int mSwapCount = 0;
  int mn = 0;
  int mi = 0;
  int mj = 0;
  float mPivot = 0; 
  float mWidth = 20;
  float[] mHeight;
  
  QuickSort(float[] array,int n){
    mHeight = array;
    mn = n ;
    Reset();
    mWidth = width/(float)mn;
  }
  
  public String Culculation(){
    if(mi == mj){
      if(mi != mn-1){
        mi++;
        mj = mn-1;
      }else{
        return "FinishState";
      }
    }else{
      if(mHeight[mj] < mHeight[mj-1]){
        return "ExchangeState";
    }
      mj--;
    }
    return "CulculationState";
  }
   
  public String ChangeBar(){
    float tmp = mHeight[mj];
      mHeight[mj] = mHeight[mj-1];
      mHeight[mj-1] = tmp;
      
      return "CulculationState";
  }  
  
  public void Render(){
    for(int i = 0;i < mn;i++){
      if(i == mj){
        fill(255,0,0);
      }else if(i == mj-1){
        fill(0,0,255);
      }else{
        fill(0);
      }
      rect(i*mWidth,height-mHeight[i],mWidth,mHeight[i]);
    }
  }
  public void Render(String finish){
    for(int i = 0;i < mn;i++){
      fill(0,255,0);
      rect(i*mWidth,height-mHeight[i],mWidth,mHeight[i]);
    }
    println(mCulculationCount);
    println(mSwapCount);
  }
  
  public void Reset(){
    mi = 0;
    mj = mn-1;
    mCulculationCount = 0;
    mSwapCount = 0;
  }
  
  public void SetArray(float[] array){
    mHeight = array;
  }
  
  public int PivotDecision(int first,int second,int third){
    if(mHeight[first] >= mHeight[second]){
      return (mHeight[first] <= mHeight[third]) ? first : ( (mHeight[second] <= mHeight[third] ) ? third : second ) ;
    }else{
      return (mHeight[first] <= mHeight[third]) ? ( (mHeight[second] <= mHeight[third] ) ? second : third ) : first  ;
    }
  }
}
  
