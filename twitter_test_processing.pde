import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.http.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;

import processing.serial.*; 

Serial myPort;    // The serial port
PFont myFont;     // The display font
String inString=" ";  // Input string from serial port
int lf = 10;      // ASCII linefeed 

String msg = "twitter4j desde processing";

//copy and paste these from your application in dev.twitter.com 
String consumer_key = "vzFv3kREeRnro3xGW4kEXg";
String consumer_secret = "Qs96RD6R1bOf5RQHPuysyNsu4Ea0dAR61HHdsO0Ns";
String oauth_token = "22927286-6u34lNmrxEv4hCAWXMoBAPVuG92BBxl56LY4yIM";
String oauth_token_secret = "NJVOvJTcVtu2i88JxrZO8mQmZUMPIPZ1BQbV4sk";

color bgcolor = color(255);
long timer;

void setup() {
  size(400, 200);
  background(0);
  // List all the available serial ports: 
  println(Serial.list()); 
  // I know that the first port in the serial list on my computer
  //is the one being used 
  myPort = new Serial(this, Serial.list()[0], 9600); 
  myPort.bufferUntil(lf);
}

void serialEvent(Serial p) { 
  inString = p.readString();
} 

void draw() {
  if (inString.contains("67 00 73 CA 0D ")) {
   
   background(255,204,0);
    println(inString);
    text(inString, 30, 30);
     text("RFID-Tag Detected", 30, 30);
   delay(1000);
     text(inString, 30, 30);
   
    Twitter twitter = new TwitterFactory().getOAuthAuthorizedInstance (consumer_key, consumer_secret, new AccessToken( oauth_token, oauth_token_secret) );
    try {
      Status st = twitter.updateStatus("wiii twiteando desde arduino rfid tag 1" + " " + second());
      println("Successfully updated the status to [" + st.getText() + "].");
   
      timer = millis();
    }
    catch (TwitterException e) {
      println(e.getStatusCode());
    }
    inString=" ";
    delay(1000);
  
  }
  if (inString.contains("67 00 73 F7 52 ")) {
    
    text(inString, 30, 30);
    text("RFID-Tag Detected", 30, 30);
     background(0,255,0);
    println(inString);
    delay(1000);
    text(inString, 30, 30);

   
    Twitter twitter = new TwitterFactory().getOAuthAuthorizedInstance (consumer_key, consumer_secret, new AccessToken( oauth_token, oauth_token_secret) );
    try {
      Status st = twitter.updateStatus("yeahhh twiteando desde arduino rfid tag 2" + " " + second());
      println("Successfully updated the status to [" + st.getText() + "].");
     timer = millis();
    }
    catch (TwitterException e) {
      println(e.getStatusCode());
    }
    inString=" ";
    delay(1000);
  
  }
  else {
  
  }
  
}




