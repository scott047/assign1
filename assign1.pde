PImage treasureImg;
int POINT;
float enemyX,enemyY,treasureX,treasureY,backgroundX,backgroundY,hpX,hpY,blood,speedX,speedY;
boolean isPlaying=true;

void setup(){
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  hpImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  shipImg=loadImage("img/fighter.png");
  speedX=floor(random(5,16));
  speedY=floor(random(-2,2));
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  POINT=0;
  backgroundX=640;
  backgroundY=1280;
  enemyX=20;
  enemyY=floor(random(40,440));
  hpX=20;
  hpY=20;
  blood=225;
  }

void draw(){
  if(isPlaying){
  imageMode(CORNERS);
  image(background1Img,backgroundX-640,0,backgroundX,480);
  imageMode(CORNERS);
  image(background2Img,backgroundY-640,0,backgroundY,480);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(enemyImg,enemyX,enemyY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,mouseX-20,mouseY-20);
  if(treasureX+40>=mouseX&&mouseX+40>=treasureX){
    if(treasureY+40>=mouseY&&mouseY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    ++POINT;
    println("SCORE:"+POINT);
    }
  }
     if(enemyX+40>=mouseX&&mouseX+40>=enemyX){
       if(enemyY+40>=mouseY&&mouseY+40>=enemyY){
       speedX=floor(random(5,16));
       speedY=floor(random(-2,2));
       enemyX=20;
       enemyY=floor(random(40,440));
       blood-=39;
       }
    }
    if(enemyX>680||enemyX<-40||enemyY<-40||enemyY>480){
      
      speedX=floor(random(5,16));
      speedY=floor(random(-2,2));
       enemyX=20;
       enemyY=floor(random(40,440));
      ++POINT;
      println("SCORE:"+POINT);
    }
  enemyX+=speedX;
  enemyY+=speedY;
  backgroundX=backgroundX+5;
  backgroundY=backgroundY+5;
  backgroundX=backgroundX%1280;
  backgroundY=backgroundY%1280;
  }
  if(blood==30){
    println("TOTAL_SCORE:"+POINT);
    println("GAME_OVER");
    isPlaying=false;
  }
}
