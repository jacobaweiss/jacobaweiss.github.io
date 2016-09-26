Eye[] eyes = new Eye[36];
void setup()
{
  size(600, 600);

  int idx = 0;
  for (int w = (width / 6); w <= width; w += (width / 6)) {
    for (int h = (height / 6); h <= height; h += (height / 6)) {
      eyes[idx] = new Eye((w - 60 + random(-25, 25)), (h - 60 + random(-25, 25)), (100 + random(-25, 50)));
      idx++;
    }
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < eyes.length; i++) {
    eyes[i].update(mouseX, mouseY);
    eyes[i].display();
  }
}

class Eye {
  int x, y, size;
  float angle = 0.0;

  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
  }

  void update(int mx, int my) {
    angle = atan2(my - y, mx - x);
  }

  void display() {
    pushMatrix();
    ellipseMode(CENTER);
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    ellipse(size / 8, 0, size / 2, size / 2);
    popMatrix();
  }
}
