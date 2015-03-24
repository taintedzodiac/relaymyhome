#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2013 Rob Zimmerman
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Original script by Daniel Hoherd (https://www.github.com/danielhoherd)
# Some code was copied from https://github.com/taintedzodiac/relaymyhome
# Tested in OS X 10.9 (Mavericks)
# Cycles through mac addresses for 3DS shift color specific homepass relays 


### TODO:
###   make this work with command line args for shirt color.

### Require Root
if [ "$(id -u)" != "0" ]; then
  echo "Error: This script must be run as root.  Exiting." 1>&2
  exit 1
fi

relay_time=90
sleep_time=5

### Set some functions
function date-echo {
  date "+%F %T%z $*" ;
}

function cleanup() {
  networksetup -setairportpower "${wifi}" on
  sudo ifconfig "${wifi}" lladdr "${wirelessMAC}"
  networksetup -setairportpower "${wifi}" off
  #networksetup -setairportpower "${wifi}" on
}

function ctrl_c() {
  # user quit midway through, so we should revert
  # the MAC address by calling our cleanup function
  echo "*** Interrupted ***"
  cleanup
  exit $?
}

### trap keyboard interrupt (control-c) or unexpected quit
trap ctrl_c SIGINT SIGTERM


function usage {
  echo "this is the usage function"
}

while getopts c:h option ; do
  case "${option}" in
    c) verbose=1;;
    h) usage ; exit ;;
    *) usage ; exit 1 ;
  esac
done

shift $((OPTIND - 1))

### MAC addresses and shirt color offsets
mac_prefix="4E:53:50:4F:43:"
offset_red="0"
offset_orange="1"
offset_yellow="2"
offset_light_green="3"
offset_green="4"
offset_blue="5"
offset_light_blue="6"
offset_pink="7"
offset_purple="8"
offset_brown="9"
offset_white="a"
offset_black="b"

wservice=$(/usr/sbin/networksetup -listallnetworkservices | grep -Ei '(wi-fi|airport)')
wifi=$(networksetup -listallhardwareports | awk "/$wservice/,/Ethernet/"' getline { print $2 }')
wirelessMAC=$(networksetup -getmacaddress "${wifi}" | awk '{print $3}')
echo "Original MAC address is: $wirelessMAC"

### Shuffle the last digits so we don't always start with 0
shuffled_digits=( $(echo {0..9} {a..f} | xargs -n1 -P1 echo | gsort -R) ) ;
echo "Shuffled digits: ${shuffled_digits[*]}"

networksetup -setairportpower "${wifi}" on

# TODO: make this whole next section more elegant.
### Do the actual spoofing
i=0
while [ $i -lt 1 ] ; do 
  j=0
  for this_digit in "${shuffled_digits[@]}" ; do
    let j=${j}+1 ;
    this_mac="${mac_prefix}${offset_black}${this_digit}"
    date-echo "Setting ${wifi} MAC to ${this_mac} ${i}/${j}"
    # TODO: turn this next line into a function with proper error checking, debug and verbose handling
    ifconfig "${wifi}" ether "${this_mac}" || echo "Failed to set MAC address"
    date-echo "Powering off wifi"
    # TODO: turn this next line into a function with proper error checking, debug and verbose handling
    networksetup -setairportpower "${wifi}" off
    sleep ${sleep_time} ;
    date-echo "Powering on wifi"
    # TODO: turn this next line into a function with proper error checking, debug and verbose handling
    networksetup -setairportpower "${wifi}" on
    date-echo "Waiting for ${relay_time} seconds"
    sleep ${relay_time} ; 
  done
  let i=${i:-0}+1
done

networksetup -setairportpower "${wifi}" off
