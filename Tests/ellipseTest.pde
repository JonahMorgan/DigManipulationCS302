PImage img;
PGraphics pg;
String path;
boolean imageChosen, clicked = false, init, shape, cornerEstablished = false;
int GUIWidth = 15;
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

  

  if (WaterColor)
  {
    //do stuff
  }
  if (PixelatedNoise)
  {
    //do stuff
  }
  if (Edges)
  {
    //do stuff
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
    //do stuff
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
    surface.setSize(img.width+80, img.height+60);
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
