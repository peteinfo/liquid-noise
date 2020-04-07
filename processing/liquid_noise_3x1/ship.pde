


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

    //if (x > width) x = 0;
    if (y > height) y = 0;
    //if (x < 0) x = width;
    if (y < 0) y = height;
  }

  void draw() {

    pushMatrix();
    translate(x, y);

    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    noStroke();
    fill(255);
    rect(0, 0, 15, 15);

    text(title, 0, 15);

    popMatrix();
  }
}
