
# 1.0 Security and Surveillance

This is the toplevel code of Mobiliya's Security & Surveillance project based on Microsoft Azure platform. 

This repository holds together all the source code, setup instructions & user guide which will allow developer to access, setup & get the solution functional on their Azure environment & hardware setup. User is requested to follow all instructions & guidelines for setting up the solution. 


## 2.0 Getting Started

For fully deploying the solution, we will require to perform following steps:
![Image of 4 step process for setup](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/4%20Steps.png)

If you are looking to just browse through the source code, please refer to section 3.0 "Repository Structure"

### 2.1 Pre-requisites
##### 2.1.1 Software Pre-requisite for setup: 
1) Azure account
2) Azure B2C application ([setup guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%202%20B2C%20Setup%201.0.0.pdf))
3) Video Indexer ([setup guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%203%20Video%20Indexer%201.0.0.pdf))
##### 2.1.2 Hardware Pre-requisite for setup: 
1) Xavier Board hardware 
2) Host machine with Linux (for flashing Xavier Board)
3) Camera with RTSP URL 

### 2.2 Setup
#### 2.2.1 Software Setup
Ensure that the pre-requisites are met.
Simplest way to perform the software setup on Azure is to:
* Click the "Deploy to Azure" button. Enter Video Indexer key and B2C application details acquired in earlier steps.
* Please refer to [Deployment Guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Quick%20ARM%20Deployment%201.0.1.pdf) for guidelines.
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fsnsarm.blob.core.windows.net%2Fdeploy%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

* Follow the guidelines provided in the following document ([PowerBI Setup](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%205%20PowerBI%20Deployment%201.0.0.pdf)) to configure PowerBI. (Can be done Later, prior to loading Reports)
  
#### 2.2.2 Hardware Setup
This step will only install required components on hardware. Refer step 2.2.3 for configuration step. 
Ensure that the pre-requisites are met.
Simplest way to complete hardware setup is to:
* Follow the guidelines provided in the following link ([Xavier Flashing](https://docs.nvidia.com/jetson/jetpack/index.html#jetpack/4.1.1/install.htm%3FTocPath%3D_____3)) for 
flashing Xavier Board.
Note : please confirm that you are downloading Jetpack 4.1.1 only
##### Opt1: Both Aggregator and Compute Engine on Xavier
* Open Terminal on Xavier and follow below steps to install Aggregator and ComputeEngine on Xavier. (will take ~30 mins)
``` 
    $ git clone -b xavierboard https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
    $ cd SecurityAndSurveillance/Setup/installation
    $ sed -i -e 's/\r$//' install.sh
    $ sudo chmod +x install.sh
    $ ./install.sh -r=https://github.com/MobiliyaTechnologies
```
##### Opt2: Separate installation
* Open Terminal on Xavier and follow below steps to install only ComputeEngine on Xavier. (Aggregator should be installed on another machine)
``` 
    $ git clone -b xavierboard https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
    $ cd SecurityAndSurveillance/Setup/ComputeEngine
    $ sed -i -e 's/\r$//' install.sh
    $ sudo chmod +x install.sh
    $ ./install.sh
```
* Open Terminal on Hostmachine (preferably Ubuntu) and follow below steps to install Aggregator.
``` 
    $ git clone -b xavierboard https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
    $ cd SecurityAndSurveillance/Setup/Aggregator
    $ sed -i -e 's/\r$//' install.sh
    $ sudo chmod +x install.sh
    $ ./install.sh
```

### 2.3 Configuration (required)
We will configure installed software components. We can start these components once configured.
* Refer following steps to configure Aggregator
```
    $ cd ~/Aggregator
    $ vi config.js
    Update config.aggregatorName and config.location
    Update following placeholder with values acquired in previous steps (deployment)
        <IOTHubConnectionString> => IoT Hub connection string
        <storageAccountName> => Storage Account Name
        <storageAccountAccessKey> => Storage Account Access Key
        <backendUrl> => Backend Url (should start with https://)
        <videoIndexingSubscriptionKey> => Video Indexer api key
```
    
* Refer following steps to configure ComputeEngine
```
    $ cd ~/ComputeEngine/jetsonNodeServer
    $ vi settings.js
    Update config.name and config.location
    Update following placeholder with values acquired in previous steps (deployment)
        <IOTHubConnectionString> => IoT Hub connection string
        <storageAccountName> => Storage Account Name
        <storageAccountAccessKey> => Storage Account Access Key
        <backendUrl> => Backend Url (should start with https://)
```
* Follow below steps to start Aggregator and ComputeEngine
```
    $ cd ~/Aggregator
    $ forever start aggregatorServer.js
    $ cd ~/ComputeEngine
    $ forever start jetsonserver.js
```
* Login to Web portal with 'Admin' account.
* Update PowerBI configuration (Reports->Configuration) for 'Reports' and save configuration.
* Update PowerBI configuration (Reports->Configuration) for 'Face Recognition' and save configuration.

### 2.4 Usage
* Please refer to [Demo Video](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Demo_Guide.mp4) for solution overview.

## 3.0 Repository Structure 
Following are the different repositories constituting the solution:
1) [Aggregator](https://github.com/MobiliyaTechnologies/Aggregator): Module to pull images from camera and make it available for Compute Engine.
2) [ARMTemplate](https://github.com/MobiliyaTechnologies/SnSARMTemplates): Azure Resource Manager template for the solution.
3) [ComputeEngine](https://github.com/MobiliyaTechnologies/ComputeEngine): Process captured image.
4) [FaceComputeEngine](https://github.com/MobiliyaTechnologies/FaceComputeEngine): Compute engine for face derection and recognition.
5) [PowerBI](https://github.com/MobiliyaTechnologies/SnSPowerBI): Reports & visualization templates.
6) [RESTServer](https://github.com/MobiliyaTechnologies/SnSRESTServer): Backend server for the solution.
7) [WebApp](https://github.com/MobiliyaTechnologies/SnSWebApp): Frontend web application for the solution.

## 4.0 Reporting of Issues
Please report any issue on issues page.

