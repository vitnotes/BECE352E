#include <ESP8266WiFi.h>
#include <DHT.h>
#include <ThingSpeak.h>
const char *ssid =  "AmmaChennai";  
const char *pass =  "Mani@05231979";
DHT dht(D5, DHT11);
WiFiClient client;
long myChannelNumber = 2383706;
const char myWriteAPIKey[] = "VVO3CPPA3PJU4L6U";
void setup() {
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
  Serial.println("Temperature: " + (String) t);
  Serial.println("Humidity: " + (String) h);
  ThingSpeak.writeField(myChannelNumber, 1, t, myWriteAPIKey);
  ThingSpeak.writeField(myChannelNumber, 2, h, myWriteAPIKey);
  delay(100);
}
