class ObstacleManager {
  ArrayList<Obstacle> obstacles;
  int obstacleTimer;
  int obstacleCounter;
  float currentSpeed;
  
  ObstacleManager() {
    obstacles = new ArrayList<Obstacle>();
    obstacleTimer = 0;
    obstacleCounter = 0;
    currentSpeed = 4.0; // Velocidad inicial
  }
  
  void update() {
    obstacleTimer++;
    
    // Aumentar velocidad progresivamente
    currentSpeed = 4.0 + (game.score * 0.001); // Velocidad aumenta con la puntuación
    if (currentSpeed > 8.0) currentSpeed = 8.0; // Velocidad máxima
    
    // Calcular frecuencia de obstáculos basada en la velocidad
    int obstacleFrequency = (int)(150 - (currentSpeed - 4.0) * 20); // De 150 a 70 frames
    if (obstacleFrequency < 70) obstacleFrequency = 70; // Frecuencia mínima
    
    // Generar obstáculo con frecuencia dinámica
    if (obstacleTimer >= obstacleFrequency) {
      int type = obstacleCounter % 2; // Alterna entre 0 y 1
      float newX = width + 100;
      
      // Calcular distancia mínima basada en la velocidad
      float minDistance = 200 + (currentSpeed - 4.0) * 30; // De 200 a 320 píxeles
      if (minDistance > 320) minDistance = 320; // Distancia máxima
      
      // Verificar que no se superponga con obstáculos existentes
      boolean canPlace = true;
      for (Obstacle obs : obstacles) {
        if (abs(obs.getX() - newX) < minDistance) {
          canPlace = false;
          break;
        }
      }
      
      if (canPlace) {
        obstacles.add(new Obstacle(newX, type));
        obstacleTimer = 0;
        obstacleCounter++;
      }
    }
    
    // Actualizar obstáculos existentes
    for (int i = obstacles.size() - 1; i >= 0; i--) {
      Obstacle obs = obstacles.get(i);
      obs.update(currentSpeed);
      
      if (obs.isOffScreen()) {
        obstacles.remove(i);
      }
    }
  }
  
  void display() {
    for (Obstacle obs : obstacles) {
      obs.display();
    }
  }
  
  boolean checkCollision(PinkBall ball) {
    // No detectar colisión si el jugador es invulnerable
    if (ball.invulnerable) {
      return false;
    }
    
    for (Obstacle obs : obstacles) {
      if (obs.checkCollision(ball)) {
        return true;
      }
    }
    return false;
  }
  
  void reset() {
    obstacles.clear();
    obstacleTimer = 0;
    obstacleCounter = 0;
    currentSpeed = 4.0; // Resetear velocidad
    
    // No agregar obstáculos iniciales para evitar problemas
    // Se generarán naturalmente durante el juego
  }
}
