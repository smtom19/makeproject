
class Player{
  int _PlayerX; //x location
  int _PlayerY; //y location
  int _PlayerSize;
  int _startY; 
  
  //attributes (not affected by arguments)
  //player cannot cannot jump twice in a row like flappy bird
 
  int gravity = 6; //jump span
  int jumpCounter = 0; //jump span
  int jumpCounterLimit = 20; 
  boolean isJumping = false; 
  float jumpAngle = 0; 
  float incrementAngle = PI/20; 
  //player must land on the ground before jumping again
  boolean notInAir = true; //used to determine when player object is allowed to jump

  Player(int x, int y, int size){ 
    _PlayerX = x;
    _PlayerY = y;
    _PlayerSize = size;
    _startY = y; 
  }
  
  void jump(){ 
    if(notInAir){ 
      isJumping = true; //allows user to jump 
    }
  }
  
  void physics(){
    if(_PlayerY < _startY){ 
      _PlayerY += gravity; 
      notInAir = false; //cant jump if youre in the air
    }else{
      notInAir = true; //if player is on the "floor" = true, allowing "jump()" to work
    }
    
    if(isJumping){
      _PlayerY -= 12; //jump
      jumpCounter += 1; 
    }
    if(jumpCounter >= jumpCounterLimit){ //jumping stops when counter counter reaches their limit
      isJumping = false;
      jumpCounter = 0; //the counter is reset
    }
    
    if(!notInAir){
      jumpAngle += incrementAngle; //rotate user
    }
    if(notInAir){
      jumpAngle = 0; 
    }
  }
  
  int getX(){ 
    return _PlayerX + _PlayerSize/2; //front coordinate
  }
  int getY(){
    return _PlayerY + _PlayerSize/2; //bottom coordinate
  }

  void display(){ 
    pushMatrix(); 
    
    rectMode(CENTER); 
    translate(_PlayerX, _PlayerY); 
    rotate(jumpAngle); 
    
    //player square
    strokeWeight(2);
    stroke(0, 0, 0);
    fill(58, 240, 160);
    rect(0, 0, _PlayerSize, _PlayerSize);

    popMatrix();//rotate user
  }
}
