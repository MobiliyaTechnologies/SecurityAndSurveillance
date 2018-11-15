# Microsoft

# Security and Surveillance Solution

## Getting Started Manual

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/sns-gettingstarted.png)

### Table of Contents 

 - [1 Introduction](#1-introduction)
     - [1.1 Overview of Security and Surveillance Solution](#11-overview-of-security-and-surveillance-solution)
     - [1.2 Overview of IoT Solution](#12-overview-of-IoT-solution)
          - [1.2.1 Highlights](#121-highlights)
          - [1.2.2 Brief About the Solution](#122-brief-about-the-solution)         
- [2 IoT Solution](#2-IoT-solution)
    - [2.1 Core Architecture ](#21-core-architecture)
    - [2.2 Automated Solution](#22-automated-solution)
    - [2.3 Architectures](#23-architectures)
         - [2.3.1 Basic Architecture](#231-basic-architecture)
         - [2.3.2 Standard Architecture](#232-standard-architecture)
         - [2.3.3 Premium Architecture](#233-premium-architecture)
    - [2.4 Conventional Data work Flow Diagram](#24-conventional-data-work-flow-diagram)
    - [2.5 Azure Components and their Functionality](#25-Azure-components-and-their-functionality)
         - [2.5.1 IoT Hub](#251-IoT-hub)
         - [2.5.2 Event Hub](#252-event-hub)
         - [2.5.3 Web Application](#253-web-application)
         - [2.5.4 Azure Active Directory](#254-Azure-active-directory)
         - [2.5.5 Cosmos DB](#255-cosmos-db)
         - [2.5.6 OMS Log analytics](#256-oms-log-analytics)
         - [2.5.7 Application Insights](#257-application-insights)
         - [2.5.8 Power BI](#258-power-bi)
         - [2.5.9 Cognitive Services](#259-cognitive-services)
         - [2.5.10 Storage Account](#2510-storage-account)
- [3 Solution Type and Cost Mechanism](#3-solution-type-and-cost-mechanism)
    - [3.1 Solutions and Associated Costs](#31-solutions-and-associated-costs)
         - [3.1.1 Basic](#311-basic)
         - [3.1.2 Standard](#312-standard)
         - [3.1.3 Premium](#313-premium)
    - [3.2 Cost Comparison](#32-cost-comparison)
         - [3.2.1 In terms of features](#321-in-terms-of-features)
         - [3.2.2 Dollar Impact](#322-dollar-impact)
         - [3.2.3 Estimated Monthly Cost for each Solution](#323-estimated-monthly-cost-for-each-solution)
- [4 Further References](#4-further-references)
    - [4.1 Deployment Guide](#41-deployment-guide)
    - [4.2 User Guide](#42-user-guide)
    - [4.3 Admin Guide](#43-admin-guide)
   
## 1 Introduction

### 1.1 Overview of Security and Surveillance Solution

Security and surveillance solution is based on 3 pillars.

1. **Aggregator** – Connects with existing infrastructure. Fetches Camera streams and integrates them in system. A solution can consist of one or more aggregators.

2. **Compute Engine** – Core module responsible for detection and tracking. A solution can consist of one or more compute-engines.

3. **Backend Server** – REST API server which acts as a coordinator and gatekeeper for overall solution

### 1.2 Overview of IoT Solution

#### 1.2.1 Highlights

The rationale behind this IoT Solution for Security Surveillance is to:

1. Video stream from video sources like DVR (Digital Video Recorder) used with CCTV cameras, IP Cameras etc will sent to aggregator.

2. Aggregator will extract frames from the video stream and sends to Compute Engine for detection and tracking. Aggregator also sends these frames to IoThub and back-end server for displaying on the web application.

3. Compute Engine uses deep learning algorithms to detect humans, objects and face recognition. It generates bounding boxes around the detected entity and sends them to the back-end server.

4. Backend server aggregates various micro-services used for different use cases like detection, recognition, tracking and all the required values will be stored in database.

5. On-boarding/Off-boarding of devices/components connecting to wide range of video streams will be controlled using the Web application, web application allow user to select video source, area of interest for detection.

#### 1.2.2 Brief About the Solution

Security and Surveillance is a solution for detection, tracking and recognition of various objects and humans in live or recorded video streams to facilitate the task of surveillance and security involved with it. 

This solution provides base framework for Security and Surveillance (SnS). It is designed in modular way where every involved component acts independently. Due to its independent nature it can be easily tuned to solve problems specific to different domains. E.g. Retail, Security etc.

Security and Surveillance solution can be easily integrated in existing infrastructure (existing camera grid). No additional surveillance hardware is required. It can easily access and connect to existing DVRs to detect and capture stream from connected cameras. It can be configured to connect to IP cameras as well. 

Security and Surveillance will help user to detect and analyses Humans, Objects present in particular area of interest. Humans can be classified based on gender, age group etc. with help of face detection and recognition.  

Security and Surveillance solution can also be used to track and identify humans. It is also possible to track movement across different areas. Admin can view and analyze historical reports based on detection during specified duration. 

## 2. IoT Solution

### 2.1 Core Architecture

Below Diagram explains the Core architecture for Security Surveillance solution

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/g1.png)

Core Architecture components:

* IoT Hub
* Event Hub
* Storage Account
* Cognitive API
* Web Compute
* Rest API
* Web Frontend
* Cosmos DB
* Azure Active Directory
* Power BI

**NOTE**: Please refer [Section 2.5](#25-Azure-components-and-their-functionality) of this document for more details about the above components.

### 2.2 Automated Solution

Automated IoT Solution is designed on the top of current core architecture. In addition, this solution also provides **Monitoring** and **High Availability**.

This solution is deployed through ARM template. This is a single click deployment which reduces manual effort when compared with the existing solution.

In addition, this solution consists

* Application Insights to provide monitoring for Web Application. Application Insights store the logs of the Web API which will be helpful to trace the web API working.

* Log analytics to provide monitoring for IoT Hub, Cosmos DB. Log analytics store the logs, which will be helpful to trace the working of these resources.

* Geo-replication to provide high availability for Cosmos DB. Geo-replication is used to set the recovery database as the primary database whenever primary database is failed.

* This solution also provides Disaster Recovery activities. IoT Hub manual failover is helpful to make the IoT Hub available in another region, when IoT Hub of one region is failed.

* Traffic Manager delivers high availability for critical web applications by monitoring the endpoints and providing automatic failover when an endpoint goes down.

### 2.3 Architectures

#### 2.3.1 Basic Architecture

Basic solution will have all core components, in addition this solution also consists monitoring components like Application Insights and OMS Log Analytics. 

* Application Insights provide monitoring for Web API.

* OMS Log Analytics provide monitoring for IoT Hub, Event Hub, Cosmos DB, Cognitive API, Rest API, Web Compute, Web Front End, and Application Insight.

The below diagram depicts the dataflow between Azure components.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/g2.png)

Basic Architecture comprises of following components:

* 3-Web App
* 1-IoT Hub
* 1-Event Hub
* 4-Cognituve API
* 1-Cosmos DB
* 1-Storage
* 1-Azure Active Directory
* 1-Log Analytics
* 1-Application Insight

**NOTE**: Please refer [Section 2.5](#25-Azure-components-and-their-functionality) for more details about the above components.

#### 2.3.2 Standard Architecture

Standard Architecture diagram contains two regions.

1.	Primary Region(Deployment)

2.	Secondary Region (Re–Deployment)

We have IoT Hub manual failover, Cosmos DB geo replication and redeployment components. The effect of these components will occur when primary Region goes down.

The main use of this solution is whenever disaster recovery occurs the redeployment components will deploy in another region, user need to manually add the Web application as an endpoint to the Traffic Manager

The main use of this solution is whenever disaster recovery occurs the redeployment components will deploy in another region and user need to configure the redeployment components.

The below diagram depicts the dataflow between Azure components in Standard solution:

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/g3.png)

Standard Architecture comprises of following components:

* 6-Web Apps
* 1-IoT Hub
* 1-Event Hub
* 8-Cognitive API
* 1-Storage
* 1-Cosmos DB
* 1-Traffic Manager
* 1-Log Analytics
* 1-Application Insight
* 1-Azure Active Directory

**NOTE**: Please refer [Section 2.5](#25-Azure-components-and-their-functionality) for more details about the above components.

When there is a Region failover, user needs to redeploy ARM template provided in GIT Repo. When re-deployment completed successfully, below Azure resources will be deployed.

**Note**:  **Deployment process will take some time around 5-8 mins  to complete.**

#### 2.3.3 Premium Architecture

Premium Architecture diagram also contains two regions.

1. Primary Region

2. Secondary Region

All the components get deployed at once in the Premium architecture.

The below diagram depicts the dataflow between Azure components in Premium solution:

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/g4.png)

Premium Architecture comprises of following components:

* 6-Web Apps
* 1-IoT Hub
* 1-Cosmos DB
* 1-Event Hub
* 1-Storage
* 8-Cognitive API
* 1-Log Analytics
* 1-Application Insight
* 1-Traffic Manager
* 1-Azure Active Directory

**NOTE**: Please refer [Section 2.5](#25-Azure-components-and-their-functionality) for more details about the above components.

In this type of solution all resources including re-deployment components will be deployed.

This type of solution reduces downtime of solution when region is down.

### 2.4 Conventional Data Work Flow Diagram

The data flow is similar across all the solutions we have explained in [section 2.3] (#23-architectures)

The below diagram explains about the data flow between Azure components with in the solution.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/g5.png)

**Workflow:**

1. The Aggregator pulls the images from the Camera

2. Sends image for processing (Aggregator -> Compute). The purpose of compute engine is responsible for human and object detection.

3. Process image with selected algorithm/shape (Compute)

4. Send result of object detection with the image to the backend (Compute -> Backend)

5. Feed image with the result to DB (Backend)

6. Check if the respective camera with State; Open (Backend)

7. If YES send the image to Web app with the result (Backend -> Web App)

8. Show the image with camera result (Web App)

### 2.5 Azure Components and Their Functionality

This section will give a brief explanation of Azure component used in the solution and their functionality.

#### 2.5.1 IoT Hub

**Introduction**

Azure IoT Hub is a fully managed service that enables reliable and secure bi-directional communications between millions of IoT devices and an application back end.

Azure IoT Hub offers reliable device-to-cloud and cloud-to-device hyper-scale messaging, enables secure communications using per-device security credentials and access control, and includes device libraries for the most popular languages and platforms. Before you can communicate with IoT Hub from a gateway you must create an IoT Hub instance in your Azure subscription and then provision your device in your IoT Hub. Some samples in this repository require that you have a usable IoT Hub instance.

The Azure IoT Hub offers several services for connecting IoT devices with Azure services, processing incoming messages or sending messages to the devices. From a device perspective, the functionalities of the Azure IoT Hub enable simple and safe connection of IoT devices with Azure services by facilitating bidirectional communication between the devices and the Azure IoT Hub.

**Implementation**

IoT Hub is the core component of any IoT Solution. Let us try to understand how the IoT Hub is used in the solution. Aggregator device generates data and sends to IoT Hub. From IoT Hub the data will be sent backend server. And in case of the face recognition the identified images are sent to the Event Hub from IoT Hub and then to the backend server. For this in IoT Hub a route is configured with the query type="cloudComputeImages” 

#### 2.5.2 Event Hub

**Introduction**

Azure Event Hubs is a highly scalable data streaming platform and event ingestion service, capable of receiving and processing millions of events per second. Event Hubs can process and store events, data, or telemetry produced by distributed software and devices. Data sent to an Event Hub can be transformed and stored using any real-time analytics provider or batching/storage adapters.

**Implementation**

Event Hub is used to communicate with the web compute engine. All the message marked as “cloudComputeImages" will be sent to Event Hub from IoT Hub then these images will be sent to backend server for further processing.

#### 2.5.3 Web Application

**Introduction**

A Web application (Web app) is an application program that is stored on a remote server and delivered over the Internet through a browser interface.

Azure Web Apps enables you to build and host web applications in the programming language of your choice without managing infrastructure. It offers auto-scaling and high availability, supports both Windows and Linux, and enables automated deployments from GitHub, Visual Studio Team Services, or any Git repo.

Web Apps not only adds the power of Microsoft Azure to your application, such as security, load balancing, auto scaling, and automated management. You can also take advantage of its DevOps capabilities, such as continuous deployment from VSTS, GitHub, Docker Hub, and other sources, package management, staging environments, custom domain, and SSL certificates.

**Implementation**

This solution contains three web apps one is a frontend web app which is used for all the admin operations, second one is for the web compute engine which is used for text, face recognition and the third one is backend web app which interacts with all other components of the solution like aggregator, compute engine and docdb etc.

#### 2.5.4 Azure Active Directory

**Introduction**

Microsoft Azure Active Directory (Azure AD) is a cloud service that provides administrators with the ability to manage end user identities and access privileges. The service gives administrators the freedom to choose which information will stay in the cloud, who can manage or use the information, what services or applications can access the information and which end users can have access.

**Implementation**

Azure Active directory is used to authenticate users to login to Web Application. Azure active Directory enables secure authentications to web application.

#### 2.5.5 Cosmos DB   

**Introduction**

Azure Cosmos DB is a Microsoft cloud database that supports multiple ways of storing and processing data. As such, it is classified as a multi-model database. In multi-model databases, various database engines are natively supported and accessible via common APIs.

**Implementation**

In this Solution, Cosmos DB used to store the device information and detected data and user history all these data are stored in three collections under admin database.

#### 2.5.6 OMS Log analytics

**Introduction**

The Microsoft Operations Management Suite (OMS), previously known as Azure Operational Insights, is a software as a service platform that allows an administrator to manage on-premises and cloud IT assets from one console.

Microsoft OMS handles log analytics, IT automation, backup and recovery, and security and compliance tasks.

Log analytics will collect and store your data from various log sources and allow you to query over them using a custom query language.

**Implementation**

In this solution OMS is used for getting logs for each component like web app, Cosmos DB, Event Hub and cognitive services etc.

#### 2.5.7 Application Insights
  
**Introduction**

Application Insights is an extensible Application Performance Management (APM) service for web developers on multiple platforms. Use it to monitor live web application. It will automatically detect performance anomalies. It includes powerful analytics tools to help diagnose issues and to understand what users do with web application.

Application Insights monitor below:

* Request rates, response times, and failure rates

* Dependency rates, response times, and failure rates

* Exceptions 

* Page views and load performance

* AJAX calls

* User and session counts

* Performance counters

* Host diagnostics from Docker or Azure

* Diagnostic trace logs

* Custom events and metrics

**Implementation**

Application Insights to provide monitoring for Web Application. Application Insights store the logs of the Web API which will be helpful to trace the web API working.

#### 2.5.8 Power BI

**Introduction**

Power BI is a suite of business analytics tools that deliver insights throughout your organization. Connect to hundreds of data sources, simplify data prep, and drive ad hoc analysis. Produce beautiful reports, then publish them for your organization to consume on the web and across mobile devices. Everyone can create personalized dashboards with a unique, 360-degree view of their business. And scale across the enterprise, with governance and security built-in.

**Implementation:**

Power BI desktop is used to visualize the output of the solution. Power BI gathers data from Cosmos DB and presents in pictorial representation like bar charts or graphs. In this solution Power BI templates are used to generate the custom reports.
 
#### 2.5.9 Cognitive Services

**Introduction:**

Microsoft Cognitive Services are a set of APIs, SDKs and services available to developers to make their applications more intelligent, engaging and discoverable. Microsoft Cognitive Services expands on Microsoft’s evolving portfolio of machine learning APIs and enables developers to easily add intelligent features – such as emotion and video detection; facial, speech and vision recognition; and speech and language understanding – into their applications. Our vision is for more personal computing experiences and enhanced productivity aided by systems that increasingly can see, hear, speak, understand and even begin to reason.

**Implementation:**

In this solution Face API and Compute Vision are used for face detection and face recognition.

#### 2.5.10 Storage Account

**Introduction:**

Azure Storage is Microsoft's cloud storage solution for modern data storage scenarios. Azure Storage offers a massively scalable object store for data objects, a file system service for the cloud, a messaging store for reliable messaging, and a NoSQL store.

**Implementation:**

In this solution storage account is used to store the recognized images and streamed videos for video retention.

## 3. Solution Type and Cost Mechanism

### 3.1 Solutions and Associated Costs

The Automated solution provided by us covered in Section 2.3 will have the following costs associated. The solutions are created by considering users requirements & overall cost of the solution. User have control on what type of Azure resources need to be deployed with respect to SKUs and Costs. These options will let user to choose whether to deploy Azure resources with minimal SKUs or production ready SKUs. The Cost Models per solutions are explained in further sections

#### 3.1.1. Basic

The Basic solution requires minimum Azure components with minimal available SKU’s. This Solution provides (Core + Monitoring) features such as application Insights & OMS Log Analytics. The details on components used in this solution is listed in Section: 

* The Estimated Monthly Azure cost is: **$142.76**

**Pricing Model for Basic Solution:**

Prices are calculated by considering Location as **West US** and Pricing Model as **PAYG**.

| **Resource Name**           | **Size**       | **Resource costing model**    | **Azure Cost/month**                                                                                                                                 
| -------------              | -------------       | --------------------      | -------------------                                                                                                                           
| **Application Insights**       | Basic, 1GB * $2.30 First 5GB free per month   | PAYG         | $2.30  
| **App Service**   | Basic Tier; 1 B1 (1 Core(s), 1.75 GB RAM, 10 GB Storage) x 730 Hours; Windows OS   | PAYG    | $54.75  
| **IoT Hub**        | Standard Tier, S1: Unlimited devices, 4,00,000 msgs/day, $25.00/mo, 1 Units     | PAYG                 | $25.00    
| **Event Hubs**      | Standard tier: Maximum throughput units: 20. Up to 1 MB per second of ingress events. Up to 2 MB per second of egress events.1 million ingress events and 1 through put unit per month   | PAYG                        | $21.93
| **Storage Account**        | Block Blob Storage, Blob Storage, LRS Redundancy, Hot Access Tier, 100 GB Capacity, 100,000 Write operations, 100,000 List and Create Container Operations, 100,000 Read operations, 1 Other operations. 1,000 GB Data Retrieval, 1,000 GB Data Write      | PAYG   | $3.12   
| **Azure Cosmos DB**       | 0 GB storage, 4 x100 RUs          | PAYG          | $25.86 
| **Azure Active Directory B2C**       | 50,000 user(s), 50,000 authentication(s), 0 authentication(s)       | PAYG   | $0.00 
| **Log Analytics**   | First 5GB of data storage is free. Per GB(Standalone). After finishing 5GB, $2.30 per GB  | PAYG  | $2.30  
| **Cognitive Services**       | 2 * Face: Standard tier, 1,000 transactions (Up to 10 transactions per second) with 1,000 faces stored per month with $1.25 of each.          | PAYG          | $2.50
| **Cognitive Services**       | 2 * computer vision: S1, Up to 10 transactions per second. 1,000 transactions per one unit with $2.50 of each         | PAYG   | $5.00
| **Cognitive Services**       | Face API – Maximum transactions included in tier, Overage rate (per 1,000 transactions)        | PAYG   | $0.00
| **Total Cost/Month**   |   |  | **$142.76** 

#### 3.1.2 Standard

This Solution provides  features such as application Insights, OMS Log Analytics, High Availability, Security & Disaster recovery. The details on components used in this solution is listed in Section: 

* The Estimated Monthly Azure cost is: **$266.13**

**Pricing Model for Standard Solution:**

Prices are calculated by Location as **West US** and Pricing Model as **PAYG**.

| **Resource Name**           | **Size**       | **Resource costing model**    | **Azure Cost/month**                                                                                                                                 
| -------------              | -------------       | --------------------      | -------------------                                                                                                                           
| **App Service**   | 2* Standard tier S1 (1 Core(s), 1.75 GB RAM, 50 GB Storage) x 730 Hours; Windows OS($73.00 per App servcie)   | PAYG    | $146.00  
| **Traffic Manager**        | 0 million DNS queries/mo, 2 Azure endpoint(s), 0 Fast Azure endpoint(s), 0  External endpoint(s), 0 Fast External endpoint(s), 0 million(s) of user measurements, 0 million(s) of data points processed.     | PAYG                 | $0.72
| **IoT Hub**        | Standard Tier, S1: Unlimited devices, 400,000 msgs/day, $25.00/mo, 1 Units     | PAYG                 | $25.00 
| **Event Hubs**      | Standard tier: Maximum throughput units: 20. Up to 1 MB per second of ingress events. Up to 2 MB per second of egress events.1 million ingress events and 1 through put unit per month     | PAYG                        | $21.93 
| **Storage Account**        | Block Blob Storage, General Purpose V2, GRS Redundancy, Hot Access Tier, 100 GB Capacity, 1,00,000 Write operations, 1,00,000 List and Create Container Operations, 1,00,000 Read operations, 1 Other operations. 100 GB Data Retrieval, 100 GB Data Write, 100 GB Geo-replication data transfer         | PAYG   | $8.62  
| **Azure Cosmos DB**       | 0 GB storage, 4 x100 RUs          | PAYG          | $25.86 
| **Cognitive Services**       | 4 * Face: Standard tier, 1,000 transactions (Up to 10 transactions per second) with 1,000 faces stored per month with $1.25 of each          | PAYG          | $5.00  
| **Cognitive Services**       | 4* computer vision: S1, Up to 10 transactions per second.1,000 transactions per one unit with $2.50 of each          | PAYG   | $10.00 
| **Azure Active Directory B2C**       | 50,000 user(s), 50,000 authentication(s), 0 authentication(s)       | PAYG   | $0.00 
| **Log Analytics**   | First 5GB of data storage is free. Per GB(Standalone). After finishing 5GB, $2.30 per GB.here we are taking 10 gb storage    | PAYG  | $11.50
 | **Application Insights**       | Basic, 1GB * $2.30 First 5GB free per month.Here we are taking 10 GB storage        | PAYG   | $11.50
| **Total Cost/Month**   |   |  | **$266.13** 


#### 3.1.3 Premium

This solution provides the features as the Standard solution but all the components parallelly in two different regions. Premium solution also reduces the down time compared to Standard solution.

* The Estimated Monthly Azure cost is: **$266.13**

**Pricing Model for Premium Solution:**

Prices are calculated by Considering Location as **West US** and Pricing Model as **PAYG**.

| **Resource Name**           | **Size**       | **Resource costing model**    | **Azure Cost/month**                                                                                                                                 
| -------------              | -------------       | --------------------      | -------------------                                                                                                                           
| **App Service**   | 2 * Standard tier S1 (1 Core(s), 1.75 GB RAM, 50 GB Storage) x 730 Hours; Windows OS($54.75 per App servcie)   | PAYG    | $146.00   
| **Traffic Manager**        | 0 million DNS queries/mo, 2 Azure endpoint(s), 0 Fast Azure endpoint(s), 0  External endpoint(s), 0 Fast External endpoint(s), 0 million(s) of user measurements, 0 million(s) of data points processed.       | PAYG                 | $0.72
| **IoT Hub**        | Standard Tier, S1: Unlimited devices, 400,000 msgs/day, $25.00/mo, 1 Units     | PAYG                 | $25.00 
| **Event Hubs**      | Standard tier: Maximum throughput units: 20. Up to 1 MB per second of ingress events. Up to 2 MB per second of egress events.1 million ingress events and 1 through put unit per month     | PAYG                        | $21.93
| **Storage Account**        | 2* Block Blob Storage, General Purpose V2, GRS Redundancy, Hot Access Tier, 100 GB Capacity, 1,00,000 Write operations, 1,00,000 List and Create Container Operations, 1,00,000 Read operations, 1 Other operations. 100 GB Data Retrieval, 100 GB Data Write, 100 GB Geo-replication data transfer       | PAYG       | $17.24 
| **Azure Cosmos DB**       | 0 GB storage, 4 x100 RUs          | PAYG          | $25.86  
| **Cognitive Services**       | 4 * Face: Standard tier, 1,000 transactions (Up to 10 transactions per second) with 1,000 faces stored per month with $1.25 of each.               | PAYG          | $5.00  
| **Cognitive Services**       | 4 * computer vision: S1, Up to 10 transactions per second.1,000 transactions per one unit with $2.50 of each            | PAYG   | $10.00 
| **Azure Active Directory B2C**       | 50,000 user(s), 50,000 authentication(s), 0 authentication(s)       | PAYG   | $0.00 
| **Log Analytics**   | First 5GB of data storage is free. Per GB (Standalone). After finishing 5GB, $2.30 per GBFirst 5GB of data storage is free. Per GB(Standalone). After finishing 5GB, $2.30 per GB.here we are taking 10 gb storage        | PAYG  | $11.50
 | **Application Insights**       | Basic, 1GB * $2.30 First 5GB free per month.Here we are taking 10 GB storage       | PAYG   | $11.50 
| **Total Cost/Month**   |   |  | **$266.13**

### 3.2. Cost Comparison

In this section we will be comparing the cost for all the solution provided in terms of Features & $ Impact:

#### 3.2.1. In terms of features:

The below table explain the distinctive features available across solution types.


| **Resource Name**           | **Parameter**         | **Basic**                  | **Standard**            | **Premium**                                                                                                                 
| -------------               | -------------         | --------------------       | ------------            | ----------    
| App Service Plan            | SKU                   | B1                         | S1                      | S1
|                             | Cores                 | 1 core                     | 1 core                  | 1 core
|                             | RAM                   | 1.75 GB                    | 1.75 GB                 | 1.75 GB
|                             | Storage               | 10 GB                      | 50 GB                   | 50 GB 
|                             | OS                    | Windows OS                 | Windows OS              | Windows OS
| Traffic Manager             | DNS Queries           |                            | 0 million/month         | 0 million/month
|                             | Azure Endpoints       |                            | 2 Endpoints             | 2 Endpoints
|                             | Fast Interval HealthChecks Add-on (Azure)  |            | 0 Endpoints             | 0 Endpoints
|                             | External Endpoints    |                            | 0 Endpoints             | 0 Endpoints
|                             | Fast Interval Health Checks Add-on (External)      |                    | 0 Endpoints     | 0 Endpoints
|                             | Real User Measurements    |                        | 0 million measurements  | 0 million measurements
|                             | Traffic View          |                            | 0 million data points processed     | 0 million data points processed
| IoT Hub                     | SKU                   | S1                         | S1                      | S1
|                             | Devices               | Unlimited Devices          | Unlimited Devices       | Unlimited Devices
|                             | Messages              | 4,00,000 msgs/day          | 4,00,000 msgs/day       | 4,00,000 msgs/day
| Event Hubs                  | SKU                   | Standard                     | Standard                   | Standard
|                             | Ingress               | 1 million events           | 1 million events        | 1 million events
|                             | Throughput            | 1 throughputs              | 1 throughputs           | 1 throughputs
| Storage                     | Type                  | Block Blob Storage         | Block Blob Storage      | Block Blob Storage
|                             | REDUNDANCY            | LRS                        | GRS                     | GRS
|                             | Capacity              | 100 GB                     | 100 GB                  | 100 GB
|                             | Write Operations      | 100000 Operations          | 100000 Operations       | 100000 Operations
|                             | List and Create Container Operations      | 100000 Operations          | 100000 Operations       | 100000 Operations
|                             | Read operations       | 100000 Operations          | 100000 Operations       | 100000 Operations
|                             | All other operations  | 1 Operations               | 1 Operations            | 1 Operations
|                             | Data retrieval        | 1000 GB                    | 100 GB                 | 100 GB
|                             | Data write            | 1000 GB                    | 1000 GB                 | 1000 GB
| Cognitive Services (Face API)       | SKU                  | Standard                 | Standard                    | Standard
|                             || API              | Face, 1,000 faces stored per month.        | Face, 1,000 faces stored per month.    | Face, 1,000 faces stored per month.  
| Cognitive Services (Text Analytics)           | SKU               | S1                | S1                      | S1
|                             | API                   | computer vision, Up to 10 transactions per second. 1,000 transactions per one unit           | computer vision, Up to 10 transactions per second. 1,000 transactions per one unit         | computer vision, Up to 10 transactions per second. 1,000 transactions per one unit
| Azure Cosmos DB             | SKU                   | Standard                   |                | 
|                             | Storage               | 0 Storage                 |              | 
|                             | Purchase model        | 4 * 100 RU/sec             |          |
| Azure Active Directory B2C  | Stored users          | 50000 users                | 50000 users             | 50000 users
|                             | Authentications       | 50000 Authentications      | 50000 Authentications   | 50000 Authentications
|                             | Multi-Factor Authentications            | 0 Authentications         | 0 Authentications             | 0 Authentications
| Log Analytics               | Data Retention        | 6 GB, 5 GB of data is included for free.            | 6 GB, 5 GB of data is included for free.              | 6 GB, 5 GB of data is included for free.
| Application Insights        | Logs collected        | 6 GB, 5 GB of data is included for free.            | 6 GB, 5 GB of data is included for free.              | 6 GB, 5 GB of data is included for free.

#### 3.2.2 Dollar Impact

The below Table explains the $ impact for the solutions by resources.

| **Resource Name**           | **Basic**                  | **Standard**                 | **Premium**                                                                                                                
| -------------              | ------------------         | --------------------                       | ------------ 
| **App Service**                  | $54.75          | $54.75          | $146.00
| **IoT HUB**                      | $25.00          | $25.00	          | $25.00
| **Event Hubs**                   | $21.93          | $21.93	          | $21.93
| **Storage**                      | $3.12           | $8.62	          | $17.24
| **Cognitive Services(Face)**          | $2.50	         | $5.00	          | $5.00
| **Cognitive Services(Computer vision)**           | $5.00	         | $10.00	          | $10.00
| **Azure Cosmos DB**              | $25.86	         | 25.86	          | 25.86
| **Storage Account**              | $3.12	         | 8.62	          | 6.24
| **Azure Active Directory B2C**   | $0.00	         | $0.00	          | $0.00
| **Log Analytics**                | $2.30	         | $11.50	          | $11.50
| **Application Insights**         | $2.30	         | $11.50	          | $11.50
| **Traffic Manager**              | $0.00	         | $0.72          | $0.72

#### 3.2.3. Estimated Monthly Cost for each Solution

| **Resource Name**           | **Basic**                    | **Standard**                 | **Premium**                                                                                                                
| -------------              | ------------------------       | --------------------      | ------------ 
| Estimated monthly cost            | $142.76            | $266.13  	             | $266.13 

## 4. Further References

### 4.1 Deployment Guide

Deployment Guide explains about how to deploy Security and Surveillance using ARM Template. Refer [Deployment Guide](https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/Deployment-Guide.md) for more details.

### 4.2 User Guide

User Guide explains about how to use Security and Surveillance solution and verify outputs of the solution. Refer [User Guide](https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/User-Guide.md) for more details.

### 4.3 Admin Guide

Admin Guide explains about how to manage Azure resources and validate components once solution deployed successfully. Refer [Admin Guide](https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/admin-guide.md) for more details.
