int score = 100;
int schermBreedte = 800;
int schermHoogte = 520;
int spelerX;
int spelerY;
int[][] blokken;

void keyPressed() {
  keyDetection();
}

void keyDetection() {
  if (mode != 2) {
    return;
  }
  if (keyCode == UP) {
    if(!collisionCheck(spelerX, spelerY -2)){
    spelerY--;}
    beweegBlok(spelerX, spelerY, "up");
    score--;
  } else if (keyCode == DOWN) {
    spelerY++;
    beweegBlok(spelerX, spelerY, "down");
    score--;
  } else if (keyCode == LEFT) {
    spelerX--;
    beweegBlok(spelerX, spelerY, "left");
    score--;
  } else if (keyCode == RIGHT) {
    spelerX++;
    beweegBlok(spelerX, spelerY, "right");
    score--;
  }
  // Houd de speler binnen bounds
  spelerX = constrain(spelerX, 0, schermBreedte / grid - 1);
  spelerY = constrain(spelerY, 0, schermHoogte / grid - 1);
}

void tekenRobot() {
  fill(255, 0, 0);
  square(constrain((width - schermBreedte) / 2 + spelerX * grid, 0, width - 20), constrain((height - schermHoogte) / 2 + spelerY * grid, 0, height - 20), 20);
}

void tekenSpelScherm() {
  float startX = (width - schermBreedte) / 2;
  float startY = (height - schermHoogte) / 2;
  int kolomBreedte = schermBreedte / grid;
  int kolomHoogte = schermHoogte / grid;
  fill(WIT);
  for (int i = 0; i < kolomHoogte; i++) {
    for (int j = 0; j < kolomBreedte; j++) {
      rect(startX + j * grid, startY + i * grid, grid, grid);
    }
  }
}

void tekenBlokken(int aantal, int kleur) {
  float startX = (width - schermBreedte) / 2;
  float startY = (height - schermHoogte) / 2;
  for (int i = 0; i < aantal; i++) {
    fill(kleur);
    rect(startX + blokken[i][0] * grid, startY + blokken[i][1] * grid, grid, grid);
  }
}

void beweegBlok(int x, int y, String direction) {
  int aantalBlokken = (keuzes[0] + 1) * 10;
  for (int i = 0; i < aantalBlokken; i++) {
    if (x == blokken[i][0] && y == blokken[i][1]) {
      if (direction == "up" && collisionCheck(x, y)) {
        blokken[i][1]--;
      }
      if (direction == "down") {
        blokken[i][1]++;
      }
      if (direction == "left") {
        blokken[i][0]--;
      }
      if (direction == "right") {
        blokken[i][0]++;
      }
      return;
    }
  }
}

boolean collisionCheck(int x, int y) {
  int aantalBlokken = (keuzes[0] + 1) * 10;
  for (int i = 0; i < aantalBlokken; i++) {
    if (x == blokken[i][0] && y == blokken[i][1]) {
      return true;
    }
  }
  return false;
}
