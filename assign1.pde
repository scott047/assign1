PImage background1Img;
PImage background2Img;
PImage background3Img;
PImage shipImg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
int POINT;
float enemyX,enemyY,treasureX,treasureY,backgroundX,backgroundY,backgroundZ,hpX,hpY,blood,speedX,speedY;
boolean isPlaying=true;

void setup(){
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  background3Img=loadImage("img/bg1.png");
  hpImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  shipImg=loadImage("img/fighter.png");
  speedX=floor(random(5,16));
  speedY=floor(random(-2,2));
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  POINT=0;
  backgroundX=0;
 
  enemyX=20;
  enemyY=floor(random(40,440));
  hpX=20;
  hpY=20;
  blood=floor(random(175,225));
  }

void draw(){
  if(isPlaying){
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
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
  backgroundX++;
  backgroundY=backgroundX-640;
  backgroundZ=backgroundY-640;
  backgroundX=backgroundX%1280;
  }
  if(blood<=30){
    println("TOTAL_SCORE:"+POINT);
    println("GAME_OVER");
    isPlaying=false;
  }
}



  
