/**
 * Rotate. 
 * 
 * Rotates a 'Boat' and also transates it around the graph. 
 * 
 * 
 * 
 * 
 */

import g4p_controls.*;

String fname = "PosDat.csv";
Table Pos;
int i;
float xmoff=1000;
float ymoff=1000;
float hedmoff=0.001;
boolean endofList = false;
Boat boat = new Boat(int(width*.5),int(height*.5),0,0,0.0);

void setup() {
  i=1;
  
  // Read data into file
  Pos = loadTable(fname);
  
  println("==================================================");
  println("Rotate_ak v0.1 by Thermoflux");
  println("Vessel Position and Heading vizualizer");
  println("==================================================");
 
  println(Pos.getRowCount() + " total rows in table"); 

  println("LIBRARY:");
  
  // Creating gui
  createGUI();
  size(800, 650);
  
  noStroke();
  fill(21);
  rectMode(CENTER);

}

void draw() {
  background(200);  

  // To stop Animation at the end of data points
  if((i >= Pos.getRowCount()-(boat.simSpd)) && endofList == false ){
      endofList = true;
      boat.updatePlay(!endofList);
      i-=boat.simSpd; //<>// //<>//
  }
  
  // Update i value only when sim is running
     if(i >= (Pos.getRowCount() - boat.simSpd) && (boat.playr == true)){
       i=1;
       endofList = false;
       }
       
  // Load new position and heading values     
  float  x = Pos.getFloat(i,1) * xmoff;
  float  y = Pos.getFloat(i,2) * ymoff;
  float  hed = Pos.getFloat(i,3) * hedmoff;
  
 // Updating values in object boat
  boat.update(i,x,y,hed);
  
  // Plot boat position 
  pushMatrix();
  for(int j=0;j<i;j+=boat.simSpd){
     float  xt = Pos.getFloat(j,1) * xmoff;
     float  yt = Pos.getFloat(j,2) * ymoff;
     stroke(10);
     fill(50);
     ellipse(width/2+xt-150,height/2+yt-150,5,5);
    }
    popMatrix();
    
    
  pushMatrix();
      text(" X: "+ boat.x,width*.10,height*.20);
      text(  " Y: "+ y,width*.10,height*.250);
      text(" Hed: "+ hed,width*.10,height*.30);
        translate(width/2+boat.x, height/3+boat.y);
      rotate(boat.hed);
      
      // Another kind of "boat"
        //fill(20);
        //rect(0, 0, 100, 180); // Boat
        //fill(255,0,50);
        //rect(30, 0, 50, 180,7); // Port
        //fill(30,200,10);
        //rect(-30, 0, 50,180,7); // Stbd
        //fill(30,2,200);
        //rect(0,-120, 100,50,8); // Bow
      strokeWeight(0);
      fill(0,100,200);
      rect(0,-30,30,40);
      fill(0,0,200);
      ellipse(0,0,40,100);
  popMatrix(); 
  
  // Update simulation Time
  if(boat.playr == true ){
  i+=boat.simSpd;
   } 
 
 
 
  
}
// EOF