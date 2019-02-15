void reDraw()
{
  background(0);
 
  gui.getTab("default")
   .activateEvent(true)
    .setLabel("Player")
     .setId(1);
     
  //gui.getTab("Arduino")
  // .activateEvent(true)
  //  .setId(2);
   
  gui.getTab("Options")
   .activateEvent(true)
    .setId(3);
   
  BPnext = new Button(gui, "Back")
   .setPosition(0, 16)
    .setHeight(24)
     .setWidth(50)
      .setFont(font);
      
  BPnext = new Button(gui, "Next")
   .setPosition(50, 16)
    .setHeight(24)
     .setWidth(50)
      .setFont(font);
     
  BPcont = new Button(gui, "Play")
   .setPosition (100,16)
    .setHeight(24)
     .setWidth(50)
      .setFont(font);
          
  BMexit = new Button(gui, "EXIT")
   .setPosition(450, 0)
    .setHeight(24)
     .setWidth(50)
      .setFont(font);
     
  /*BAactive = new Button(gui, "IsSerial")
   .setPosition(150, 50)
    .setLabel("Serial Port Enabled?")
     .moveTo("Arduino")
      .setFont(font);*/
     
  BFgetFolder = new Button(gui, "Directory")
   .setPosition(150, 50)
     .moveTo("Options")
      .setFont(font);
     
  BVisu = new Button(gui, "LowCPUMode")
   .setPosition(147, 16)
    .setHeight(24)
     .setWidth(100)
      .moveTo("default")
       .setLabelVisible(true)
        .setFont(font);
  
     
  Sleng = new Slider(gui, "Rewind")
   .setPosition(0, height-20)
    .setSize(width, 20)
     .setRange(1, 100);
 
}

void controlEvent(ControlEvent theControlEvent)
{
 if (theControlEvent.isTab())
  activeTab = theControlEvent.getTab().getId();
}
