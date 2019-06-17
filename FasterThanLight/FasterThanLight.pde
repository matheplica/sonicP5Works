import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress sonicPiAdress;
int nStars = 100, stepEnd, alphaEnd, add;
Star[] stars = new Star[nStars];
int nSinVal = 90, step = 0;
float[] sinVal = new float[nSinVal];
PFont font;
String titre = "Faster Than Light";
int xTitre = 700;

PImage img;
float rot, deep = 4;

void settings() {
  size(640, 480);
}
void setup() {
  frameRate(60);
  font = createFont("vahikac.ttf", 282);
  smooth();
  oscP5 = new OscP5(this, 9000);
  sonicPiAdress = new NetAddress("127.0.0.1", 4560);
  for (int i=0; i<nShip; i++) ships[i] = new Ship(i);
  oscP5.plug(this, "melody", "/melody/note");
  for (int i=0; i<nSinVal; i++) sinVal[i] = sin(((TWO_PI*2)/nSinVal)*i);
  for (int i=0; i<nStars; i++) stars[i] = new Star(i, int(random(width)), int(random(height)), int(random(10)), int(random(20, 60)));
  reloadLogo();
  img = loadImage("saturn.png");
  hint(ENABLE_KEY_REPEAT);
}
void draw() {
  background(0);
  for (Star star : stars) star.display();
  if (step==0) { 
    add = 0;
    textFont(font);
    fill(213);
    text(titre, xTitre, 360);
    xTitre = (xTitre>-2320) ? xTitre-3 : 700;
  } 
  if (step==3 || step==4) for (int i=0; i<nShip; i++) ships[i].display();
  if (step ==4 && frameCount%10==0 && add<180) add++;
  if (step == 5) {
    pushMatrix();
    pushStyle();
    translate(width>>1, height>>1);
    rotate(rot);
    scale(deep);
    imageMode(CENTER);
    image(img, 0, 0);
    popStyle();
    popMatrix();
    rot += 0.012;
  }
  drawLogo();
}
void melody(int a, int p) {
  ships[a].init(a, p);
}
void startSaturn() {
  step = 5;
  add  = 0;
  ani = new Ani(this, 14.0, "deep", 0, Ani.QUAD_OUT);
}
void keyPressed() {
  if  (key=='x') sendOsc("/step", ++step);
  else if (key=='w') sendOsc("/step", --step);
  else if (key==' ') sendOsc("/step", ++step);
  else if (key=='L') startLogo();
}
