PImage img;
String path;
boolean imageChosen, clicked = false;
int GUIWidth = 15;
int imgX, imgY= 320;
int prevmouseX, prevmouseY =0 ; 
void setup(){
  size(640, 640);
  surface.setResizable(true);
  textAlign(CENTER);
}
void draw(){
  background(25);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(0);
  text("Click to here load image", width/2, GUIWidth+15);
  imageMode(CENTER);
  if(imageChosen==true){
    
   image(img, imgX, imgY); 
    if(mousePressed){
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
  }
  
  
}
void mouseClicked(){
 if((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)){
   selectInput("Choose an image for editing", "imageSelected");
   
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
  surface.setSize(img.width+80, img.height+60);
  imgX = width/2;
  imgY = height/2;
  imageChosen=true;
}
}
