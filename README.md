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
2) Cloud component Packages uploaded ([setup guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%201%20Package%20Creation%201.0.0.pdf))
3) Azure B2C application ([setup guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%202%20B2C%20Setup%201.0.0.pdf))
4) Video Indexer ([setup guide](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%203%20Video%20Indexer%201.0.0.pdf))
##### 2.1.2 Hardware Pre-requisite for setup: 
1) Nvidia Jetson TX2 hardware 
2) Host machine with Linux (for flashing Nvidia Jetson)
3) Camera with RTSP URL 

### 2.2 Setup
#### 2.2.1 Software Setup
Ensure that the pre-requisites are met.
Simplest way to perform the software setup on Azure is to:
* Click the "Deploy to Azure" button 
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fsnsarm.blob.core.windows.net%2Fdeploy%2Fazuredeploy.json" target="blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

* Follow the guidelines provided in the following document ([PowerBI Setup](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%205%20PowerBI%20Deployment%201.0.0.pdf)) to configure PowerBI.
  
#### 2.2.2 Hardware Setup
Ensure that the pre-requisites are met.
Simplest way to complete hardware setup is to:
* Follow the guidelines provided in the following document ([Jetson Flashing](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/Step%206%20Jetson%20Flashing%201.0.0.pdf)) for flashing Nvidia jetson.
* Checkout [this](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance) repo on jetson terminals
* cd /SecurityAndSurveillance/Setup/installation
* sudo chmod +x install.sh (~ 30 mins)
* Run [./install.sh https://github.com/MobiliyaTechnologies](link) to install and setup aggregator and compute Engine.

### 2.3 Configuration 
* Refer [5.7b Start Aggregator](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/SnS_Installation%201.0.0.pdf) to configure and start Aggregator
* Refer [5.7b Start Compute Engine](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/SnS_Installation%201.0.0.pdf) to configure and start ComputeEngine
* cd ~/Aggregator
* $ forever start aggregatorServer.js
* cd ~/ComputeEngine
* $ forever start jetsonserver.js
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

