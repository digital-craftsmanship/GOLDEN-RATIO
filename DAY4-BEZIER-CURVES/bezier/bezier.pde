// bezier, demonstration of Bézier curves using two anchor points and two control points.
// Four points can be dragged and then the Bézier curve is shown.
// The polynomial is taken from http://pomax.github.io/bezierinfo/
// PS normally use beginShape(); bezierVertex(x,y); etc. endShape(); (this is for learning only)

float[][] myPoints = new float[4][2]; //four points 

void setup(){
     size(500,500);
     background(255);
     stroke(0);
     //four points: anchor, control, control, anchor
     myPoints[0][0] = 100;
     myPoints[0][1] = height/2;
     myPoints[1][0] = 200;
     myPoints[1][1] = height/2;
     myPoints[2][0] = 300;
     myPoints[2][1] = height/2;
     myPoints[3][0] = 400;
     myPoints[3][1] = height/2;
}

float polynomial(float x0, float x1, float x2, float x3, float t){
      //sum of binomials (4 over 0,1,2,3, respectively) times polynomial in t 
      return x0     * (1-t) * (1-t) * (1-t)
           + x1 * 3 * (1-t) * (1-t) * t
           + x2 * 3 * (1-t) * t * t
           + x3     * t * t * t; 
}

void myCurve(float[][] p){
     //draw the curve as connected line segments
     //p must contains four points as x and y
     float prev_x = p[0][0];
     float prev_y = p[0][1];
     
     for (int i=0; i < 100; i++){
          float t = i * 0.01;
          float x = polynomial(p[0][0],p[1][0],p[2][0],p[3][0],t);
          float y = polynomial(p[0][1],p[1][1],p[2][1],p[3][1],t);
          stroke(255,0,0); line(prev_x,prev_y,x,y); stroke(0);

          prev_x = x;
          prev_y = y;
     }
}

void draw(){
     fill(100);
     frameRate(200);
     background(255);
     //draw the four points of myPoints 
     for (int i=0; i<4; i++)
          ellipse(myPoints[i][0],myPoints[i][1],4,4);

     if (mousePressed){
         for (int i=0; i<4; i++){
              //drag the point being near the mouse
              //oops: keep them at least 40 pixels apart
              if (dist(myPoints[i][0],myPoints[i][1],mouseX,mouseY) < 20){
                       myPoints[i][0] = mouseX;
                       myPoints[i][1] = mouseY;
              }
         }
     }
     myCurve(myPoints);
}
