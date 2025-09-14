PinkBallGame game;
PFont titleFont;
PFont textFont;

// Variables globales para nubes continuas
CloudManager cloudManager;

void setup() {
  size(1200, 600);
  
  // Cargar fuentes
  titleFont = createFont("Copyduck.ttf", 48);
  textFont = createFont("Comfortaa-Bold.ttf", 24);
  
  // Inicializar el gestor de nubes global
  cloudManager = new CloudManager();
  
  game = new PinkBallGame();
}

void draw() {
  // Actualizar nubes globales
  cloudManager.update();
  
  game.update();
  game.display();
}

void keyPressed() {
  game.handleKeyPress();
}

void keyReleased() {
  game.handleKeyRelease();
}

void mousePressed() {
  game.mousePressed();
}

// Clase para gestionar las nubes de forma global y continua
class CloudManager {
  float cloudOffset1 = 0;
  float cloudOffset2 = 0;
  float cloudOffset3 = 0;
  float cloudOffset4 = 0;
  float cloudOffset5 = 0;
  
  void update() {
    // Actualizar movimiento de nubes de forma continua
    cloudOffset1 -= 0.3;
    cloudOffset2 -= 0.2;
    cloudOffset3 -= 0.25;
    cloudOffset4 -= 0.15;
    cloudOffset5 -= 0.35;
  }
  
  void display() {
    fill(255, 255, 255, 150);
    noStroke();
    
    // Nube 1
    float cloud1X = width/4 + cloudOffset1;
    if (cloud1X < -150) cloud1X = width + 100;
    
    ellipse(cloud1X, height/4, 60, 40);
    ellipse(cloud1X + 20, height/4, 50, 35);
    ellipse(cloud1X - 15, height/4, 45, 30);
    
    // Nube 2
    float cloud2X = width * 3/4 + cloudOffset2;
    if (cloud2X < -150) cloud2X = width + 100;
    
    ellipse(cloud2X, height/3, 70, 45);
    ellipse(cloud2X + 25, height/3, 55, 40);
    ellipse(cloud2X - 20, height/3, 50, 35);
    
    // Nube 3
    float cloud3X = width/2 + cloudOffset3;
    if (cloud3X < -150) cloud3X = width + 100;
    
    ellipse(cloud3X, height/5, 50, 35);
    ellipse(cloud3X + 15, height/5, 40, 30);
    ellipse(cloud3X - 10, height/5, 35, 25);
    
    // Nube 4
    float cloud4X = width * 0.8 + cloudOffset4;
    if (cloud4X < -150) cloud4X = width + 100;
    
    ellipse(cloud4X, height/6, 45, 30);
    ellipse(cloud4X + 12, height/6, 35, 25);
    ellipse(cloud4X - 8, height/6, 30, 20);
    
    // Nube 5
    float cloud5X = width * 0.2 + cloudOffset5;
    if (cloud5X < -150) cloud5X = width + 100;
    
    ellipse(cloud5X, height/7, 55, 38);
    ellipse(cloud5X + 18, height/7, 45, 32);
    ellipse(cloud5X - 12, height/7, 40, 28);
    
    // Nube adicional para más continuidad
    float cloud6X = width * 0.6 + cloudOffset1 * 0.5;
    if (cloud6X < -150) cloud6X = width + 100;
    
    ellipse(cloud6X, height/8, 40, 28);
    ellipse(cloud6X + 12, height/8, 32, 24);
    ellipse(cloud6X - 8, height/8, 28, 20);
  }
  
  void updateGameSpeed(float gameSpeed) {
    // Ajustar velocidad de nubes basada en la velocidad del juego
    float cloudSpeed = 0.3 + (gameSpeed * 0.1);
    cloudOffset1 -= cloudSpeed * 1.5;
    cloudOffset2 -= cloudSpeed * 1.0;
    cloudOffset3 -= cloudSpeed * 0.8;
    cloudOffset4 -= cloudSpeed * 0.6;
    cloudOffset5 -= cloudSpeed * 1.2;
  }
}