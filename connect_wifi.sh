#!/bin/bash

# Input Arguments
SSID="Guru"
PASSWORD="1234567891"
SECURITY="WPA2"
 
INTERFACE="wlan0" # Replace with the correct interface if it's different
INTERFACE="wlp2s0" # Replace with the correct interface if it's different

# Disconnect any current connection
sudo nmcli device disconnect "$INTERFACE"

# Connect to the specified Wi-Fi network
sudo nmcli device wifi connect "$SSID" password "$PASSWORD" ifname "$INTERFACE"

# Confirm connection by pinging Google DNS
if ping -c 4 8.8.8.8 &> /dev/null; then
  echo "Connected to $SSID successfully!"
else
  echo "Failed to connect to $SSID."
fi
