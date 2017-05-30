import processing.video.*;
Movie myMovie;

int numPixels;
int x = 640;
int y = 480;
float currentX = 0;
float lineWidth = 0;
boolean saved = false;

void setup() {
  size(640, 480);

  myMovie = new Movie(this, "free.mp4");
  
  //play more
  //myMovie.loop();
  myMovie.play();
  myMovie.volume(0);
  loadPixels();
  numPixels = x * y;
  lineWidth = x/(myMovie.duration()*30);
}

void draw() {
  //image(myMovie, 0, 0);
   if (myMovie.available()) {
     myMovie.read();
        //myMovie.read(); // Read a new video frame 
      myMovie.loadPixels();
      color col;
      int curRed = 0;
      int curBlue = 0;
      int curGreen = 0;
      //numPixels = myMovie.width * myMovie.height;
      //print(numPixels);
      
      for(int i=0; i<x; i++){
        for(int a=0; a<y; a++){
          //print(myMovie.pixels[i]);
          //print(myMovie.get(i,a));
          col = myMovie.get(i,a);
          
         curRed += red(col);
         curBlue += blue(col);
         curGreen += green(col);
          //col = myMovie.pixels[i]
        }
      }
     curRed /= numPixels;
     curBlue /= numPixels;
     curGreen /= numPixels;
     
     stroke(curRed, curGreen, curBlue);
     strokeWeight(lineWidth);
     line(currentX, 0, currentX, y);
     currentX += lineWidth;
     //print(lineWidth);
     

   } 
   else {
    //print("nothing"); 
   } 
   //print(round(myMovie.time()));
   //print(round(myMovie.duration()));
     if(round(myMovie.time()) == round(myMovie.duration()) && !saved){
       print("END!");
       saveFrame("export.png");
       saved = true;
     }

}