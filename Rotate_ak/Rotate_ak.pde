/** //<>// //<>// //<>//
 * Rotate Object 
 * 
 * Rotates a 'Boat' and also transates it around the graph. 
 * 
 * 
 * 
 * 
 */
import java.util.Date;
import g4p_controls.*;

String fname = "PosDat.csv";
String tempFname = fname;
Table Pos;
int i;
//float xmoff=500;
//float ymoff=500;
float hedmoff=0.001;
boolean endofList = false;
boolean loop = false;
Boat boat = new Boat(int(width*.5), int(height*.5), 0, 0, 0.0);

void setup() {
  i=1;

  // This chunk if code will create a list of .csv data files and writes the list to a file for use in GUI dropdown menu
  // Begin
  String path = dataPath("");  
  println("Path = " + path);  
  String[] filenames = listFileNames(path);
  StringList impF= new StringList();
  for (int i = 0; i < filenames.length; i++) {
    String[] m = match(filenames[i], ".csv");
    if (m != null) {
      //         println(filenames[i]);
      impF.append(filenames[i]);
    }
  }
  String[] nF = impF.array();
  printArray(nF);
  File fname2 = new File(path, "list_727463");
  println(fname2);
  saveStrings(fname2, nF);
  // End

  // Read data into file
  Pos = loadTable(fname);

  println("==================================================");
  println("Rotate_ak v0.1 by Thermoflux");
  println("Vessel Position and Heading vizualizer");
  println("==================================================");

  println(Pos.getRowCount() + " total rows in table"); 

  println("LIBRARY:");


  // Create file list

  // Creating gui
  createGUI();
  size(1000, 800);

  noStroke();
  fill(21);
  rectMode(CENTER);
  
  // Setting Zoom Level 
  boat.updateZoomLevel(500);
}

void draw() {
  background(200);  

  // To stop Animation at the end of data points
  if ((i >= Pos.getRowCount()-(boat.simSpd)) && (endofList == false && loop == false) ) {
    endofList = true;
    boat.updatePlay(!endofList);
    i-=boat.simSpd;
  }

  // Update i value only when sim is running
  if (i >= (Pos.getRowCount() - boat.simSpd) && (boat.playr == true)) {
    i=1;
    endofList = false;
  }

  // Load new position and heading values     
  float  x = Pos.getFloat(i, 1) * boat.xmoff;
  float  y = Pos.getFloat(i, 2) * boat.ymoff;
  float  hed = Pos.getFloat(i, 3) * hedmoff;
 
  // Update Sim Time from Slider value
  if (abs(slider2.getValueF() - boat.getBoatTime()) > 20 ) {
    i = int(map(slider2.getValueF(), 0, 10000, 0, float(Pos.getRowCount()-1) ));
  }

  float tmpTime = map( float(i), (0.0), float(Pos.getRowCount()), (0.0), (10000.0) );

  // Updating values in object boat
  boat.update(tmpTime, x, y, hed);
  tmpTime = map( (boat.time), 0, 10000, 0, float(Pos.getRowCount()) );
  i = int(tmpTime);
  //println(boat.simSpd);
  // Plot boat position 
  pushMatrix();
  for (int j=0; j<i; j+=boat.simSpd) {
    float  xt = Pos.getFloat(j, 1) * boat.xmoff;
    float  yt = Pos.getFloat(j, 2) * boat.ymoff;
    stroke(10);
    fill(50);
    ellipse(width/2+xt-150, height/2+yt-250, 5, 5);
  }
  popMatrix();


  pushMatrix();
  text(" X: "+ Pos.getFloat(i, 1), width*.10, height*.20);
  text(  " Y: "+ Pos.getFloat(i, 2), width*.10, height*.250);
  text(" Hed: "+ Pos.getFloat(i, 3), width*.10, height*.30);

  translate(width/2+boat.x, height/4+boat.y);
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
  // Simple Boat   
  strokeWeight(0);
  fill(0, 100, 200);
  rect(-35, 0, 30, 40);
  fill(0, 0, 200);
  ellipse(0, 0, 100, 40);
  popMatrix(); 

  // Update simulation Time
  if (boat.playr == true ) {
    i+=boat.simSpd;
    slider2.setValue(boat.getBoatTime()); // Update Slider 2 here
  }  

  if (fname.equals(tempFname) == false) {
    Pos =  loadTable(tempFname);
    fname = tempFname;
    i = 0;
  }
}


// This function returns all the files in a directory as an array of Strings
// Copied from tutorials
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
// EOF