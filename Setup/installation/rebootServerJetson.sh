#Starting Compute-Engine
sleep 30
cd ~/ComputeEngine/jetsonNodeServer
forever start jetsonServer.js

#Starting Aggregator
cd ~/Aggregator
forever start aggregatorServer.js

