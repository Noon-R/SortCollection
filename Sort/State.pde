interface IState{
  
  void Update();
  void OnEnter();
  void OnExit();
}

public class EmptyState implements IState{
   int mCountFrame = 0;
  StateMachine mStateMachine ;
  
  EmptyState(StateMachine stateMachine){
    mStateMachine = stateMachine;
  }
  public void Update(){}
  public void OnEnter(){}
  public void OnExit(){}
}

public class EllipsePaintState implements IState{
  int mCountFrame = 0;
  StateMachine mStateMachine ;
  
  EllipsePaintState(StateMachine stateMachine){
    mStateMachine = stateMachine;
  }
  
  public void Update(){
    print(0);
    background(255);
    
    
    if(mCountFrame > frameRate*2){
      mStateMachine.Change();
    }
    mCountFrame++;
  }
  public void OnEnter(){}
  public void OnExit(){
    mCountFrame = 0;
  }
}
