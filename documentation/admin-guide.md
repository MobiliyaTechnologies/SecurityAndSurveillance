# Microsoft

# Security and Surveillance Solution

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/sns-admin.png)

### Table of Contents

- [1 Admin Guide](#1-admin-guide)     
- [2 Enable Cosmos DB Preview feature](#2-enable-Cosmos-db-preview-feature)
- [3 Update Traffic manager URL in Azure B2C](3#-update-traffic-manager-url-in-Azure-b2c)
- [4 Connect Camera](#4-connect-camera)
- [5 Add Floor Map](#5-add-floor-map)
- [6 Face Detection](#6-face-detection)
- [7 Verify Aggregator](#7-verify-aggregator)
- [8 Verify Compute Engine](#8-verify-compute-engine)
- [9 Face Recognition](#9-face-recognition)
- [10 Human Detection](#10-human-detection)
- [11 Object Detection](#11-Object-detection)
- [12 Configuring Power BI](#12-configuring-power-bi)
    - [12.1 Apply Permissions to your application within Azure AD](#121-apply-permissions-to-your-application-within-Azure-ad)
    - [12.2 Publish Power BI Reports](#122-publish-power-bi-reports) 
    - [12.3 Retrieve Report ID of the published report](#123-retrieve-report-id-of-the-published-report)
    - [12.4 Configure Reports in Web App](#124-configure-reports-in-web-app)
- [13 Monitoring Components](#13-monitoring-components)
    - [13.1 Application Insights](#131-application-insights)
    - [13.2 OMS Log Analytics](#132-oms-log-analytics)
- [14 Hardening Components](#14-hardening-components)
    - [14.1 Application HA](#141-application-ha)
- [15 Performing DR Strategies](#15-performing-dr-strategies)
    - [15.1 Standard Solution Type](#151-standard-solution-type)
        - [15.1.1 Accessing the web application](#1511-accessing-the-web-application)
        - [15.1.2 Re-Deploy the Region-2 ARM Temple](#1512-re-deploy-the-region-2-arm-temple)
        - [15.1.3 Standard Solution HA](#1513-standard-solution-ha)
        - [15.1.4 Event Hub failover](#1514-event-hub-failover)
        - [15.1.5 IoT Hub Manual Failover](#1515-IoT-hub-manual-failover)
     - [15.2 Premium Solution Type](#152-premium-solution-type)
        - [15.2.1 Accessing the web application](#1521-accessing-the-web-application)
        - [15.2.2 Premium Solution HA](#1522-premium-solution-ha)
        - [15.2.3 Event Hub failover](#1523-event-hub-failover)
        - [15.2.4 IoT Hub Manual Failover](#1524-IoT-hub-manual-failover)  
        
 
   
## 1. Admin Guide

This Document explains how to use the Security and Surveillance solution. In addition to the user document, this provides verifying data in resources, updating SKUs, securing steps for the resources and performing DR activities for Standard and Premium solutions.

**Note**: This document assumes that the solution is already deployed through ARM using the Deployment Guide.


## 2. Enable Cosmos DB Preview feature 

Before Login into the web app you need to enable the Cosmos DB Preview features, to do that follow the below steps.

1. Go to **Resource Group** -> Click on **Cosmos DB** resource i.e. coredocdbf7qu4.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u4.png)

2.	Now it will direct to **Overview** page of the Cosmos DB. 

3.	Click on **Preview Feature** from the **Settings** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u5.png)

4.	Click on **Enable** as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u6.png)

5.	Now you can see that the Preview Features enabled for Cosmos DB.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u7.png)

## 3. Update Traffic manager URL in Azure B2C

1. Copy the **Traffic Manager DNS** and paste in the **Replay URL** section in Azure AD B2C Application and click **Save**.

**Note**: You can perform this step only if you choose **Standard** and **Premium solution**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u8.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u9.png)

## 4. Connect Camera

1. Go to **Resource Group** -> Click on **Web App** from the below resources.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u10.png)

2. Copy the **web app URL** and open it in browser.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u11.png)

**Note**: Before login into the Web App, update the reply URL in your B2C tenant Application with the Web App URL.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u12.png)

3. Click on **Sign In** .

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u13.png)

4. If you don’t have access to the Web App please **sign up and sign in**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u14.png)

5. Now you can see the landing page  of the **Web Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u15.png)

6. Click on **Next** till you can view the **Connect Your Camera Now option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u16.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u17.png)

7. Click on **Connect your Camera** Now button to view the dashboard.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u18.png)

## 5 Add Floor Map

1. Now you need to upload the Floor map. Fill the **Map name** and click on **Click to browse**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u21.png)

2. Choose **floor map** from your local system and upload.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u22.png)

3. Here you can see the **uploaded image** and able to position the camera in the map.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u23.png)

## 6 Face Detection

1. Connect your camera by going to **Device management --> Cameras** then click on **Connect Camera** button

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u19.png)

2.	Now you need to add the following details like streaming URL (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u20.png)

3. Here you can choose the Area to mark. We have a Drop-down list to choose the type of Detection to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u24.png)

4. After click on marker and mark the area you will get a Marker Properties pop-up.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u25.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u26.png)

5. Here you can fill the following details and click on **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u27.png)

6. Click on **Start Streaming option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u28.png)

7. If you want to save the video click **YES** or else click **NO**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u29.png)

8.	Here you can see the dashboard of the web application. Click on **Live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u30.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u31.png)

9. Click on **Video Icon** to view the live streaming.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u32.png)

10.	Click on Maximize Icon to view the video in full screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u33.png)

11.	Here you can view the video in full screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u34.png)  

12.	Once the video stream is up you can see the **Detected faces** if any surrounded by a **Square marker**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u35.png)  

13.	In the following screen you can to see the **detected faces** count and the marker details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u36.png)

14.	Once you done the detection you can stop the streaming using **Stop Streaming** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u37.png)

Follow the above steps to add **multiple camera’s** with different **aggregators** and **compute engines**.

## 7. Verify Aggregator

1. Click on **Device management** in left side menu and click on **Aggregator** here you can see the **aggregator details**.

**Note**: If you want add aggregator manually, you can click on right side button to add the aggregator.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u38.png)

## 8. Verify Compute Engine

1. Click on **Device management** in left side menu and click on **Compute Engine** here you can see the compute engine details.

**Note**: If you want add compute engine manually, you can click on right side button to add the compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u39.png)

2. Now choose the **compute engine** to keep them available.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u40.png)

## 9. Face Recognition

1. You can add another video stream with aggregator and compute engine for face recognition. To do the we need to add the camera with another stream by going to **Device management -> Cameras** then click on **Connect Camera** button

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u41.png)

2. Now you need to add the following details like streaming URL (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u42.png)

3. Once the page loads you need to select the **Face Recognition** in the drop down then select the area of interest for face recognition. You will get a Marker Properties pop-up enter the Marker properties.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u43.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u44.png)

4. Click on **Start Stream**. You will get a pop-up to **Save** video, click on **No** if you don’t want to save the video otherwise click on **Yes**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u45.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u46.png)

5. Now you can see the **live camera** count increased by one.  

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u47.png)

6. Click on the added camera to view the live stream.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u48.png)

7. In the **Live stream** you can see the **detected Image** with square marker along with the detected details. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u49.png)

8. Now you need to click on the **Face Recognition**, it will display the detected images. You need to enter the name and age then Save them for further recognition. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u50.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u51.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u52.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u53.png)

9. After saving the details if you stream again, now the stream shows the recognized face details with Name and age in the square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u54.png)

## 10 Human Detection

1. Click on **Camera** -> Click **Connect Camera** in the right side. Fill the following fields Streaming URL, Device Name, Device Type, Aggregator, Compute Engine and Location and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u55.png)

2. Once the page loads you need to select the **Human Detection** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the Marker properties.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u56.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u57.png)

3. Fill the following fields and select **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u58.png)

4. Click on **Start Stream**. You will get a pop-up to **Save** video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u59.png)

5. Click **No** if you don’t want to save the video otherwise **YES** to continue.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u60.png)

6. Now you can see the **Live camera count** increased by one.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u61.png)

7. Click on the added camera to view the **live stream**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u62.png)

8. In the **Live stream** we could see the live stream and the detected details on the right side as shown below. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u63.png)

## 11. Object Detection

1. Click on **Camera** -> Click **Connect Camera** in the right side. Fill the following fields Streaming URL, Device Name, Device Type, Aggregator, Compute Engine and Location and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/object.png)

2. Once the page loads you need to select the **Object Detection** in the drop down then select the area of interest for **face recognition**. You will get a **Marker Properties** pop-up enter the Marker properties.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u66.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u67.png)

3. Click on **Start Stream**. You will get a pop-up to **Save video**, click on **No** if you don’t want to save the video otherwise click **Yes**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u68.png)

4. Now you can see the **live camera count** increased by one.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u69.png)

5. Here you can see the **live camera** details. Select **Cam4** to open the live streaming for human details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u70.png)

6. In the **Live stream** you could see the live stream and the detected details on the right side as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u71.png)

## 12 Configuring Power BI 

### 12.1 Apply Permissions to your application within Azure AD

1.	Go to https://dev.PowerBI.com/apps and register the **Web App**.

a. Login to your **PowerBI account** with the Azure Login credentials that have **Global admin permissions**.

b. Provide a **name** for your Web App (This is different from what you created before).

c. Select **App type** as **“server-side Web App”**.

d. Enter the Redirected URL and Home URL, same as you gave in Azure AD B2C tenant **Reply URL** without **“/redirect.html”** for **Home URL**.

e. If you want to deploy **Basic Solution**, give **Rest Server Web App URL** without **“/redirect.html”** for **Home URL**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u72.png)

f. Select check boxes for required API’s (choose all check boxes for best practice).

* Read all datasets

* Read and write all data sets

* Read all dashboards

* Read all reports

* Read and Write all reports

* Read all Groups

* Create content

g. Click **Register App**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u73.png)

h. The **Client ID** and **Client Secret** key will be generated. Note down these keys to use later in the configuration.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u74.png)

i. The **Client ID** and **Client Secret** key will be generated. Note down these keys to use later in the configuration.

2. Go to **Azure Active Directory** from your Azure account and click the **App registrations** tab. Select the App you just created in **PowerBI**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u75.png)

**NOTE**: To grant permissions to the App you must be a **Global Administrator** in the Tenant.

3. Click on the App, navigate to **Settings**, and provide the **required permissions**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u76.png)

4. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u77.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u78.png)

5. Within Required permissions, select **Power BI Service** (Power BI).

6. Select all permissions under **Delegated Permissions.** Select **Save** when done.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u79.png)

7.	Within Required permissions, select **Grant Permissions**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u80.png)

### 12.2 Publish Power BI Reports

1.	Download and open the **Power BI template** files from the **GIT repository** and follow all the steps below for each template file. 

*https://github.com/MobiliyaTechnologies/SecurityAndSurveillancePowerBI/blob/master/Templates/*

2.	Enter **Cosmos DB URI** and **Cosmos DB Name** to connect back-end with the report.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u81.png)

3. To get the above details, click on **resource group** and select **Cosmos DB**. 

Locate the URI as highlighted below and paste the same in the Power BI Template file.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u82.png)

4. Go back to the browser window and under **Settings**, click on **Connection String** and note down the **Primary Password**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u83.png)

5. Go to **Power BI Desktop** screen and Click on Load and you will be prompted for **Account Key** of **Cosmos DB**, enter the key noted down in the last step and click on **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u84.png)

6. After the data has loaded successfully.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u85.png)

7. Click on **Human Detection** and see the detected faces counts and visuals.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u86.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u87.png)

8. Here we can see the **Face Recognition** counts and **visuals**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u88.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u89.png)

9. Here we can see the **Object Detection** counts and **visuals**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u90.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u91.png)

10. Now click on **Publish**. You will be prompted to enter the Power BI account credentials. Enter the same and choose a workspace where you want the report to be. Default is **My Workspace** if you have not created any.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u92.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u93.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u94.png)

11. Click on Open created **pbit.pbix** in Power BI.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u95.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u96.png)

### 12.3 Retrieve Report ID of the published report

1. Click on **My Workspace** and go to **Reports** section and open the report which was published in Above step.  

2. If you have published report in some other **workspace** then click on **Workspaces** > “Your Workspace Name” >Reports and then open the report.

3. Note down the **Report ID** shown in the browser URL window. Report ID starts after../reports/ and before /Report Section. 
 
4. If you have published report in some other workspace, then Note down the **Group ID** also as shown below. Group ID starts after../groups/ and before /reports.

5. Final URL which is used to embed the report has the following structure: If report is in My Workspace: https://app.powerbi.com/reportEmbed?reportId={Your Report ID}.  

If report is in other workspace: https://app.powerbi.com/reportEmbed?reportId={Your Report ID}&groupId={Your Group ID}.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u97.png)

### 12.4 Configure Reports in Web App

1. Go back to web application and click on **Reports** section.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u98.png)

2.	Fill the following details and click on **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u99.png)

3.	Check the following **reports**, the published report can be viewed in the web app 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u100.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u101.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u102.png)

## 13	Monitoring Components

### 13.1.	Application Insights

1.	Go to **Azure portal**-->**Resource Group**-->**Rest Server Web App**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a1.png)

2.	Here click on the **Application insight**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a2.png)

3.	Click on **Setup Application Insight** for **rest server** web app.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a3.png)

4.	Select following in the **application insight** and click **Ok** button it will navigating to the popup window.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a4.png)

5.	Click **Continue** 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a5.png)

6.	Here application insight connected to the following web application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a6.png)

7.	Update setup same as the **compute engine** web application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a7.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a8.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a9.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a10.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a11.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a12.png)

8.	Go to **Resource group** and click on **application insight**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a13.png)

9.	On **Overview** page, Summary details are displayed as shown in the following figure.

10.	Click **Performance** on the left side of the page as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a14.png)

11.	Click on **profile** in top right side we can see the configured web apps.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a15.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a16.png)

12.	For frontend web app we did the SDK implementation for application insight monitoring.

13.	Go back to **Overview** page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a17.png)

**Failover**

14.	Click on **Failure** on the left side of the page as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a18.png)

15.	Click on **View in Analytics** and select any of the analytics.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a19.png)

16.	After click on **request count**, it will open a new tab with some default queries & chart.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a20.png)


**Performance**

17.	Go back to the **application insight** and click on **performance** and select **Request time** in the following screenshot.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a21.png)

18.	After click on that **Request time**, it will open a new tab with some default queries & chart for the same.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a22.png)

19.	Click on **Request** it will open a new tab with request and response operations.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a23.png)

20.	Click **Chart** icon it should be display default queries & chart.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a24.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a25.png)

**Metric preview**

21.	Then select **metric** explorer from the left menu.

22.	Here you need to select the resource from the **drop-downl ist**, select the **metric** what you want to give and select the **aggregation** as per requirement.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a26.png)

23.	Here we can see the graph after specifying our need.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a27.png)

**Application Map**

24.	**Application Map** helps you spot **performance bottlenecks** or **failure hotspots** across all components distributed application.

25.	After click on application map you can see the screen like below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a28.png)

26.	When we click on **AppInsghtsovnpp** it will open popup window in right side and click on **Investigate Performance** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a29.png)

27.	To check the logs, click on the **chart** of which you want to see the logs then you will get the logs of each request as shown in below figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a30.png)

28.	Click **Analytics** icon as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a31.png)

29.	It will display the request and response quires and tables. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a32.png)

**Live Metrics Stream**

Click on **live metric stream** to view the incoming requests, outgoing requests, overall health and servers of web application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a33.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a34.png)

### 13.2.	OMS Log Analytics

1.	Open **Azure Portal** -> **Resource Group** -> Click the **OMS Workspace** in resource group to view OMS Overview Section. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a35.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a36.png)

2.	Click **Azure Resources** on left side menu to view available Azure Resources. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a37.png)

3.	Select your **Subscription** and **Resource Group** name from the dropdown list. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a38.png)

4.	Go to overview blade and click on **OMS Portal** as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a39.png)

5.	Once you click **OMS Workspace**, OMS Home Page will take few seconds to load and displayed as below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a40.png)

6.	Click on **Azure web apps analytics** here you can see the request and responses deprecated.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a41.png)

7.	Click on **Search tab** and search for the **IoT hub, Event Hub, Cosmos DB, Face API, Vision API, Web Apps**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a42.png)

8.	Click on **Search** icon to search the resources.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a43.png)

9.	Copy **IoT Hub** resource name, paste it in the **search** box and click **RUN**. 

10.	The IoT Hub information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a44.png)

11.	Copy first **Event Hub** resource name, paste it in the **search** box and click **RUN**. 

12.	The Event Hub information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a45.png)

13.	Copy second **Event Hub** resource name, paste it in the **search** box and click **RUN**. 

14.	The Event Hub information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a46.png)

15.	Copy **Cosmos DB** resource name, paste it in the **search** box and click **RUN**. 

16.	The Cosmos DB information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a47.png)

17.	Copy Basic **Face API** resource name, paste it in the **search** box and click **RUN**.

18.	The Face API information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a48.png)

19.	Copy **Basic Vision API** resource name, paste it in the **search** box and click **RUN**. 

20.	The Vision API information is displayed below the page as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a49.png)

21.	Copy **Standard Face API** resource name, paste it in the **search** box and click **RUN**. 

22.	The Face API information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a50.png)

23.	Copy **Standard Vision API** resource name, paste it in the **search** box and click **RUN**. 

24.	The Vision API information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a51.png)

25.	Copy **Web App** resource name, paste it in the **search** box and click **RUN**. 

26.	The Web App information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a52.png)

27.	Copy **Rest Server App** resource name, paste it in the **search** box and click **RUN**. 

28.	The Rest Server App information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a53.png)

29.	Copy **Compute Engine Web App** resource name, paste it in the **search** box and click **RUN**. 

30.	The Compute Engine Web App information is displayed below the page as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a54.png)

## 14.	Hardening Components

### 14.1.	Application HA

1.	Go to **Resource group** -> Click on **Web App**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a55.png)

2.	Click on **Stop** button to stop the web application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a56.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a57.png)

3.	Go to **resource group** and click on **traffic manager** then you can see the primary web stopped.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a58.png)

4.	Copy the **traffic manager URL** and check the flow.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a59.png)

5.	The primary web has stopped as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a60.png)

6.	Copy the **Traffic Manager DNS** and past in the **Reply URL** section in **Azure AD B2C Application** and click **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a61.png)

7.	Now you can refresh the page. It should navigating to the **login page**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a62.png)

8.	Enter the following sign up credentials, it should redirect to **dashboard** page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a63.png)

9.	Here you can see the dashboard of the web application. Click on **Live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a64.png)

10.	In the following screen we can see the detected human count and the marker details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a65.png)

11.	Go back to the **resource group** and click on **rest server** application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a66.png)

12.	And also stop the rest server web application in the following screen we can able to see the detected human count and the marker details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a67.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a68.png)

13.	Go back to the **resource group** and click on **Compute Engine Web application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a69.png)

14.	And also stop the compute engine web application in the following screen we can able to see the detected human count and the marker details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a70.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a71.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a72.png)

15.	Follow the below steps for doing the Event Hub manual failover.

16.	Go to **Resource Group** -> Click on **Event Hub**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a73.png)

17.	Go to **Geo-Recovery** in the left side menu.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a74.png)

18.	Click on **Failover**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a75.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a76.png)

19.	Enter **Alias name** and click **Failover** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a77.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a78.png)

20.	Go to back to **resource group** and click on **secondary Event Hub namespace** and see the **secondary namespace** will changed as primary namespace.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/admin-sub.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a80.png)

21.	Go to **Resource group** -> click on **IoT Hub**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a81.png)

22.	In **Overview** section click on **Message routing**. 

23.	Click on **Custom endpoints** and you can see the Event Hub status has **Healthy**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a82.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a83.png)

24.	Click on **Routes** and click **+ Add** to create a routes.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a84.png)

25.	Enter **Name** and click on **+ Add** button to add the Event Hubs endpoints.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a85.png)

26.	Enter **name**, secondary **Event Hub namespace** and **Event Hub instance** and click **Create**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a86.png)

27.	Enter the **Routing query** and click **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a87.png)

28.	Now you can see the Added **message routing**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a88.png)

29.	Here we stopped all the primary web apps and Event Hub failover.

30.	Now you can update **rest server DR URL** into **aggregator config.js** file and **compute engine setting.js** file then you should run them.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a89.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a90.png)

31.	Now you can check the web application.

32.	Here all cameras are stopped because before we used primary rest server in aggregator and compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a91.png)

33.	Add new camera to check the workflow.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a92.png)

34.	Fill the following details and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a93.png)

35.	Here you can choose the Area to mark. We have a Drop-down list to choose the type of **Human Detection** to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a94.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a95.png)

36.	Click on **Start streaming** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a96.png)

37.	If you want to save the video click YES or else click NO.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a97.png)

38.	Once the video stream is up you can see the Detected faces if any surrounded by a Square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a100.png)

## 15.	Performing DR Strategies

### 15.1.	Standard Solution Type

In this scenario, there is again a primary and a secondary Azure region. All the traffic goes to the active deployment on the primary region. The secondary region is better prepared for disaster recovery because the database is running on both regions. 
Only the primary region has a deployed cloud service application. Both regions are synchronized with the contents of the database. When a disaster occurs, there are fewer activation requirements. You redeploy Azure resources in the secondary region.
Redeployment approach, you should have already stored the service packages. However, you don’t incur most of the overhead that database restore operation requires, because the database is ready and running.  This saves a significant amount of time, making this an affordable DR pattern.

Standard Solution requires redeployment of Azure resources in secondary region when the primary region is down.
When user chooses Standard Solution type below Azure resources will be deployed 

•	3-Web Apps

•	8-Cognitive API

•	Application insights

•	Azure Cosmos DB

•	IoT Hub

•	Event Hub

•	Storage Account 

•	Log analytics

•	Azure Active Directory 

When Primary region is down, and user needs to redeploy Azure resources to new region. Once redeployment gets completed below resources will get deployed.

•	3-Web Apps

•	4-Cognitive API

*Refer 4.1 and 4.2 Section in Deployment Guide for Standard Solution Deployment.*

#### 15.1.1.	Accessing the web application

1.	Go to **Resource Group** -> Click on **Traffic Manager** from the below resources

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a101.png)

2.	Copy the **DNS name** and open it in **browser**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a102.png)

3.	Before login into the **Web App URL** please update the **reply URL in your B2C tenant Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a103.png)

4.	Now you can see the landing page of **Web Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a104.png)

After opening the web application, you can verify the application flow like adding camera, verifying aggregator, verifying compute engine, face detection, human detection as mentioned in the above sections 4,5,6,7,8,9,10,11 and 12

#### 15.1.2.	Re-Deploy the Region-2 ARM Temple

1.	Go to the **GitHub** and select **re-deploy.json** file from **master branch**. Copy the **re-deploy.json template**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a105.png)

2.	Click on **Add** in existing Resource Group.

**Note**: Please enter the **deployment prefix** same as the main deployment.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a106.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a107.png)

#### 15.1.3.	Standard Solution HA

After the re-deployment, you need to go newly created resources in the same resource group and perform application HA as discussed in **section 14.1. Application HA from point 1 to 14**.

#### 15.1.4.	Event Hub failover

1.	Follow the below steps for doing the Event Hub manual failover.

2.	Go to **Resource Group** -> Click on **Event Hub**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a108.png)

3.	Go to **Geo-Recovery** in the left side menu.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a109.png)

4.	Click on **Failover**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a110.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a111.png)

5.	Enter **Alias name** and click **Failover** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a112.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a113.png)

6.	Go to back to **resource group** and click on **secondary Event Hub namespace** and see the **secondary namespace** will changed as primary namespace.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a114.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a115.png)

#### 15.1.5.	IoT Hub Manual Failover

7.	Go to **Resource group** -> click on **IoT Hub**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a116.png)

8.	In **Overview** section click on **Message routing**. 

9.	Click on **Custom endpoints** and you can see the Event Hub status has **Healthy**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a117.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a118.png)

10.	Click on **Routes** and click **+ Add** to create a routes.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a119.png)

11.	Enter **Name** and click on **+ Add** button to add the Event Hubs endpoints.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a120.png)

12.	Enter **name**, **secondary Event Hub namespace** and **Event Hub instance** and click **Create**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a121.png)

13.	Enter the **Routing query** and click **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a122.png)

14.	Now you can see the Added **message routing**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a123.png)

15.	Here we stopped all the primary web apps and Event Hub failover.

**Note**: This process will take around **15 mins**. To initial failover again, user needs to wait for 1 hour to run failover again.

16.	Now you can update **rest server DR URL** into **aggregator config.js** file and **compute engine setting.js** file then you should run both the **VM’s**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a124.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a125.png)

17.	Now you can check the web application.

18.	Here all cameras are stopped because before you used primary rest server in aggregator and compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a126.png)

19.	Add new camera to check the workflow.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a127.png)

20.	Fill the following details and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a128.png)

21.	Here you can choose the Area to mark. You have a Drop-down list to choose the type of **Human Detection** to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a129.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a130.png)

22.	Click on **Start streaming** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a131.png)

23.	If you want to save the video click YES or else click NO.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a132.png)

24.	Here you can see the dashboard of the web application. Click on **live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a133.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a134.png)

25.	Once the video stream is up we can see the **Detected faces** if any surrounded by a Square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a135.png)

26.	Here we can’t edit before we used camera because we changed the aggregator config file.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a136.png)

### 15.2.	Premium Solution Type

#### 15.2.1.	Accessing the web application

1.	Go to **Resource Group** -> Click on **Traffic Manager** from the below resources

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a137.png)

2.	Copy the **DNS name** and open it in browser.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a138.png)

3.	Before login into the **Web App URL** please update the **reply URL** in your **B2C tenant Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a139.png)

4.	Now you can see the landing page of the **Web Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a140.png)

#### 15.2.2.	Premium Solution HA

To achieve HA when the *primary region* fails we need to use *secondary region*(DR) components from the *same resource group* where all DR components were deployed as part of the *Premium solution* as discussed in section 14.1. Application HA from point 1 to 14..

#### 15.2.3.	Event Hub failover

1.	Follow the below steps for doing the Event Hub manual failover.

2.	Go to **Resource Group** -> Click on **Event Hub**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a141.png)

3.	Go to **Geo-Recovery** in the left side menu.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a142.png)

4.	Click on **Failover**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a143.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a144.png)

5.	Enter **Alias name** and click **Failover** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a145.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a146.png)

6.	Go to back to **resource group** and click on **secondary Event Hub namespace** and see the **secondary namespace** will changed as primary namespace.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a147.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a148.png)

#### 15.2.4.	IoT Hub Manual Failover

7.	Go to **Resource group** -> click on **IoT Hub**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a149.png)

8.	In **Overview** section click on **Message routing**.

9.	Click on **Custom endpoints** and you can see the **Event Hub** status has **Healthy**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a150.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a151.png)

10.	Click on **Routes** and click **+ Add** to **create a routes**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a152.png)

11.	Enter **Name** and click on **+ Add** button to add the **Event Hubs endpoints**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a153.png)

12.	Enter **name**, **secondary Event Hub namespace** and **Event Hub instance** and click **Create**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a154.png)

13.	Enter the **Routing query** and click **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a155.png)

14.	Now you can see the Added message **routing**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a156.png)

15.	Here we stopped all the primary web apps and Event Hub 

**Note**: After IoT hub and Event Hub failover restart all the web apps.

16.	Now you can update **rest server DR URL** into **aggregator config.js** file and **compute engine setting.js** file then you should run both the the Aggregator and ComputeEngine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a157.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a158.png)

17.	Now you can check the web application.

18.	Here all cameras are stopped because before we used primary rest server in aggregator and compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a159.png)

19.	Add new camera to check the workflow.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a160.png)

20.	Fill the following details and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a161.png)

21.	Here you can choose the Area to mark. We have a Drop-down list to choose the type of **Human Detection** to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a162.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a163.png)

22.	Click on **Start streaming** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a164.png)

23.	If you want to save the video click YES or else click NO.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a165.png)

24.	Here you can see the entire dashboard of the web application. Click on **live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a166.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a167.png)

25.	Once the video stream is up we can see the Detected faces if any surrounded by a Square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/a168.png)

26.	Here we can’t edit before we used camera because we changed the aggregator config file.
