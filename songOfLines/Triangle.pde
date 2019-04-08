class Triangle {
  PVector pos;
  int wide, alpha, x;
  color nCol1, nCol2;
  float rot;
  Triangle(int id) {
    pos = new PVector();
    x = (width/6)*(id+1);
  }
  void display() {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    strokeWeight(13+alpha/11);
    stroke(nCol2, alpha);
    noFill();
    translate(pos.x, pos.y);
    rotate(rot);
    triangle(wide+-5, -33, -wide+-13, 38, -33, -wide+-34);
    noStroke();
    fill(nCol1, alpha);
    triangle(wide, -49, -wide, 42, -18, -wide);
    popStyle();
    popMatrix();
    if (alpha>0) alpha -= 17;
  }
  void init() {
    pos.set(x, random(109, height-106));
    alpha = 279;
    wide = int(random(106, 181));
    rot = random(PI/1);
    nCol1 = colsBack[int(random(colsBack.length))];
    nCol2 = colsLines[int(random(colsLines.length))];
  }
}
