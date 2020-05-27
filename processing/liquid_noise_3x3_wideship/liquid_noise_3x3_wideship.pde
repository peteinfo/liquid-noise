
//================================
//         Liquid Noise
//================================
//
// WIDE SHIP version.
// 
// One wide ship moves from side to side or top to bottom.


// Features to Add
// --------------------------
// - Add whale communication? ... talking? two whales? communicate? long distance ship through middle? distance of communication - how many shipping lanes between X & Y?


// MIDI setup
import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus
int channel = 0;
int pitch = 64;
int velocity = 127;

// -------------------------------------------
// Set the SPEED of the whales and ships here! 
// -------------------------------------------
float whaleMaxSpeed = 2;   // measured in how many pixels it moves per turn 
float shipMaxSpeed = 2;    // measured in how many pixels it moves per turn 
float shipMinSpeed = 0.5;  // measured in how many pixels it moves per turn 
int shipWaitMin = 100;     // measured in frames (30 frames per second)
int shipWaitMax = 500;    // measured in frames (30 frames per second)
boolean shipOffScreen = false;

// mode variables
boolean running = true;
boolean presentationMode = false;
int scene = 1;
int selectedSpeaker = 1;
int shipWaitCounter = 0;
int shipWait = 0;


// whale, ship and speakers
Whale whale1;
Ship ship1;
Speaker[] speaker = new Speaker[9];

// fonts
PFont mainFont;


void setup() {

  size(1024, 768);
  //smooth();
  
  frameRate(30);

  mainFont = createFont("Courier", 16, true);
  textFont(mainFont, 16);

  //whale1 = new Whale("whale", 0, height*0.45, random(whaleMaxSpeed), 0);
  ship1 = new Ship("ship", 0, height*0.55, random(shipMaxSpeed), 0);

  shipWait = int(random(shipWaitMin, shipWaitMax)); 


  speaker[0] = new Speaker(width*0.25, height*0.25, "1");
  speaker[1] = new Speaker(width*0.5, height*0.25, "2");
  speaker[2] = new Speaker(width*0.75, height*0.25, "3");
  speaker[3] = new Speaker(width*0.25, height*0.5, "4");
  speaker[4] = new Speaker(width*0.5, height*0.5, "5");
  speaker[5] = new Speaker(width*0.75, height*0.5, "6");
  speaker[6] = new Speaker(width*0.25, height*0.75, "7");
  speaker[7] = new Speaker(width*0.5, height*0.75, "8");  
  speaker[8] = new Speaker(width*0.75, height*0.75, "9");

  setupMIDI();
}



void draw() {

  background(0);

  if (running) {

    shipWaitCounter++;

    if (!shipOffScreen) {
      shipWaitCounter = 0;
    }

    if (shipWaitCounter > shipWait) {

      shipWaitCounter = 0;
      shipWait = int(random(shipWaitMin, shipWaitMax));

      ship1.newShipRoute();
    }


    // first update positions
    //whale1.update();
    ship1.update();

    // then update each speaker
    for (int n = 0; n < speaker.length; n++) {


      // WIDE SHIP method

      float dShip = 0;
      if (ship1.upDown) {
        dShip = abs(dist(0, speaker[n].y, 0, ship1.y));
      } else {
        dShip = abs(dist(speaker[n].x, 0, ship1.x, 0));
      }
      // keep it to MIDI cc scale
      dShip = constrain(120-dShip, 0, 120);


      // then send that distance to the correct speaker in Live
      // Whale speakers are CC channel 1-9
      //myBus.sendControllerChange(0, n+1, int(dWhale));
      // Ship speakers are CC channel 10-19
      myBus.sendControllerChange(0, n+11, int(dShip));
    }
  }

  if (presentationMode) {

    sceneText();
  } else {

    sceneText();

    // draw the speakers  
    for (int n = 0; n < speaker.length; n++) {

      if (selectedSpeaker-1 == n) {
        speaker[n].selected = true;
      } else {
        speaker[n].selected = false;
      }

      // draw the speaker
      speaker[n].draw();
    }

    // now draw whale and ship
    //whale1.draw();
    ship1.draw();


    // draw info text
    textAlign(LEFT, TOP);
    textFont(mainFont, 12);

    text(""
      + "[spacebar] start/stop\n"
      + "   [enter] next scene\n"
      + "       [p] toggle presentation mode\n"
      + "       [r] randomise movement\n"
      + "     [1-9] select speaker\n"
      + "       [w] send whale cc message to ableton on selected speaker\n" 
      + "       [s] send ship cc message to ableton on selected speaker\n", 20, height-110);
  }
}


void sceneText() {
  noStroke();
  fill(255);
  rectMode(CENTER);
  //rect(width/2, 50, width-50, 100, 2);  
  fill(255);
  stroke(255);
  textFont(mainFont, 14);

  if (scene == 1) {
    text("LIQUID NOISE        scene 1\n"
      +  "---------------------------\n"
      +  "Meet the whales.\n"
      +  "Observe their movement.", width*0.25, 50);
  } else if (scene == 2) {
    text("LIQUID NOISE        scene 2\n"
      +  "---------------------------\n"
      +  "Ships cross the ocean.\n"
      +  "Noise of their engines spread far.", width*0.25, 50);
  } else if (scene == 3) {
    text("LIQUID NOISE        scene 3\n"
      +  "---------------------------\n"
      +  "Whales and ships.\n"
      +  "See the effect of the ship's noise.", width*0.25, 50);
  }
}



void keyPressed() {

  //println(int(key));

  if (key == 10) {    
    scene++;

    if (scene > 3) {
      scene = 1;
    }

    if (scene == 1) {
      //whale1.newWhaleRoute();
      ship1.x = 10;
      ship1.y = 10;
      ship1.xSpeed = 0;
      ship1.ySpeed = 0;
    } else if (scene == 2) {
      ship1.newShipRoute();
      //whale1.x = 10;
      //whale1.y = 10;
      //whale1.xSpeed = 0;
      //whale1.ySpeed = 0;
    } else if (scene == 3) {
      //whale1.newWhaleRoute();
      ship1.newShipRoute();
    }

    println("scene " + scene);
  }

  if ((key == 'r') || (key == 'R')) {
    // randomise whales and ships
    //whale1.xSpeed = random(-whaleMaxSpeed, whaleMaxSpeed);
    //whale1.ySpeed = random(-whaleMaxSpeed, whaleMaxSpeed);
    ship1.xSpeed = random(-shipMaxSpeed, shipMaxSpeed);
    ship1.ySpeed = random(-shipMaxSpeed, shipMaxSpeed);
  }

  if ((key == 'p') || (key == 'P')) {
    // toggle presentation mode
    presentationMode = !presentationMode;
    println("presentation mode = " + presentationMode);
  }

  if ((key == 'w') || (key == 'W')) {
    // send whale cc message
    myBus.sendControllerChange(0, selectedSpeaker, int(random(127)));
  }

  if ((key == 's') || (key == 'S')) {
    // send whale cc message
    myBus.sendControllerChange(0, selectedSpeaker+10, int(random(127)));
  }



  switch (key) {
  case ' ':
    running = !running;
    break;
  case '1':     
    selectedSpeaker = 1;
    running = false;
    break;
  case '2':     
    selectedSpeaker = 2;
    running = false;
    break;
  case '3':     
    selectedSpeaker = 3;
    running = false;
    break;
  case '4':     
    selectedSpeaker = 4;
    running = false;
    break;
  case '5':     
    selectedSpeaker = 5;
    running = false;
    break;
  case '6':     
    selectedSpeaker = 6;
    running = false;
    break;
  case '7':     
    selectedSpeaker = 7;
    running = false;
    break;
  case '8':     
    selectedSpeaker = 8;
    running = false;
    break;
  case '9':     
    selectedSpeaker = 9;
    running = false;
    break;
  default:
    break;
  }
}
