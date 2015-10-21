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

int cc = 0;
int cs = 0;
int tmp =0;
int bg1x = 640;
int bg2x = 0;
boolean tmp2 = false; 
int count = 0;
float eyfinal;
int changetmp = 0;
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
  frameRate(120);
}

 void mouseClicked(){
 tmp2 = true;  
 
 }
 
  void draw() {
   
   background(bg1);//背景
   image(start1, 0, 0); //開始畫面
   count ++;
   if(tmp2){
     if(count%30==0){
      isPlaying = true;
     }else{
      image(start2,0,0);           
     }
   }
   if(tmp%2==0){
     ex = 0;
     ey = random(320);
   }
   
   
   if (isPlaying) {//開始u
     background(0);//頁面刷新
    
     image(bg1,bg1x-640, 0);//bg1
     image(bg2,bg2x-640, 0);//bg2
      bg1x++;
      bg2x++;
      bg1x%=1280;
      bg2x%=1280;
      x+=2;
     float ex = x % 640; //敵機速度
     
     if(count%640==0){
       ey=fy;}
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
     pressSetting();
     border(); //<>//
     if (fx <= ex+60 && fx >= ex) {
       if (fy <= ey + 60 && fy >= ey) {
            c-=38;
            changetmp++;
    
     }
     }

     if(t-20<fx && fx <= t+20){
       if(s-20 < fy && fy<=s+20 ){
         
       }
     }
     if (c <= 0) {
         c = 0;
        isPlaying =false;
         image(end1, 0, 0);
         
          cc=0;
       }
     }

   }
  
  
  void border(){
  if (fx >= 600) {//橫向範圍設定
       fx = 600;
     }
     if (fx <= 0) {
       fx = 0;
     }
     if (fy >= 440){//直向範圍設定
       fy = 440;
     }
     if (fy <= -0) {
       fy = 0;
     }if (fx >= 600) {//橫向範圍設定
       fx = 600;
     }
     if (fx <= 0) {
       fx = 0;
     }
     if (fy >= 440){//直向範圍設定
       fy = 440;
     }
     if (fy <= -0) {
       fy = 0;
     }
  }
  void  pressSetting(){
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