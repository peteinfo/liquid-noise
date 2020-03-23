


class Whale {

  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;

  Whale() {
    xPos = random(width);
    yPos = random(height);
    xSpeed = random(-1000, 1000) / 500;
    ySpeed = random(-1000, 1000) / 1000;
  }

  void update() {
    xPos += xSpeed;
    yPos += ySpeed;

    if (xPos > width) xPos = 0;
    if (yPos > height) yPos = 0;
    if (xPos < 0) xPos = width;
    if (yPos < 0) yPos = height;


    myBus.sendControllerChange(0, 0, int(distance())); // Send a controllerChange

  }

  void draw() {

    noStroke();
    fill(150);
    ellipse(width/2, height/2, 50, 50);
    stroke(150);
    line(xPos, yPos, width/2, height/2);

    noStroke();
    fill(255);
    ellipse(xPos, yPos, 20, 20);
  }

  float distance() {

    float d = sqrt(sq(xPos - width/2) + sq(yPos - height/2));

    d = constrain(127-d, 0, 127);
    d = map(d, 0, 127, 60, 127);

    println(d);
    return d;
  }
}
