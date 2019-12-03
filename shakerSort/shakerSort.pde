ShakerSort shakerSort;
int count = 25;
float[] rHeight = new float[count];
int maxHeight;
StateMachine stateMachine = new StateMachine();

PFont font ;

void setup(){
  size(640,480);
  maxHeight = height;
  
  font = createFont("SpicaNeue-Regular-20",20,true);
  textFont(font,20);
  for(int i = 0;i< count;i++){
    rHeight[i] = noise(i)*maxHeight;
  }
  shakerSort = new ShakerSort(rHeight,count);
  stateMachine.Add("CulculationState",new CulculationState(stateMachine));
  stateMachine.Add("ExchangeState",new ExchangeState(stateMachine));
  stateMachine.Add("FinishState",new FinishState(stateMachine));
  stateMachine.Change("CulculationState");
  shakerSort.Render();
  frameRate(120);
 
}

void draw(){
  stateMachine.Update();
  saveFrame("Image/01/shaker#######.jpg");
}
