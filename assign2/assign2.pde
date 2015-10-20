PImage bg1,bg2,treasure,hp,fighter,enemy,end1,end2,start1,start2,enemy1,bomb;
int x = 0;
int y = 0;
int z = -640;
int c = 190;
int t = floor(random(640));
int s = floor(random(480));
boolean isPlaying = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
float speed = 5;
float fx = 500;
float fy = 240;
float ey = random(320);
int cc = 0;
int cs = 0;
int tmp =0;

void setup() {
  size(641, 482);
  bg1 = loadImage("img/bg1.png");
  treasure = loadImage("img/treasure.png");
  hp = loadImage("img/hp.png");
  fighter = loadImage("img/fighter.png");
  enemy = loadImage("img/enemy.png");
  bg2 = loadImage("img/bg2.png");
  enemy1 = loadImage("img/Moocs-element-enemy1.png");
  bomb = loadImage("img/Moocs-element-gainbomb.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  smooth();
  isPlaying = false;
}
 //void draw(){
 ////  tmp++;
 // background(bg1);
 // image(start1,0,0);
 // if(isPlaying){
 // image(bg1,y,0);
 // image(bg2,z,0);
 //  y++;
 //  z++;
 //   if(y==640){
 //   y=-640;
 //   }
 //   if(z==640){
 //   z=-640;
 //  }
 //}
 //}
 
 void mouseClicked(){
   cc++;//計算keyboard次數
   if(cc==1){
     image(start2,0,0);
     isPlaying = true;
     
   }
   if(cc==0){
     isPlaying = false;
   }
  
 
 }
 void mouseReleased(){
   image(start2,0,0);
   isPlaying = true;

 }
 
  void draw() {
   background(bg1);//背景
   image(start1, 0, 0); //開始畫面
   if (isPlaying) {//開始u
     background(0);//頁面刷新
     y++;//背景跑馬燈
     z++;
     if (y == 640) {
       y = -640;
     }
     if (z == 640) {
       z = -640;
     }
     image(bg1, y % 640, 0);//bg1
     image(bg2, z % 640, 0);//bg2
     x+=2;
     float ex = x % 640; //敵機速度
     image(enemy,ex,ey);//敵機位置
     if(ex>=640){//敵機超出頁面後重返位置0
     ex = 0;
     }
      
     image(fighter, fx, fy);//我方位置
     stroke(250, 3, 3);//血條
     strokeWeight(18);//血條寬度
     line(58, 38, 58 + c, 38);//血量
     image(hp, 50, 25);//血量框
     //x += 2; //你他媽這三小變數,10/21幹我知道了
     image(treasure, t, s);//寶物位置
     if (upPressed) {//按件判別
       fy -= speed;
     }
     if (downPressed) {
       fy += speed;
     }
     if (leftPressed) {
       fx -= speed;
     }
     if (rightPressed) {
       fx += speed;
     }
     if (fx >= 600) {//橫向範圍設定
       fx = 600;
     }
     if (fx <= 0) {
       fx = 0;
     }
     if (fy >= 440){//直向範圍設定
       fy = 440;
     }
     if (fy <= -0) { //<>//
       fy = 0;
     }
     if (fx <= ex + 20 && fx >= ex - 20) {
       if (fy <= ey + 20 && fy >= ey - 20) {
         c--;
       }

     if(t-20<fx && fx <= t+20){
       if(s-20 < fy && fy<=s+20 ){
         updateTreasure();
       }
     }
     if (c <= 0) {
         c = 0;
         image(end1, 0, 0);
          cc=0;
       }
     }

   }
  }

  void keyPressed() {
   // loop();
  // isPlaying = true;
   
   if (key == CODED) {
     switch (keyCode) {
     case UP:
       upPressed = true;
       break;
     case DOWN:
       downPressed = true;
       break;
     case LEFT:
       leftPressed = true;
       break;
     case RIGHT:
       rightPressed = true;
       break;
     }
   }
  }

  void keyReleased() {
    
   if (key == CODED) {
     switch (keyCode) {
     case UP:
       upPressed = false;
       break;
     case DOWN:
       downPressed = false;
       break;
     case LEFT:
       leftPressed = false;
       break;
     case RIGHT:
       rightPressed = false;
       break;
     }
   }
  }
  
  void updateTreasure(){
      image(enemy,random(480),random(240));
  }
  
  void updateEnemy(){
  
  }