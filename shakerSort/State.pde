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

public class CulculationState implements IState{
  int mCountFrame = 0;
  StateMachine mStateMachine ;
  
  CulculationState(StateMachine stateMachine){
    mStateMachine = stateMachine;
  }
  
  public void Update(){
    print(0);
    background(255);
    String nextState;
    if(shakerSort.Direction()){
      nextState = shakerSort.CulculationToLeft();
    }else{
      nextState = shakerSort.CulculationToRight();
    }
    mStateMachine.Change(nextState);
    shakerSort.Render();
  }
  public void OnEnter(){
  }
  public void OnExit(){
    mCountFrame = 0;
  }
}


public class ExchangeState implements IState{
  int mCountFrame = 0;
  StateMachine mStateMachine ;
  
  ExchangeState(StateMachine stateMachine){
    mStateMachine = stateMachine;
  }
  
  public void Update(){
    print(1);
    background(255);
    String nextState = shakerSort.ChangeBar();
    shakerSort.Render();
    mStateMachine.Change(nextState);
    mCountFrame++;
  }
  public void OnEnter(){}
  public void OnExit(){
    mCountFrame = 0;
  }
  
}

public class FinishState implements IState{
  int mCountFrame = 0;
  StateMachine mStateMachine ;
  
  FinishState(StateMachine stateMachine){
    mStateMachine = stateMachine;
  }
  
  public void Update(){
    print(0);
    background(255);
    shakerSort.Render("finish");
    noLoop();
    print("finish");
  }
  public void OnEnter(){}
  public void OnExit(){
    mCountFrame = 0;
  }
  
}
