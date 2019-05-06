int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
  bg = color(50);
  fg = color(255, 0, 0);
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    fill(fg);
    triangle(v1x, v1y, v2x, v2y, v3x, v3y);
    fill(bg);
    if(levels>0){
      float m1x = (v1x+v2x)/2;
      float m1y = (v1y+v2y)/2;
      float m2x = (v2x+v3x)/2;
      float m2y = (v2y+v3y)/2;
      float m3x = (v1x+v3x)/2;
      float m3y = (v1y+v3y)/2;
      triangle(m1x, m1y, m2x, m2y, m3x, m3y);
      gasket(levels-1, v1x, v1y, m1x, m1y, m3x, m3y);
      gasket(levels-1, v2x, v2y, m2x, m2y, m1x, m1y);
      gasket(levels-1, v3x, v3y, m3x, m3y, m2x, m2y);
    }
}
void koch(int levels, float x1, float y1, float x2, float y2){
  stroke(fg);
  line(x1, y1, x2, y2);
  if(levels>0){
    float middleX = abs(x1-x2)/3;//these are the xval and yval of the middle segement
    float middleY = abs(y1-y2)/3;
    float dist = sqrt(sq(middleX) + sq(middleY));
    float m1x = (x1+middleX);//the left point of the 3 line segment 
    float m1y = (y1+middleY);
    float m2x = (x2-middleX);//the right point of the 3 line segment
    float m2y = (y2-middleY);
    float tx = (x1+x2)/2;
    float ty = middleX;
    stroke(bg);
    line(m1x, m1y, m2x, m2y);
    stroke(fg);
    line(m1x, m1y, );
}

void draw() { 
  background(bg);  
  
  fill(fg);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);
  //gasket(levels,0, height-10, width, height-10, width/2, 10);

  koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
  if(levels>0)
 levels --; 
}