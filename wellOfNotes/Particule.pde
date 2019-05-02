ArrayList<Particule> particules = new ArrayList<Particule>();
class Particule {
  float mass, rot, speedRot;
  int pLength = 3;
  color col; 
  PVector location, speed, gravity;
  Particule(int n, int c) {
    col = c;
    mass = map(n, 60, 70, 0.3, 0.8);
    speedRot = map(n, 60, 70, 0.06, 0.13);
    location = new PVector(0, 0);
    speed = new PVector(5, -9.3);
    gravity = new PVector(0, 0.13);
  }
  void display() {
    applyForce(gravity);
    location.add(speed);
    rot+=speedRot;
    strokeWeight(10);
    stroke(col, 165);
    pushMatrix();
    translate(location.x, location.y);
    rotate(rot);
    line(2+pLength, 21, -24+pLength, 10+pLength);
    line(5, -22+pLength, 23, 30-pLength);
    popMatrix();
    if (location.y>height) eraseParticule();
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    speed.add(f);
  }
}
void createParticule(int n, color c) {
  colHole = c;
   randHole();
  particules.add(new Particule(n, c));
}
