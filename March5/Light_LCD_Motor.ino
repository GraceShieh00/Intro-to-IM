/*
  Codes to control servo motor, button to turn LED on and off, lcd screen to display words, a buzzer to play melody, and a photo resistor to play melody depending on brightness of surrounding

  Modified based on Arduino example code from below:

  http://www.arduino.cc/en/Tutorial/Tone

  March 5, 2020
*/

#include "pitches.h"
#include <Servo.h>
#include <LiquidCrystal.h>


LiquidCrystal lcd(12, 11, 5, 4, 3, 2); //code for lcd board, codes from https://www.arduino.cc/en/Tutorial/HelloWorld
Servo myservo;  // control a servo

int potpin = A1;  // analog pin used to connect the potentiometer
int val;

const int speakerPin = 9;
int photocellPin = A0;     // the cell and 10K pulldown are connected to a0
int photocellReading;     // the analog reading from the analog resistor divider
int yellowLED = 7;
int yellowswitch = 8;
boolean oldyellowSwitchState = LOW;
boolean newyellowSwitchState = LOW;

boolean yellowLEDstatus = LOW;

int thisNote;

// notes in the melody:
int melody[] = {
  0, NOTE_G3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_E4, 0, NOTE_E4, NOTE_D4, NOTE_E4,
  NOTE_C4, NOTE_C4, 0, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_A4, NOTE_G4, NOTE_F4,
  NOTE_E4, 0, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_A4, 0, NOTE_A4, NOTE_G4,
  NOTE_F4, NOTE_E4, NOTE_C4, 0, NOTE_G3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_E4, NOTE_F4,
  NOTE_D4, NOTE_D4, NOTE_E4, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  8, 8, 8, 8, 4, 4, 8, 8, 8, 8,
  4, 4, 8, 8, 8, 8, 4, 4, 4, 4,
  2, 8, 8, 8, 8, 4, 4, 8, 8, 8,
  8, 4, 4, 8, 8, 8, 8, 4, 8, 8,
  4, 8, 8, 2
};
// melody originally planned for second song when the light sensor is detecting under 400/ when it's dark
int melody1[] = {
  NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_G4,
  NOTE_E4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_D4, NOTE_G4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_C4, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations1[] = {
  4, 4, 8, 8, 4, 8, 8, 8, 8, 4,
  4, 4, 4, 8, 8, 4, 8, 8, 8, 8,
  4, 4
};
void setup() {
  // set up the LCD's number of columns and rows; code from https://www.arduino.cc/en/Tutorial/HelloWorld
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("Hi sunshine :)");
  Serial.begin(9600);
  pinMode(yellowLED, OUTPUT);
  digitalWrite(yellowLED, LOW);

  pinMode(yellowswitch, INPUT);
  myservo.attach(6);


}

void loop() {
  // no need to repeat the melody.
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(1);

  newyellowSwitchState = digitalRead(yellowswitch);
  delay(1);
  if ( newyellowSwitchState != oldyellowSwitchState )
  {
    // has the button switch been closed?
    if ( newyellowSwitchState == HIGH )
    {
      if ( yellowLEDstatus == LOW ) {
        digitalWrite(yellowLED, HIGH);
        yellowLEDstatus = HIGH;
      }
      else                    {
        digitalWrite(yellowLED, LOW);
        yellowLEDstatus = LOW;
      }
    }


    photocellReading = analogRead(photocellPin);

    for (int thisNote = 0; thisNote < 45; thisNote++) {
      //if (photocellReading < 10)
      //    Serial.println(" - Dark");
      //    noTone(speakerPin);
      if (photocellReading < 400) {
        Serial.println(photocellReading);
        for (int thisNote = 0; thisNote < 13; thisNote++) {
          int noteDuration1 = 1000 / noteDurations1[thisNote];
          tone(speakerPin, melody1[thisNote], noteDurations1);
        }
        //        delay(pauseBetweenNotes);
        //        noTone(speakerPin);}
        if (photocellReading > 400 && photocellReading < 500) {
          Serial.println(photocellReading);
          noTone(speakerPin);
        }
        if (photocellReading > 500 && photocellReading < 800)
        { Serial.println(photocellReading);
          for (int thisNote = 0; thisNote < 45; thisNote++) {

            int noteDuration = 1000 / noteDurations[thisNote];
            tone(speakerPin, melody[thisNote], noteDuration);

            int pauseBetweenNotes = noteDuration * 1.50;
            delay(pauseBetweenNotes);
            //        noTone(speakerPin);

          }
        }
      }




      ///  Serial.print("Analog reading = ");
      ///  Serial.print(photocellReading);     // the raw analog reading
      // We'll have a few threshholds, qualitatively determined

    }


  }
}
