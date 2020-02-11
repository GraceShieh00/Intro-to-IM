/*
  DigitalReadSerial

  Reads a digital input on pin 2, prints the result to the Serial Monitor

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/DigitalReadSerial
*/

// int bluebutton = 9;
int greenbutton = 11;
int redbutton = 10;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(bluebutton, INPUT); 
  pinMode(greenbutton, INPUT);
  pinMode(redbutton, INPUT);
  pinMode(13, OUTPUT);  
  pinMode(8, OUTPUT);  
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input pin:
  int buttonState1 = digitalRead(bluebutton);
  int buttonState2 = digitalRead(greenbutton);
  int buttonState3 = digitalRead(redbutton);

  // print out the state of the button:

   if(buttonState3 == 1)
{
  digitalWrite(13, HIGH);
  delay(80);
  digitalWrite(13, LOW);
  delay(80);
  digitalWrite(8, HIGH);
  delay(60);
  digitalWrite(8, LOW);
  delay(60);
}
  if(buttonState1 == 1) 
  
  {

  digitalWrite(13, HIGH);
  delay(240);
  digitalWrite(13, LOW);
  delay(240);

  }

  if(buttonState2 == 1)
  {
   digitalWrite(8, HIGH);
  delay(120);
  digitalWrite(8, LOW);
  delay(120);
  }


   Serial.println(buttonState1);1;
  Serial.println(buttonState2);1;  
  delay(1);        // delay in between reads for stability
}
 
 
