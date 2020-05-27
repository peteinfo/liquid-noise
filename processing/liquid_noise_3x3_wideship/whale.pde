


class Whale {

  float x;
  float y;
  float xSpeed;
  float ySpeed;
  String title;

  Whale(String _title, float _x, float _y, float _xSpeed, float _ySpeed) {
    x = _x;
    y = _y;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    title = _title;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;

    // if ship reaches an edge, choose a new route
    if ((x > width) || (y > height) || (x < 0) || (y < 0)) {
      newWhaleRoute();
    }
  }



  void newWhaleRoute() {

    int r = floor(random(4));

    switch(r) {
    case 0:
      // new whale from left to right
      x = 0;
      y = random(0.1*height, 0.9*height);
      xSpeed = random(1, whaleMaxSpeed);
      ySpeed = 0;
      break;
    case 1:
      // new whale from right to left
      x = width;
      y = random(0.1*height, 0.9*height);
      xSpeed = -random(1, whaleMaxSpeed);
      ySpeed = 0;
      break;
    case 2:
      // new whale from top to bottom
      x = random(0.1*width, 0.9*width);
      y = 0;
      xSpeed = 0;
      ySpeed = random(1, whaleMaxSpeed);
      break;
    case 3:
      // new whale from bottom to top
      x = random(0.1*width, 0.9*width);
      y = height;
      xSpeed = 0;
      ySpeed = -random(1, whaleMaxSpeed);
      break;
    default:
      break;
    }
  }


  void draw() {

    pushMatrix();
    translate(x, y);
    ellipseMode(CENTER);
    textAlign(CENTER, CENTER);
    noStroke();
    fill(255);
    ellipse(0, 0, 17, 17);
    text(title, 0, 15);
    popMatrix();
  }
}
