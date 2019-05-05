int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y, w, h;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    w = 400;
    h = 200;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  Visualizer(float x, float y, float w, float h, int n) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    values = new float[n];
    speeds = new float[n];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-h/2-1, h/2-1);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, w, h);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+h/2, x+w, y+h/2);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    //fill(255, 0, 0);
    //rect(x+40, y+100, 60, 50);
    //fill(0, 255, 0);
    //rect(x+120, y+50, 60, 50);
    float wb = w/values.length; //the width of the bars
    for(int i = 0; i < values.length; i++) {
      if(values[i] < 0){
        if(y+h/2-values[i] >= y+3*h/4){
          fill(255, 0, 0);
        } else {
          fill(255, 125, 0);
        }
      } else {
        if(y+h/2-values[i] <= y+h/4){
          fill(0, 255, 0);
        } else {
          fill(255, 255, 0);
        }
      }
      rect(x+(i*wb), y+h/2, wb, -values[i]);
    }

    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      if(y+h/2-values[i] <= y || y+h/2-values[i] >= y+h){
        speeds[i] = -(speeds[i]);
      }
    }
  }
}

void setup() {
  size(600, 500);
  //v = new Visualizer(20, 20);
  v = new Visualizer(20, 20, 200, 300, 30);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
