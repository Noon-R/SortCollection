public class StateMachine{
  ArrayList<IState> mStates = new ArrayList<IState>();  
  IState mCurrentState = new EmptyState(this);
  int mStateNumber = -1;
 
 public void Update(){
   mCurrentState.Update();
 }
 
 public void Change(){
   mStateNumber ++;
   if(mStateNumber >= mStates.size()){
     mStateNumber = 0;
   }
   mCurrentState.OnExit();
   mCurrentState =  mStates.get(mStateNumber);
 }
 
 public void Add(IState nState){
   mStates.add(nState);
 }
 
}
