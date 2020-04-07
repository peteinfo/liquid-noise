
//================================
//         Liquid Noise
//================================


// How many ships in the sea?
// Petri dish

// layering 
// talking? twp whales? communicate? long distance ship through middle? 
// distance of communication - how many shipping lanes between X & Y?



import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int channel = 0;
int pitch = 64;
int velocity = 127;

boolean running = true;

Whale whale1;
Ship ship1;
Speaker[] speaker = new Speaker[9];

void setup() {

  size(600, 600);
  smooth();


  whale1 = new Whale("whale", 0, height*0.45, 0.1, 0);
  ship1 = new Ship("ship", 0, height*0.55, 1.0, 0);

  speaker[0] = new Speaker(width*0.25, height*0.25);
  speaker[1] = new Speaker(width*0.5, height*0.25);
  speaker[2] = new Speaker(width*0.75, height*0.25);
  speaker[3] = new Speaker(width*0.25, height*0.5);
  speaker[4] = new Speaker(width*0.5, height*0.5);
  speaker[5] = new Speaker(width*0.75, height*0.5);
  speaker[6] = new Speaker(width*0.25, height*0.75);
  speaker[7] = new Speaker(width*0.5, height*0.75);  
  speaker[8] = new Speaker(width*0.75, height*0.75);

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
      myBus.sendControllerChange(0, n+5, int(dShip));
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

  // draw info text
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
