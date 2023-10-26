int spelers = 1;
int[] keuzes = {0, 0};

void titels() {
  fill(ZWART);
  background(WIT);
  text("AANTAL SPELERS: " + spelers, width / 2, height / grid + grid);
  text("AANTAL BLOKKEN: " + (keuzes[0] + 1) * 10, width / 2, height / grid * 3 + grid);
  text("AANTAL OBSTAKELS: " + (keuzes[1] + 1) * 10, width / 2, height / grid * 7 + grid);
}

void tekenKnoppen(int aantal, float xPos, float yPos, float breedte, float hoogte, int uniek) {
  float totaleBreedte = aantal * breedte;
  float startX = xPos - totaleBreedte / 2;

  for (int i = 0; i < aantal; i++) {
    float x = startX + i * breedte;
    int kleur;

    if (isMouseOver(x, yPos, breedte, hoogte) && mousePressed) {
      keuzes[uniek] = i;
    }
    if (i == keuzes[uniek]) {
      kleur = ROOD;      
    } else {
      kleur = WIT; 
    }
    tekenKnop(x, yPos, breedte, hoogte, "" + (i + 1) * 10, kleur);
  }
  
}


void tekenKnop(float x, float y, float breedte, float hoogte, String tekst, int kleur) {
  fill(kleur);
  stroke(ZWART);
  rect(x, y, breedte, hoogte);

  fill(ZWART);
  text(tekst, x + breedte / 2, y + hoogte / 2);
  }

boolean isMouseOver(float x, float y, float breedte, float hoogte) {
  if (mouseX >= x && mouseX <= x + breedte && mouseY >= y && mouseY <= y + hoogte) {
    return true;
  }
  return false;
}
