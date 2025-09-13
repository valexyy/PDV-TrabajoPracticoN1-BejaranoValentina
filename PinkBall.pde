class PinkBall {
  float x, y;
  float velocityX, velocityY;
  float size;
  boolean onGround;
  boolean moving;
  int lives;
  public boolean invulnerable;
  int invulnerabilityTimer;
  
  PinkBall() {
    reset();
  }
  
  void reset() {
    x = 100;
    y = height - 130;
    velocityX = 0;
    velocityY = 0;
    size = 60;
    onGround = true;
    moving = false;
    lives = 3;
    invulnerable = false;
    invulnerabilityTimer = 0;
  }
  
  void update() {
    if (moving) {
      velocityX = 0;
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
    
    if (invulnerable) {
      invulnerabilityTimer--;
      if (invulnerabilityTimer <= 0) {
        invulnerable = false;
      }
    }
  }
  
  void display() {
    if (invulnerable && (invulnerabilityTimer / 10) % 2 == 0) {
      // Parpadeo durante la inmunidad
      fill(255, 182, 193, 100);
    } else {
      fill(255, 182, 193);
    }
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
  int getLives() { return lives; }
  
  void loseLife() {
    if (!invulnerable) {
      lives--;
      invulnerable = true;
      invulnerabilityTimer = 120; // 2 segundos de inmunidad
    }
  }
  
  boolean isAlive() {
    return lives > 0;
  }
  
  void respawn() {
    x = 100;
    y = height - 130;
    velocityX = 0;
    velocityY = 0;
    onGround = true;
    moving = false;
    invulnerable = true;
    invulnerabilityTimer = 120;
  }
}
