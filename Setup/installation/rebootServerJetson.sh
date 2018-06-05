#Starting Compute-Engine
cd ~/ComputeEngine/jetsonNodeServer
forever start jetsonServer.js

#Starting Aggregator
cd ~/Aggregator
forever start aggregatorServer.js

