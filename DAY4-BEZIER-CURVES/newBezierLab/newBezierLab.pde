// Loe Feijs 2016-2019 for TU/e, course Golden Ratio.
// Demonstration of Bézier curves using two anchor points and two control points.
// Six points can be dragged and then the Bézier curve is shown.
// The letter "a" is on a background image of "Lab",
// but the belly of the "a" is augmented by a shape whose control points come from 
// the polynomial for a Bézier segment (6th order, en.wikipedia.org/wiki/Bézier_curve).
// Next, the letter "a" then breathes in a two-phase sine wave.

float[][] myPoints = new float[6][2]; //six points 
PImage Lab;
void setup(){
     size(1300,725);
     background(255);
     smooth();
     Lab = loadImage("Lab.jpg");
  
     stroke(0);
     fill(0);
     //six points: (lowest) anchor, (lower)control, control, control, (upper) control, anchor
     myPoints[0][0] = 440; 
     myPoints[0][1] = 563;
     
     myPoints[1][0] = 438;
     myPoints[1][1] = 542;
     
     
     myPoints[2][0] = 411; 
     myPoints[2][1] = 506;
     myPoints[3][0] = 426;
     myPoints[3][1] = 433;
     
     myPoints[4][0] = 537; 
     myPoints[4][1] = 411;
     
     myPoints[5][0] = 558;
     myPoints[5][1] = 405; 
} 

float polynomial(float x0, float x1, float x2, float x3, float t){
      //sum of binomials (4 over 0,1,2,3, respectively) times polynomial in t 
      return x0     * (1-t) * (1-t) * (1-t)
           + x1 * 3 * (1-t) * (1-t) * t
           + x2 * 3 * (1-t) * t * t
           + x3     * t * t * t; 
}

float polynomial(float x0, float x1, float x2, float x3, float x4, float x5, float t){
      //sum of binomials (6 over 0,1,2,3, etc respectively) times polynomial in t 
      return x0 * 1 * (1-t) * (1-t) * (1-t) * (1-t) * (1-t)
           + x1 * 5 * (1-t) * (1-t) * (1-t) * (1-t)  * t
           + x2 * 10* (1-t) * (1-t) * (1-t) * t     * t
           + x3 * 10* (1-t) * (1-t) * t     * t     * t
           + x4 * 5 * (1-t) * t     * t     * t     * t
           + x5 * 1 * t     * t     * t     * t     * t;
}

void a(){
     //make bump at letter "a" by vertexes
     beginShape();
     vertex(558,563);
     //put 50 points under Bézier control:
     float[][] p = myPoints;
     for (int i=0; i < 51; i++){
          float t = i * 0.02;
          float x = polynomial(p[0][0],p[1][0],p[2][0] + belly,p[3][0] + lungs,p[4][0],p[5][0],t);
          float y = polynomial(p[0][1],p[1][1],p[2][1] + belly,p[3][1] + lungs,p[4][1],p[5][1],t);
          vertex(x,y);
     }
     vertex(558,563);
     endShape();
}

float belly, lungs;

void draw(){
     image(Lab,0,0);

     belly = 10*sin(frameCount/50.0);
     lungs = 10*sin(PI/3 + frameCount/50.0);

     a();
     //show the special points controlling the Bézier
     if (frameCount > 1200){
          strokeWeight(3);
          stroke(255,0,0);
          ellipse(myPoints[0][0],myPoints[0][1],8,8);
          ellipse(myPoints[1][0],myPoints[1][1],6,6);
          ellipse(myPoints[2][0] + belly,myPoints[2][1],6,6);
          ellipse(myPoints[3][0] + lungs,myPoints[3][1],6,6);
          ellipse(myPoints[4][0],        myPoints[4][1],6,6);
          ellipse(myPoints[5][0],        myPoints[5][1],8,8);
     }    else stroke(0);
     if (mousePressed){  
         for (int i=0; i<6; i++){
              //drag the point being near the mouse
              //oops: keep them at least 10 pixels apart
              if (dist(myPoints[i][0],myPoints[i][1],mouseX,mouseY) < 10){
                       myPoints[i][0] = mouseX;
                       myPoints[i][1] = mouseY;
              }
              print(mouseX);print(" ");println(mouseY);
         }
     }
     //if (frameCount%10==0) saveFrame("newBezierLab-####.png");
}