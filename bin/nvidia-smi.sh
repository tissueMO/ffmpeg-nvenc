#!/bin/bash

docker run --runtime nvidia --rm --entrypoint nvidia-smi ffmpeg -l 1
