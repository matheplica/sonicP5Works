import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import oscP5.*;
import netP5.*;
import com.hamoid.*;
Ani ani;
VideoExport videoExport;
OscP5 oscP5;
NetAddress sonicPiAdress;
int sizeHole = 120, nHoles = 198;
PVector[] holes = new PVector[nHoles];
color colHole = #460B9B;
color[] palette = {#FA15A1, #FA15A1, #FA15A1, #FA15A1, #FA15A1, #FA15A1};
void settings() {
  size(640, 480);
}
void setup() {
  reloadLogo();
  randHole();
  Ani.init(this);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  strokeCap(PROJECT);
  pgLogo = createGraphics(640, 480);
  oscP5 = new OscP5(this, 6000);
  //sonicPiAdress = new NetAddress("127.0.0.1", 4559);
  oscP5.plug(this, "piano", "/piano/note");
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}
void draw() {
  background(313, 6, 98);
  translate(width>>2, (height>>2)*3);
   for (int i=0; i<particules.size(); i++) { 
    Particule part = particules.get(i);
    part.display();
  }
  noFill();
  //fill(67, 73, 99, 199);
  stroke(colHole, 201);
  strokeWeight(2);
  beginShape();  
  for (int i=0; i<nHoles; i++) {
    holes[i].x+=random(-1, 1);
    holes[i].y+=random(-2, 2);
    vertex(holes[i].x, holes[i].y);//, holes[i+1].x, holes[i+1].y, holes[i+2].x, holes[i+2].y);
  }
  endShape();
  resetMatrix();
   drawLogo();
  videoExport.saveFrame();
  //if(frameCount%12==0) piano(int(random(60, 70)));
}
void eraseParticule() {
  particules.remove(0);
}
void randHole() {
  for (int i=0; i<nHoles; i++) { 
    holes[i] = PVector.random2D();
    holes[i].mult(int(random(sizeHole)));
  }
}
void keyPressed() {
  //piano(int(random(60, 70)));
  if (key=='L') startLogo();
  else if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
