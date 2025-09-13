class VictoryScreen extends GameScreen {
  int finalScore;
  
  VictoryScreen(int score) {
    this.finalScore = score;
  }
  
  void display() {
    // Fondo simple kawaii
    background(255, 240, 245);
    
    // Dibujar nubes globales
    cloudManager.display();
    
    // Título de victoria
    fill(255, 215, 0);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    textSize(48);
    text("VICTORIA!", width/2, height/2 - 120);
    
    // Mensaje de felicitación
    textFont(textFont);
    textSize(28);
    fill(255, 105, 180);
    text("Felicidades!", width/2, height/2 - 70);
    
    // Puntuación
    textSize(24);
    fill(255, 182, 193);
    text("Puntuacion final: " + finalScore, width/2, height/2 - 30);
    
    // Mensaje de logro
    textSize(20);
    fill(100, 100, 100);
    text("Has alcanzado los 10000 puntos!", width/2, height/2 + 10);
    
    // Botón JUGAR DE NUEVO
    drawButton(width/2, height/2 + 50, 200, 60, "JUGAR DE NUEVO", 255, 105, 180);
    
    // Botón SALIR
    drawButton(width/2, height/2 + 120, 200, 60, "SALIR", 255, 182, 193);
    
  }
  
  void drawButton(float x, float y, float w, float h, String text, int r, int g, int b) {
    // Sombra del botón
    fill(200, 200, 200, 100);
    noStroke();
    rect(x - w/2 + 3, y - h/2 + 3, w, h, 15);
    
    // Botón principal
    fill(r, g, b);
    stroke(255);
    strokeWeight(3);
    rect(x - w/2, y - h/2, w, h, 15);
    
    // Texto del botón centrado correctamente
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(textFont);
    textSize(20);
    text(text, x, y);
  }
  
}
