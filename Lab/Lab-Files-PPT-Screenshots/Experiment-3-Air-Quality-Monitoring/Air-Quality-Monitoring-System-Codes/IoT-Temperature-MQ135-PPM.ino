#include <ESP8266WiFi.h>
#include <DHT.h>
#include <ThingSpeak.h>
#include "MQ135.h" 

const char *ssid =  "AmmaChennai";  
const char *pass =  "Mani@05231979";
DHT dht(D5, DHT11);
WiFiClient client;
long myChannelNumber = 2410078;
const char myWriteAPIKey[] = "LFOH0VKLJZAVFRJ6";

// The load resistance on the board
//#define RLOAD 22.0
// Calibration resistance at atmospheric CO2 level
//#define RZERO 879.13 

MQ135 gasSensor = MQ135(A0); 
int val; 
int sensorPin = A0; 
int sensorValue = 0; 

void setup() {
  pinMode(sensorPin, INPUT); 
  // put your setup code here, to run once:
  Serial.begin(115200);
  WiFi.begin(ssid, pass);
  while(WiFi.status() != WL_CONNECTED)
  {
    delay(200);
    Serial.print("..");
  }

  Serial.println();
  Serial.println("NodeMCU is connected!");
  Serial.println(WiFi.localIP());
  dht.begin();
  ThingSpeak.begin(client);
}
void loop() {
  // put your main code here, to run repeatedly:
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  val = analogRead(A0); 
  Serial.print ("raw = "); 
  Serial.println (val); 
  float zero = gasSensor.getRZero(); 
  Serial.print ("rzero: "); 
  Serial.println (zero); 
  float ppm = gasSensor.getPPM(); 
  Serial.print ("ppm: "); 
  Serial.println (ppm); 
  Serial.println("raw: " + (String) val);
  Serial.println("Rzero: " + (String) zero);
   Serial.println("PPM: " + (String) ppm);
  ThingSpeak.writeField(myChannelNumber, 1, val, myWriteAPIKey);
  ThingSpeak.writeField(myChannelNumber, 2, zero, myWriteAPIKey);
   ThingSpeak.writeField(myChannelNumber, 3, ppm, myWriteAPIKey);
  Serial.println("Temperature: " + (String) t);
  Serial.println("Humidity: " + (String) h);
  ThingSpeak.writeField(myChannelNumber, 4, t, myWriteAPIKey);
  ThingSpeak.writeField(myChannelNumber, 5, h, myWriteAPIKey);
  delay(100);
}
