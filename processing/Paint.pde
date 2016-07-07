void setup()
{
  background(#FAEDD4);
  size(600,600);
  
  stroke(0,0,0);
  strokeWeight(3);
  
  fill(255,255,255);
  rect(0,0,599,125); 
  
}

color c = #FAEDD4;
int strokeRadius = 25;

void keyReleased() {
  if(int(keyCode) == 38) //up
  {
    if (strokeRadius < 200)
    {
      strokeRadius = strokeRadius + 25;
    }
    
    else
    {
      strokeRadius = 200;
    }
    
  }
  
  if(int(keyCode) == 40) //down
  {
    if (strokeRadius >= 50)
    {
      strokeRadius = strokeRadius - 25;
    }
    
    else
    {
      strokeRadius = 25;
    }
  }
}

void draw()
{
  
  stroke(0,0,0);
  strokeWeight(3);
  
  fill(255,255,255);
  rect(0,0,599,125);
  
  int xCoordinate;
  int baseXCoordinate = 75;
  int swatchInterval = 75;
  boolean shifted = false;
  int yCoordinate;
  int baseYCoordinate = 50;
  int yShift = 25;
  
  int swatches = 0;
  int totalSwatches = 7;
  int[] colors = new int[totalSwatches];
  colors[0] = #E80918;
  colors[1] = #F5810C;
  colors[2] = #F5DE0C;
  colors[3] = #0D8B1A;
  colors[4] = #0F34BF;
  colors[5] = #701B93;
  colors[6] = #FAEDD4;
  
  int circleRadius = 50;
  
  stroke(0,0,0);
  strokeWeight(3);
  
  for(swatches = 0; swatches < totalSwatches; swatches++)
  {
    xCoordinate = baseXCoordinate + (swatches)*swatchInterval;
    if (shifted == false)
    {
      yCoordinate = baseYCoordinate + yShift;
      shifted = true; 
    }
    
    else
    {
      yCoordinate = baseYCoordinate;
      shifted = false;
    }
    
    fill(colors[swatches]);
    ellipse(xCoordinate, yCoordinate, circleRadius, circleRadius);
    
  }
  
  noStroke();
  
  if (mousePressed)
  {
     if (mouseY<125)
     {    
       c = get(mouseX,mouseY);
       println(c);
       
     }
  
      if (mouseY>125)
      {
        fill(c);
        ellipse(mouseX,mouseY,strokeRadius,strokeRadius);
        
      }
  
  }
  
}
