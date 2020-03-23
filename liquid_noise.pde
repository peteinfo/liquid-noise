
//================================
//         Liquid Noise
//================================


import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int channel = 0;
int pitch = 64;
int velocity = 127;

Whale whale1 = new Whale();
Speaker[] speaker = new Speaker[4];

void setup() {

  size(600, 300);
  smooth();

  speaker[0] = new Speaker(width*0.2, height/2);
  speaker[1] = new Speaker(width*0.4, height/2);
  speaker[2] = new Speaker(width*0.6, height/2);
  speaker[3] = new Speaker(width*0.8, height/2);

  setupMIDI();
}



void draw() {

  background(200);

  // first update positions
  whale1.update();


  // for each speaker
  for (int n = 0; n < speaker.length; n++) {

    // draw the speaker
    speaker[n].draw();

    // and then calculate distance from each speaker to the whale
    float d = speaker[n].distance(whale1.x, whale1.y);

    // then send that distance to Live
    myBus.sendControllerChange(0, 0, int(d)); // Send a controllerChange
  }

  // now draw whale
  whale1.draw();
}


void mousePressed() {

  whale1 = new Whale();
}
