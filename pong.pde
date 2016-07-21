import ddf.minim.*;
PImage backgroundImage;
Minim minim;
AudioSample sound;
int ballX = 51;
int speedX = 10;
int ballY = 50;
int speedY = 11;
void setup(){
  size(500, 500);
  minim = new Minim (this);
  sound = minim.loadSample("hitTheGround.wav");
  backgroundImage = loadImage("borris.jpg");  
  
}
void draw(){
  background(255, 255, 255);
  image(backgroundImage, 0, 0);
  image(backgroundImage, 0, 0, 500, 500);
  fill(0, 0, 0);
  ellipse(ballX, ballY, 20, 20);
  stroke(0, 0, 255);
  ballX = ballX + speedX;
  ballY = ballY + speedY;
  rect(mouseX, 480, 100, 10);
  if (ballY > 500){
    speedY = -speedY; 
  }
  if (ballY < 0){
    speedY = -speedY;
  }
  if (ballX > 500){
       speedX = -speedX;
  }
  if (ballX < 0){
    speedX = -speedX;
  }
  if (ballY > 500){
    sound.trigger();
    text("You lose.", 350, 325);
    textSize(25);
  }
  if (intersects(ballX, ballY, mouseX, 480, 100) == true){
    speedX = -10;
    speedY = -10;
  }

}
  boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
if (ballY > paddleY && ballX > paddleX && ballX < paddleX + paddleLength)
return true;
else 
return false;
}
