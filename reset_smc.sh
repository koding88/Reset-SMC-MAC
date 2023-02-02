#!/bin/bash

echo "Resetting the SMC on an Intel-based MacBook..."

# Check if the system is running on battery power
power_source=$(pmset -g ps)
if [[ "$power_source" == *"Battery Power"* ]]; then
  sudo pmset -a sms 0
else
  sudo pmset -a autopoweroff 0
  sudo pmset -a powerbutton 0
  sudo pmset -a standby 0
  sudo pmset -a standbydelay 0
  sudo pmset -a hibernatemode 0
  sudo pmset -a ttyskeepawake 0
  sudo pmset -a displaysleep 0
  sudo pmset -a sleep 0
  sudo pmset -a womp 0
  sudo pmset -a networkoversleep 0
  sudo pmset -a disksleep 0
  sudo pmset -a autorestart 1
  sudo pmset -a gpuswitch 2
  sudo pmset -a lidwake 1
  sudo pmset -a acwake 0
  sudo pmset -a lessbright 1
  sudo pmset -a ring 1
  sudo pmset -a halfdim 1
  sudo pmset -a panicrestart 157680000
fi

# Reset the SMC
sudo sysctl -w kern.nvram.pms=1
echo "SMC reset complete."
