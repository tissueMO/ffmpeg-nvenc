#!/bin/bash

docker run --runtime nvidia -v /mnt/aplib/VR:/tmp --rm -it --entrypoint bash ffmpeg
