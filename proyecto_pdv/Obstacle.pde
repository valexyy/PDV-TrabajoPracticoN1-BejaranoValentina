class Obstacle {
  float x, y;
  float obstacleWidth, obstacleHeight;
  int type;
  
  Obstacle(float x, int type) {
    this.x = x;
    this.type = type;
    
    if (type == 0) {
      obstacleWidth = random(25, 35); // Menos ancho
      obstacleHeight = random(40, 60); // Más alto
    } else {
      obstacleWidth = random(40, 60);
      obstacleHeight = random(30, 50);
    }
    
    y = height - 120 - obstacleHeight;
  }
  
  void update(float speed) {
    x -= speed; // Velocidad dinámica
  }
  
  void display() {
    if (type == 0) {
      // Cubo simple
      fill(255, 182, 193);
      stroke(255, 105, 180);
      strokeWeight(3);
      rect(x, y, obstacleWidth, obstacleHeight);
      
    } else {
      // Triángulo simple
      fill(173, 216, 230);
      stroke(135, 206, 235);
      strokeWeight(3);
      triangle(x, y + obstacleHeight, x + obstacleWidth/2, y, x + obstacleWidth, y + obstacleHeight);
    }
  }
  
  boolean checkCollision(PinkBall ball) {
    if (type == 0) {
      return (ball.getX() + ball.getSize()/2 > x && 
              ball.getX() - ball.getSize()/2 < x + obstacleWidth &&
              ball.getY() + ball.getSize()/2 > y && 
              ball.getY() - ball.getSize()/2 < y + obstacleHeight);
    } else {
      return (ball.getX() + ball.getSize()/2 > x && 
              ball.getX() - ball.getSize()/2 < x + obstacleWidth &&
              ball.getY() + ball.getSize()/2 > y);
    }
  }
  
  float getX() { return x; }
  boolean isOffScreen() { return x + obstacleWidth < 0; }
}
