#!/bin/bash

# Wi-Fi network details
SSID="Guru"
PASSWORD="1234567891"
INTERFACE="wlp2s0"

# Scan for available networks to check if the SSID exists
if ! sudo nmcli device wifi list ifname "$INTERFACE" | grep -q "$SSID"; then
  echo "Network with SSID '$SSID' not found. Please check if the network is in range."
  exit 1
fi

# Attempt to connect to the specified Wi-Fi network
sudo nmcli device wifi connect "$SSID" password "$PASSWORD" ifname "$INTERFACE"

# Check if the connection was successful
if ping -c 4 8.8.8.8 &> /dev/null; then
  echo "Connected to $SSID successfully!"
else
  echo "Failed to connect to $SSID."
fi
