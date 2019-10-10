import processing.serial.*;

//mini-heart rate viewer, (c) Loe Feijs TU/e DESIS Taicaing 2015
//use arduino and Geert Langereis' program to get beat-to-beat events
//see wolfram's mathworld for the equation of the cardioid.

Serial myPort; 
void setup() {
     size(600,400);
     //if [0] does't work, try [1] or [2]:
     myPort = new Serial(this, Serial.list()[2], 19200);
}

int heart=0;
void draw(){
     background(0); 
     if (heart > 0) 
         heart--;
     while (myPort.available() > 0) {
            if (myPort.read() == '\n') {
                print("<3 ");
                heart = 50;
            }
     }
     cardioid(width/2,height/2,heart);
}

void cardioid(int x0, int y0, float a){
     smooth();
     beginShape();
     fill(255,0,0);
     for (float theta=0; theta < 2*PI; theta+=.1){
          float r = a * (1 - cos(theta));
          vertex(x0 + r*sin(theta),y0 - r*cos(theta));
     }
     endShape();
}

void keyPressed(){
     //for test and simulate
     print("<3 ");
     heart = 50;
}