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
    if (game.score < 7000) {
      currentSpeed = 4.0 + (game.score * 0.001);
      if (currentSpeed > 8.0) currentSpeed = 8.0;
    } else {
      // Después de 7000 puntos, velocidad más agresiva
      currentSpeed = 8.0 + ((game.score - 7000) * 0.002);
      if (currentSpeed > 12.0) currentSpeed = 12.0; // Velocidad máxima aumentada
    }
    
    // Calcular frecuencia de obstáculos basada en la velocidad y puntuación
    int obstacleFrequency;
    if (game.score < 600) {
      obstacleFrequency = (int)(150 - (currentSpeed - 4.0) * 20);
      if (obstacleFrequency < 70) obstacleFrequency = 70;
    } else {
      // Después de 600 puntos, más obstáculos
      obstacleFrequency = (int)(120 - (currentSpeed - 4.0) * 25);
      if (obstacleFrequency < 50) obstacleFrequency = 50; // Frecuencia mínima más agresiva
    }
    
    // Generar obstáculo con frecuencia dinámica
    if (obstacleTimer >= obstacleFrequency) {
      int type = obstacleCounter % 2; // Alterna entre 0 y 1
      float newX = width + 100;
      
      // Calcular distancia mínima basada en la velocidad y puntuación
      float minDistance;
      if (game.score < 600) {
        minDistance = 200 + (currentSpeed - 4.0) * 30;
        if (minDistance > 320) minDistance = 320;
      } else {
        // Después de 600 puntos, obstáculos más juntos
        minDistance = 150 + (currentSpeed - 4.0) * 25;
        if (minDistance > 280) minDistance = 280;
      }
      
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
