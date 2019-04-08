void drawRect() {
  if (alphaRect<260 && startSample) {
    if (alphaRect>253) startSample = false;
    alphaRect+=6;
  } else alphaRect -=2;
  noStroke();
  fill(cRect, alphaRect);
  rect(0, 0, width, height);
}
void drawDiag() {
  for (int i=0; i<nDrum; i++) {
    stroke(255, 216);
    int ww = 79+i*5;
    strokeWeight(ww);
    line(width-(width/4)*(i+1)-329, -506, width-(width/4)*(i-1)+104, height+180);
  }
}
void drawElement() {
  background(0);
  drawRect();
  drawDiag();
  for (int i=0; i<2; i++) shapes[i].display();
  for (int i=0; i<5; i++) triangles[i].display();
  if(meloTime>0){
    meloTime--;
    alphaMelo-=12;
    pushStyle();
    strokeWeight(16);
    stroke(colMelo);
    rectMode(CENTER);
    strokeCap(SQUARE);
    int sizze = meloTime;
    line(meloX-sizze, meloY-sizze, meloX+sizze, meloY+sizze);
    line(meloX-sizze, meloY+sizze, meloX+sizze, meloY-sizze);
    popStyle();
  }
}
