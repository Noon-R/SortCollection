public class ShakerSort{
  int mCulculationCount = 0;
  int mSwapCount = 0;
  int mn = 0;
  int mRight = 0;
  int mLeft = 0;
  int mIndexUpper = 1;
  int mi = 0;
  int mNoChangeCount = 0;
  boolean mDirectionIsLeft = true;
  float mWidth = 20;
  float[] mHeight;
  
  ShakerSort(float[] array,int n){
    mHeight = array;
    mn = n ;
    Reset();
    mWidth = width/(float)mn;
  }
  
  public boolean Direction(){
    return mDirectionIsLeft;
  }
  
  public String CulculationToLeft(){
    mCulculationCount++;
    if(mRight == mLeft || mNoChangeCount == mRight - mLeft + 1){
      return "FinishState";
    }else{
      if(mi == mLeft){
        mLeft++;
        mDirectionIsLeft = false;
        mi++;
        mNoChangeCount = 0;
        return "CulculationState";
      }
      if(mHeight[mi] < mHeight[mi-1]){
        mNoChangeCount = 0;
        return "ExchangeState";
      }
      mi--; 
      mNoChangeCount++;
    }
    return "CulculationState";
  }
  
  public String CulculationToRight(){
    mCulculationCount++;
    if(mRight == mLeft || mNoChangeCount == mRight - mLeft){
      return "FinishState";
    }else{
      if(mi == mRight){
        mRight--;
        mDirectionIsLeft = true;
        mi--;
        mNoChangeCount = 0;
        return "CulculationState";
      }
      if(mHeight[mi] < mHeight[mi-1]){
        mNoChangeCount = 0;
        return "ExchangeState";
      }
      mNoChangeCount++;
      mi++;
    }
    return "CulculationState";
  }
   
  public String ChangeBar(){
    mSwapCount++;
    float tmp = mHeight[mi];
    mHeight[mi] = mHeight[mi-1];
    mHeight[mi-1] = tmp;
    if(mDirectionIsLeft){
      mi--;
    }else{
      mi++;
    }
     
    return "CulculationState";
  }  
  
  public void Render(){
    for(int i = 0;i < mn;i++){
      if(i == mi){
        fill(255,0,0);
      }else if(i == mi-1){
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
    mRight = mn;
    mLeft  = 0;
    mIndexUpper = 1;
    mi = mn-1;
  }
  
  public void SetArray(float[] array){
    mHeight = array;
  }
}
  
