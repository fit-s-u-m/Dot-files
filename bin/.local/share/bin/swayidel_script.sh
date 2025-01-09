#!/usr/bin/env bash


# Define the idle timeout values (in seconds)
LOCK_TIMEOUT=300       # Lock the screen after 5 minutes of inactivity
DPMS_TIMEOUT=600       # Turn off the display after 10 minutes of inactivity
SLEEP_TIMEOUT=1800     # Suspend after 30 minutes of inactivity
HIBERNATE_TIMEOUT=3600 # Hibernate after 1 hours of inactivity

# Command to lock the screen
LOCK_CMD='swaylock'

# Command to turn off the display
DPMS_OFF_CMD='hyprctl dispatch dpms off'
DPMS_ON_CMD='hyprctl dispatch dpms on'

# Command to hibernate the system
HIBERNATE_CMD='systemctl hibernate'

# Command to suspend the system
SLEEP_CMD='systemctl suspend'

# Execute swayidle with specified events
swayidle -w \
    timeout $LOCK_TIMEOUT "$LOCK_CMD" \
    timeout $DPMS_TIMEOUT "$DPMS_OFF_CMD" \
        resume "$DPMS_ON_CMD" \
    timeout $SLEEP_TIMEOUT "$SLEEP_CMD" \
    timeout $HIBERNATE_TIMEOUT "$HIBERNATE_CMD" \
    before-sleep "$LOCK_CMD"
