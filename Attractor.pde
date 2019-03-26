class Attractor {

  float mass;
  PVector location;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = CshapeSize;
  }

  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y, CshapeSize*2, CshapeSize*2);
  }
}
