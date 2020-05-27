
class Speaker {

  float x;
  float y;
  String name;
  boolean selected;

  Speaker(float _x, float _y, String _name) {
    x = _x;
    y = _y;
    name = _name;
    selected = false;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(255);
    ellipse(0, 0, 30, 30);
    fill(0);
    noStroke();

    if (selected) {
      noFill();
      stroke(255);
      strokeWeight(2);
      ellipse(0, 0, 40, 40);
    }

    textFont(mainFont, 16);
    text(name, -6, -7);
    popMatrix();
  }

  float distanceX(float _x, float _y) {

    float d = dist(x, y, _x, _y);

    d = constrain(120-d, 0, 120);
    //d = map(d, 0, 127, 60, 127);

    return d;
  }
}
