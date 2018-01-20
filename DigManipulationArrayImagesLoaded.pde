PImage[] images = new PImage[10];
PImage img;
String path;
int GUIwidth=15;
boolean imgChosen = false;
int i = 0;
void setup(){
  size(640,640); 
  surface.setResizable(true);
}
void draw(){
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
  surface.setSize(images[0].width+60, images[0].height+60+GUIwidth);
  imgChosen = true;
  i++;
  }
}