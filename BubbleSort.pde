Element[] elements = new Element[400]; //Can Change the element number up to 500 for the set size(1100, 800)

float xPos;
float yPos;
float wide;
boolean letsSort = false;

void setup(){
  size(1100, 800);
  background(0);
  for(int i = 0; i < elements.length; i++){
    elements[i] = new Element(i + 1);
  }
  mix();
}

void draw(){
  clear();
  translate(width / 2 - (elements.length * 2 + elements.length * 0.1) / 2, height / 2 + elements.length / 2);
  stroke(255);
  xPos = 0;
  yPos = 0;
  
  if(isCompletelyMixed() == false && letsSort == false){
    if(isCompletelySorted()){
      delay(3500); //Delay time to display the complete sorted elements
    }
    mix();
  } else if(isCompletelyMixed() == true){
    delay(2000); //Delay time to display the complete mixed elements
    letsSort = true;
  }

  if(letsSort == true){
    slctSort(); //Selection Sort
    //bblSort();//Bubble Sort
  }
  if(isCompletelySorted()){
    letsSort = false;
  }
 
  for(int i = 0; i < elements.length; i++){
    rect(xPos, 0, 0.1, -(elements[i].height));
    xPos+= 2;
  }
}

void mix(){
  int indA = int(random(0, elements.length));
  int indB = int(random(0, elements.length));
  while(elements[indA].height == indA){
    indA = int(random(0, elements.length));
  }
  while(elements[indB].height == indB){
    indB = int(random(0, elements.length));
  }
  float h = elements[indA].height;
  elements[indA].height = elements[indB].height;
  elements[indB].height = h;
}

boolean isCompletelyMixed(){
  for(int i = 0; i < elements.length; i++){
    if(elements[i].height == i + 1){
      return false;
    }
  }
  return true;
}

boolean isCompletelySorted(){
  for(int i = 0; i < elements.length; i++){
    if(elements[i].height != i + 1){
      return false;
    }
  }
  return true;
}

void swap(int a, int b){
  float rh = elements[a].height;
  elements[a].height = elements[b].height;
  elements[b].height = rh;
}

void bblSort(){
   for(int i = 0; i < elements.length - 1; i++){
      boolean isSwapped = false;
      for(int j = 0; j < elements.length - i - 1; j++){
        if(elements[j].height > elements[j + 1].height){
          swap(j, j + 1);
          isSwapped = true;
        }
      }
      if(isSwapped){
      break;
      }
   }
}
int bound = 0;

void slctSort(){
  int min_idx = bound; 
  for (int j = bound + 1; j < elements.length; j++){
    if (elements[j].height < elements[min_idx].height){
      min_idx = j;
    }
  }
  swap(min_idx, bound);
  bound++;
  if(bound >= elements.length){
    bound = 0;
  }
}
