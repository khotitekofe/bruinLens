import processing.video.*;

int circlesize = 10;
int cols, rows;

Capture webcam;


void setup() {
  size(640, 480, P3D);
  cols = width / circlesize;
  rows = height / circlesize;

  webcam = new Capture(this, width, height);
  webcam.start();

  background(0);
}


void draw() { 
  if (webcam.available()) {
    webcam.read();
    webcam.loadPixels();
    
    background(5, 70, 173);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {

        int x = i * circlesize;
        int y = j * circlesize;
        int loc = (webcam.width - x - 1) + y * webcam.width;

        color c = webcam.pixels[loc];
        float sz = (brightness(c) / 255.0) * circlesize;
        fill(255, 255, 0);
        noStroke();
        ellipse(x + circlesize/2, y + circlesize/2, sz, sz);
      }
    }
  }else{
    System.out.println("Could not access webcam.");
  }
}

void keyPressed(){
    saveFrame("camera.jpg");
}
