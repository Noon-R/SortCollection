public class BubbleSort{
  int mCulculationCount = 0;
  int mSwapCount = 0;
  int mn = 0;
  int mi = 0;
  int mj = 0;
  int mNoChangeCount = 0;
  float mWidth = 20;
  float[] mHeight;
  
  BubbleSort(float[] array,int n){
    mHeight = array;
    mn = n ;
    Reset();
    mWidth = width/(float)mn;
  }
  
  public String Culculation(){
    mCulculationCount++;
    if( mNoChangeCount >= mn - mi ){
      return "FinishState";
    }
    if(mi == mj){
      if(mi != mn-1){
        mi++;
        mj = mn-1;
      }else{
        return "FinishState";
      }
    }else{
      if(mHeight[mj] < mHeight[mj-1]){
        mNoChangeCount = 0;
        return "ExchangeState";
      }
      mNoChangeCount++;
      mj--;
    }
    return "CulculationState";
  }
   
  public String ChangeBar(){
    
    float tmp = mHeight[mj];
    mHeight[mj] = mHeight[mj-1];
    mHeight[mj-1] = tmp;
    mSwapCount++;
    mj--;
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
    fill(0);
    text("計算回数は"+mCulculationCount,0,20);
    text("交換回数は"+mSwapCount,0,40);
    text("合計は"+(mCulculationCount+mSwapCount),0,60);
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
}
  
