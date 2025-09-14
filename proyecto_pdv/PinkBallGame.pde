class PinkBallGame {
  GameScreen currentScreen;
  PinkBall player;
  ObstacleManager obstacleManager;
  int score;
  boolean gameRunning;
  
  PinkBallGame() {
    currentScreen = new StartScreen();
    player = new PinkBall();
    obstacleManager = new ObstacleManager();
    score = 0;
    gameRunning = false;
  }
  
  void update() {
    if (currentScreen instanceof PlayScreen) {
      if (gameRunning) {
        player.update();
        obstacleManager.update();
        score++;
        
        // Verificar victoria
        if (score >= 10000) {
          currentScreen = new VictoryScreen(score);
          gameRunning = false;
        }
        // CORRUPCIÓN: Mensaje oculto
        if (score == 6666) {
          currentScreen = new CorruptedScreen(score);
          gameRunning = false;
        }
        // Verificar colisión
        else if (obstacleManager.checkCollision(player)) {
          player.loseLife();
          if (!player.isAlive()) {
            currentScreen = new GameOverScreen(score);
            gameRunning = false;
          } else {
            player.respawn();
          }
        }
      }
    }
  }
  
  void display() {
    currentScreen.display();
  }
  
  void handleKeyPress() {
    if (currentScreen instanceof StartScreen) {
      if (key == 'q' || key == 'Q') {
        exit();
      }
    } else if (currentScreen instanceof GameOverScreen) {
      if (key == 'q' || key == 'Q') {
        exit();
      }
    } else if (currentScreen instanceof VictoryScreen) {
      if (key == 'q' || key == 'Q') {
        exit();
      }
    } else if (currentScreen instanceof CorruptedScreen) {
      if (key == 'q' || key == 'Q') {
        exit();
      }
    } else if (currentScreen instanceof PlayScreen) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          player.moveRight();
        } else if (keyCode == LEFT) {
          player.stop();
        }
      } else if (key == ' ') {
        player.jump();
      }
    }
  }
  
  void mousePressed() {
    if (currentScreen instanceof StartScreen) {
      // Botón JUGAR
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 - 40 && mouseY < height/2 + 20) {
        startGame();
      }
      // Botón SALIR
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 + 30 && mouseY < height/2 + 90) {
        exit();
      }
    } else if (currentScreen instanceof GameOverScreen) {
      // Botón REINTENTAR
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 + 10 && mouseY < height/2 + 70) {
        restartGame();
      }
      // Botón SALIR
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 + 80 && mouseY < height/2 + 140) {
        exit();
      }
    } else if (currentScreen instanceof VictoryScreen) {
      // Botón JUGAR DE NUEVO
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 + 10 && mouseY < height/2 + 70) {
        restartGame();
      }
      // Botón SALIR
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && 
          mouseY > height/2 + 80 && mouseY < height/2 + 140) {
        exit();
      }
    }
  }
  
  void handleKeyRelease() {
    if (currentScreen instanceof PlayScreen) {
      if (key == CODED && keyCode == RIGHT) {
        player.stopMoving();
      }
    }
  }
  
  void startGame() {
    currentScreen = new PlayScreen();
    gameRunning = true;
    player.reset();
    obstacleManager.reset();
    score = 0;
  }
  
  void restartGame() {
    startGame();
  }
}
