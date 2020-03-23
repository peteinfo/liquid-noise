


class Whale {

  float x;
  float y;
  float xSpeed;
  float ySpeed;

  Whale() {
    x = random(width);
    y = random(height);
    xSpeed = random(-1000, 1000) / 500;
    ySpeed = random(-1000, 1000) / 1000;
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

    noStroke();
    fill(255);
    ellipse(x, y, 20, 20);
  }


}
