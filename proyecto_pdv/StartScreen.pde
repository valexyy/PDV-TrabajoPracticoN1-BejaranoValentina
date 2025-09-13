class StartScreen extends GameScreen {
  void display() {
    // Fondo simple kawaii
    background(255, 240, 245);
    
    // Dibujar nubes globales
    cloudManager.display();
    
    // Título kawaii
    fill(255, 105, 180);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    textSize(56);
    text("PINK BALL", width/2, height/2 - 120);
    
    // Subtítulo
    textFont(textFont);
    textSize(28);
    fill(255, 182, 193);
    text("Aventura Kawaii", width/2, height/2 - 70);
    
    // Botón JUGAR
    drawButton(width/2, height/2 - 10, 200, 60, "JUGAR", 255, 105, 180);
    
    // Botón SALIR
    drawButton(width/2, height/2 + 60, 200, 60, "SALIR", 255, 182, 193);
    
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
