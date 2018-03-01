 PImage img;
PGraphics pg;
String path;
boolean imageChosen, clicked = false;
int GUIWidth = 15;
int imgX, imgY= 0;
int prevmouseX, prevmouseY =0 ; 

void setup(){
  size(640, 640);
  surface.setResizable(true);
  textAlign(CENTER);
  imageMode(CENTER);
  colorMode(RGB, 255,255,255,255);
  
}
void draw(){
  background(25);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(0);
  text("Click to here load image", width/2, GUIWidth+15);
  
  if(imageChosen==true){
  pushMatrix();
  translate(width/2, height/2);
   image(img, imgX, imgY);
   
   popMatrix();
  }
   
  
}
void mouseClicked(){
 if((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)){
   selectInput("Choose an image for editing", "imageSelected");
   
 }
  if(imageChosen){
   pixNoise(); 
    
  }
}
void pixNoise(){
  int radius = 12;
   
  pg.beginDraw();
  pg.background(img);
  pg.noStroke();
  for(int rep = 0; rep<5; rep++){
 for(int y = 0; y< img.height; y+=radius-2){
    for(int x = 0; x< img.width; x+=radius-2){
      int randX = floor(random(img.width));
      int randY = floor(random(img.height));
      int loc = randX+randY*img.width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      pg.fill(r,g,b,100);
      pg.ellipse(randX,randY, radius, radius);
      
      //img.pixels[loc] = color(r+map(noise(x,y,r), 0, 1, -r, 255-r), g+map(noise(x,y,g), 0, 1, -g, 255-g), b+map(noise(x,y,b), 0, 1, -b, 255-b));
      //img.pixels[loc] = color(r+random(-r, 255-r),g+random(-g, 255-g),b+random(-b, 255-b),255);
    }
 }

 img = pg.get();
  }
 
 img.updatePixels();
}

  

void imageSelected(File file){
  if (file !=null){
  path = file.getAbsolutePath();
  img = loadImage(path);
  surface.setSize(img.width+80, img.height+60);
  pg = createGraphics(img.width, img.height);

  imageChosen=true;
}
}
