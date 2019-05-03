
class Obstacle{
  int _startX;
  int _spikeX;
  int _spikeY;
  int _squareX;
  int _squareY;
  int _speed;
  boolean _ignore;
  
  Obstacle(int x){ 
    _startX = x;
    _squareX = _startX;
    _spikeX = _startX;
    _ignore = false;
  }
  
  void spike(int y){ //the spikes will kill you if you touch them from any direction
    _spikeY = y; //the y coordinate of the obstacle, set according to the argument in the constructor
    strokeWeight(2);
    stroke(0,0,0);
    fill(204,0,0);
    triangle(_spikeX, _spikeY, _spikeX+30, _spikeY, _spikeX+15, _spikeY-50);
    _spikeX -= _speed;
  }
  
  void square(int y){ //square obstacle (only safe to touch if you land on the top of the square)
    _squareY = y; //y coordinate 
    rectMode(CENTER);
    strokeWeight(2);
    stroke(0,0,0);
    fill(204,0,0);
    rect(_squareX, _squareY, 50, 50); 
    _squareX -= _speed;
  }
  
  void ignore(){ //make Player jump on square safely
    _ignore = true;
  }
  
//check for collisions
//for the spike obstacle
  int spikeGetX1(){
    return _spikeX+5;  
  }
  int spikeGetX2(){
    return _spikeX+75;  
  }
  int spikeGetY1(){
    return _spikeY-50; 
  }
  int spikeGetY2(){
    return _spikeY; 
  }
  
  //for the square obstacle
  int squareGetX1(){ //returns front coordinate of the square
    return _squareX-25;
  }
  int squareGetX2(){ //returns back coordinate of the square
    return _squareX+75;
  }
  int squareGetY1(){ //returns top coordinate of the square
    return _squareY-25;
  }
  int squareGetY2(){ //returns bottom coordinate of the square
    return _squareY+25;
  }
  
  void move(int speed){ //determines the speed which the obstacles move along the x-axis with
    _speed = speed;
  }
}
