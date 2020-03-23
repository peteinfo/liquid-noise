
//================================
//         Liquid Noise
//================================


import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int channel = 0;
int pitch = 64;
int velocity = 127;

boolean running = true;

Whale whale1;
Ship ship1;
Speaker[] speaker = new Speaker[4];

void setup() {

  size(600, 300);
  smooth();


  whale1 = new Whale("whale", 0, height*0.35, 1, 0);
  ship1 = new Ship("ship", 0, height*0.6, 1.5, 0);

  speaker[0] = new Speaker(width*0.2, height/2);
  speaker[1] = new Speaker(width*0.4, height/2);
  speaker[2] = new Speaker(width*0.6, height/2);
  speaker[3] = new Speaker(width*0.8, height/2);

  setupMIDI();
}



void draw() {

  background(200);

  if (running) {

    // first update positions
    whale1.update();
    ship1.update();

    // then update each speaker
    for (int n = 0; n < speaker.length; n++) {

      // calculate distance from each speaker to the whale and ship
      float dWhale = speaker[n].distance(whale1.x, whale1.y);
      float dShip = speaker[n].distance(ship1.x, ship1.y);

      // then send that distance to the correct speaker in Live
      // Whale speakers are CC channel 1-4
      myBus.sendControllerChange(0, n+1, int(dWhale));
      // Ship speakers are CC channel 5-9
      myBus.sendControllerChange(0, n+4, int(dShip));
    }
  }

  // draw the speakers  
  for (int n = 0; n < speaker.length; n++) {
    // draw the speaker
    speaker[n].draw();
  }

  // now draw whale and ship
  whale1.draw();
  ship1.draw();

  // draw info
      textAlign(LEFT, TOP);
  text("LIQUID NOISE\n"
    + "------------\n"
    + "SPACE, start/stop\n"
    + "1-8,  send midi cc", 20, height-70);
}




void keyPressed() {

  //println(int(key));

  switch (key) {
  case ' ':
    running = !running;
    break;
  case '1':     
    myBus.sendControllerChange(0, 1, int(random(127)));
    break;
  case '2':     
    myBus.sendControllerChange(0, 2, int(random(127)));
    break;
  case '3':     
    myBus.sendControllerChange(0, 3, int(random(127)));
    break;
  case '4':     
    myBus.sendControllerChange(0, 4, int(random(127)));
    break;
  case '5':     
    myBus.sendControllerChange(0, 5, int(random(127)));
    break;
  case '6':     
    myBus.sendControllerChange(0, 6, int(random(127)));
    break;
  case '7':     
    myBus.sendControllerChange(0, 7, int(random(127)));
    break;
  case '8':     
    myBus.sendControllerChange(0, 8, int(random(127)));
    break;
  default:
    break;
  }
}
