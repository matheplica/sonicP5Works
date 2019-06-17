class Star {
  int x, y, z, me, goalH, h, wideH = 210, newY;
  Star(int me, int x, int y, int z, int goalH) {
    this.me = me;
    this.x = x;
    this.y = y;
    this.z = z;
    this.goalH = goalH;
  }
  void display() {
    if (step<2) {
      x -= z;
      y  = (height>>1) + int(sinVal[me%nSinVal]*wideH);
      if (x < 0) reload(wideH, width, int(random(-120, height)), int(sqrt(random(100))));
    } else if (step>1 && step<5) {
      x -= z;
      if (x < 0) reload(min(wideH, 90), width, int(random(-120, height)), int(sqrt(random(100))));
      y  = (height>>1) + int(sinVal[me%nSinVal]*wideH);  
      if (y< height) wideH++;
      else reload(160, width+200, int(random(-240, 240)), int(sqrt(random(100))));
      newY = y;
    }
    pushStyle();
    rectMode(CENTER);
    noStroke();
    fill(z * 25);
    rect(x, y, 5+add, 5+add);
    popStyle();
  }
  void reload(int wideH, int x, int y, int z) {
    this.wideH = wideH;
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
