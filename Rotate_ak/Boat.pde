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
  float time;
  float xmoff=500;
  float ymoff=500;

  // Constructor
  Boat(int xot, int yot, int xt, int yt, float hedt) {
    xofset = xot;
    yofset = yot;
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
    playr  = false;
    simSpd = 2;
    time = 0;
  }

  // Update fun to update position and heading
  void update(float timet, float xt, float yt, float hedt) {
    x      = xt+xofset;
    y      = yt+yofset;
    hed    = hedt;
    time   = timet;
  }

  // setter for Play
  void updatePlay(boolean playt) {
    playr = playt;
  }

  // setter for sim speed
  void updateSimSpeed(int sspdt) {
    simSpd = sspdt;
  }

  // setter for sim time
  void updateSimTime(float timet) {
    time = timet;
  }

  // getter for time float
  float getBoatTime() {
    return this.time;
  }
 
 // setter for xmoff
 void updateXoffset(int xoff){
   xofset = xoff;
 }
 
// setter for ymoff
 void updateYoffset(int yoff){
   yofset = yoff;
 }
 
  // Display fun // I have trouble using this function now.

  //void display() {
  //  fill(128,128,128);
  //  rotate(hed);
  //  triangle(x,y, x+20,y, x,y+20);


  //}
  
  // setter for Zoom Level
  void updateZoomLevel(float zoomLvl) {
    xmoff = zoomLvl;
    ymoff = zoomLvl;
  }
  
}