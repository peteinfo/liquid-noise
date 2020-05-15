


class Ship {

  String title;
  float x;
  float y;
  float xSpeed;
  float ySpeed;


  Ship(String _title, float _x, float _y, float _xSpeed, float _ySpeed) {
    title = _title;
    x = _x;
    y = _y;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;

    // if ship reaches an edge, choose a new route
    if ((x > width) || (y > height) || (x < 0) || (y < 0)) {
      newShipRoute();
    }
  }

  void newShipRoute() {

    int r = floor(random(4));

    switch(r) {
    case 0:
      // new ship from left to right
      x = 0;
      y = random(0.1*height, 0.9*height);
      xSpeed = random(shipMaxSpeed);
      ySpeed = 0;
      break;
    case 1:
      // new ship from right to left
      x = width;
      y = random(0.1*height, 0.9*height);
      xSpeed = -random(shipMaxSpeed);
      ySpeed = 0;
      break;
    case 2:
      // new ship from top to bottom
      x = random(0.1*width, 0.9*width);
      y = 0;
      xSpeed = 0;
      ySpeed = random(shipMaxSpeed);
      break;
    case 3:
      // new ship from bottom to top
      x = random(0.1*width, 0.9*width);
      y = height;
      xSpeed = 0;
      ySpeed = -random(shipMaxSpeed);
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
    rect(0, 0, 15, 15);

    textFont(mainFont, 14);
    text(title, 0, 15);

    popMatrix();
  }
}
