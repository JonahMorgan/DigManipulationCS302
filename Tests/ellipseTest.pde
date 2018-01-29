PImage img;
PGraphics pg;
String path;
boolean imageChosen, clicked = false, ellipse, cornerEstablished = false;
int GUIWidth = 15;
int imgX, imgY= 320;
int prevmouseX, prevmouseY =0 ; 
PVector ellipseCorner = new PVector(0,0);
void setup(){
  size(640, 640);
  surface.setResizable(true);
  textAlign(CENTER);
  ellipseMode(CORNERS);
}
void draw(){
  background(75);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(0);
  text("Click here to load image", width/2, GUIWidth+15);
  text("Click here to draw ellipse", width/2, height-15);

  imageMode(CENTER);
  if(imageChosen==true){
    
   image(img, imgX, imgY); 
   //Move aroud code frome here
    if(mousePressed){
      if(ellipse == false){
  if(clicked == false){
 if((abs(imgX-mouseX )<=img.width/2)&&(abs((imgY)-mouseY)<=img.height/2)){
   clicked = true;
    prevmouseX = mouseX;
    prevmouseY = mouseY;
 } 
  }else{
    if((abs(imgX-mouseX )<=img.width/2)&&(abs((imgY)-mouseY)<=img.height/2)){
      if((abs(pmouseX-mouseX)>1)){
   move(1, 0);
   if(abs(pmouseY-mouseY)>1){
     move(0,1);
   
   }
      }
 }
  
  }
  }else{
    if(clicked == true){
      
      clicked = false;
    }}
  }}
  //to here
  if(ellipse){
    if(cornerEstablished== false){
    if (mousePressed ){
        ellipseCorner = new PVector(mouseX, mouseY);
        cornerEstablished = true;
    }
    }
  pg.beginDraw();
  pg.background(img);
  
  pg.ellipse(ellipseCorner.x, ellipseCorner.y, mouseX, mouseY);
  if(mousePressed==false){
  pg.endDraw();
  img = pg.get();
  ellipse = false;
  }
  }
  println(ellipse);
}
void mouseClicked(){
 if((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)){
   selectInput("Choose an image for editing", "imageSelected");
   
 }
 if((abs(width/2-mouseX )<=60)&&(abs((height-15)-mouseY)<=12)){
   delay(100);
  ellipse = true;
   
 }
  
}
void move(int x , int y){
  if(x==1){
  imgX+=mouseX-pmouseX;
  }
  if(y==1){
  imgY+=mouseY-pmouseY;
}}

void imageSelected(File file){
  if (file !=null){
  path = file.getAbsolutePath();
  img = loadImage(path);
  img.loadPixels();
  pg = createGraphics(img.width, img.height);
  surface.setSize(img.width+80, img.height+60);
  imgX = width/2;
  imgY = height/2;
  imageChosen=true;
}
}