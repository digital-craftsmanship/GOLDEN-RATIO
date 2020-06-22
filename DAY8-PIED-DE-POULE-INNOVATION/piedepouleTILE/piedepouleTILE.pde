//Generating a pied-de-poule basic tile.
//See Feijs, L. Geometry and Computation of Houndstooth (Pied-de-poule)
//Proceedings or Bridges 2012, pp. 299-306.
//usage: run and use UP and DOWN keys to adjust N.

Compass t;//special turtle;
int STEP = 10;//turtle's step size
int N=1;//which member of the pied-de-poule family

void setup(){
     size(1200,1200);
}

void draw(){
     t = new Compass(width/2 - 3*N*STEP/2, height/2-3*N*STEP/2);
     background(255);
     t.N(N-1);
     t.ES(N-1);
     t.E(N); 
     t.ES(2*N);
     t.W(N);
     t.NW(N-1);
     t.S(N-1);
     t.W(N);
     t.SE(N);
     t.S(N);
     t.WN(2*N);
     t.N(N);
     t.WN(N);
     t.E(N);
}

void keyPressed(){
     if (key == CODED && keyCode == UP)
          N++;
     if (key == CODED && keyCode == DOWN)
          if (N>1) N--;
}       
