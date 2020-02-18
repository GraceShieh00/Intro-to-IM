
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
const int greenledPin =  4;
const int redledPin =  8;
const int yellowledPin = 6;
// the number of the LED pin

// variables will change:
int bluebuttonState = 0;
int greenbuttonState = 0;
int redbuttonState = 0;
int sensorValue1 = 0;
int sensorValue2 = 0;
int mappedValue1;
int mappedValue2;

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

    int sensorValue1 = analogRead(A5);
    int mappedValue1;
    mappedValue1 = map(sensorValue1, 50, 1023, 0, 255);
    mappedValue1 = constrain(mappedValue1, 0, 255);
    Serial.print("raw value = ");
    Serial.print(sensorValue1);
    Serial.print(" mapped value = ");
    Serial.println(mappedValue1);

    analogWrite(10, mappedValue1);

    int sensorValue2 = analogRead(ldrPin);
    int mappedValue2;
    mappedValue2 = map(sensorValue2, 170, 1023, 0, 255);
    mappedValue1 = constrain(mappedValue1, 0, 255);

    Serial.print("raw value = ");
    Serial.println(sensorValue2);

    Serial.print(" mapped value = ");
    Serial.print(mappedValue2);

    analogWrite(yellowledPin, mappedValue2);
    delay (100);

}
