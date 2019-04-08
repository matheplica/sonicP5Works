import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import com.hamoid.*;

VideoExport videoExport;
import oscP5.*;
import netP5.*;
Ani ani;
RandShape[] shapes = new RandShape[2];
Triangle[] triangles = new Triangle[5];
OscP5 oscP5;
NetAddress sonicPiAdress;
boolean stars, startSample;
int nCols = 6, nShape = 9, count, nDrum;
color[] colsLines = {#25CDF5, #FC70C9, #D7F723, #F723D4, #F7EF91, #F791B7};
color[] colsBack = {#2301F5, #23F7F4, #F5A123, #63EF91, #929CFA, #D79102};
int alphaRect, alphaMelo, hDrum, meloTime, meloX, meloY;
color cBack, cRect = colsLines[2], myPix, colMelo;
PGraphics pgLogo;
void setup() {
  size(640, 480);
  frameRate(60);
  smooth();
  Ani.init(this);
  videoExport = new VideoExport(this);
  videoExport.startMovie();
  for (int i=0; i<2; i++) shapes[i] = new RandShape(i);
  pgLogo = createGraphics(640, 480);
  reloadLogo();
  oscP5 = new OscP5(this, 6000);
  sonicPiAdress = new NetAddress("127.0.0.1", 4559);
  oscP5.plug(this, "bass", "/inst/bass");
  oscP5.plug(this, "drum", "/inst/drum");
  oscP5.plug(this, "panSample", "/inst/panSample");
  oscP5.plug(this, "synth", "/inst/synth");
  oscP5.plug(this, "mel", "/inst/mel");
  for (int i=0; i<5; i++) triangles[i] = new Triangle(i);
}
void panSample(int pan) {
  cRect = colsLines[int(random(nCols))];
  startSample = true;
  alphaRect = 160;
}
void drum(int a) {
  nDrum = a;
}
void bass(int a) {
  int c = int(random(nCols));
  if (a==2) { 
    shapes[0].show(c);
    shapes[1].show(c);
  } else shapes[a].show(c);
}
void synth(int a) {
  triangles[a].init();
}
void mel(int n) {
  meloY = int(map(n, 56, 74, height-60, 60));
  meloTime = 40;
  meloX = int(random(60, width));
  alphaMelo = 255;
  colMelo = color(255, random(255), 67);
}
void draw() {
  drawElement();
  drawLogo();
  videoExport.saveFrame();
}
void sendOsc(String msg, int piste) {
  OscMessage myMessage = new OscMessage(msg);
  myMessage.add(piste);
  oscP5.send(myMessage, sonicPiAdress);
}
void keyPressed() {
  if (key=='w')  mute(0);
  else if (key=='x')  mute(1);
  else if (key=='c')  mute(2);
  else if (key=='v')  mute(3);
  else if (key=='b')  mute(4);
  else if (key=='n')  mute(5);
  else if (key=='0') for (int i=0; i<5; i++) mute(i);
  else if (key=='L') startLogo();
  else if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
void mute(int s) {
  sendOsc("/muting", s);
}
