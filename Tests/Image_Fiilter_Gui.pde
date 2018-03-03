PImage img;
PGraphics pg;
String path;
boolean imageChosen, clicked = false, init, shape, cornerEstablished = false;
int GUIWidth = 40;
int imgX, imgY= 320;
int prevmouseX, prevmouseY =0 ; 
int shapeX, shapeY = 0;
boolean WaterColor = false;
boolean PixelatedNoise = false;
boolean Edges = false;
boolean Draw = false;
boolean Snip = false;
boolean Fill = false;
boolean Brush = false;
boolean Crop = false;
boolean Ellipse = false;
boolean Rect = false;
boolean DropDown = false;
color loadC, saveC = color(0);
// For the booleans jonah, if you need to aadd gui width/height or img width/height thats up to you

void setup() 
{
  size(1000, 600);
  surface.setResizable(true);
  background(185);
  textAlign(CENTER);
  textSize(16);
  ellipseMode(CORNERS);
}

void draw()
{

  background(100, 100, 100);
  fill(100, 100, 100);
  noStroke();

  stroke(0);
  fill(255);
  textSize(14);
  text("File Functions", 60, 15);


  stroke(0);
  line(0, 40, 9999, 40);
  noStroke();

  stroke(0);
  fill(255);
  textSize(14);
  text("Filter Effects", 300, 15);
  line(205, 0, 205, 40);
  noStroke();

  imageMode(CENTER);
  if (imageChosen==true) {

    image(img, imgX, imgY);
  }
  if (!(WaterColor&&PixelatedNoise&&Edges&&Draw&&Snip&&Fill&&Brush&&Crop&&Ellipse&&Rect) {
    if (mousePressed) {
      if (shape == false) {
        if (clicked == false) {
          if ((abs(imgX-mouseX )<=img.width/2)&&(abs((imgY)-mouseY)<=img.height/2)) {
            clicked = true;
            prevmouseX = mouseX;
            prevmouseY = mouseY;
          }
        } else {
          if ((abs(imgX-mouseX )<=img.width/2)&&(abs((imgY)-mouseY)<=img.height/2)) {
            if ((abs(pmouseX-mouseX)>1)) {
              move(1, 0);
              if (abs(pmouseY-mouseY)>1) {
                move(0, 1);
              }
            }
          }
        }
      } else {
        if (clicked == true) {

          clicked = false;
        }
      }
    }
  }

  if (WaterColor)
  {
    int radius = 12;

    pg.beginDraw();
    pg.background(img);
    pg.noStroke();
    for (int rep = 0; rep<5; rep++) {
      for (int y = 0; y< img.height; y+=radius-2) {
        for (int x = 0; x< img.width; x+=radius-2) {
          int randX = floor(random(img.width));
          int randY = floor(random(img.height));
          int loc = randX+randY*img.width;
          float r = red(img.pixels[loc]);
          float g = green(img.pixels[loc]);
          float b = blue(img.pixels[loc]);
          pg.fill(r, g, b, 100);
          pg.ellipse(randX, randY, radius, radius);

          //img.pixels[loc] = color(r+map(noise(x,y,r), 0, 1, -r, 255-r), g+map(noise(x,y,g), 0, 1, -g, 255-g), b+map(noise(x,y,b), 0, 1, -b, 255-b));
          //img.pixels[loc] = color(r+random(-r, 255-r),g+random(-g, 255-g),b+random(-b, 255-b),255);
        }
      }

      img = pg.get();
    }

    img.updatePixels();
  }
  if (PixelatedNoise)
  {



    for (int rep = 0; rep<5; rep++) {
      for (int y = 0; y< img.height; y+=random(1, 5)) {
        for (int x = 0; x< img.width; x+=random(1, 5)) {
          int randX = floor(random(img.width));
          int randY = floor(random(img.height));
          int loc = randX+randY*img.width;
          float r = red(img.pixels[loc]);
          float g = green(img.pixels[loc]);
          float b = blue(img.pixels[loc]);
          img.pixels[x+y*img.width] = color(r+(0.2*r), g+0.2*g, b+0.2*b);
        }
      }
    }

    img.updatePixels();
  }
  if (Edges)
  {
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
        img.pixels[loc] = color(r-0.5*r, g-0.5*g, b-0.5*b);
      }
    }
    for (int pix : edges) {
      img.pixels[pix] = color(255);
    }

    img.updatePixels();
  }
  if (Crop)
  {
    //do stuff
  }
  if (Snip)
  {
    //do stuff
  }
  if (Brush)
  {


    pg.beginDraw();
    pg.strokeWeight(5);
    pg.background(img);
    if (mousePressed) {
      pg.point(mouseX-30, mouseY-GUIWidth-15);
    }
    pg.endDraw();
    img = pg.get();
  }
  if (Ellipse)
  {
    drawShape("ellipse");
  }
  if (Rect)
  {
    drawShape("rect");
  }
  if (DropDown) {

    fill(loadC);
    rect(0, 40, 205, 25);
    fill(55);
    text("Load Picture", 102, 58);

    fill(saveC);
    rect(0, 65, 205, 25);
    fill(55);
    text("Save Picture", 102, 85);
    stroke(0);
    line(0, 65, 205, 65);
    loadC = 255;
    saveC = 255;
  }
}
void mouseClicked() {
  if ((abs(102-mouseX )<=100)&&(abs((58)-mouseY)<=15)) { //Load Image
    loadC= color(88, 88, 255);
    selectInput("Choose an image for editing", "imageSelected");
  }
  if ((abs(102-mouseX )<=100)&&(abs((85)-mouseY)<=15)) { //Load Image
    saveC= color(88, 88, 255);
    selectOutput("Choose a place to outsource:", "imageExport");
  } 
  if ((abs(102-mouseX )<=100)&&(abs((20)-mouseY)<=20)) { //Load Image
    DropDown = !DropDown;
  }
}
void imageSelected(File file) {
  if (file !=null) {
    path = file.getAbsolutePath();
    img = loadImage(path);
    img.loadPixels();
    pg = createGraphics(img.width, img.height);
    surface.setSize(img.width+80, img.height+2*GUIWidth + 40);
    imgX = width/2;
    imgY = height/2;
    imageChosen=true;
  }
}
void imageExport(File selection) 
{
  if (selection != null) {
    img.save(selection.getAbsolutePath());
    redraw();
  }
}
void drawShape(String Shape) {
  if (shape) {
    if (cornerEstablished== false) {
      if (mousePressed && mouseY>15) {
        shapeX= mouseX;
        shapeY=mouseY;
        cornerEstablished = true;
      }
    }
    if (mousePressed) {
      init = true;
    }
    if (init) {
      pg.beginDraw();
      pg.strokeWeight(3);
      pg.ellipseMode(CORNERS);
      pg.rectMode(CORNERS);
      pg.background(img);
      pg.noFill();
      noFill();
      if (Shape == "ellipse") {

        ellipse(shapeX+30, shapeY+30, mouseX+30, mouseY+30);
      } else {
        rect(shapeX+30, shapeY+30, mouseX+30, mouseY+30);
      }
      if (mousePressed == false) { //if mousePressed is false
        if (Shape == "ellipse") {
          pg.ellipse(shapeX, shapeY, mouseX, mouseY);
        } else {
          pg.rect(shapeX, shapeY, mouseX, mouseY);
        }

        pg.endDraw();
        img = pg.get();
        cornerEstablished = false;
        init = false;
      }
    }
  }
}
void move(int x, int y) {
  if (x==1) {
    imgX+=mouseX-pmouseX;
  }
  if (y==1) {
    imgY+=mouseY-pmouseY;
  }
}
