
class Speaker {

  float x;
  float y;

  Speaker(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void draw() {
    noStroke();
    fill(150);
    ellipse(x, y, 30, 30);
  }

  float distance(float _x, float _y) {

    float d = sqrt(sq(x - _x) + sq(y - _y));

    d = constrain(120-d, 0, 120);
    //d = map(d, 0, 127, 60, 127);

    return d;
  }
}
