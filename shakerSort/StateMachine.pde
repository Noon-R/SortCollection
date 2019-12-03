import java.util.Map;
public class StateMachine{
  HashMap<String,IState> mStates = new HashMap<String,IState>();  
  IState mCurrentState = new EmptyState(this);
 
 public void Update(){
   mCurrentState.Update();
 }
 
 public void Change(String name){
   if(mStates.get(name) != null){
     mCurrentState.OnExit();
     mCurrentState =  mStates.get(name);
     mCurrentState.OnEnter();
   }else{
     print(name+"State is not exist!!");
   }
 }
 
 public void Add(String name,IState nState){
   mStates.put(name,nState);
 }
 
}
