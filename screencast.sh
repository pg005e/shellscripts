#! /bin/bash

# Use your actual DISPLAY environment variable (e.g. :1)
DISPLAY_NUM="${DISPLAY:-:1}"

# Use slop to select region and extract coordinates
REGION=$(slop -f "%x,%y %w,%h")
if [ -z "$REGION" ]; then
  echo "No region selected. Exiting."
  exit 1
fi

X=$(echo $REGION | cut -d' ' -f1 | cut -d',' -f1)
Y=$(echo $REGION | cut -d' ' -f1 | cut -d',' -f2)
W=$(echo $REGION | cut -d' ' -f2 | cut -d',' -f1)
H=$(echo $REGION | cut -d' ' -f2 | cut -d',' -f2)

recordwithaudio() {
  OUTPUT="screencast_audio_$(date +%Y%m%d_%H%M%S).mkv"

  ffmpeg -video_size ${W}x${H} -framerate 30 -f x11grab -i ${DISPLAY_NUM}+${X},${Y} \
  -f pulse -i alsa_input.pci-0000_00_1f.3.analog-stereo \
  -c:v libx264 -preset ultrafast -c:a aac -b:a 128k "$OUTPUT"
}

recordwithoutaudio() {
  OUTPUT="screencast$(date +%Y%m%d_%H%M%S).mkv"

  ffmpeg -video_size ${W}x${H} -framerate 30 -f x11grab -i ${DISPLAY_NUM}+${X},${Y} \
  -c:v libx264 -preset ultrafast -c:a aac -b:a 128k "$OUTPUT"
}

while [ $# -gt 0 ]; do
  case "$1" in
    -w | --with-audio)
      recordwithaudio()
      exit
      ;;
    -wo | --without-audio)
      recordwithoutaudio()
      exit
      ;;
    *)
      echo "unknown flag"
      exit
      ;;
  esac
done

# default is record with audio
recordwithaudio
