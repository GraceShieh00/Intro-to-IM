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
int photocellPin = A0;     // the cell and 10K pulldown are connected to A0
int photocellReading;     // the analog reading from the analog resistor divider
int blueLED = 7;
int blueswitch = 8;
boolean oldblueSwitchState = LOW;
boolean newblueSwitchState = LOW;

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

// rhythm for music; 4- quarter note, 8- eigth note
int noteDurations[] = {
  8, 8, 8, 8, 4, 4, 8, 8, 8, 8,
  4, 4, 8, 8, 8, 8, 4, 4, 4, 4,
  2, 8, 8, 8, 8, 4, 4, 8, 8, 8,
  8, 4, 4, 8, 8, 8, 8, 4, 8, 8,
  4, 8, 8, 2
};
// melody originally planned for second song when the light sensor is detecting under 400/ when it's darker
int melody1[] = {
  NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_E4, NOTE_G4, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_G4,
  NOTE_E4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_D4, NOTE_G4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_C4, NOTE_C4
};

// rhythm of the music
int noteDurations1[] = {
  4, 4, 8, 8, 4, 8, 8, 8, 8, 4,
  4, 4, 4, 8, 8, 4, 8, 8, 8, 8,
  4, 4
};
void setup() {
  // set up the LCD's number of columns and rows; code from https://www.arduino.cc/en/Tutorial/HelloWorld
  lcd.begin(16, 2);
  // Print a message "hi sunshine" to the LCD.
  lcd.print("Hi sunshine :)");
  Serial.begin(9600);
  
  pinMode(blueLED, OUTPUT);
  digitalWrite(blueLED, LOW);

  pinMode(blueswitch, INPUT);
  myservo.attach(6);


}

void loop() {
 
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(1);

// controls the switch; allows the button to turn on and off light when pushed and stays in the state ex. stays light up until button pushed again
  newblueSwitchState = digitalRead(blueswitch);
  delay(1);
  if ( newblueSwitchState != oldblueSwitchState )
  {
    // has the button switch been closed?
    if ( newblueSwitchState == HIGH )
    {
      if ( blueLEDstatus == LOW ) {
        digitalWrite(blueLED, HIGH);
        blueLEDstatus = HIGH;
      }
      else                    {
        digitalWrite(blueLED, LOW);
       blueLEDstatus = LOW;
      }
    }

//reads the brightness of the photo resistor and plays music in respond to brightness
    photocellReading = analogRead(photocellPin);

    for (int thisNote = 0; thisNote < 45; thisNote++) {
      
      if (photocellReading < 400) {
        Serial.println(photocellReading);
        for (int thisNote = 0; thisNote < 13; thisNote++) {
          int noteDuration1 = 1000 / noteDurations1[thisNote];
          tone(speakerPin, melody1[thisNote], noteDurations1);
        }
      
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
            
          }
        }
      }

    }


  }
}
