boolean WaterColor = false;
boolean PixelatedNoise = false;
boolean Edges = false;
boolean Draw = false;
boolean Snip = false;
boolean Fill = false;
boolean Brush = false;
boolean Crop = false;
boolean DropDown = false;

// For the booleans jonah, if you need to aadd gui width/height or img width/height thats up to you

void setup() 
{
  size(1000, 600);
  surface.setResizable(true);
  background(185);
  textAlign(LEFT);
  textSize(16);
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
    fill(0);
  else
    fill(255);
  rect(660, 200, 130, 40, 10);
  fill(55);
  text("Water Color", 680, 225);

  if (WaterColor)
    fill(#FFFF7D);
  else
    fill(255);
  rect(660, 250, 130, 40, 10);
  fill(55);
  text("Filter 1", 680, 275);

  if (PixelatedNoise)
    fill (#FFFF7D);
  else
    fill(255); 
  rect(660, 300, 130, 40, 10);
  fill(55);
  text("Filter 2", 680, 325);

  noStroke();
  textSize(16);

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
  if (!DropDown){
    
    fill(255);
  rect(5, 17, 95, 17);
  fill(55);
  text("Load Picture", 10, 30);
   
  fill(255);
  rect(5, 34, 95, 17);
  fill(55);
  text("Save Picture", 10, 50);
  stroke(0);
    line(95, 34, 8,34);
  } else{
      
  }
  
}
void mouseClicked(){
 if((abs(10-mouseX )<=95)&&(abs((10)-mouseY)<=15)){ //Load Image
   selectInput("Choose an image for editing", "imageSelected");
   
 }
 
  
}
