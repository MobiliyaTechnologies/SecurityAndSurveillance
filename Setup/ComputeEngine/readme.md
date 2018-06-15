# ComputeEngine

## Pre-requisites 

- Jetson Flashing with Jepack 3.1
Following if not preinstalled, will be installed from following steps
- NodeJS (4.0.0 and above)
- Python (2.7 and above)
- OpenCV 3+

## Installation

```bash  
$ sed -i -e 's/\r$//' install.sh
$ chmod +x install.sh
$ ./install.sh
```

## Configuration

Open ~/Compute-Engine-Yolo/jetsonNodeServer/settings.js

- Change config.name, config.location according to your choice.
- Change according to following - 
1. IoT Hub connection string    --> IOTHubConnectionString
2.  Backend url		              --> backendUrl

## Running the server

``` bash
$ cd ~/ComputeEngine/jetsonNodeServer
$ node jetsonServer.js  
or
$ forever start jetsonServer.js

```

## License

[MIT](#)
