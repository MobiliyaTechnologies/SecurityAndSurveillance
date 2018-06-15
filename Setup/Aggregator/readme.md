# Aggregator Server

## Pre-requisites 

- NodeJS (4.0.0 and above)
- Python (2.7 and above)
- OpenCV 3+
- Mobiliya github REPO URL  

## Installation

```bash 
$ git clone 
$ cd installAggregator
$ sed -i -e 's/\r$//' install.sh
$ chmod +x install.sh
$ ./install.sh
$ cd ~/Aggregator
$ node aggregatorServer.js
```

## Running the server

Starting the aggregator server:

``` bash
$ node aggregatorServer.js

```
## Limitations
- Camera streaming URL should be known and tested before passing as input to Aggregator.

## Tested video sources
- Recorded videos, rtsp streaming url of CPPlus DVR, rtsp streaming url of onvif Sricam IP camera, Logitech webcam.

## License

[MIT](#)
