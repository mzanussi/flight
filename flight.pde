import processing.svg.*;

int num = 50;
int range = 25;
int counter = 0;

float[] ax = new float[num];
float[] ay = new float[num]; 
float[] bx = new float[num];
float[] by = new float[num]; 


void setup() 
{
  size(800, 600);
  //fullScreen();
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
    bx[i] = width/2;
    by[i] = height/2;
  }
  frameRate(30);
}

void draw() 
{
  background(0);
  
  counter++;
  flighta();
  flightb();
  
  saveFrame("xr-######.png");
}

void flighta() {
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    if (i>=num-4) {
      stroke(255,255,0);
    } else {
      stroke(val);
    }
    //line(ax[i-1], ay[i-1], ax[i], ay[i]);
    noFill();
    arc(ax[i], ay[i], range, range, HALF_PI, PI);
  }
}

void flightb() {
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    bx[i-1] = bx[i];
    by[i-1] = by[i];
  }

  // Put a new value at the end of the array
  bx[num-1] += random(-range*1.3, range*1.3);
  by[num-1] += random(-range*1.3, range*1.3);

  // Constrain all points to the screen
  bx[num-1] = constrain(bx[num-1], 0, width);
  by[num-1] = constrain(by[num-1], 0, height);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    if (i>=num-4) {
      stroke(255,255,0);
    } else {
      stroke(val);
    }
    noFill();
    arc(bx[i], by[i], range, range, HALF_PI, PI);
  }
}