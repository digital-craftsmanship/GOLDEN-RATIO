//(c) Loe Feijs and TU/e 2016-2019
//for Golden Ratio and Digital Craftmanship 
//The Archimedean spiral is approximated by red dots
//Using the function, we can make four spiral-arms

import processing.pdf.*;

void setup() {
  noLoop();
  beginRecord(PDF, "SPIRAL" + ".pdf");
  size(400,400);
  stroke(255,0,0);
  strokeWeight(5);
  background(255);
}

void spiral(float xc, float yc, float rot){
     //xc,yc are the coordinates of centre
     //rot is the initial orientation
     //a defines radius growth
     int steps = 100;
     int windings = 2;
     float a = 10;
     float dt = windings * TWO_PI / steps; 
     for (int i=0; i < steps; i++){
          float t = i * dt;           
          float x = a * t * cos(t + rot); 
          float y = a * t * sin(t + rot); 
          point(xc + x,yc + y);  
     }
}

void draw() {
  float x = width/2;
  float y = height/2;
  spiral(x,y,0); 
  spiral(x,y,PI/2); 
  spiral(x,y,PI); 
  spiral(x,y,3*PI/2); 
  endRecord();
}