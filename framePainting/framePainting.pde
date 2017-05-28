import processing.video.*;
Movie myMovie;

int numPixels;
static final int x = 640;
static final int y = 480;
float currentX = 0;
float lineWidth = 0;

void setup() {
  size(640, 480);
  //background(0);
  myMovie = new Movie(this, "free.mp4");
  //myMovie.loop();
  myMovie.play();
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
     print(lineWidth);
   } 
   else {
    //print("nothing"); 
   } 

}