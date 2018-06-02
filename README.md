# 1.0 Security and Surveillance

This is the toplevel code of Mobiliya's Security & Surveillance project based on Microsoft Azure platform. 

This repository holds together all the source code, setup instructions & user guide which will allow developer to access, setup & get the solution functional on their Azure environment & hardware setup. User is requested to follow all instructions & guidelines for setting up the solution. 


## 2.0 Getting Started

For fully deploying the solution, we will require to perform following steps:
![Image of 4 step process for setup](https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/4%20Steps.png)

If you are looking to just browse through the source code, please refer to section 3.0 "Repository Structure"

### 2.1 Pre-requisites
##### 2.1.1 Software Pre-requisite for setup: 
1) Azure account with IoT subscription(link)
2) powerBI account with subscription (link)
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

* Follow the guidelines provided in the following document <insert document link> which will help to clarify any issues while setting up the Azure account.
  
#### 2.2.1 Hardware Setup
Ensure that the pre-requisites are met.

### 2.3 Configuration

### 2.4 Usage

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

