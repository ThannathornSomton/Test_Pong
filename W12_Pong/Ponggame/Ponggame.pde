Ball ball;
Paddle[] paddle;
PongGame Game;
int paddle_quantity = 2;
int ball_quantity = 1;

void setup(){
  frameRate(60);
  size(800,600);
  textSize(32);
  Game = new PongGame();
  ball = new Ball(24,-5,0);
  paddle = new Paddle[paddle_quantity];
  paddle[0] = new Paddle(0);
  paddle[1] = new Paddle(1);
  

}
void draw(){
  Game.draw();

  
}


class Ball{

  float positionX,positionY,size,speedX,speedY;
  int side;
  boolean isOut = false;
  
  Ball(float a,float b,float c){
    positionX = width/2;
    positionY = height/2;
    size = a;
    speedX = b;
    speedY = c;
  }
   
  public void draw(){
    this.move();
    this.bounce();
    circle(positionX,positionY,size);
  }
  
  public void move(){
    positionX += speedX;
    positionY -= speedY;
  }
  
  public void bounce(){
    if(positionX > 0 && positionX < width){
      if(positionX-(size/2) <= paddle[0].positionX + (paddle[0].p_width)){ //left paddle
        if(positionY + (size/2) >= paddle[0].positionY 
          && positionY - (size/2) <= paddle[0].positionY + paddle[0].p_height){
            speedX = abs(speedX);
            speedY = abs(speedX)*0.75*((paddle[0].positionY+(paddle[0].p_height/2)) - positionY)/50;
        }
      }
      if(positionX+(size/2) >= paddle[1].positionX){
        if(positionY + (size/2) >= paddle[1].positionY 
          && positionY - (size/2) <= paddle[1].positionY + paddle[1].p_height){
            speedX = 0 - abs(speedX);
            speedY = abs(speedX)*0.75*((paddle[1].positionY+(paddle[1].p_height/2)) - positionY)/50;
        }
      }
    
        if(positionY - size/2 <= 0){
          speedY = 0 - abs(speedY);  
        }
    
        if(positionY + size/2 >= height){
          speedY = 0 + abs(speedY);  
        }
      }
    else{
      if(positionX < width/2){
        side = 0;
      }
      if(positionX > width/2){
        side = 1;
      }
      isOut = true;
    }
    
  }
  public void reset_Out(){
    isOut = false;
  }
  //public void set_speedXYto(){
  //  SpeedX = 
 //   speedY =
 // }
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
  
  int score_0 = 0, score_1 = 0;
  
  void draw(){
    background(0);
    fill(255);
    rect((width/2)-1,0,2,height);
    paddle[0].draw();
    paddle[1].draw();
    ball.draw();
    text(score_0, 190, 50);
    text(score_1, 590, 50);
    if(ball.isOut){
      update(ball.side);
    }
     
  }
  
  void update(int a){
    if(a == 0){
      score_1++;
    }
    if(a == 1){
      score_0++;
    }
    ball.reset_Out();
    ball = new Ball(24,5,0);
    
  }
  
}
