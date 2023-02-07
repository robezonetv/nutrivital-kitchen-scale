#!/bin/bash

#
# Your ETA NutriVital BLE MAC
#
_MAC="2E:CC:12:BC:6F:ED"

#
# Working path directory
#
_DIR="./"

#
# After defined timeout restart bluetoothctl process
#
bluetoothReconnectTimeout=60

while [ 1 ]; do
    {
        printf 'scan.pattern %s\n' $_MAC;
        printf 'scan on\n';
        sleep $bluetoothReconnectTimeout;
    } | stdbuf -oL bluetoothctl --monitor >> $_DIR/scale.log
done
