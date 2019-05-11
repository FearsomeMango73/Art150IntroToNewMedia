/* FSR testing sketch. 
 
Connect one end of FSR to 5V, the other end to Analog 0.
Then connect one end of a 10K resistor from Analog 0 to ground
Connect LED from pin 11 through a resistor to ground 
 
For more information see www.ladyada.net/learn/sensors/fsr.html */
 
int fsrAnalogPin1 = A1; // FSR is connected to analog 0
int fsrAnalogPin2 = A5; // FSR is connected to analog 3
int LEDpin = 9;      // connect the LEDs to pin 9
int fsrReading1;      // the analog reading from the FSR resistor divider
int fsrReading2;      // the analog reading from the FSR resistor divider
int LEDbrightness1;
int LEDbrightness2;
 
void setup(void) {
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin, OUTPUT);
  pinMode(fsrAnalogPin1, INPUT);
  pinMode(fsrAnalogPin2, INPUT);
}
 
void loop(void) {
  fsrReading1 = analogRead(fsrAnalogPin1);
  fsrReading2 = analogRead(fsrAnalogPin2);
  Serial.print("Analog reading1 = ");
  Serial.println(fsrReading1);
 Serial.print("Analog reading2 = ");
  Serial.println(fsrReading2);
  // we'll need to change the range from the analog reading (0-1023) down to the range
  // used by analogWrite (0-255) with map!
  //LEDbrightness1 = map(fsrReading1, 0, 1023, 0, 255);
  //LEDbrightness2 = map(fsrReading2, 0, 1023, 0, 255);
  if(fsrReading1 > 800 && fsrReading2 > 800){
      digitalWrite(LEDpin, HIGH);
  }
  else{
      digitalWrite(LEDpin, LOW);
  }
}
