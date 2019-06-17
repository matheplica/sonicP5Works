int nShip = 15;
Ship[] ships = new Ship[nShip];
class Ship {
  PVector pos;
  PVector[] shapes = new PVector[10];
  PVector[] tri = new PVector[6];
  int wide, sens, alpha, alphaContour, x, id;
  float rot; 
  color col;
  Ship(int id) {
    this.id = id;
    pos = new PVector();
    x = 48+(width/10)*(id+1);
    col = color(random(11, 326), random(103, 274), random(27, 85));
    for(int i=0;i<10; i++) shapes[i] = new PVector(random(-120, 120), random(-30, 200));
    for(int i=0;i<6; i++) tri[i] = new PVector(random(-120, 100), random(-30, 160));
   
}
  void display() {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    ellipseMode(CENTER);
    strokeWeight(2);   
    translate(pos.x, pos.y);
    rotate(rot);
    //randomSeed(28);
    rot+=-0.01*sens;
    noFill();
    stroke(col, alphaContour);//28, 196, 292-12, alphaContour);
    rotate(2.23);
    ellipse(0, 0, wide-289, wide+30);
    rotate(3.76);
    triangle(tri[0].x, tri[0].y, tri[1].x, tri[1].y, tri[2].x, tri[2].y);
      triangle(tri[3].x, tri[3].y, tri[4].x, tri[4].y, tri[5].x, tri[5].y);
    popStyle();
    noStroke();
    fill(col, alpha);//105, 87, 222, alpha);
    //rect(48, 80, wide+29, wide+-40, 48);
    //rect(0, 0, wide+14, wide+-105, 21);
    beginShape();
    for(int i=0; i<5; i++) vertex(shapes[i].x, shapes[i].y);
    endShape();
    beginShape();
    for(int i=5; i<10; i++) vertex(shapes[i].x, shapes[i].y);
    endShape();
    popMatrix();
    if (alpha>0) alpha -= 18;
    if (alpha<=20) alphaContour = 0;
  }
  void init(int y, int p) {
    sens = p*-1;
    pos.set(201+(width>>2)+p*123, 90+y*24);
    alpha = 378;
    alphaContour = 95;
    wide = int(random(174, 261));
    rot = random(PI);
  }
}
