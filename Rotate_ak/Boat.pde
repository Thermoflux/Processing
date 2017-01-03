class Boat {
  // Properties
  int xofset;
  int yofset;
  float x, y;
  int xDir;
  int yDir;
  float hed;
  boolean playr;
  int simSpd;
  int time;
  // Constructor
  Boat(int xot, int yot, int xt, int yt, float hedt) {
    xofset = xot;
    yofset = yot;
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
    playr  = false;
    simSpd = 1;
    time = 0;
  }
  
  // Update fun to update position and heading
  void update(int timet, float xt, float yt, float hedt) {
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
    time   = timet;
   
  }
  
  // setter for Play
  void updatePlay(boolean playt){
    playr = playt;
  }
  
  // setter for sim speed
  void updateSimSpeed(int sspdt){
   simSpd = sspdt;
  }
 
  
  // getter for time
  int getBoatTime(){
    return this.time;
  }
    
  // Display fun // I have trouble using this function now.
  
  //void display() {
  //  fill(128,128,128);
  //  rotate(hed);
  //  triangle(x,y, x+20,y, x,y+20);
   

  //}
  
}