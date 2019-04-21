/*
Code to update LabChart when a stimulus plays
*/

// constants won't change. Used here to set a pin number:
const int ledPin =  LED_BUILTIN;// the number of the LED pin
const int analogOutPin = A0;

// Variables will change:
int ledState = LOW;             // ledState used to set the LED
int outputValue = 0;        // value output to the PWM (analog out)
int incomingByte = 0;

// Generally, you should use "unsigned long" for variables that hold time
// The value will quickly become too large for an int to store
unsigned long previousMillis = 0;        // will store last time LED was updated

// constants won't change:
const long pulse_length = 100;           // pulse length (milliseconds)

void setup() {
  // set the digital pin as output:
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  analogWrite(analogOutPin, outputValue); 
}

void loop() {
  // here is where you'd put code that needs to be running all the time.

  if (Serial.available() > 0) {
      // read the incoming byte:
      incomingByte = Serial.read();

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW) {
      ledState = HIGH;
    } else {
      ledState = LOW;
    }
      // say what you got:
      Serial.print("I received: ");
      Serial.println(incomingByte, DEC);
      digitalWrite(ledPin, ledState);
      digitalWrite(analogOutPin,1);

      delay(pulse_length);
      analogWrite(analogOutPin, outputValue); 
      Serial.flush();
  }
}
