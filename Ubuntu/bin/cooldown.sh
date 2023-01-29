#!/bin/bash

# m h  dom mon dow   command
# * * * * * sh /home/mgch/bin/cooldown.sh > /dev/null 2>&1
sudo bash -c "echo 'disable' > /sys/firmware/acpi/interrupts/gpe69"

