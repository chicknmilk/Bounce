int level = 0;
Screen screen = new Screen();

void setup() {
  size(1000, 1000);
  frameRate(60);

  if (level == 0) {
    screen = new Screen1();
  }
}

void draw() {
  screen.render();
}

void mouseClicked() {
  screen.update(mouseX, mouseY);
}