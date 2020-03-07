/*
  The codes below are intended to control the movements of a servo motor with both a potentionmeter and with playing music,
  a button to turn LED on and off and two LEDs that turn on when specitic songs are playing,
  a lcd screen to display words, a buzzer to play two songs,
  and a photo resistor that triggers music playing depending on the brightness of surrounding (plays you are my sunshine when
  photoresistor shone with light and rain rain go away when photoresistor detects darkness).

  Parts of the code are modified based on Arduino example code from below:
  http://www.arduino.cc/en/Tutorial/Tone
  https://www.arduino.cc/en/Tutorial/HelloWorld

  March 6, 2020
*/

#include "pitches.h"
#include <Servo.h>
#include <LiquidCrystal.h>


LiquidCrystal lcd(12, 11, 5, 4, 3, 2); //the pins in which the lcd screen is plugged into on the red board
Servo myservo;  // the servo motor that is to be controlled

const int potpin = A1;  // analog pin used to connect the potentiometer on A1
int val; //value of the potentionmeter

const int speakerPin = 9; //the buzzer is connected to pin 9
const int photocellPin = A0;     // the cell and 10K pulldown are connected to A0
int photocellReading;     // the analog reading from the analog resistor divider
int servo = 6; //the servo is connected to pin 6 on the red board
const int lcd1 = 16;
const int lcd2 = 2;
const int blueLED = 7;
const int yellowLED = 13;
const int redLED = 10;
int redswitch = 8;
boolean oldredSwitchState = LOW; //sets the old switch state to low
boolean newredSwitchState = LOW; //sets the new switch state

boolean redLEDstatus = LOW;
boolean blueLEDstatus = LOW;
int thisNote;

// notes in the melody, plays melody of you are my sunshine:
int melody[] = {
  0, NOTE_G3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_E4, 0, NOTE_E4, NOTE_D4, NOTE_E4,
  NOTE_C4, NOTE_C4, 0, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_A4, NOTE_G4, NOTE_F4,
  NOTE_E4, 0, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_A4, 0, NOTE_A4, NOTE_G4,
  NOTE_F4, NOTE_E4, NOTE_C4, 0, NOTE_G3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_E4, NOTE_F4,
  NOTE_D4, NOTE_D4, NOTE_E4, NOTE_C4
};

// rhythm for music; 4- quarter note, 8- eigth note; lists the rhythm for the song you are my sunshine
int noteDurations[] = {
  8, 8, 8, 8, 4, 4, 8, 8, 8, 8,
  4, 4, 8, 8, 8, 8, 4, 4, 4, 4,
  2, 8, 8, 8, 8, 4, 4, 8, 8, 8,
  8, 4, 4, 8, 8, 8, 8, 4, 8, 8,
  4, 8, 8, 2
};


// melody for second song, notes of rain rain go away
int melody1[] = {
  NOTE_G4, NOTE_E4, NOTE_G4,  NOTE_E4, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_G4,
  NOTE_E4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_D4, NOTE_G4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_C4, NOTE_C4
};

// rhythm of the music rain rain go away
int noteDurations1[] = {
  4, 4, 4, 4, 4, 8, 8, 4,
  4, 4, 4, 4, 4, 8, 8, 8, 8,
  4, 4
};
void setup() {

  lcd.begin(lcd1, lcd2);

  lcd.print("Hi sunshine :)"); // Print a message "hi sunshine" to the LCD
  Serial.begin(9600);
  // set up the LCD's number of columns and rows; code from https://www.arduino.cc/en/Tutorial/HelloWorld
  pinMode(blueLED, OUTPUT);
  digitalWrite(blueLED, LOW);

  pinMode(yellowLED, OUTPUT);
  digitalWrite(yellowLED, LOW);

  pinMode(redLED, OUTPUT);
  digitalWrite(redLED, LOW);

  pinMode(redswitch, INPUT);
  myservo.attach(servo);


}

void loop() {

  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(1); // waits 1ms for the servo to reach the position


  newredSwitchState = digitalRead(redswitch);
  // controls the switch; allows the button to turn on and off light when pushed and stays in the state ex. stays light up until button pushed again
  delay(1); //waits 1ms for the servo to reach the position; controls speed of servo
  if ( newredSwitchState != oldredSwitchState )
  {
    Serial.println("button state has changed");
    // has the button switch been closed?
    if ( newredSwitchState == HIGH )
    {
      Serial.println("button state is high");

      if ( redLEDstatus == LOW ) {
        Serial.println("red led was off; will turn it on");

        digitalWrite(redLED, HIGH);
        redLEDstatus = HIGH;
      }
      else                    {
        Serial.println("red led was on; will turn it off");
        digitalWrite(redLED, LOW);
        redLEDstatus = LOW;
      }
    }
  }

  //reads the brightness of the photo resistor and plays music in respond to brightness
  photocellReading = analogRead(photocellPin);
  Serial.println(photocellReading);


  //plays rain rain go away when detected light is under 650; corresponding led lights up
  if (photocellReading < 650) {
    myservo.write(90);
    delay(1); //waits 1ms for the servo to reach the position, controls speed of the servo


    { digitalWrite(yellowLED, HIGH);
    }
    for (int thisNote = 0; thisNote < 20; thisNote++) {

      int noteDuration1 = 1000 / noteDurations1[thisNote];
      tone(speakerPin, melody1[thisNote], noteDurations1);
      int pauseBetweenNotes = noteDuration1 * 1.80;
      delay(pauseBetweenNotes); //amount of time between each notes, as set by above, to distinquish notes from one another
      val = analogRead(potpin); // reads the value of the potentiometer (value between 0 and 1023)

    }

  }

  //does not play music when light detected is between 660 and 900, which is the range of the IM lab room
  if (photocellReading > 660 && photocellReading < 900) {
    noTone(speakerPin);
    { digitalWrite(yellowLED, LOW);
      digitalWrite(blueLED, LOW);
    }
  }

  //plays you are my sunshine when light is shine on the resistor is over 900 detected; lights up the corresponding LED
  if (photocellReading > 900)   {
    myservo.write(180); // sets the servo position according to the scaled value
    delay(1); //waits 1ms for the servo to reach the position
    { digitalWrite(blueLED, HIGH);
    }
    for (int thisNote = 0; thisNote < 44; thisNote++) {

      int noteDuration = 1000 / noteDurations[thisNote];
      tone(speakerPin, melody[thisNote], noteDurations);

      int pauseBetweenNotes = noteDuration * 1.50;
      delay(pauseBetweenNotes); //amount of time between each notes, as set by above, to distinquish notes from one another
      val = analogRead(potpin); // reads the value of the potentiometer (value between 0 and 1023)

    }



  }



}
