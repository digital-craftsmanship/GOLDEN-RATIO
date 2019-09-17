//(c) Loe Feijs and TU/e 2016-2019
//for Golden Ratio and Digital Craftmanship 
//The Circle is approximated by red dots
import processing.pdf.*;

void setup() {
  noLoop();
  beginRecord(PDF, "CIRCLE" + ".pdf");
  size(400,400);
  stroke(255,0,0);
  strokeWeight(4);
  background(255);
}
void circle(float xc, float yc){
     //xc,yc are the coordinates of centre
     //a is the radius
     float a = 100;
     int steps = 50;
     float dt = TWO_PI / steps; 
     
     for (int i=0; i < steps; i++){
          float t = i * dt;           
          float x = a * cos(t); 
          float y = a * sin(t); 
          point(xc + x,yc + y);  
     }
}

void draw() {
  float x = width/2;
  float y = height/2;
  circle(x,y); 
  endRecord();
}