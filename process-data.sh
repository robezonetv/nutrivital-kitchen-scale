#!/bin/bash

#
# Working path directory
#
_DIR="./"

#
# Packet HEX values (first stable part)
#
pattern="b0 08 ff ff"

# Continuously reading log from bluetoothctl scanning line by line
tail -n0 -F $_DIR/scale.log | \
while read LINE
do
    # We need HEX values which contains weight
    scale=$(echo $LINE | grep "$pattern")
    if [[ -z $scale ]]; then
        continue
    fi

    # We need read bytes for weight
    A=$(echo "$scale" | awk '{ print $9 }')
    B=$(echo "$scale" | awk '{ print $10 }')
    C=$(echo "$scale" | awk '{ print $11 }')
    D=$(echo "$scale" | awk '{ print $12 }')

    # For better working with numbers need decode from HEX to INT
    # And its working like this 0f (0) -> 1e (1) -> f0 (15)
    # So we are fine with 1 part of value decoded to INT
    a=$((16#${A:0:1}))
    b=$((16#${B:0:1}))
    c=$((16#${C:0:1}))
    d=$((16#${D:0:1}))
    
    # Debug :)
    #echo $a $b $c $d

    # And how it's working algorithm encoded weight
    #sumD is not needed, because is same as d value (as is: 0 - 15)
    sumC=$(( c * 16 ))
    sumB=$(( b * 256 ))
    sumA=$(( a * 4096 ))

    # Live output
    echo "Weight $(( $d + $sumC + $sumB + $sumA )) grams"
    
done
