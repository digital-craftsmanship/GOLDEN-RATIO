//(c) Loe Feijs and TU/e 2016-2019
//for Golden Ratio and Digital Craftmanship 
//The Ellipse is approximated by black dots
//Then a thread art pattern is generated.
//Advice: choose N and J to be relative prime.
import processing.pdf.*;

//parameters
int N = 50;//total number of pins
int J = 5;//jump size between pins

//coordinates of pins
float[] x = new float[N];
float[] y = new float[N];

void setup() {
     beginRecord(PDF, "THREAD_ART_" + N + "_" + J + ".pdf");
     size(1181,835);//A3 if 1cm=39.77px
     stroke(255, 0, 0);
     background(255);
     
     //first find the coordinates
     int steps = N;//make the ellipse in steps
     float dt = TWO_PI / steps; //angular step size

     float a = 350;//half width of ellipse
     float b = 200;//half height of ellipse
     for (int i=0; i < steps; i++) {
          float t = i * dt;   

          x[i] = width/2 + a * cos(t);
          y[i] = height/2 + b * sin(t);
          stroke(0);
          strokeWeight(5);
          point(x[i], y[i]);
     }
}

int pin = 0;
int count = 0;

void draw() {
  delay(100);
  //draw thread art lines from pin to pin
  //each time skipping J-1 pins, going round
  if (count < N){  
      stroke(255,0,0); 
      strokeWeight(2);
      line(x[pin], y[pin], x[(pin + J)%N], y[(pin + J)%N]);
      pin = (pin + J) % N;
  }
  if (count == N)
      endRecord();
  count++;
}