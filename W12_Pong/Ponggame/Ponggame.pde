Ball ball;
Paddle[] paddle;
PongGame Game;

void setup(){
  frameRate(60);
  size(800,600);
  textSize(32);
  Game = new PongGame();
  ball = new Ball(24);
  paddle = new Paddle[2];
  paddle[0] = new Paddle(0);
  paddle[1] = new Paddle(1);
  

}
void draw(){
  Game.draw();

  
}


class Ball{

  float positionX,positionY,size,speedX,speedY;
  int side, sec;
  boolean isOut = false;
  
  Ball(float a){
    positionX = width/2;
    positionY = height/2;
    size = a;
    speedX = random(0,4);
    speedY = random(0,4);
    println(speedX);
    println(speedY);
    if(speedX > 2){speedX = 3;}else{speedX = -3;}
    if(speedY > 2){speedY = 3;}else{speedY = -3;}
    sec = second();;
  }
        
  public void draw(){
    if(abs(speedX) < 12){
      if(second() - sec >= 1 ){
        speedX = (speedX/abs(speedX))*(abs(speedX)+1);
        println(speedX);
        sec = second();
      }
    }
    move();
    bounce();
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
    if(mouseX <= 250){
      float dy = targetY - positionY;
      positionY += dy * 0.25;}
  }
  if(p_number == 1){
    if(mouseX >= width - 250){
      float dy = targetY - positionY;
      positionY += dy * 0.25;}
  }
  rect(positionX,positionY,p_width,p_height);
  }

}
class PongGame{
  
  int score_0, score_1,sec,sec2 = 0 ;
  boolean run = true ;
  String display_text = ""; 
  int bg_color = 0;
  
  PongGame(){
    score_0 = 0;
    score_1 = 0;
  }
  
  void draw(){
    background(bg_color);
    fill(255);
    rect((width/2)-1,0,2,height);
    paddle[0].draw();
    paddle[1].draw();
    text(score_0, 190, 50);
    text(score_1, 590, 50);
    if(ball.isOut){
      update(ball.side);
      who_win();
    }
    if(run){
      ball.draw();
    }
    else{
      bg_color = 100;
      text(display_text, 280, 300);
      if(second() - sec == 1 ){
        sec2++;
        sec = second();
      }
      if(sec2 > 3){
        run = true;
        sec2 = 0;
        restart();
        bg_color = 0;
      }
    }
  }
  
  void update(int a){
    if(a == 0){
      score_1++;
    }
    if(a == 1){
      score_0++;
    }
    ball = new Ball(24);
  }
  
  void who_win(){
    if(score_0 == 10 || score_1 == 10){  
        if (score_0 > score_1){
          display_text = "Left_player wins";
        }
        else{
          display_text = "Right_player wins";
        }
    run = false;
    sec = second();
    }
  }
    
  void restart(){
      Game = new PongGame();
      ball = new Ball(24);
  }
}
  
