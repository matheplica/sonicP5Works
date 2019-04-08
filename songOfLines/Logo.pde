int alphaBack, sizeRect0, sizeRect1, sizeRect2, sizeRect3, posYPub;
int visualWidth, visualHeight, xPub, yPub;
String pub = "bicarbo.github.io";
float rotPub;
boolean logoOn = true, outroOn;
int startPosX0, startPosX1, startPosX2, startPosX3;
int startPosY0, startPosY1, startPosY2, startPosY3, weight;
color[] colorsLogo = {#FF0641, #E46A0B, #410B1D, #409486};
void drawLogo() {
  pgLogo.beginDraw();
  pgLogo.background(255, 0);
 // pgLogo.rectMode(CENTER);
  pgLogo.noStroke();
  pgLogo.fill(#FFFFDD, alphaBack);
  pgLogo.rect(0, 0, visualWidth, visualHeight);
  pgLogo.strokeWeight(weight);
  pgLogo.fill(#FFFFDD, 165);
  pgLogo.stroke(colorsLogo[0]);
  pgLogo.rect(startPosX0, startPosY0, sizeRect0, sizeRect0);
  pgLogo.stroke(colorsLogo[1]);
  pgLogo.rect(startPosX1, startPosY1, sizeRect1, sizeRect1);
  pgLogo.stroke(colorsLogo[2]);
  pgLogo.rect(startPosX2, startPosY2, sizeRect2, sizeRect2);
  pgLogo.stroke(colorsLogo[3]);
  pgLogo.rect(startPosX3, startPosY3, sizeRect3, sizeRect3);
  /*pgLogo.textFont(fontIntro);
  pgLogo.textSize(148);
  pgLogo.fill(0);
  pgLogo.pushMatrix();
  pgLogo.translate(xPub, 737);
  pgLogo.rotate(rotPub);
  pgLogo.text(pub, 64, 0);
  pgLogo.popMatrix();*/
  pgLogo.endDraw();
  image(pgLogo, 0, 0);
}
void reloadLogo() {
  logoOn = true;
  alphaBack = 0;
  sizeRect0 = 38; 
  sizeRect1 = 48;
  sizeRect2 = 60;
  sizeRect3 = 72; 
  posYPub = -82;
  rotPub = -PI;
  visualWidth = 640;
  visualHeight = 480;
  startPosX0 = visualWidth-49;
  startPosX1 = visualWidth-73; 
  startPosX2 = visualWidth-97;
  startPosX3 = visualWidth-121;
  startPosY0 = visualHeight-123; 
  startPosY1 = visualHeight-110; 
  startPosY2 = visualHeight-97;
  startPosY3 = visualHeight-85;
  weight = 7;
  xPub = -450;
}
void startLogo() {
  reloadLogo();
  ani = new Ani(this, 4.6, "alphaBack", 255, Ani.CIRC_OUT);
  ani = new Ani(this, random(0.4, 3.3), "startPosX0", 396, Ani.CIRC_OUT);
  ani = new Ani(this, 1.4, random(0.4, 1.3), "startPosX1", 307, Ani.CUBIC_OUT);
  ani = new Ani(this, 1.2, random(0.4, 2.3), "startPosX2", 233, Ani.CUBIC_OUT);
  ani = new Ani(this, 1.7, 1.2, "startPosX3", 166, Ani.SINE_OUT);
  ani = new Ani(this, random(0.4, 2.3), 1, "startPosY0", 73, Ani.CUBIC_IN);
  ani = new Ani(this, random(1.4, 2.3), 0.9, "startPosY1", 105, Ani.SINE_OUT);
  ani = new Ani(this, 1.8, 1.1, "startPosY2", 144, Ani.CUBIC_IN);
  ani = new Ani(this, 2.4, random(0.4, 1.3), "startPosY3", 176, Ani.SINE_OUT);
  ani = new Ani(this, 2.5, "sizeRect0", 102, Ani.CIRC_OUT);
  ani = new Ani(this, random(0.4, 2.3), 1, "sizeRect1", 153, Ani.SINE_OUT);
  ani = new Ani(this, 1.2, 1.7, "sizeRect2", 192, Ani.SINE_OUT);
  ani = new Ani(this, 1.4, random(0.4, 1.5), "sizeRect3", 230, Ani.SINE_OUT);
  ani = new Ani(this, 2.8, "weight", 22, Ani.LINEAR);
  ani = new Ani(this, 2.4, "xPub", 46, Ani.QUAD_IN);
  ani = new Ani(this, 4.4, "rotPub", rotPub+PI, Ani.BOUNCE_OUT);
}
