
class Speaker {

  float x;
  float y;

  Speaker(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void draw() {
    noStroke();
    fill(100);
    ellipse(x, y, 20, 20);
  }

  float distance(float _x, float _y) {

    float d = sqrt(sq(x - _x) + sq(y - _y));

    d = constrain(127-d, 0, 127);
    d = map(d, 0, 127, 60, 127);

    return d;
  }
}
