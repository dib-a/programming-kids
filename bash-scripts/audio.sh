#!/bin/bash

# Set audio output volume to 80%
pactl set-sink-volume @DEFAULT_SINK@ 80%

# Set microphone input volume to 30%
pactl set-source-volume @DEFAULT_SOURCE@ 30%

echo "Audio output volume set to 80%."
echo "Microphone input volume set to 30%."