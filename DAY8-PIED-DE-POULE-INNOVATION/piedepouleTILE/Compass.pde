//special turtle graphics: compass logo
//positions are relative, directions are abolute
//see Feijs, Proceedings of Bridges 2012
class Compass {
      int x, y;
      Compass (int x, int y){
               this.x = x;
               this.y = y;
               stroke(0);
               strokeWeight(2);
      }
      void N(int n){//North
           for (int i = 0; i < n; i++){
                int prevy = y;
                y = y - STEP;
                line(x,prevy,x,y);
           }
      }
      void E(int n){//East
           for (int i = 0; i < n; i++){
                int prevx = x;
                x = x + STEP;
                line(prevx,y,x,y);
           }
      }
      void S(int n){//South
           for (int i = 0; i < n; i++){
                int prevy = y;
                y = y + STEP;
                line(x,prevy,x,y);
           }
      }
      void W(int n){//West
           for (int i = 0; i < n; i++){
                int prevx = x;
                x = x - STEP;
                line(prevx,y,x,y);
           }
      }
      void ES(int n){
           for (int i = 0; i < n; i++){
                E(1);
                S(1);
           }
      }
      void SE(int n){
           for (int i = 0; i < n; i++){
                S(1);
                E(1);
           }
      }
      void NW(int n){
           for (int i = 0; i < n; i++){
                N(1);
                W(1);
           }
      }
      void WN(int n){
           for (int i = 0; i < n; i++){
                W(1);
                N(1);
           }
      }
} //end class compass
