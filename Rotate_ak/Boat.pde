class Boat {
  // Properties
  int xofset;
  int yofset;
  float x, y;
  int xDir;
  int yDir;
  float hed;
  // Constructor
  Boat(int xot, int yot, int xt, int yt, float hedt) {
    xofset = xot;
    yofset = yot;
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
  }
  
  // Update fun
  void update(float xt, float yt, float hedt) {
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
  }
  
  // Display fun
  
  //void display() {
  //  fill(128,128,128);
  //  rotate(hed);
  //  triangle(x,y, x+20,y, x,y+20);
   

  //}
  
}