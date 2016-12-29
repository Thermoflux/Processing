import g4p_controls.*;

/**
 * Rotate. 
 * 
 * Rotates a 'Boat' and also transates it around the graph. 
 * 
 * 
 * 
 * 
 */
 
String fname = "PosDat.csv";
Table Pos;
int i;
float xmoff=1000;
float ymoff=1000;
float hedmoff=0.001;

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
 createGUI();
  size(800, 800);
  
  noStroke();
 // textFont(createFont("SourceCodePro-Regular.ttf",24));
  fill(21);
  rectMode(CENTER);

  
  /* Time = Pos.getRow(1); 
  ax   =
  ay   =
  ahed =
  */

}

void draw() {
  background(220);  
// createGUI();

     if(i >= Pos.getRowCount()){
    i=1;}
  float  x = Pos.getFloat(i,1) * xmoff;
  float  y = Pos.getFloat(i,2) * ymoff;
  float  hed = Pos.getFloat(i,3) * hedmoff;
     
   if(boat.playr == true){
  i++;
   }    //boat.updatePlay(true);

   String msg = "";
  
 // print(" ^("+x+" " +y+" " + hed + "  ^)");
  boat.update(x,y,hed);
  
  //angle = hed;
  //float c = cos(angle);
  
  //for(int j=0;j<i;j++){
  //   float  xt = Pos.getFloat(j,1);
  //   float  yt = Pos.getFloat(j,2);
  //   point(xt+100,yt+100);
  //  }
    pushMatrix();
  text(" X: "+ boat.x,width*.10,height*.20);
  text(  " Y: "+ y,width*.10,height*.250);
  text(" Hed: "+ hed,width*.10,height*.30);
    translate(width/2+boat.x, height/2+boat.y);
  rotate(boat.hed);
  //triangle(boat.x-50,boat.y-50, boat.x,boat.y+100, boat.x+50,boat.y+50);
  fill(20);
  rect(0, 0, 100, 180); // Boat
  fill(255,0,50);
  rect(30, 0, 50, 180,7); // Port
  fill(30,200,10);
  rect(-30, 0, 50,180,7); // Stbd
  fill(30,2,200);
  rect(0,-120, 100,50,8); // Bow
      popMatrix(); 
  
  
  
}