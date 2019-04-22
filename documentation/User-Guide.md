# Microsoft

# Security and Surveillance Solution

## User Guide
![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/userguide.png)

### Table of Contents

- [1 Introduction to User Guide](#1-introduction-to-user-guide)     
- [2 Enable Cosmos DB Preview feature](#2-enable-cosmos-db-preview-feature)
- [3 Update Traffic manager URL in Azure B2C](#3-update-traffic-manager-url-in-azure-b2c)
- [4 Use Case Walkthrough](#4-use-case-walkthrough)
    - [4.1 Connect Camera](#41-connect-camera)
         - [4.1.1 Face Detection](#411-face-detection)
    - [4.2 Verify Aggregator](#42-verify-aggregator)
    - [4.3 Verify Compute Engine](#43-verify-compute-engine)
    - [4.4 Face Recognition](#44-face-recognition)
    - [4.5 Human Detection](#45-human-detection)
    - [4.6 Object Detection](#46-Object-detection)
    - [4.7 Configuring Power BI](#47-configuring-power-bi)
         - [4.7.1 Apply Permissions to your application within Azure AD](#471-apply-permissions-to-your-application-within-azure-ad)
         - [4.7.2 Publish Power BI Reports](#472-publish-power-bi-reports) 
         - [4.7.3 Retrieve Report ID of the published report](#473-retrieve-report-id-of-the-published-report)
         - [4.7.4 Configure Reports in Web App](#474-configure-reports-in-web-app)
    - [4.8 User Management](#48-user-management) 
    - [4.9 Video Retention](#49-video-retention)
    - [4.10 Multi-screen View](#410-multi-screen-view)
   
## 1. Introduction to User Guide

This Document explains how to use the solution. The document explains about post deployment steps and it will walk you through the solution.

## 2. Enable Cosmos DB Preview feature 

Once the solution is deployed successfully, navigate to the **resource group** and select the created resource group to view the list of resources that are created in the Resource Group as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u1.png)

Before Login into the web app you need to enable the Cosmos DB Preview features, follow the below steps to enable the preview features.

1. Go to **Resource Group** -> Click Cosmos DB resource i.e. **coredocdbf7qu4**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u4.png)

2.	Now it will direct to **Overview** page of the Cosmos DB. 

3.	Click **Preview Feature** from the **Settings** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u5.png)

4.	Click **Enable** as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u6.png)

5.	Now you can see that the Preview Features enabled for Cosmos DB.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u7.png)

## 3. Update Traffic manager URL in Azure B2C

1. Copy the **Traffic Manager DNS** and paste in the **Replay URL** section in Azure AD B2C Application and click **Save**.

**Note**: This step is applicable in case if you select solution type as Standard or Premium. For the basic solution update the Reply URL with front end web app URL.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u113.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u9.png)

## 4. Use Case Walkthrough

1. Go to **Resource Group** -> Click **Web App** from the below resources.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u117.png)

2. Copy the **web app URL** and open it in browser.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u118.png)

**Note**: Before login into the Web App URL please update the reply URL in your tenant to login into the Application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u12.png)

3. Click **Sign In** .

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u13.png)

4. If you don’t have access to the Web App please **sign up and sign in**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u14.png)

5. Now you can see the landing page  of the **Web Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u15.png)

6. Click **Next** till you can view the **Connect Your Camera Now** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u16.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u17.png)

7. Click **Connect your Camera** Now button to view the dashboard.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u18.png)

### 4.1 Connect Camera

#### 4.1.1 Face Detection

1. The following screenshot shows the detail to be entered to connect camera.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u19.png)

2. Now you need to enter the following details like streaming URL (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u20.png)

3. Now you need to upload the Floor map. Fill the **Map name** and Click **Click to browse**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u21.png)

4. Choose **floor map** from your local system and upload.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u22.png)

5. Here you can see the uploaded image.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u23.png)

6. Here you can choose the Area to mark. We have a Drop-down list to choose the type of Detection to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u24.png)

7. Click marker and mark the area we have a Marker Properties pop-up.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u25.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u26.png)

8. Here you can fill the following details and Click **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u27.png)

9. Click **Start Streaming option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u28.png)

10. If you want to save the video click **YES** or else click **NO**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u29.png)

11. Here you can see the entire dashboard of the web application. Click **Live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u30.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u31.png)

12. Click **Video Icon** to view the live streaming video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u32.png)

13.	Click **Maximize** Icon to view the maximized video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u33.png)

14.	Here you can view the maximized streaming video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u34.png)  

15.	Once the video stream is up you can see the Detected faces if any surrounded by a Square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u35.png)  

16.	In the following screen you can able to see the **detected faces count** and the **marker details**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u36.png)

17.	Once you done the detection we can stop the streaming using **Stop Streaming option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u37.png)

18. Follow the above steps to add **multiple camera’s** with different **aggregators** and **compute engines**.

### 4.2 Verify Aggregator

1. Click **Device management** in left side menu and Click **Aggregator** here you can see the aggregator details.

**Note**: If you want add aggregator manually, you can Click right side button to add the aggregator.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u38.png)

### 4.3 Verify Compute Engine

1. Click **Device management** in left side menu and Click **Compute Engine** here you can see the compute engine details.

**Note**: If you want add compute engine manually, you can Click right side button to add the compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u39.png)

2. Now choose the **compute engine** to keep them available.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u40.png)

### 4.4 Face Recognition

1. You can add another video stream with aggregator and compute engine for face recognition.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u41.png)

2. Now you need to add the following details like streaming URL (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u42.png)

3. Once the page loads you need to select the **Face Recognition** in the drop down then select the area of interest for face recognition. You will get a Marker Properties pop-up enter the Marker properties.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u43.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u44.png)

4. Click **Start Stream**. You will get a pop-up to **Save** video, Click No.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u45.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u46.png)

5. Now you can see the live camera count increased by one.  

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u47.png)

6. Click the added camera to view the live stream.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u48.png)

7. In the Live stream you can see the detected Image with square marker, with the detected details. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u49.png)

8. Now you need to Click the **Face Recognition**, it will display the detected images. You need to enter the name and age then Save for further recognition. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u50.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u51.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u52.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u53.png)

9. After saving the details if we stream again, now the stream shows the recognized face details with Name and age in the square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u54.png)

### 4.5 Human Detection

1. Click **Camera** -> Click **Connect Camera** in the right side. Fill the following fields Streaming URL, Device Name, Device Type, Aggregator, Compute Engine and Location and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u55.png)

2. Once the page loads you need to select the **Human Detection** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the **Marker properties**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u56.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u57.png)

3. Fill the following fields and select **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u58.png)

4. Click **Start Stream**. You will get a pop-up to **Save** video, Click **No** if you don’t want to save the video otherwise Click **Yes**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u59.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u60.png)

5. Now you can see the **Live camera count** increased by one.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u61.png)

6. Click the added camera to view the **live stream**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u62.png)

7. In the **Live stream** we could see the live stream and the detected details on the right side as shown below. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u63.png)

### 4.6 Object Detection

1. Click **Connect Camera** and fill the following fields Device name, Device Type **DVR**, Compute Engine **ComputeEngine** and click **Connect** Button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u65.png)

2. Once the page loads you need to select the **Object Detection** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the Marker properties.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u66.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u67.png)

3. Click **Start Stream**. You will get a pop-up to **Save** video, Click **No** if you don’t want to save video otherwise Click Yes.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u68.png)

4. Now you can see the **live camera count** increased by one.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u69.png)

5. Here you can see the **live camera** details. Select **Cam4** to open the live streaming for human details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u70.png)

6. In the **Live stream** you could see the live stream and the detected details on the right side as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u71.png)

### 4.7 Configuring Power BI 

#### 4.7.1 Apply Permissions to your application within Azure AD

1.	Go to **https://dev.PowerBI.com/apps** and register the Web App.

a. Login to your PowerBI account with the Azure Login credentials that have Global admin permissions.

b. Provide a **name** for your Web App (This is different from what you created before).

c. Select **App type** as “**server-side Web App**”.

d. Enter the Redirected URL and Home URL, same as you gave in Azure AD B2C tenant **Reply URL** without “**/redirect.html**” for **Home URL**.

e. If you want to deploy **Basic Solution**, give **Rest Server Web App URL** without “**/redirect.html**” for **Home URL**.

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

3. Click the App, navigate to **Settings**, and provide the **required permissions**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u76.png)

4. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u77.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u78.png)

5. Within Required permissions, select **Power BI Service** (Power BI).

6. Select all permissions under **Delegated Permissions**. Select **Save** when done.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u79.png)

7.	Within Required permissions, select **Grant Permissions**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u80.png)

#### 4.7.2 Publish Power BI Reports

a)	Download and open the **Power BI template** files from the **GIT repository** and follow all the steps below for each template file. 

***https://github.com/MobiliyaTechnologies/SecurityAndSurveillancePowerBI/blob/master/Templates/***

b)	Enter **Cosmos DB URI** and **Cosmos DB Name** to connect back-end with the report.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u81.png)

c) To get the above details, Click **resource group** and select **Cosmos DB**. 

d) Locate the URI as highlighted below and paste the same in the Power BI Template file.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u82.png)

e) Go back to the browser window and under **Settings**, Click **Connection String** and note down the **Primary Password**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u83.png)

f) Go to **Power BI Desktop** screen and Click Load and you will be prompted for **Account Key** of **Cosmos DB**, enter the key noted down in the last step and Click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u84.png)

g) After the data has loaded successfully.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u85.png)

h) Click **Human Detection** and see the detected faces counts and visuals.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u86.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u87.png)

i) Here we can see the **Face Recognition** counts and visuals.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u88.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u89.png)

j) Here we can see the **Object Detection** counts and **visuals**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u90.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u91.png)

k) Now Click **Publish**. You will be prompted to enter the Power BI account credentials. Enter the same and choose a workspace where you want the report to be. Default is **My Workspace** if you have not created any.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u92.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u93.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u94.png)

l) Click Open created **pbit.pbix** in Power BI.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u95.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u96.png)

#### 4.7.3 Retrieve Report ID of the published report

1. Click **My Workspace** and go to **Reports** section and open the report which was published in Step 7.  

2. If you have published report in some other **workspace** then Click Workspaces > “Your Workspace Name” >Reports and then open the report.

3. Note down the **Report ID** shown in the browser URL window. Report ID starts after../reports/ and before /Report Section. 
 
4. If you have published report in some other workspace, then Note down the **Group ID** also as shown below. Group ID starts after../groups/ and before /reports.

5. Final URL which is used to embed the report has the following structure: If report is in My Workspace: https://app.powerbi.com/reportEmbed?reportId

reportId = [Your Report ID].  

If report is in other workspace: https://app.powerbi.com/reportEmbed?reportId&groupId

reportId = [Your Report ID] & groupId=[Your Group ID].

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u97.png)

#### 4.7.4 Configure Reports in Web App

1. Go back to web application and Click **Reports** section.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u98.png)

2.	Fill the following details and Click **Save**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u99.png)

3.	Check the following **reports**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u100.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u101.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u102.png)

### 4.8 User Management

You can see the logged in user details by clicking on **User Management**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u103.png)

You can add a user as admin by changing role to Admin as shown in below screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u104.png)

After updating Role, you can observe that the role has got Changed to **Admin**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u105.png)

### 4.9 Video Retention

To view the recorded videos, go to dashboard and click **Video Retention**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u106.png)

You can view the video preview as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u107.png)

You can **download** the video by clicking on **Download symbol** as shown in below screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u108.png)

You can **delete** the video as shown like below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u110.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u111.png)

### 4.10 Multi-screen View

You can see all the connected cameras in **Multi-screen view** as shown in below screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/u112.png)
