PImage img;
String path;
boolean imageChosen, clicked = false;
int GUIWidth = 15;
int mousePixel;
int iterations=0;
IntList infected;

void setup() {
  size(640, 640);
  surface.setResizable(true);
  textAlign(CENTER);
  imageMode(CENTER);
  frameRate(15)
  infected = new IntList();
}
void draw() {
  background(25);
  stroke(0);
  text("Click here to load image", width/2, GUIWidth+15);
  if (imageChosen==true) {

    image(img, width/2, height/2); 

    img.updatePixels();
  }
}
void imgFill(int x, int y, color c, color fill) {
  int loc = x+y*img.width;
  if (loc<=img.pixels.length) {
    img.pixels[loc]= fill;
    if (loc>0 && loc< img.pixels.length-1) {
      if (img.pixels[loc-1]== c) {
        imgFill(x-1, y, c, fill);
      }
      if (img.pixels[loc+1]== c) {

        imgFill(x+1, y, c, fill);
      }
      if (loc-img.width>0 && loc+img.width< img.pixels.length) {
        if (img.pixels[loc-img.width]== c) {

          imgFill(x, y-1, c, fill);
        }
        if (img.pixels[loc+img.width]== c) {

          imgFill(x, y+1, c, fill);
        }
      }
    }
  }
}

void mouseClicked() {
  if ((abs(width/2-mouseX )<=60)&&(abs((GUIWidth+15)-mouseY)<=12)) {
    selectInput("Choose an image for editing", "imageSelected");
  }
  if ((mouseX>40 && mouseX<width-40)&&(mouseY>30+GUIWidth)&&(mouseY<height-30)) {
    mousePixel=img.pixels[(mouseX-40)+(mouseY-30-GUIWidth)*img.width];
    println("Startup");
    imgFill((mouseX-40), (mouseY-15-GUIWidth), mousePixel, color(0, 255, 0));
    //println(red(img.pixels[(mouseX-40)+(mouseY-30-GUIWidth)*img.width]));
  }
}



void imageSelected(File file) {
  if (file !=null) {
    path = file.getAbsolutePath();
    img = loadImage(path);
    surface.setSize(img.width+80, img.height+60);
    img.loadPixels();

    imageChosen=true;
  }
}
