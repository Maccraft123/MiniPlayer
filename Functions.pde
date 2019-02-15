void Next()
{
  filetoplay = files[int(random(0, 51))];
  if (isSerial) println("Now Playing: "+filetoplay.getName());
  println("Now Playing: ", filetoplay.getName());
  player.mute();
  player = minim.loadFile(filetoplay.getAbsolutePath());
  player.play();
}
 
void Play()
{
  player.play();
}
 
void Stop()
{
  player.pause();
}
 
void EXIT()
{
  exit();
}
