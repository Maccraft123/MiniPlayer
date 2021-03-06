import processing.serial.*;
//import processing.sound.*;
import ddf.minim.*;
import controlP5.*;

ControlP5 gui;
Serial port;
Minim minim;
Button BPnext;               //Button for Next File
Button BBack;                //           Previous File
Button BPcont;               //           Continue Playing      DONE
Button BMexit;               //           Exit                  DONE
Button BAactive;             //           Is Serial port?       TODO
Button BFgetFolder;          //           Getting Dir to play   DONE(mostly)
Button BVisu;                //Toggle For Visualization         TODO
Slider Sleng;                //                                 DONE
Slider Svolu;                //                                 WIP
AudioPlayer player;          //                                 DONE
File[] files;                //                                 DONE
File filetoplay;             //                                 DONE
 
int i = 100, overButton, directory, x, y, activeTab = 1, tmp;
int[] keysPressed;
String dir = "/home/maccraft123/Music/";
//String dir = "";
File prevFile;
int filesCount = 100;
String nowPlay;
PFont font;
//boolean isPi = false;
boolean isSerial = false;
//boolean isPhone = false;
boolean isPlaying = true;
PrintWriter output;
BufferedReader reader;
 
void setup()
{
  background(0);
  size(500,200);
 
  font = createFont("arial", 10);
  files = listFiles(dir);
  filesCount=files.length;
  
  minim = new Minim(this);
  try
  {
   port = new Serial(this, Serial.list()[1], 9600);
   isSerial = true;
  }
  catch(Exception e)
  {
    isSerial = false;
  }
  
  try
  {
    BufferedReader reader = createReader("settings.conf");
    if (reader.readLine().equals("config"))
      dir = reader.readLine();
    print("No error here");
    selected = true;
  }
  catch (Exception e)
  {
    selectFolder("Please select folder with music", "Folder");
    selected = true;
  }  

  while (!selected) delay(1000);
  minim = new Minim(this);
  gui = new ControlP5(this);
  reDraw();
}

void init()
{
  files = listFiles(dir);
  print("still no error");
  filesCount=files.length;
  filetoplay = files[int(random(0, filesCount))];
  println("PLAYING: ", filetoplay.getName());
  player = minim.loadFile(filetoplay.getAbsolutePath());
  player.play();
  textFont(font);
  BPcont.setLabel("Stop");
}
 
void draw()
{
  background(0);
  stroke(255);
  if (activeTab == 1)
  {
  for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, 500);
      float x2 = map( i+1, 0, player.bufferSize(), 0, 500);
      line( x1, 100 + player.left.get(i)*50, x2, 100 + player.left.get(i+1)*50 );
    }
  }
  if (player.position()+10 >= player.length())
   Next();
  
  if (player.getGain() != Svolu.getValue())
    player.setGain(Svolu.getValue());
  
  if (mousePressed && mouseY > 180)
  {
    if (int(Sleng.getValue()) != int(map(player.position(), 0, player.length(), 1, 100)))
    {
      println("Rewinding");
      Stop();
      player.play(int(map(Sleng.getValue(), 0, 100, 0, player.length())));
    }
  }
    
  Sleng.setValue(map(player.position(), 0, player.length(), 1, 100));
}
