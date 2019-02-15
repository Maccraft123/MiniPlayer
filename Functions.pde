void NextFile(int a)
{
  if (a == 1)
    filetoplay=prevFile;
  else
  {
    prevFile=filetoplay;
    filetoplay = files[int(random(0, filesCount))];
  }
  println("Now Playing: ", filetoplay.getName());
  player.mute();
  player = minim.loadFile(filetoplay.getAbsolutePath());
  player.play();
}

void Next()
{
  NextFile(0);
}

void Back()
{
  NextFile(1);
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
