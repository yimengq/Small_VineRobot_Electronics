/*
    This sketch shows the Ethernet event usage
*/

// Important to be defined BEFORE including ETH.h for ETH.begin() to work.
// Example RMII LAN8720 (Olimex, etc.)
#ifndef ETH_PHY_TYPE
#define ETH_PHY_TYPE  ETH_PHY_LAN8720
#define ETH_PHY_ADDR  0
#define ETH_PHY_MDC   23
#define ETH_PHY_MDIO  18
#define ETH_PHY_POWER -1
#define ETH_CLK_MODE  ETH_CLOCK_GPIO0_IN
#endif

#include <ETH.h>
#include <WiFi.h>

#define AP_SSID "Vcc-AP"
#define AP_PASS "12345678"

IPAddress ap_ip(192, 168, 137, 15);
IPAddress ap_gateway(192, 168, 137, 1);
IPAddress ap_mask(255, 255, 255, 0);
IPAddress ap_leaseStart(192, 168, 137, 10);
IPAddress ap_dns(192, 168, 137, 1);

IPAddress eth_ip(192, 168, 137, 0);
IPAddress eth_gateway(192, 168, 137, 0);
IPAddress eth_mask(255, 255, 255, 0);
IPAddress eth_leaseStart(192, 168, 137, 0);
IPAddress eth_dns(8, 8, 4, 4);

static bool eth_connected = false;

// WARNING: onEvent is called from a separate FreeRTOS task (thread)!
void onEvent(arduino_event_id_t event, arduino_event_info_t info) {
  switch (event) {
    case ARDUINO_EVENT_ETH_START:
      Serial.println("ETH Started");
      // The hostname must be set after the interface is started, but needs
      // to be set before DHCP, so set it from the event handler thread.
      // ETH.setHostname("esp32-ethernet");
      break;
    case ARDUINO_EVENT_ETH_CONNECTED: Serial.println("ETH Connected"); break;
    case ARDUINO_EVENT_ETH_GOT_IP:
      Serial.println("ETH Got IP");
      Serial.println(ETH);
      eth_connected = true;
      WiFi.AP.enableNAPT(true);
      break;
    case ARDUINO_EVENT_ETH_LOST_IP:
      Serial.println("ETH Lost IP");
      eth_connected = false;
      WiFi.AP.enableNAPT(false);
      break;
    case ARDUINO_EVENT_ETH_DISCONNECTED:
      Serial.println("ETH Disconnected");
      eth_connected = false;
      WiFi.AP.enableNAPT(false);
      break;
    case ARDUINO_EVENT_ETH_STOP:
      Serial.println("ETH Stopped");
      eth_connected = false;
      break;
    
    case ARDUINO_EVENT_WIFI_AP_START:
      Serial.println("AP Started");
      Serial.println(WiFi.AP);
      break;
    case ARDUINO_EVENT_WIFI_AP_STACONNECTED:    Serial.println("AP STA Connected"); break;
    case ARDUINO_EVENT_WIFI_AP_STADISCONNECTED: Serial.println("AP STA Disconnected"); break;
    case ARDUINO_EVENT_WIFI_AP_STAIPASSIGNED:
      Serial.print("AP STA IP Assigned: ");
      Serial.println(IPAddress(info.wifi_ap_staipassigned.ip.addr));
      break;
    case ARDUINO_EVENT_WIFI_AP_PROBEREQRECVED: Serial.println("AP Probe Request Received"); break;
    case ARDUINO_EVENT_WIFI_AP_STOP:           Serial.println("AP Stopped"); break;
    
    default: break;
  }
}

void testClient(const char *host, uint16_t port) {
  Serial.print("\nconnecting to ");
  Serial.println(host);

  NetworkClient client;
  if (!client.connect(host, port)) {
    Serial.println("connection failed");
    return;
  }
  client.printf("GET / HTTP/1.1\r\nHost: %s\r\n\r\n", host);
  while (client.connected() && !client.available());
  while (client.available()) {
    Serial.write(client.read());
  }

  Serial.println("closing connection\n");
  client.stop();
}

void setup() {
  Serial.begin(115200);
  Serial.setDebugOutput(true);
  Network.onEvent(onEvent);
  WiFi.mode(WIFI_STA);
  WiFi.AP.begin();
  // WiFi.AP.config(ap_ip, ap_ip, ap_mask, ap_leaseStart, ap_dns);
  // WiFi.AP.config(ap_ip, ap_gateway, ap_mask, ap_leaseStart, ap_dns);
  WiFi.AP.create(AP_SSID, AP_PASS);
  if (!WiFi.AP.waitStatusBits(ESP_NETIF_STARTED_BIT, 1000)) {
    Serial.println("Failed to start AP!");
    return;
  }
  delay(100);
  // TODO: Check out
  ETH.begin();
  //ETH.config(eth_ip, eth_gateway, eth_mask, eth_leaseStart, eth_dns);
  // ETH.config();
}

void loop() {
  // if (eth_connected) {
  //   testClient("google.com", 80);
  // }
  delay(20000);
}
