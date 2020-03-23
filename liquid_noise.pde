
//================================
//         Liquid Noise
//================================


import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int channel = 0;
int pitch = 64;
int velocity = 127;

Whale whale1 = new Whale();

void setup() {

  size(600, 300);
  smooth();

  setupMIDI();
}



void draw() {
  
  background(200);
  
  whale1.update();
  whale1.draw();
  
}


void mousePressed() {

  whale1 = new Whale();

}
