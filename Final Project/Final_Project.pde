/*
Final Project - Hayley Christianson

*/
import processing.serial.*;

float steps = 10000 + 1;
float circleLoc = random(-100,200);
float rand = 0;
Serial myPort;
int colorTrue;
// setup function

void setup() {
  size(displayWidth, displayHeight);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
  stroke(255);
  frameRate(12);
  background(55);
  colorTrue = 0;
} 

void circleCreation(){
    stroke(random(0, 255),random(0, 255),random(0, 255)); //red
  for(int i = 1; i < steps; ++i) {
    if( i % 9 == 0){
          //stroke(255,0,0); //red
          strokeWeight(random(25,75)); //thickness of points
          point( random(-rand, rand) * ((i+1)/2), (height/3) * random(-rand, rand) );
          rand += random(-9, 9);   
      }
    else if( i % 6 == 0){
         // stroke(0,255,0); //grean
          strokeWeight(random(1,50)); //thickness of points
          point( random(-rand, rand) * ((i+1)/2), (height/2) * random(-rand, rand) );
          rand += random(-6, 6);
      }
    else{
         // stroke(0,0,255); // blue
          strokeWeight(random(1,25)); //thickness of points
          point( random(-rand, rand) * ((i+1)/2), (height/3 + height/3) * random(-rand, rand) );
          rand += random(-3, 3);
      }
    } 
}
// draw function
void draw() {
 // background(55);
  //String inString = myPort.readStringUntil('\n');
  //inString = trim(inString);

  rand = 0;
 
  //print("colorTrue is: ");
  print(colorTrue);
  if(colorTrue == 0){
    filter(GRAY);  
  }
  else if(colorTrue == 1){
    circleCreation();
  }
 
}

  void serialEvent (Serial myPort) {

    // get the ASCII string:

    String inString = myPort.readStringUntil('\n');

    if (inString != null) {

      // trim off any whitespace:

      inString = trim(inString);

      // convert to an int and map to the screen height:

      colorTrue = int(inString);

      println(colorTrue);
  }

}
