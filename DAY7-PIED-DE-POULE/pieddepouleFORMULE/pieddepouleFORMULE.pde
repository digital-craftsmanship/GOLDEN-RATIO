//pied-de-poule (houndstooth) generator (c) Loe Feijs and TU/e 2012-2020
//reference: Loe Feijs, Geometry and Computation of Houndstooth (Pied-de-poule)
//Proceedings of Bridges 2012, Pages 299–306, 
//https://archive.bridgesmathart.org/2012/bridges2012-299.html

int i=1000;//column number in grid, offset 1000
stroke(128);//contours of grid cells grey
boolean aij;//value of matrix indexed i,j
size(350,350);//adjust if desired

for (int x=0;x<100;x++){
    int j=0;//row number
    for (int y=0;y<100;y++){  
        //aij = (i-j)%2<1? true  : false;
        //aij = (i/2-j/2)%2<1? true  : false;
        //aij = (i/3-j/3)%2<1? true  : false;
        //aij = (i/4-j/4)%2<1? true  : false;
        //checkers (Dutch: ruitjes, damborden)
        
        //aij = (i-j)%2<1? i%4<2  : j%4<2;
        //aij = (i-j)%2<1? i%6<3  : j%6<3;
        //aij = (i-j)%2<1? i%8<4  : j%8<4;
       // aij = (i-j)%2<1? i%12<6  : j%12<6;
        //pepita grids (Dutch: koksruiten)
        
        //aij = (i-j)%2<1? i%4<2  : j%4<2;
        //puppy thooth (Dutch: molenwiek)
        
        aij = (i-j)%4<2? i%8<4  : j%8<4;
        //aij = (i-j)%6<3? i%12<6 : j%12<6;
        //aij = (i-j)%8<4? i%16<8 : j%16<8;
        //aij = (i-j)%12<6? i%24<12 : j%24<12;
        //pied de poules (Dutch: hanevoet)
     
        //aij = i%4<2?  (i+j)%4 < 2 : (10000+j-i)%4 < 2;
        //aij = i%8<4?  (i+j)%4 < 2 : (10000+j-i)%4 < 2;
        //aij = i%16<8? (i+j)%4 < 2 : (10000+j-i)%4 < 2;
        //aij = i%32<16?(i+j)%4 < 2 : (10000+j-i)%4 < 2;
        //herring bone (Dutch: visgraat)
        
        //aij = i%4<2?  (i+j)%4 < 2 : (i-j)%4 < 2; 
        //aij = i%8<4?  (i+j)%4 < 2 : (i-j)%4 < 2; 
        //aij = i%16<8?  (i+j)%4 < 2 : (i-j)%4 < 2; 
        //aij = i%32<16?  (i+j)%4 < 2 : (i-j)%4 < 2; 
        //broken twill (Dutch: spitskeper)
        
        //aij = (  (i%6<3? i%6 : 6 - (i%6)) + 1001 
        //      -  ((j-1)%8<4? (j-1)%8 : 8 - ((j-1)%8))
        //      )  %4 < 2? true : false;
        //gooze-eye (Dutch: kraanoog)
        
        fill(255*int(aij));
        rect(10*x,10*y,10,10);
        j++;
    }
    i++;
}
