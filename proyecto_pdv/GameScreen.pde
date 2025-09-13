abstract class GameScreen {
  abstract void display();
}

class PlayScreen extends GameScreen {
  void display() {
    // Fondo simple kawaii
    background(255, 240, 245);
    
    // Actualizar velocidad de nubes basada en la velocidad del juego
    cloudManager.updateGameSpeed(game.obstacleManager.currentSpeed);
    
    // Dibujar nubes globales
    cloudManager.display();
    
    // Línea del suelo con corazones
    drawKawaiiGround();
    
    game.player.display();
    game.obstacleManager.display();
    
    // Puntuación con estilo kawaii
    fill(255, 105, 180);
    textAlign(LEFT);
    textFont(textFont);
    textSize(24);
    text("Puntuacion: " + game.score, 20, 35);
  }
  
  void drawKawaiiGround() {
    stroke(255, 182, 193);
    strokeWeight(3);
    line(0, height - 120, width, height - 120);
  }
}
