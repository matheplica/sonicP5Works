class RandShape {
  int id, nSegm = 10, xShape, yShape, count, theCol, alphaCol;
  int[] segmWidth = new int[nSegm];
  int[] segmHeight = new int[nSegm];
  boolean visible = false;
  RandShape(int id) {
    this.id = id;
    xShape = (width/4)*(2*id+1);
    yShape = height/2;
    count = 0;
  }
  void display() {
    if (count>0) {
      if(count>29) reload();
      else alphaCol -= 7;
      noStroke();
      fill(colsLines[theCol], alphaCol);
      beginShape();
      for (int j=0; j<nSegm; j++) vertex(xShape+segmWidth[j], yShape+segmHeight[j]);
      endShape();
      count--;
    }
  }
  void reload(){
  for (int i=0; i<nSegm; i++) {
      segmWidth[i] = int(random(-140, 140));
      segmHeight[i] = int(random(-164, 164));
    }
  }
  void show(int c) {
    theCol = c;
    alphaCol = 255;
    count = 48;
  }
}
