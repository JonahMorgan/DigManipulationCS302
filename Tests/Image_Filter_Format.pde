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
  text("Click here to load image", width/2, GUIWidth+15);
  imageMode(CENTER);
  if(imageChosen==true){
    
   image(img, imgX, imgY); 
   
  }
   
  
}
void mouseClicked(){
 if((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)){
   selectInput("Choose an image for editing", "imageSelected");
   
 }
  
}

  

void imageSelected(File file){
  if (file !=null){
  path = file.getAbsolutePath();
  img = loadImage(path);
  surface.setSize(img.width+80, img.height+60);

  imageChosen=true;
}
}
