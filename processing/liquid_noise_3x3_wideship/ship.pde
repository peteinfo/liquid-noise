


class Ship {

  String title;
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  boolean upDown; // is the ship travelling updown or leftright?

  Ship(String _title, float _x, float _y, float _xSpeed, float _ySpeed) {
    title = _title;
    x = _x;
    y = _y;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    newShipRoute();
  }

  void update() {
    x += xSpeed;
    y += ySpeed;

    // if ship reaches an edge, choose a new route
    if ((x > width) || (y > height) || (x < 0) || (y < 0)) {

    shipOffScreen = true;
    
    }
  }

  void newShipRoute() {
    
    shipOffScreen = false;
    
    int r = floor(random(4));

    switch(r) {
    case 0:
      // new ship from left to right
      upDown = false;
      x = 0;
      y = height/2;
      xSpeed = random(shipMinSpeed, shipMaxSpeed);
      ySpeed = 0;
      break;
    case 1:
      // new ship from right to left
      upDown = false;
      x = width;
      y = height/2;
      xSpeed = -random(shipMinSpeed, shipMaxSpeed);
      ySpeed = 0;
      break;
    case 2:
      // new ship from top to bottom
      upDown = true;
      x = width/2;
      y = 0;
      xSpeed = 0;
      ySpeed = random(shipMinSpeed, shipMaxSpeed);
      break;
    case 3:
      // new ship from bottom to top
      upDown = true;
      x = width/2;
      y = height;
      xSpeed = 0;
      ySpeed = -random(shipMinSpeed, shipMaxSpeed);
      break;
    default:
      break;
    }
  }

  void draw() {

    pushMatrix();
    translate(x, y);

    rectMode(CENTER);
    textAlign(CENTER, CENTER);

    noStroke();
    fill(255);

    if (upDown) {
      rect(0, 0, width, 15);
    } else {
      rect(0, 0, 15, height);
    }

    textFont(mainFont, 14);
    text(title, 0, 15);

    popMatrix();
  }
}
