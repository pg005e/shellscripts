#! /bin/sh

##### print the errors on bootup
# journalctl -p 3 -b

##### exec into a docker container to interact with the DB
# sudo docker exec -it <container_id> <shell>
# psql -U <user_name> -d <database>

##### screencast entire screen, own audio (ffmpeg)
# ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i $DISPLAY \
# -f pulse -i alsa_input.pci-0000_00_1f.3.analog-stereo \
# -c:v libx264 -preset ultrafast -c:a aac -b:a 128k screen_with_mic.mkv

##### screencast entire screen, system audio (ffmpeg)
# ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i $DISPLAY \
# -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor \
# -c:v libx264 -preset ultrafast -c:a aac -b:a 128k screen_with_system_audio.mkv

##### record audio (ffmpeg)
# ffmpeg -f alsa -i default -codec:a flac audio.mkv

##### astroterm commands
# astroterm -cCu -s 1000 -f 30 -t 4
