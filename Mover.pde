// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 22;
  }

  void update() {

    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX + 1, mouseY + 1);
    PVector acceleration = PVector.sub(mouse, location);
    // Set magnitude of acceleration
    acceleration.setMag(0.6);
    acceleration.normalize();
    acceleration.mult(6);

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    smooth();
    strokeWeight(11);
    background(255);
    noFill();
    stroke(0);

    point(location.x, location.y);
    point(width/2, height/2);

    int r = 1;

    for (int i = 0; i < width*3; i += r) {
      stroke(0);
      ellipse(location.x, location.y, i, i);
      ellipse(width/2, height/2, i, i);
      r += 1;
    }
    float d = dist(width/2, height/2, mouseX, mouseY);
    float locx = location.x;
    float locy = location.y;
    float bX = (d + locy)  * 0.07;
    float bY = (d + locy)  * 0.07;
    stroke(255, 0, 0);
    strokeWeight(location.x);
    ellipse(mouseX, mouseY, 11, 11);
    strokeWeight(location.y);
    ellipse(mouseX, mouseY, 11, 11);
    noStroke();
    fill(0, 255, 255);
    ellipse(mouseX, mouseY, bX + 66, bX + 66);
    fill(255);
    ellipse(mouseX, mouseY, bY, bY);
    noFill();
  }

  void sound() {
    float d = dist(width/2, height/2, mouseX, mouseY);
    float locx = location.x;
    float locy = location.y;
    frequencyGlide1.setValue((d + locy) * 0.07);
    frequencyGlide2.setValue((d + locy)  * 0.07);
  }
}

