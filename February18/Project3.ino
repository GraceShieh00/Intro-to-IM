/*

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Button
*/

// constants won't change. They're used here to set pin numbers:
const int bluebuttonPin = 2;
const int greenbuttonPin = 11;
const int redbuttonPin = 12;
const int ldrPin = A0;
// the number of the pushbutton pin
const int blueledPin =  13;
const int greenledPin =  6;
const int redledPin =  8;
const int yellowledPin = 4;
// the number of the LED pin

// variables will change:
int bluebuttonState = 0;
int greenbuttonState = 0;
int redbuttonState = 0;
int sensorValue = 0;
int mappedValue;

// variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  Serial.begin(9600);
  pinMode(blueledPin, OUTPUT);
  pinMode(greenledPin, OUTPUT);
  pinMode(redledPin, OUTPUT);
  pinMode(ldrPin, INPUT);
  pinMode(yellowledPin, OUTPUT);

  // initialize the pushbutton pin as an input:
  pinMode(bluebuttonPin, INPUT);
  pinMode(greenbuttonPin, INPUT);
  pinMode(redbuttonPin, INPUT);
  pinMode(A5, INPUT);
  pinMode(10, OUTPUT);
  pinMode(3, OUTPUT);
}

void loop() {
  // read the state of the pushbutton value:
  bluebuttonState = digitalRead(bluebuttonPin);
  redbuttonState = digitalRead(redbuttonPin);
  greenbuttonState = digitalRead(greenbuttonPin);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (bluebuttonState == HIGH) {
    // turn LED on:
    digitalWrite(blueledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(blueledPin, LOW);
  }

  if (greenbuttonState == HIGH) {
    // turn LED on:
    digitalWrite(greenledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(greenledPin, LOW);
  }

  if (redbuttonState == HIGH) {
    // turn LED on:
    digitalWrite(redledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(redledPin, LOW);
  }
  {
    int sensorValue = analogRead(A5);
    int mappedValue;
    mappedValue = map(sensorValue, 50, 1006, 0, 255);
    mappedValue = constrain(mappedValue, 0, 255);
    Serial.print("raw value = ");
    Serial.print(sensorValue);
    Serial.print(" mapped value = ");
    Serial.println(mappedValue);

    analogWrite(10, mappedValue);
  }
  { int sensorValue = analogRead(ldrPin);
    int mappedValue;
    mappedValue = map(sensorValue, 50, 1023, 0, 255);

    Serial.print("raw value = ");
    Serial.println(mappedValue);

    Serial.print(" mapped value = ");
    Serial.print(sensorValue);

    analogWrite(yellowledPin, mappedValue);
    delay (100);
  }
}
