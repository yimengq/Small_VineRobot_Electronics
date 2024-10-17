/*
  WiFiAccessPoint.ino creates a WiFi access point and provides a web server on it.

  Steps:
  1. Connect to the access point "yourAp"
  2. Point your web browser to http://192.168.4.1/H to turn the LED on or http://192.168.4.1/L to turn it off
     OR
     Run raw TCP "GET /H" and "GET /L" on PuTTY terminal with 192.168.4.1 as IP address and 80 as port

  Created for arduino-esp32 on 04 July, 2018
  by Elochukwu Ifediora (fedy0)
*/

#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include "esp_http_server.h"
#include <HTTPClient.h>

#ifndef LED_BUILTIN
#define LED_BUILTIN 2  // Set the GPIO pin where you connected your test LED or comment this line out if your dev board has a built-in LED
#endif

// Set these to your desired credentials.
const char *ssid = "Vcc-AP";
const char *password = "12345678";

NetworkServer server(80);

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(115200);
  Serial.println();
  Serial.println("Configuring access point...");

  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters
  if (!WiFi.softAP(ssid, password)) {
    log_e("Soft AP creation failed.");
    while (1);
  }
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);
  server.begin();

  Serial.println("Server started");

  
}

void loop() {
  // Check WiFi connection
  if ((WiFi.status() == WL_CONNECTED)) {

    Serial.print("[HTTP] begin...\n");

    HTTPClient http;

    // http.begin("https://imgv3.fotor.com/images/homepage-feature-card/upload-jpeg-file-to-fotor-online-jpeg-to-png-file-converter.jpg");
    http.begin("http://192.168.137.196");

    
    Serial.print("[HTTP] GET...\n");
    // Start connection and send HTTP header
    int httpCode = http.GET();
    if (httpCode > 0) {
      // fs::File f = SPIFFS.open(filename, "w+");
      // if (!f) {
      //   Serial.println("file open failed");
      //   return 0;
      // }
      // HTTP header has been send and Server response header has been handled
      Serial.printf("[HTTP] GET... code: %d\n", httpCode);

      // File found at server
      if (httpCode == HTTP_CODE_OK) {

        // Get length of document (is -1 when Server sends no Content-Length header)
        int total = http.getSize();
        int len = total;

        // Create buffer for read
        uint8_t buff[128] = { 0 };

        // Get tcp stream
        WiFiClient * stream = http.getStreamPtr();

        // Read all data from server
        while (http.connected() && (len > 0 || len == -1)) {
          // Get available data size
          size_t size = stream->available();
          Serial.printf("Size: %d", size);

          if (size) {
            // Read up to 128 bytes
            int c = stream->readBytes(buff, ((size > sizeof(buff)) ? sizeof(buff) : size));

            // // Write it to file
            // f.write(buff, c);

            // Calculate remaining bytes
            if (len > 0) {
              len -= c;
            }
          }
          yield();
        }
        Serial.println();
        Serial.print("[HTTP] connection closed or file end.\n");
      }
      // f.close();
    }
    else {
      Serial.printf("[HTTP] GET... failed, error: %s\n", http.errorToString(httpCode).c_str());
    }
    http.end();
  }

  // NetworkClient client = server.accept();  // listen for incoming clients

  // if (client) {                     // if you get a client,
  //   Serial.println("New Client.");  // print a message out the serial port
  //   String currentLine = "";        // make a String to hold incoming data from the client
  //   while (client.connected()) {    // loop while the client's connected
  //     if (client.available()) {     // if there's bytes to read from the client,
  //       char c = client.read();     // read a byte, then
  //       Serial.write(c);            // print it out the serial monitor
  //       if (c == '\n') {            // if the byte is a newline character

  //         // if the current line is blank, you got two newline characters in a row.
  //         // that's the end of the client HTTP request, so send a response:
  //         if (currentLine.length() == 0) {
  //           // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
  //           // and a content-type so the client knows what's coming, then a blank line:
  //           client.println("HTTP/1.1 200 OK");
  //           client.println("Content-type:text/html");
  //           client.println();

  //           // the content of the HTTP response follows the header:
  //           client.print("Click <a href=\"/H\">here</a> to turn ON the LED.<br>");
  //           client.print("Click <a href=\"/L\">here</a> to turn OFF the LED.<br>");

  //           // The HTTP response ends with another blank line:
  //           client.println();
  //           // break out of the while loop:
  //           break;
  //         } else {  // if you got a newline, then clear currentLine:
  //           currentLine = "";
  //         }
  //       } else if (c != '\r') {  // if you got anything else but a carriage return character,
  //         currentLine += c;      // add it to the end of the currentLine
  //       }

  //       // Check to see if the client request was "GET /H" or "GET /L":
  //       if (currentLine.endsWith("GET /H")) {
  //         digitalWrite(LED_BUILTIN, HIGH);  // GET /H turns the LED on
  //       }
  //       if (currentLine.endsWith("GET /L")) {
  //         digitalWrite(LED_BUILTIN, LOW);  // GET /L turns the LED off
  //       }
  //     }
  //   }
  //   // close the connection:
  //   client.stop();
  //   Serial.println("Client Disconnected.");
  // }
}
