Ball ball;
Paddle[] paddle;
PongGame Game;
int paddle_quantity = 2; 
void setup(){
  frameRate(60);
  size(800,600);
  textSize(32);
  ball = new Ball(24,2,0);
  Game = new PongGame();
  paddle = new Paddle[paddle_quantity];
  for(int i = 0; i < paddle_quantity; i++){
    paddle[i] = new Paddle(i);
  }

}
void draw(){
  Game.draw();
  
}

class Ball{

  float positionX,positionY,size,direction,speed;
  
  Ball(float a,float b,float c){
    positionX = width/2;
    positionY = height/2;
    size = a;
    speed = b;
    direction = c;
  }
   
  public void draw(){
   circle(positionX,positionY,size);
  }
  
   
   
  

}

class Paddle{

  float positionX,positionY,p_width,p_height,p_number;
  
  Paddle(int a){
    p_number = a;
    p_width = 20;
    p_height = 100;
    if(p_number == 0){
      positionX = 0;}
    else if(p_number == 1){
      positionX = width-p_width;}
    positionY = (height/2)-(p_height/2);
  }
  
  public void draw(){
  float targetY = mouseY-p_height/2;
  if(p_number == 0){
    if(mouseX <= 200){
      float dy = targetY - positionY;
      positionY += dy * 0.25;}
  }
  if(p_number == 1){
    if(mouseX >= width - 200){
      float dy = targetY - positionY;
      positionY += dy * 0.25;}
  }
  rect(positionX,positionY,p_width,p_height);
  }

}
class PongGame{
  
  float score_0 = 0, score_1 = 0,direction;
  
  void draw(){
    background(0);
    fill(255);
    rect((width/2)-1,0,2,height);
    for(int i = 0; i < 2; i++){
     paddle[i].draw();
    }
    ball.draw();

    
  
  }
  
  
}
