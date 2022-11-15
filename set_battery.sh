# !bin/bash

user=$USER

# create a systemd service to set the battery charge stop threshold on boot
# ls /sys/class/ power_supply/BAT0/charge_control_end_threshold

echo "creating service to set bettery level limit"
sudo cp ./battery-charge-threshold.service /etc/systemd/system/


echo "Enabling and starting the battery-charge-threshold-service"
sudo systemctl enable battery-charge-threshold.service
sudo systemctl start battery-charge-threshold.service

echo 'the current status of the battery is:'
cat /sys/class/power_supply/BAT0/status
