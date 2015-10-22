PImage bg1,bg2,treasure,hp,fighter,enemy,end1,end2,start1,start2,enemy1,bomb;//image imort 
int x = 0;
int y = 0;
int z = -640;
int c = 38;
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
int ex = 0;
int ey = floor(random(430));
boolean changeTreasurePlace = false;
boolean changeEnemyPlace = false;
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

 void mousePressed(){
 tmp2 = !tmp2;  
 
 }
 
 void draw() {
   background(bg1);//bg
   image(start1, 0, 0); //start initial
   count ++;//framecount
   
   if(tmp2){//count press time and initial start2
     if(count%30==0){
      isPlaying = true;
     }else{
      image(start2,0,0);           
     }
   } 
   if (isPlaying) {//game start
     background(0);//bg0
    
     image(bg1,bg1x-640, 0);//initial bg1
     image(bg2,bg2x-640, 0);//initial bg2
      bg1x++;//bg1 Xspeed
      bg2x++;//bg2 Xspeed
      bg1x%=1280;// if bg1 to 1280,it will go back 0;
      bg2x%=1280;// like bg2;
      x+=2;//enemy speed
      ex = x % 640; //enemy location

     image(enemy,ex,ey);//enemy initial
     if(ex>=640){//enemy border
     ex = 0;
     }
     
      
     image(fighter, fx, fy);//fighter location
     stroke(250, 3, 3);//blood
     strokeWeight(18);
     line(58, 38, 58 + c, 38);//blood line
     image(hp, 50, 25);//initial hp
     image(treasure, t, s);//initial treasure
     pressSetting();
     border();   //<>//
     if (fx <= ex+20 && fx > ex-20) {
       if (fy <= ey + 20 && fy >= ey-20) {
           
            updateEnemy();
            //changetmp++;
            if(changeEnemyPlace){
            ex= 0;
            ey=floor(random(430));
            changeEnemyPlace = false;
            }
             c-=38;
    
     }
     }

     if(t-20 <fx && fx <= t+20){
       if(s-20 < fy && fy<=s+20 ){
         updateTreasure();
         if(changeTreasurePlace){
           s=floor(random(430));
           t=floor(random(640));
           changeTreasurePlace=false;
         }
         c+=38;
       }
     }
     if (c <= 0) {
         c = 0;
        isPlaying =false;
         image(end1, 0, 0);
         
          cc=0;
       }
       
      if(c>=190){
      c=190;
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
     changeTreasurePlace = true;
    
}
  
  void updateEnemy(){
    changeEnemyPlace = true;
  }