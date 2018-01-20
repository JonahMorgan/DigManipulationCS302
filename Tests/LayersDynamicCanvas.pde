PImage[] images = new PImage[20];
PImage img;
String path;
int GUIwidth=15;
boolean imgChosen = false;
int i = 0;
int maxWidth, maxHeight = 150;
void setup(){
  size(640,640); 
  surface.setResizable(true);
}
void draw(){
  stroke(0, 0, 0);
  textAlign(CENTER);
  text("Click to load image", width/2, GUIwidth+15);
 if(imgChosen == true){ 
   for(int j = 0; j<10; j++){
     if(images[j] != null){
 image(images[j], 30, 30+GUIwidth); 
     }
   }
}
}

void mouseClicked(){
  //img=null;
  selectInput("Choose an image for editing", "imageSelected");
  
}
void imageSelected(File file){
  if (file !=null){
 
 
  path = file.getAbsolutePath();
  images[i] = loadImage(path);
  if(images[i].width>displayWidth){
   images[i].resize(displayWidth, 0); 
    
  }
  if(images[i].height>displayHeight){
   images[i].resize(0, displayHeight); 
    
  }
  
  if(images[i].width > maxWidth){
    maxWidth = images[i].width;
    }
    if(images[i].height > maxHeight){
    maxHeight = images[i].height;
    }
  surface.setSize(maxWidth+60, maxHeight+60+GUIwidth);
  imgChosen = true;
  i++;
  }
}

