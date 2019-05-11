
//variables
float steps = 10000 + 1;
float circleLoc = random(-100,200);
float rand = 0;
// setup function
void setup() {
  size(displayWidth, displayHeight);
  stroke(255);
  frameRate(12);
  background(55);
} 
void circleCreation(){
  
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
  rand = 0;
  if(mousePressed){
    stroke(random(0, 255),random(0, 255),random(0, 255)); //red
    //print("Click");
  }
  else if(keyPressed == true && key == 's' || key == 'S') {
    saveFrame("drawingWithProcessing-#####.png");
  }
  else if(keyPressed == true && key == ' '){
     background(55);
  }
    circleCreation();
  //want to play with frame rates as mouse moves across the screen, the amount of time per new group of circles increases/ decreases
 /*
 if(mouseX != 0){
   frameRate(mouseX);
 } 
 */
 println(frameRate);
}
