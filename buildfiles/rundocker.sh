#!/bin/bash

docker run --restart unless-stopped -it -v/tmp:/tmp/ttt -p80:80 -p443:443 xyzj/outside-the-wall:latest 
