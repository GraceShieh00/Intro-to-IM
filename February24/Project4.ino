

#include "pitches.h"

// notes in the melody:

const int speakerPin = 8;
const int servoPin = 9;

int melody[] = {
  NOTE_G4, NOTE_A4, NOTE_G4, NOTE_FS4, NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_G4, 0, NOTE_G4, NOTE_A4, NOTE_G4, NOTE_FS4, NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_G4, 0, NOTE_C4, NOTE_E4, NOTE_G4, NOTE_C5, NOTE_D5, NOTE_C5, NOTE_B4, NOTE_C5, NOTE_A4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_G4, NOTE_A4, NOTE_B4, NOTE_C5, NOTE_C5, NOTE_C5, NOTE_C5
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  1, 4, 4, 4, 4, 2, 4, 4, 2, 2, 1, 4, 4, 4, 4, 2, 4, 4, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 1, 2, 4, 4, 4, 4, 4, 4, 2, 4, 4, 1
};

#include <Servo.h>

Servo myservo;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin

void setup() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 40; thisNote++) {

    // to calculate the note duration, take one second divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 2000 / noteDurations[thisNote];
    tone(speakerPin, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(speakerPin);
  }
  {
    myservo.attach(servoPin);  // attaches the servo on pin 9 to the servo object
  }
}

void loop() {
  // no need to repeat the melody.
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(15);
}
