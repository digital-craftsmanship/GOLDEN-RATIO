//(c) Loe Feijs for Digital Craftmanship and Goldent Ratio, 2019
//Cardioid from parametric equation. Demonstrate calculus for slopes,
//normals ("ortho") and speed. The cardioid is approximated by a zigzag.
//This version draws the cardioid (in blue), successive points on the curve (also blue), 
//tangents (black), normals (black), and a zigzag (red). The zigzag has been used for embroidery.

import processing.pdf.*;

int XSIZE=int(3.6*297);
int YSIZE=int(3.6*210);

void setup() {
     noLoop(); 
     noFill();
     size(1069,756);
     beginRecord(PDF, "CARDIOID2019.pdf");
     background(255);
}

void cardioid(float xc, float yc, float a){
     //xc,yc coordinates of centre, a radius parameter
     float px = xc;//zigzag end point
     float py = yc;
     float prevpx = px;//previous zigzag end point
     float prevpy = py;
     int steps = 200;
     int i = 0;
     beginShape();
     float speed = 1;
     float dt = 2*PI/steps;
     curveVertex(xc, yc);
     for (float t = 0; t <= TWO_PI ; t += dt / speed){
          float x = xc + a * cos(t) * (1-cos(t));//parameteric cardioid equation
          float y = yc + a * sin(t) * (1-cos(t));//mathworld.wolfram.com/Cardioid.html
          stroke(0);
          curveVertex(x,y);
          ellipse(x,y,5,5);
          float dxdt = -sin(t) + 2*cos(t)*sin(t);//manual derivation
          float dydt =  cos(t) - cos(t)*cos(t) + sin(t)*sin(t);//idem
 
          float slope =  dydt/dxdt;//slope of tangent
          float ortho = -dxdt/dydt;//orthogonal to tangent
          if (ortho != ortho)
              ortho = 100;//avoid NaN
          speed = sqrt(dxdt*dxdt + dydt*dydt);//rate of change along curve
          if (speed < .2) 
              speed = .2;
          float dx = 30 * cos(atan(ortho));//zigzag size, normalize length 
          if (i++%2 == 1) 
              dx = -dx;//alternate left or right
          prevpx = px;
          prevpy = py;
          px = x + dx;//move away from main curve
          py = y + dx * ortho;//in orthogonal direction
          stroke(0);
          line(x, y, x + 100, y + 100*slope);//tangents
          line(x - dx, y - dx*ortho, x + dx, y + dx*ortho);//normals
          stroke(255,0,0); 
          line(prevpx,prevpy,px,py); 
     }
     stroke(0,0,255);
     endShape();
}

void draw() {
  float x = 2 * width/3;
  float y = height/2;
  cardioid(x, y, 250); 
  endRecord();
}