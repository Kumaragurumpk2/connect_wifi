#!/bin/bash

# Wi-Fi network details
SSID="Guru"
PASSWORD="1234567891"
INTERFACE="wlp2s0"

# Attempt to connect to the Wi-Fi network, even if it's hidden
sudo nmcli device wifi connect "$SSID" password "$PASSWORD" ifname "$INTERFACE" hidden yes

# Check if the connection was successful
if ping -c 4 8.8.8.8 &> /dev/null; then
  echo "Connected to $SSID successfully!"
else
  echo "Failed to connect to $SSID. Please check if the network is in range or if the SSID is correct."
fi
