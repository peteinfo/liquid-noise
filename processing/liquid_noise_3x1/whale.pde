


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

    if (x > width) x = 0;
    if (y > height) y = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;
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
