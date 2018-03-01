PImage img;
PGraphics pg;
String path;
boolean imageChosen, clicked = false;
int GUIWidth = 15;
int imgX, imgY= 0;
int prevmouseX, prevmouseY =0 ; 

void setup() {
  size(640, 640);
  surface.setResizable(true);
  textAlign(CENTER);
  imageMode(CENTER);
  colorMode(RGB, 255, 255, 255, 255);
}
void draw() {
  background(25);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(0);
  text("Click to here load image", width/2, GUIWidth+15);

  if (imageChosen==true) {
    pushMatrix();
    translate(width/2, height/2);
    image(img, imgX, imgY);

    popMatrix();
  }
}
void mouseClicked() {
  if ((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)) {
    selectInput("Choose an image for editing", "imageSelected");
  }
  if (imageChosen) {
    findEdges();
  }
}
void findEdges() {
  IntList edges = new IntList();
  int threshold = 50;

  
    for (int y = 0; y< img.height-1; y++) {
      for (int x = 0; x< img.width-1; x++) {

        int loc = x+y*img.width;
        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);
        if (abs((r+g+b)/3 -(red(img.pixels[loc+1])+green(img.pixels[loc+1])+blue(img.pixels[loc+1]))/3 )> threshold ||abs((r+g+b)/3 -(red(img.pixels[loc+img.width])+green(img.pixels[loc+img.width])+blue(img.pixels[loc+img.width]))/3 )> threshold) {
        edges.append(loc);
        
        }
        img.pixels[loc] = color(r-0.5*r, g-0.5*g,b-0.5*b);
      }
    }
  for(int pix : edges){
   img.pixels[pix] = color(255); 
  }

  img.updatePixels();
}



void imageSelected(File file) {
  if (file !=null) {
    path = file.getAbsolutePath();
    img = loadImage(path);
    surface.setSize(img.width+80, img.height+60);
    pg = createGraphics(img.width, img.height);

    imageChosen=true;
  }
}