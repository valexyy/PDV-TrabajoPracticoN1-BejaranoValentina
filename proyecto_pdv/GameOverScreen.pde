class GameOverScreen extends GameScreen {
  int finalScore;
  
  GameOverScreen(int score) {
    this.finalScore = score;
  }
  
  void display() {
    // Fondo simple kawaii
    background(255, 240, 245);
    
    // Dibujar nubes globales
    cloudManager.display();
    
    // Título game over kawaii
    fill(255, 105, 180);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    textSize(42);
    text("GAME OVER", width/2, height/2 - 120);
    
    // Puntuación
    textFont(textFont);
    textSize(28);
    fill(255, 182, 193);
    text("Puntuacion final: " + finalScore, width/2, height/2 - 70);
    
    // Mensaje de ánimo
    textSize(20);
    fill(100, 100, 100);
    text("No te rindas! Intentalo de nuevo!", width/2, height/2 - 30);
    
    // Botón REINTENTAR
    drawButton(width/2, height/2 + 20, 200, 60, "REINTENTAR", 255, 105, 180);
    
    // Botón SALIR
    drawButton(width/2, height/2 + 90, 200, 60, "SALIR", 255, 182, 193);
    
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
    textSize(24);
    text(text, x, y);
  }
  
}
