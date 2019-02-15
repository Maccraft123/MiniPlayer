import processing.serial.*;
//import processing.sound.*;
import ddf.minim.*;
import controlP5.*;

ControlP5 gui;
Serial port;
Minim minim;
Button BPnext;               //Button for Next File
Button BBack;                //           Previous File
Button BPstop;               //           Stop Playing          DONE
Button BPcont;               //           Continue Playing      DONE
Button BMexit;               //           Exit                  DONE
Button BAactive;             //           Is Serial port?       WIP
Button BFgetFolder;          //           Getting Dir to play   WIP
Button BVisu;                //Toggle For Visualization         DOING
Slider Sleng;                //                                 WIP
AudioPlayer player;          //                                 DONE
File[] files;                //                                 WIP(Counting WIP, other DONE)
File filetoplay;             //                                 DONE
 
int i = 100, overButton, directory, x, y, activeTab = 1, tmp;
int[] keysPressed;
String dir;
String line = "/home/maccraft123/Music/";
//String line = "";
File prevFile;
int filesCount = 100;
String nowPlay;
PFont font;
boolean isPi = false;
boolean isSerial = false;
boolean isPhone = false;
PrintWriter output;
BufferedReader reader;
 
void setup()
{
  background(0);
  size(500,200);
 
  font = createFont("arial", 10);
  files = listFiles(line);
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
  
  gui = new ControlP5(this);
  reDraw();
  filetoplay = files[int(random(0, filesCount))];
  println("PLAYING: ", filetoplay.getName());
  player = minim.loadFile(filetoplay.getAbsolutePath());
  player.play();
  textFont(font);
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
 
  Sleng.setValue(map(player.position(), 0, player.length(), 1, 100));
}