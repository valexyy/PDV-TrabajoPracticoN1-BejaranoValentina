class PinkBall {
  float x, y;
  float velocityX, velocityY;
  float size;
  boolean onGround;
  boolean moving;
  
  PinkBall() {
    reset();
  }
  
  void reset() {
    x = 100;
    y = height - 130; // Más arriba
    velocityX = 0;
    velocityY = 0;
    size = 60;
    onGround = true;
    moving = false;
  }
  
  void update() {
    if (moving) {
      velocityX = 0; // Pink Ball no se mueve horizontalmente
    } else {
      velocityX = 0;
    }
    
    velocityY += 0.8;
    y += velocityY;
    
    if (y >= height - 150) {
      y = height - 150;
      velocityY = 0;
      onGround = true;
    }
  }
  
  void display() {
    // Cuerpo principal de la pelota
    fill(255, 182, 193);
    stroke(255, 105, 180);
    strokeWeight(3);
    ellipse(x, y, size, size);
  }
  
  void moveRight() {
    moving = true;
  }
  
  void stop() {
    velocityX = 0;
  }
  
  void stopMoving() {
    moving = false;
  }
  
  void jump() {
    if (onGround) {
      velocityY = -18; // Salto más alto
      onGround = false;
    }
  }
  
  float getX() { return x; }
  float getY() { return y; }
  float getSize() { return size; }
}
