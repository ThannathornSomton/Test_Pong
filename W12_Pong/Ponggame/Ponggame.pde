Ball A;
Paddle B,C;
void setup(){
  size(800,600);
  line(width/2,0,width/2,height);
  A = new Ball(20,2,0);
  B = new Paddle(0);
  C = new Paddle(1);

}
void draw(){
  A.draw();
  B.draw();
  C.draw();
  
  
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
   
   void draw(){
   circle(positionX,positionY,size);
   }
  

}

class Paddle{

  float positionX,positionY,p_width,p_height;
  
  Paddle(int a){
    if(a == 0){
      positionX = 0;}
    else if(a == 1){
      positionX = 790;}
    positionY = 300;
    p_width = 10;
    p_height = 50;
  }
  
  void draw(){
  rect(positionX,positionY-(p_height)/2,p_width,p_height);
  }

}
