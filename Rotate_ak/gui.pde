/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:413223:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  // Pausing animation
  boat.updatePlay(false);
} //_CODE_:button1:413223:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:324534:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  // Playing animation
  boat.updatePlay(true);
} //_CODE_:button2:324534:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:713671:
  //  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  // Update simulation speed
  boat.updateSimSpeed(source.getValueI() );
} //_CODE_:slider1:713671:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:slider2:226617:
  //  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
  //  boat.updateSimTime(source.getValueF());
} //_CODE_:slider2:226617:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:643224:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
  if (event == GEvent.SELECTED) {
    loop = true;
  } else {
    loop = false;
  }
} //_CODE_:checkbox1:643224:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:727463:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
  if (event == GEvent.SELECTED) {
    tempFname = source.getSelectedText();
    println(source.getSelectedText());
  }
} //_CODE_:dropList1:727463:

public void ZoomLevel_change1(GSlider source, GEvent event) { //_CODE_:zoomLevel:820282:
  println("slider3 - GSlider >> GEvent." + event + " @ " + millis());
    // Update boat zoom level
    boat.updateZoomLevel(source.getValueF());
    
} //_CODE_:zoomLevel:820282:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.ORANGE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  label1 = new GLabel(this, 30, 20, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("File Name");
  label1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  label1.setOpaque(false);
  button1 = new GButton(this, 230, 50, 80, 30);
  button1.setText("Pause");
  button1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 328, 48, 80, 30);
  button2.setText("Play");
  button2.addEventHandler(this, "button2_click1");
  slider1 = new GSlider(this, 310, 10, 100, 50, 10.0);
  slider1.setShowValue(true);
  slider1.setShowLimits(true);
  slider1.setLimits(1, 1, 10);
  slider1.setNbrTicks(3);
  slider1.setShowTicks(true);
  slider1.setNumberFormat(G4P.INTEGER, 0);
  slider1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  label2 = new GLabel(this, 220, 20, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Sim Speed");
  label2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  label2.setOpaque(false);
  slider2 = new GSlider(this, 440, 40, 350, 50, 10.0);
  slider2.setShowValue(true);
  slider2.setLimits(0, 0, 10000);
  slider2.setNbrTicks(10);
  slider2.setShowTicks(true);
  slider2.setNumberFormat(G4P.INTEGER, 0);
  slider2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  slider2.setOpaque(false);
  slider2.addEventHandler(this, "slider2_change1");
  label3 = new GLabel(this, 580, 20, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Sim Time");
  label3.setOpaque(false);
  checkbox1 = new GCheckbox(this, 440, 10, 90, 20);
  checkbox1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText("Loop");
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  dropList1 = new GDropList(this, 10, 50, 210, 150, 4);
  dropList1.setItems(loadStrings("list_727463"), 0);
  dropList1.addEventHandler(this, "dropList1_click1");
  zoomLevel = new GSlider(this, 310, 90, 100, 40, 10.0);
  zoomLevel.setShowValue(true);
  zoomLevel.setShowLimits(true);
  zoomLevel.setLimits(50.0, 50.0, 1500.0);
  zoomLevel.setNbrTicks(5);
  zoomLevel.setShowTicks(true);
  zoomLevel.setNumberFormat(G4P.DECIMAL, 2);
  zoomLevel.setLocalColorScheme(GCScheme.RED_SCHEME);
  zoomLevel.setOpaque(false);
  zoomLevel.addEventHandler(this, "ZoomLevel_change1");
  label4 = new GLabel(this, 220, 100, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Zoom Level");
  label4.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GLabel label1; 
GButton button1; 
GButton button2; 
GSlider slider1; 
GLabel label2; 
GSlider slider2; 
GLabel label3; 
GCheckbox checkbox1; 
GDropList dropList1; 
GSlider zoomLevel; 
GLabel label4; 