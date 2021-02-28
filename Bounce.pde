int level = 0;
Screen screen = new Screen1();

int x1 = 0;
int y1 = 0;

int x2 = 0;
int y2 = 0;

boolean drawProjectileLine = false;

void setup() {
  size(1200, 800);
  frameRate(60);
}

void draw() {

  if (screen.levelComplete()) {
    level++;

    if (level == 0) {
      screen = new Screen1();
    }
    if (level == 1) {
      screen = new Screen2();
    }
  }

  if (drawProjectileLine) screen.drawProjectileLine(x1, y1, x2, y2);

  screen.render();
}

// detects click on button
void mouseClicked() {
  if (mouseButton == LEFT) {
    screen.detectButtonClick(mouseX, mouseY);
  }
}

// records projectile start coordinates
void mousePressed() {
  if (mouseButton == RIGHT) {
    x1 = mouseX;
    y1 = mouseY;
  }
}

// doesn't work, supposed to draw lines between start and end projectile
void mouseDragged() {
  if (mouseButton == RIGHT) {
    x2 = mouseX;
    y2 = mouseY;

    drawProjectileLine = true;
  }
}

// creates projectile
void mouseReleased() {
  if (mouseButton == RIGHT) {
    x2 = mouseX;
    y2 = mouseY;

    screen.createProjectile(x1, y1, x2, y2);

    x1 = 0;
    y1 = 0;
    x2 = 0;
    y2 = 0;
    drawProjectileLine = false;
  }  
}
