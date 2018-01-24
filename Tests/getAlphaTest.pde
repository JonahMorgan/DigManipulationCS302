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
  background(255);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(255);
  text("Click to here load image", width/2, 15);
  imageMode(CENTER);
  if(imageChosen==true){
   
   image(img, imgX, imgY);
     println(alpha(img.pixels[mouseX+mouseY*width]));
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
  img.loadPixels();
  surface.setSize(img.width, img.height);
  imgX = width/2;
  imgY = height/2;
  imageChosen=true;
}
}