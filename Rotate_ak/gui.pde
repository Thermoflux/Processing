/* ========================================================= //<>//
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

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:292608:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:292608:

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
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  // Update simulation speed
  boat.updateSimSpeed(source.getValueI() );
} //_CODE_:slider1:713671:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.ORANGE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  textfield1 = new GTextField(this, 30, 50, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setPromptText("Enter file name");
  textfield1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
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
  slider1 = new GSlider(this, 310, 10, 100, 40, 10.0);
  slider1.setShowValue(true);
  slider1.setShowLimits(true);
  slider1.setLimits(1, 1, 10);
  slider1.setNbrTicks(5);
  slider1.setNumberFormat(G4P.INTEGER, 0);
  slider1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  label2 = new GLabel(this, 220, 20, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Sim Speed");
  label2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  label2.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GTextField textfield1; 
GLabel label1; 
GButton button1; 
GButton button2; 
GSlider slider1; 
GLabel label2; 