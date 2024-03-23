#!/bin/bash
while true; do
    read -p "Paste the video link: " video_link
    if [ "$video_link" == "exit" ]; then
        break
    fi
    echo "Downloading video..."
   ./yt-dlp -o downloaded.webm "$video_link"
        echo "Converting to mp4..."
        ffmpeg -i downloaded.webm -c copy converted.mp4
    echo "Flipping on the Vertical Axis..."
#    ffmpeg -i converted.mp4 -vf hflip -c:a copy flipped.mp4
    ffmpeg -i converted.mp4 -vf hflip -c:a copy -c:v libx264 flipped.mp4
    echo "Moving to /sdcard/..."
    timestamp=$(date +"%Y%m%d%H%M%S")
    mv flipped.mp4 "media(${timestamp}).mp4"
    mv "record(${timestamp}).mp4" /sdcard
    rm -rf converted.mp4
    rm -rf downloaded.webm
    clear
    echo "Successful!"
done
