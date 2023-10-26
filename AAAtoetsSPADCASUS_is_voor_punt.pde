//mode 1 = startscherm | 2 = spel | 3 = eindscherm
int mode = 1;
int grid = 20;
boolean knopGeklikt = false;
int muisX;
int muisY;
int ZWART = #000000;
final int ROOD = #ff0000;
final int WIT = #FFFFFF;
final int GROEN = #008000;


void setup() {
  size(1080, 720);
  background(WIT);
  textAlign(CENTER, CENTER);
  rectMode(CORNER);
  textSize(grid * 2);
}

void draw() {
  //startscherm
  if (mode == 1) {
    titels();
    tekenKnoppen(4, width / 2, height / 4, grid * 6, grid * 2, 0);
    tekenKnoppen(3, width / 2, height / 2.25, grid * 6, grid * 2, 1);
    tekenKnop(width / 2 - grid * 20 / 2, height / 1.5, grid * 20, grid * 5, "START SPEL", WIT);
  }
  //spel start
  if (mode == 2) {
    background(WIT);
    tekenSpelScherm();
    tekenRobot();
    text("score: " + score, width - width + grid * 5, height - height  + grid * 2);
    int aantalBlokken = (keuzes[0] + 1) * 10;
    tekenBlokken(aantalBlokken, GROEN);
    if (score == 0) {
      mode = 1;
      score = 100;
      spelerX = 0;
      spelerY = 0;
    }
  }
  //eindscherm
  if (mode == 3) {
  }
}

void tekenGrid() {
  noFill();
  for (int i = 0; i < width / grid; i++) {
    for (int j = 0; j < height / grid; j++) {
      rect(grid * i, grid * j, grid, grid);
    }
  }
}

void mouseClicked() {
  muisX = mouseX;
  muisY = mouseY;

  if (mode == 1) {
    if (muisX >= width / 2 - grid * 20 / 2 && muisX <= width / 2 - grid * 20 / 2 + grid * 20 && muisY >= height / 1.5 && muisY <= height / 1.5 + grid * 5) {
      mode = 2;
      int aantalBlokken = (keuzes[0] + 1) * 10;
      blokken = new int[aantalBlokken][2];
        
      for (int i = 0; i < aantalBlokken; i++) {
        int x = (int) random(0, schermBreedte / grid);
        int y = (int) random(0, schermHoogte / grid);
        while(isDuplicate(x, y, aantalBlokken)){
          x = (int) random(0, schermBreedte / grid);
          y = (int) random(0, schermHoogte / grid);
        }
        blokken[i][0] = x;
        blokken[i][1] = y;
        
      }
    }

    if (mode == 2) {
    }
  }
}

boolean isDuplicate(int x, int y, int aantalBlokken){
  for (int i = 0; i < aantalBlokken; i++){
   if (x == blokken[i][0] && y == blokken[i][1]){
     return true;
   }
  }
  
  return false;
}
