import beads.*;

AudioContext ac;
WavePlayer wp1;
Glide frequencyGlide1;
WavePlayer wp2;
Glide frequencyGlide2;

Gain g;


Mover[] movers = new Mover[1];

void setup() {
  size(1280, 800);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  ac = new AudioContext();
  frequencyGlide1 = new Glide(ac, 20, 50);
  wp1 = new WavePlayer(ac, frequencyGlide1, Buffer.SINE);

  frequencyGlide2 = new Glide(ac, 20, 50);
  wp2 = new WavePlayer(ac, frequencyGlide2, Buffer.SINE);

  g = new Gain(ac, 1, 0.5);

  g.addInput(wp1);
  g.addInput(wp2);

  ac.out.addInput(g);

  ac.start();
}

void draw() {
  background(255);
  noCursor();

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
    movers[i].sound();
  }
}

