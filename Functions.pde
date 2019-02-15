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
  BPcont.setLabel("Stop");
  isPlaying = true;
}

void Folder(File select)
{
  if (select == null) return;
  dir = select.getAbsolutePath();
  PrintWriter output;
  output = createWriter("settings.conf");
  output.println("config");
  output.println(dir);
  output.flush();
  output.close();
  selected = true;
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
  if (isPlaying)
  {  
    player.pause();
    BPcont.setLabel("Play");
    isPlaying = false;
  }
  else
  {
    BPcont.setLabel("Stop");
    player.play();
    isPlaying = true;
  }
}
 
void Stop()
{
  player.pause();
}
 
void EXIT()
{
  exit();
}
