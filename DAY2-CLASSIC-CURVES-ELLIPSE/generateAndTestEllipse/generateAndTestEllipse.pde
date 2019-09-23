//(c) 2015-2019 Loe Feijs and TU/e
//for Digital Craftmanship and Golden Ratio
//The ellipse is gradually filled by little squares inside.
//See mathworld.wolfram.com/Ellipse.html
import processing.pdf.*;

void setup() {
  beginRecord(PDF, "ELLIPSE_" + str(int(random(100,999))) + ".pdf");
  stroke(0);
  fill(255,200,200);
  background(255);
  size(500,400);

}

float sqr(float x){
      return x*x;
}

boolean inEllipse(float x, float y){
        //test whether (x,y) in the ellipse, 
        //mathworld says b^2 = a^2 - c^2, let a>b
        float a = 200; //half-diameter horizontally
        float b = 100; //half-diameter vertically
        float c = sqrt(sqr(a)-sqr(b));//focus points (-x,0) and (c,0)
        float r1 = dist(x,y,-c,0);
        float r2 = dist(x,y, c,0);
        return r1 + r2 < 2 * a;
}


void draw() {
   float x = random(0,width);
   float y = random(0,height);
     if (inEllipse(x - width/2,y - height/2))
         rect(x, y,5,5); 
}

void mousePressed() {
     //Lacanian end of session
     endRecord();
     exit();
}
