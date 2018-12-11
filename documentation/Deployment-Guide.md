# Microsoft

# Securiy Surveillance

## Deployment Guide

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/sns-deployment.png)

### Table of Contents
 - [1 Deployment Guide](#1-deployment-guide)
 - [2 What are Paired Regions](#2-what-are-paired-regions)
 - [3 Prerequisites for Deploying ARM Template](#3-prerequisites-for-deploying-arm-template)
    - [3.1 Azure B2C Tenant Creation and Configuration](#31-azure-b2c-tenant-creation-and-configuration)
        - [3.1.1 Follow Below steps to create Azure AD B2C Tenant](#311-follow-below-steps-to-create-azure-ad-b2c-tenant)
    - [3.2 Setting up Video Indexer](#32-setting-up-video-indexer)  
    - [3.3 Certificate Creation for Traffic Manager](#33-certificate-creation-for-traffic-manager)
        - [3.3.1 Retrieving the web app certificate secret name and thumbprint from key vault](#331-retrieving-the-web-app-certificate-secret-name-and-thumbprint-from-key-vault)
- [4 ARM Template Input Parameters](#4-arm-template-input-parameters)
- [5 Getting Started](#5-getting-started)
    - [5.1 ARM Template Deployment Using Azure Portal](#51-arm-template-deployment-using-azure-portal)
        - [5.1.1 Inputs](#511-inputs)
        - [5.1.2 Outputs](#512-Outputs)
    - [5.2 ARM Template Deployment Using Azure CLI](#52-arm-template-deployment-using-azure-cli)
- [6 Hardware Setup](#6-Hardware-Setup)
    - [6.1 Flashing the Nvidia Jetson TX2 Board](#61-Flashing-the-Nvidia-Jetson-TX2-Board)
    - [6.2 Setting Up Aggregator and Compute Engine](#62-Setting-up-Aggregator-and-compute-Engine)
        - [6.2.1 Both Aggregator and Compute Engine on Jetson](#621-both-aggregator-and-compute-engine-on-jetson)
        - [6.2.2 Separate installation](#622-separate-installation)
- [7 Post Deployment Steps](#6-post-deployment-steps)
     - [7.1 Enable Cosmos DB Preview feature](#71-enable-cosmos-db-preview-feature)
     - [7.2 Update Traffic manager URL in Azure B2C](#72-update-traffic-manager-url-in-azure-b2c)
     - [7.3 Configuring and Starting Aggregator and Compute Engine](#73-configuring-and-starting-aggregator-and-compute-engine)
     - [7.4 Deployment Walkthrough](#74-deployment-walkthrough)
        - [7.4.1 Connect Camera](#741-connect-camera)
        - [7.4.2 Verify Aggregator](#742-verify-aggregator)
        - [7.4.3 Verify Compute Engine](#743-verify-compute-engine)
        - [7.4.4 Face Recognition](#744-face-recognition)
        - [7.4.5 Human Detection](#745-human-detection)
        - [7.4.6 Object Detection](#746-object-detection)
       

## 1 Deployment Guide

This Document explains about how to deploy Security and Surveillance Solution using ARM template. This document shows two different ways of deploying the solution.

•	Using Azure portal

•	Using Azure CLI

This document explains about input parameters, output parameters and points to be noted while deploying ARM template.

## 2 What are Paired Regions

Azure operates in multiple geographies around the world. An Azure geography is a defined area of the world that contains at least one Azure Region. An Azure region is an area within a geography, containing one or more datacenters.

Each Azure region is paired with another region within the same geography, together making a regional pair. The exception is Brazil South, which is paired with a region outside its geography.

IoT Hub Manual Failover Support Geo-Paired Regions:

| **S.NO**                   | **Geography**                  | **Paired Regions** |       |    
| ------------------------                 | -------------------           | --------------------|----------------------|
| 1             | North America          | East US 2                | Central US            |
| 2               | North America              | Central US                | East US 2            |
| 3             | North America               | West US 2                   | West Central US           |
| 4             | North America                   | West Central US                   | West US 2              |
| 5            | Canada                | Canada Central                     | Canada East          |
| 6            | Canada                 | Canada East                  | Canada Central            |
| 7                | Australia           | Australia East                  | Australia South East            |
| 8                   | Australia             | Australia South East                   | Australia East          |
| 9             | India             | Central India                  | South India            |
| 10              | India              | South India                 | Central India             |
| 11                     | Asia             | East Asia                | South East Asia               |
| 12               | Asia               | South East Asia         | East Asia            |
| 13              | Japan           | Japan West                | Japan East            |
| 14                 | Japan             | Japan East         | Japan West             |
| 15                 | Korea          | Korea Central         | Korea South              |
| 16                  | Korea              | Korea South         | Korea Centra             |
| 17                | UK            | UK South                 | UK West                |
| 18               | UK              | UK West                  | UK South           |   
## 3 Prerequisites for Deploying ARM Template

### 3.1 Azure B2C Tenant Creation and Configuration

Creating Azure AD B2C tenant is a one-time activity, if you have a B2C Tenant already created by your admin then you should be added into that tenant as Global Administrator to register your app to get the B2C tenant id, application id and sign-in/sign-up policies.

### 3.1.1 Follow Below steps to create Azure AD B2C Tenant

1.	To create a new B2C tenant in **Azure Active Directory B2C**. Login to **Azure portal** -> Click + to create a resource to open the new page.

2.	In the New page **search box** enter **Azure Active Directory B2C** the result is displayed in everything page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d1.png)

3.	Click **Azure Active Directory B2C** to open a create **Azure Active Directory B2C** page.

4.	Click Create button at the bottom to start configuring your new **Azure Active Directory B2C tenant**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d2.png)

5.	Select create a new **Azure AD B2C Tenant**.

6.	Enter the **Organization name, Initial Domain name** in their respective fields and select the **Country of Region** for your tenant from the dropdown list.

7.	Note down your entire **tenant name** which is highlighted in the below figure, this will be used while deploying the **ARM template**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d3.png)

8.	Once the **B2C Tenant** is created, Click **Directory and Subscription** filter on the top right to see your newly created tenant.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d4.png)

9.	Switch to your created **tenant** by clicking on it. Type **Azure** in search box and select **Azure AD B2C**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d5.png)

10.	You can see the **created tenant** overview as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d6.png)

11.	Click **Sign-up** or **Sign-in** policies under **POLICIES** section. Then click **+Add** to add policy.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d7.png)

12.	Provide the **name** and enter the details as shown in the following figure.

13.	**Note** down the **policy name** that you are creating, as it is used while deploying the template.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d8.png)

14.	Select all the **Sign-up attributes** as show in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d9.png)

15.	Select all the **Application claims** as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d10.png)

16.	After providing all the required details, click **Create** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d11.png)

17.	Once the deployment is complete, the sign-up details are displayed as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d12.png)

18.	Click the **Applications** tab and click **+Add** to create a new application.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d13.png)

19.	Provide a name for the application in the **name** field.

20.	Under the **Web APP/Web API** tab, click **Yes** to provide the **App ID URL** for your application. Add an entry in the **App ID URL** section of the **B2C application** in the following format.

*https://<Website Name>.onmicrosoft.com/ssiot*
    
![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d14.png)

21.	Select the application you created and click on application note down the **Application ID**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d16.png)

 As shown in the above screen provide the name of the application under the **App ID URI**

22.	Click on the **Published Scopes**, here you can see the user_impersonation scope value.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d17.png)

23.	Here you can add the following scopes, you need to enter the values in the text area as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d18.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d19.png)

24. Click the **API access** tab and click **+Add** to create an API access and click **OK**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d20.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d21.png)

25.	Here you can see the API access

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d22.png)

### 3.2 Setting up Video Indexer 

1.	Open the below link to sign up the video indexer. However, we would show the outlook account method.

2.	Link to Video Indexer: *https://www.videoindexer.ai/account/login*

**Note**: If you already have an account with active Azure subscription, signing in using that is recommended, however it is not mandatory.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d23.png)

3.	After sign up completed you should see the video **indexer preview** page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d24.png)

4.	Link to video indexer developer portal https://api-portal.videoindexer.ai/

5.	Click on **sign-in** in the right side of the developer portal, it will navigate to the sign-in page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d25.png)

6.	Click on outlook to sign-in the video indexer.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d26.png)

7.	Enter the following credentials to sign in.

User ID: ***************

Password: ***************

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d27.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d28.png)

8.	Click **Yes** if you want stay signed in otherwise click **No** to continue..

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d29.png)

9.	After you sign in completed it should navigated to **video indexer portal**, here you can see the user profile details.

10.	Click on **Products** in the video indexer portal.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d30.png)

11.	Click on **Authorization** link to authorize the video indexer authorization API.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d31.png)

12.	Click on **subscribe** button it will subscribe to product.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d32.png)

13.	Click on **Confirm**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d33.png)

14. Here you can see the subscription details. Copy the Primary key and keep it safe.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d34.png)

### 3.3 Certificate Creation for Traffic Manager

1.	The Web App can be accessed with Traffic Manager URL but since the Traffic Manager has **http** protocol we need to redirect it to **https**. To redirect the http of Traffic Manager URL to https configure an SSL Certificate for your Azure App Service.

2.	Click on **+Add** (icon) in the Resource Group.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d35.png)

3.	Search for App Service Certificate and select it to create a certificate

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d36.png)

4.	Enter a friendly **Name** for your SSL certificate and enter the Traffic manager name in the **Domain Host Name. Use the existing Resource Group, Accept the Legal Terms and click Create button**.

**Note**: Make sure to enter correct host name (custom domain) that you want to protect with this certificate. DO NOT append the Host name with WWW.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d37.png)

5.	Once the SSL Certificate purchase is complete. The certificate status is **“Pending Issuance”** as there are few more steps you need to complete before you can start using this certificate. Click **Certificate Configuration** in the **Certificate Properties** page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d38.png)

6.	Click on **Step 1: Store** to store this certificate in Azure Key Vault. From the **Key Vault Status** page, click **Key Vault Repository** to choose an existing Key Vault to store this certificate (select the key vault which we created before step) OR **Create New Key Vault** to create new Key Vault inside same subscription and resource group.

7.	Once you have selected the Key Vault Repository to store this certificate, the **Store** option should show success.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d39.png)

8.	From the same **Certificate Configuration** page, you used in the above Step 5, click **Step 2: Verify**.
There are four types of domain verification supported by App Service Certificates: App Service, Domain, Mail, and Manual Verification.

9.	Choose **App Service Verification** from the dropdown.

10.	Click **Verify** button to complete this step.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d41.png)

11.	After clicking **Verify**, use the **Refresh** button until the **Verify** option shows success.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d40.png)

#### 3.3.1 Retrieving the web app certificate secret name and thumbprint from key vault

If you want to deploy the **Standard** and **Premium** solutions you should create the below prerequisites.

1.	**webapp certificate**

2.	**key vault secret name**

3.	**Certificate thumbprint.**

1.	Go to the resource group where you have created the **Key Vault**. Under **Settings** click **Secrets**. 

**Note**: A caution message is displayed if you are unauthorized to view these contents as shown in below figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d44.png)

**Add new user to key vault**:

Add new user in the **Access Polices** by following the below steps:

2.	Click **Access policies** and then click **+ Add new** as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d45.png)

3.	Search for the user in the **Select** box and click on the displayed user name

4.	Click the **Select** button.  

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d46.png)

5.	Select the appropriate **key permissions** from the dropdown list

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d47.png)

6.	Select **Secret permissions** and **Certificate permissions** form their respective dropdown lists.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d48.png)

7.	Click **OK** and then click **Save** the user is added as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d49.png)

8.	You can now go to the **Secrets** to view the secrets as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d50.png)

9.	Click on the secret name to view the key vault secret name of the certificate.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d51.png)

10.	Go to the Resource Group where you have deployed the **Key Vault** and **Web App certificates** to get the thumbprints of the certificates for template deployment.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d54.png)

11.	Click **appcert** certificate there you can see the thumbprint of certificate as highlighted in the following figure. Note down the thumbprint.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d55.png)

## 4 ARM Template Input Parameters

In the parameters section of the template, specify the values as inputs when deploying the ARM template. These parameter values enable you to customize the deployment by providing values that are tailored for your environment (such as dev, Staging and production). 


| **Parameter Name**  | **Description**     | **Allowed Values**    | **Default Values**   |                                                                                                            
| -------------       | -------------       | -----------------     | ------------         |
| **deploymentType**  | Choose the solution deployment type from the drop down, for more information about the solution deployment type navigate to https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/Deployment-Guide.md      | Basic, Standard, Premium | Basic solution|
|  **solutionType**   | Provide the name of teh solution   |    |  SecurityAndSurveillance    |
| **deploymentPrefix**   | A unique string for the deployment with maximum 15 characters which would be used to provision the resources   |         |            |
| **cognitive Services Location**   | Choose location for CognitiveServices, for more information about the cognitiveServiceLocation navigate to https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/Deployment-Guide.md   | eastus, eastus2, westus, westus2, southcentralus, westcentralus, northeurope, westeurope   | eastus |
| **OMS Location**   | Choose location for OMS Log Analytics to deploy. For more information,see https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-overview   | australiasoutheast, canadacentral, centralindia, eastus, japaneast, southeastasia, uksouth, westeurope  | eastus  |
| **App Insights Location**  | specify the region for application insights   | eastus, northeurope, southcentralus, southeastasia, westeurope, westus2 | westus2 |
| **Location DR**  | Choose locationDR which is different from the resource group region,if you have selected standard (or) premium option in the solution type inputparameter, for more information about the locationDr navigate to https://github.com/sysgain/SecurityAndSurveillance/blob/master/documentation/Deployment-Guide.md   | NA, EastUS2, CentralUS, WestUS2, WestCentralUS, CanadaCentral, CanadaEast, AustraliaEast, AustraliaSouthEast, CentralIndia,  SouthIndia, EastAsia, SouthEastAsia, JapanWest, JapanEast, KoreaCentral,    KoreaSouth, UKSouth, UKWest | NA |
| **Traffic Manager Name**    | Please provide the name of the trafficmanager certficate custom domain name   |    | NA |
| **Azure B2C Application ID**   | Enter App Client ID registrered under B2C tenant   |     |   f58xxxxx-xxxx-xxxx-xxxx-f5xxxxxed570   |
| **B2C ApplicationID DR**    | Enter Second App Client ID registrered under B2C tenant,if you choose Standard/premium Solution | | NA |
| **B2C Policy**   | Enter B2C SignUp-SignIn policy      |       |   B2C_x_xxxxxx-In  |
| **B2C Tenant** |  Enter B2C tenant name ex. something.onmicrosoft.com  |      |    xxxxxxxxxx.onmicrosoft.com  |
| **B2C Scope** | Enter User impersonation scope of B2C tenant |           |  https://xxxxxxxxx.onmicrosoft.com/xxxxxxx   |
| **B2C ScopeDR** | Enter Second User impersonation scope of B2C tenant,if you choose Standard/Premium Solution |      | NA      |
| **video Indexer Key** | Enter Video Indexer service key         |        |    11xxxxxxxxxxxxxxxxxxxxxxxxxxxx54   |
| **keyVault Name** |      Name of the Key Vault      |        | NA   |
| **keyVault WebApp SecretName** |     Name of the Web App Secret Name      |        | NA     |
| **keyVault Resource Group** |        Name of the Key Vault Resource Group   |        | NA     |
| **WebApp Certificate ThumbPrint** |     Value of Web App Certificate Thumb print     |        | NA     |

## 5 Getting Started

Azure Resource Manager allows you to provision your applications using a declarative template. In a single template, you can deploy multiple services along with their dependencies. The template consists of JSON and expressions that you can use to construct values for your deployment. You use the same template to repeatedly deploy your application during every stage of the application lifecycle.

Resource Manager provides a consistent management layer to perform tasks through Azure PowerShell, Azure CLI, Azure portal, REST API, and client SDKs.

Resource manager provides the following feature:

•	Deploy, manage, and monitor all the resources for your solution as a group, rather than handling these resources individually.

•	Repeatedly deploy your solution through the development lifecycle and your resources are deployed in a consistent state.

•	Manage your infrastructure through declarative templates rather than scripts.

•	Define the dependencies between resources so they're deployed in the correct order.

•	Apply access control to all services in your resource group because Role-Based Access Control (RBAC) is natively integrated into the management platform.

•	Apply tags to resources to logically organize all the resources in your subscription.


### 5.1 ARM Template Deployment Using Azure Portal

1.	Click the below **Git hub** repo URL.

https://github.com/sysgain/SecurityAndSurveillance/tree/master

2. Select **maintemplate.json** from **master** branch, click on **Raw** from the top right corner.
**Copy** the raw template and **paste** in your Azure portal for template deployment.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d60.png)

**To deploy a template for Azure Resource Manager, follow the below steps.**

1.	Go to **Azure portal**.

2.	Navigate to **Create a resource (+)**, search for **Template deployment**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d61.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d62.png)

3.	Click **Create** button and click **Build your own Template in the editor** as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d63.png)

4.	The **Edit template** page is displayed as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d64.png)

5.	**Replace / paste** the template and click **Save** button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d65.png)

6.	The **Custom deployment** page is displayed as shown in the following figure.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d66.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d67.png)

#### 5.1.1 Inputs

These parameter values enable you to customize the deployment by providing values. There parameters allow to choose the deployment type, region and AD Application details. 

**Parameters for Basic Solution**:

If you want to deploy the **Basic Solution** you must enter the values for below parameters.
For **basic solution**, select **Cognitive Services Location, OMS Location** and **App Insights Location** OR keep the default values as it is. No need to choose the **Location Dr** value, keep the default as it is..

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d68.png)

**Parameters for Standard Solution**:

If you want to deploy the **standard solution** you have to enter the below parameters.
For **standard solution**, select new values for **Cognitive Services Location, OMS Location** and **App Insights Location** OR keep the default values as it is. You should choose **Location Dr** should be different from resource group location and should provide the custom domain name of the certificate as **Traffic Manager Name**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d69.png)

**Parameters for Premium solution**:

If you want to deploy the **Premium solution** you have to enter the below parameters.
For **Premium solution**, select new values for  **Cognitive Services Location, OMS Location** and **App Insights Location** OR keep the default values as it is. provide the custom domain name of the certificate as **Traffic Manager Name**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d70.png)

7.	Once all the parameters are entered, check in the **terms and conditions** check box and click **Purchase**.

8.	After the successful deployment of the ARM template, the following **resources** are created in a **Resource Group**.

•	3 web Apps

•	1 application Insights

•	1 Azure Cosmos DB

•	1 IoT Hub

•	1 Event Hub

•	4 Cognitive API

•	1 log analytics

•	1 Storage account

The above resources are deployed for **Basic Solution**.

Except IoT Hub, Cosmos DB, OMS Log Analytics and Storage Account the rest of the resources are created additionally along with Traffic manager as disaster recovery for Standard and Premium Solution deployment.

9.	Once the solution is deployed successfully, navigate to the resource group to view the list of resources that are created as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d71.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d72.png)

#### 5.1.2 Outputs

10.	Go to **Resource Group** -> Click **Deployments**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d73.png)

11.	Click **Outputs**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d74.png)

### 5.2 ARM Template Deployment Using Azure CLI

Azure CLI is used to deploy your resources to Azure. The Resource Manager template you deploy, can either be a local file on your machine, or an external file that is in a repository like GitHub.  

Azure Cloud Shell is an interactive, browser-accessible shell for managing Azure resources. Cloud Shell enables access to a browser-based command-line experience built with Azure management tasks in mind. 

Deployment can proceed within the Azure Portal via **Azure Cloud Shell**. 

Customize **maintemplate.parameters.json** file 

1.	Log in to **Azure portal**. 

2.	Open the **prompt**. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/1.png)

3.	Select **Bash (Linux)** environment as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/2.png)

4.	Select your preferred **Subscription** from the dropdown list.  

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/3.png)

5.	Click **Create Storage button** as shown in the following figure. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/4.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/5.png)

6.	Copy **maintemplate.json** and **maintemplate.parameters.json** to your Cloud Shell before updating the parameters. 

7.	Create maintemplate.json using the following command. 

```
vim maintemplate.json 

```
![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/6.png)

8.	Paste your **maintemplate.json** in editor as shown below and **save** the file. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/7.png)

9.	Create **maintemplate.parameters.json** using the following command. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/8.png)

10.	Paste your **maintemplate.parameters.json** in editor. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/9.png)

11.	Update the following parameters in **maintemplate.parameters.json** file 

* solutionType
* deploymentPrefix
* cognitiveServicesLocation
* omsLocation
* appInsightsLocation
* locationDR
* trafficManagerName
* b2cApplicationId
* b2cApplicationIdDR
* b2cPolicy
* b2cTenant
* b2cScope
* b2cScopeDR
* videoIndexerKey
* keyVaultName
* keyVaultwebAppSecretName
* keyVaultResourceGroup
* webAppCertificatethumbPrint

12.	Create Resource Group for Security and Surveillance Solution.

13.	Use the **az group create** command to create a Resource Group in your region, e.g.: 

**Description**: To create a resource group, use **az group create** command, 

It uses the name parameter to specify the name for **resource group (-n)** and **location** parameter to specify the location (-l). 

**Syntax**:

```
az group create -n <resource group name> -l <location>

```

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/11.png)

14.	Execute the **Template Deployment**.

15.	Use the **az group deployment** create command to deploy the ARM template.

**Description**: To deploy the ARM template, you require two files: 

**maintemplate.json** – contains the resource & its dependency resources to be provisioned from the ARM template 

**maintemplate.parameters.json** –contains the input values that are required to provision respective SKU & Others details. 

**Syntax**:  

```
az group deployment create --template-file './<maintemplate.json filename>' --parameters '@./<maintemplate.parameters.json filename>' -g < provide resource group name that created in previous section> -n deploy >> <provide the outputs filename> 

```

**Ex:** 

```
az group deployment create --template-file './maintemplate.json' --parameters '@./maintemplate.parameters.json' -g SecurityAndSurveillancebasicsolution -n deploy >> outputs.txt 

```

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/12.png)

16.	Deployment may take between 15-20 minutes depending on deployment size. 

17.	After successful deployment you can see the deployment outputs as follows.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/raw/master/images/13.png)

## 6 Hardware Setup

This section will explain the detailed steps on how to setup the hardware for Security and Surveillance solution. This is an independent step you can perform the steps discussed in this section before or after the deployment.

Pre-requisite for hardware setup:

1.	Nvidia Jetson TX2 hardware
2.	Host machine with Linux (for flashing Nvidia Jetson)
3.	Camera with RTSP URL

### 6.1 Flashing the Nvidia Jetson TX2 Board

We will flash the Nvidia Jetson board with Linux based operating system. Please refer the following image for Jetson board layout.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/nvidia.png)

Please follow the below steps on host machine.

1. Download Nvidia Jetson Jetpack for flashing.

https://github.com/MobiliyaTechnologies/SecurityAndSurveillance/blob/master/Setup/installation/JetPack-L4T-3.1-linux-x64.run

2. Create a folder named **jetson_jetpack** for installation of Jetpack libraries in **home directory**.

3.  Place the downloaded **JetPack-${VERSION}.run** (Eg: JetPack-L4T-3.1-linux-x64.run ) file in 
above folder.

4. Open Terminal.  Run the below commands.

     **$ cd jetson_jetpack** 

     **$ chmod +x JetPack-L4T-3.1-linux-x64.run** 

5. Run following command in terminal on your host Ubuntu machine. 
     
     **$ ./JetPack-L4T-3.1-linux-x64.run**  

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n1.png)

6. Next, the JetPack installer will indicate the installation directory.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n2.png)

7. Select the development environment to setup.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n3.png)

8. The JetPack installer will pop up a window to ask for permission to use during the installation Process.

you will need to enter your user password (Host machine’s password) here 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n4.png)

9. Select the Full option for installing all the packages on the Jetson. Click ‘Next’

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n5.png)

10. Accept all Terms and conditions. Click ‘Accept.

11. The Component Manager will proceed with the installation ( ~ 20 minutes). Once the host installation steps are completed, click the ‘Next’ button to continue with the installation of target components. 

12. Please refer following setup for flashing Jetson.

You need a router connected to internet.  

Connect Host machine to router via ethernet. 

Jetson to the same router via ethernet. 

**Note:** Jetson and Host machine should be in same sub network after this setup and internet connection should be working on host machine (check in browser if needed). 

After above setup is done, press <NEXT> 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n6.png)

13. If you selected the Device access Internet via router/switch layout, you will be asked to select which interface to use for Internet access. 
Note: eth0 or ensp0 will be displayed as option. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n7.png)

13. A pop-up window will instruct you to put your device into Force USB Recovery Mode, so you 
can flash the OS. 

Refer Jetson Diagram given at start to know about buttons on Jetson. Follow the steps from pop up window. Follow following Fix as 4rth step. Fix for 4th step to put device in recovery mode: Keep pressing FORCE RECOVERY button, press POWER button and release POWER button after 
a second. Then release FORCE RECOVERY button. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n8.png)

**Note:** In 5th step, verify that Device with **‘Nvidia Corp’** is listed in **lsusb** output. 
Open another terminal and run - **$ lsusb** 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n9.png)

Then, press Enter in the pop window. After this, it will take around 15 minutes. 

15. After around 15 minutes, the host will try to identify the IP address of Jetson system. If it 
gives up, enter IP manually. 

**Note:** To know IP of Jetson: Open Terminal on Jetson machine->ifconfig. Use HDMI cable to 
connect monitor/display. Credentials to login nvidia:nvidia

16. After obtaining the IP the host PC will install all the libraries on Jetson device. This will take 
around 15 minutes. 

17. After all the processing the host PC will give a ‘Done Installation’ message. Then Jetson is 
completely flashed. 

18. Please make sure below message is displayed after installation in complete.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n10.png)

19. Connect monitor, keyboard, mouse to Jetson for further steps. Login credentials **nvidia:nvidia**

###  6.2 Setting up Aggregator and Compute Engine

This section will explain how to install the Aggregator and Compute Engine. You can install both the Aggregator and Compute engine on the Jetson board or you can install them separately.

#### 6.2.1 Both Aggregator and Compute Engine on Jetson

Open Terminal on Jetson and follow below steps to install Aggregator and Compute Engine on Jetson. (will take ~30 mins)

  *$ git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git*

  *$ cd SecurityAndSurveillance/Setup/installation*

  *$ sed -i -e 's/\r$//' install.sh*

  *$ sudo chmod +x install.sh*

  *$ ./install.sh -r=https://github.com/MobiliyaTechnologies*

#### 6.2.2 Separate installation

Open Terminal on Jetson and follow below steps to install only Compute Engine on Jetson. (Aggregator should be installed on another machine)

  *$ git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git*

  *$ cd SecurityAndSurveillance/Setup/ComputeEngine*

  *$ sed -i -e 's/\r$//' install.sh*

  *$ sudo chmod +x install.sh*

  *$ ./install.sh*

Open Terminal on Host machine (preferably Ubuntu) and follow below steps to install Aggregator.

  *$ git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git*

  *$ cd SecurityAndSurveillance/Setup/Aggregator*

  *$ sed -i -e 's/\r$//' install.sh*

  *$ sudo chmod +x install.sh*

  *$ ./install.sh*

## 7 Post Deployment Steps

### 7.1 Enable Cosmos DB Preview feature

1.	Before Login into the web app we need to enable the Cosmos DB Preview features.

2.	Go to **Resource Group** and select **Group by type**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d75.png)

3.	Before Login into the web app you need to enable the **Cosmos DB Preview** features.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d76.png)

4.	Click on **preview feature** from the Settings option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d77.png)

5.	Click on **enable option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d78.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d79.png)

### 7.2 Update Traffic manager URL in Azure B2C

1.	Copy the **Traffic Manager** DNS and past in the **Replay URL** section in **Azure AD B2C** Application and click **Save**.

**Note:**  The above step is only for the **Standard** and **Premium** solutions. If the solution is **Basic**, you need to update the Reply URL with the frontend web app URL

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d80.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d81.png)

### 7.3 Configuring and Starting Aggregator and Compute Engine

We will configure installed software components. We can start these components once configured.

Refer following steps to configure Aggregator, go the Aggregator installation directory and run the below command 

**$ cd ~/Aggregator**

**$ vi config.js**

    Update config.aggregatorName and config.location
    Update the following placeholder with values acquired from the deployment outputs as shown in the screen

        <IOTHubConnectionString> => IoT Hub connection string
        <storageAccountName> => Storage Account Name
        <storageAccountAccessKey> => Storage Account Access Key
        <backendUrl> => Backend Url (should start with https://)
        <videoIndexingSubscriptionKey> => Video Indexer api key

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n11.png)

Before starting the Aggregator make sure that no other “forever” processing running with the aggregator.

Follow the below screenshots to verify and then start the Aggregator.

**$ ps -aux | grep “forever*”**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n12.png)

If any process is running, we need to kill them before running the new process.

**$ kill -9 <process ID>**

**$fuser -k 3001/tcp**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n13.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n14.png)

**$forever start aggregatorServer.js**

If you want to see the log file run the below command and open the log file shown in the output

**$forever list**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n15.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n16.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n17.png)

Refer following steps to configure Compute engine, go the Compute engine installation directory and run the below command

   **$ cd ~/ComputeEngine/jetsonNodeServer**
   
   **$ vi settings.js**

    Update config.name and config.location
    Update the following placeholder with values acquired from the deployment outputs as shown in the screen

        <IOTHubConnectionString> => IoT Hub connection string
        <storageAccountName> => Storage Account Name
        <storageAccountAccessKey> => Storage Account Access Key
        <backendUrl> => Backend Url (should start with https://)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n18.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n19.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/n20.png)

Before starting the Compute, engine make sure that no other “forever” process is running and then start the Compute engine

**$ ps -aux | grep “forever*”**

**$ kill -9 <ProcessID>**

**$fuser -k 5001/tcp**

**$forever start jesonNodeServer**

### 7.4 Deployment Walkthrough

1.	Go to **Resource Group** -> Click on **Web App** from the below resources

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d82.png)

2.	Copy the **Web App URL** and open it in browser.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d83.png)

**Note**: Before login into the **Web App URL** please update the reply URL in your **B2C tenant** to login into the **Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d84.png)

3.	Click on **Sign In**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d85.png)

4.	If you don’t have an access **Web App** please **sign up** and **sign in**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d86.png)

5.	Now you can see the View of the **Web Application**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d87.png)

6.	Click on **Next** till you can view the **Connect your camera option**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d88.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d89.png)

7.	Click on **Connect your Camera** now button to view the dashboard.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d90.png)

#### 7.4.1 Connect Camera

##### 7.4.1.1 Face Detection

1.	After clicking the Connect Your Camera Now, you will get the following screen.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d91.png)

2.	Now you need to add the streaming URL (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d92.png)

3.	Now you need to upload the Floor map. Fill the **Map name** and click on **click to browse**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d93.png)

4.	Choose **floor map** from your local system and upload.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d94.png)

5.	Here you can see the **uploaded image**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d95.png)

6.	Here you can choose the Area to mark. We have a Drop-down list to choose the type of **Detection** to mark the Area.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d96.png)

7.	After Click on **marker** and mark the area we have a **Marker Properties** pop-up.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d97.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d98.png)

8.	Here you can fill the following details and click on **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d99.png)

9.	Click on **Start Streaming** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d100.png)

10.	If you want to save the video click YES or else click **NO**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d101.png)

11.	Here you can see the entire dashboard of the web application. Click on **live camera** to view the streaming of the video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d102.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d103.png)

12.	Click on **Video Icon** to view the **live streaming** video.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d104.png)

13.	Click on **Maximizing** Icon.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d105.png)

14.	Here you can view the **Streaming video**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d106.png)

15.	Once the video stream is up you can see the **Detected faces** if any surrounded by a Square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d107.png)

16.	In the following screen you can see the **detected faces count** and the **marker details**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d108.png)

17.	Once we done the detection we can stop the streaming using **stop streaming** option.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d109.png)

Follow the above steps to add multiple camera’s with different aggregators and compute engines.

#### 7.4.2 Verify Aggregator

1.	Click on **Device management** in left side menu and click on **Aggregator** here you can see the **aggregator** details.

**Note**: If you want add aggregator manually, you can click on right side button to add the aggregator.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d110.png)

#### 7.4.3 Verify Compute Engine

1.	Click on **Device management** in left side menu and click on **Compute Engine** here you can see the **compute engine** details.

**Note**: If you want add compute engine manually, you can click on right side button to add the compute engine.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d111.png)

2.	Now choose the **compute engine** to keep them available.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d112.png)

#### 7.4.4 Face Recognition

1.	You can add the another video stream with **aggregator** and **compute engine** for **face recognition**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d113.png)

2.	Now you need to add the following details like **streaming URL** (which is RTSP URL which is coming from the DVR), Device name, Device Type, Aggregator, Compute Engine (select **Face_Text_Recognition**) and Device Type and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d114.png)

3.	Once the page loads you need to select the **Face Recognition** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the Marker properties

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d115.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d116.png)

4.	Click on **Start Stream**. You will get a pop-up to **Save** video, click on **No**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d117.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d118.png)

5.	Now you can see the **live camera count** increased by one

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d119.png)

6.	Click on the added camera to view the **live stream**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d120.png)

7.	In the **Live stream** you can see the detected Image with square marker, with the detected details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d121.png)

8.	Now you need to click on the **Face Recognition**, it will display the detected images. You need to enter the name and age then Save for further recognition. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d122.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d123.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d124.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d125.png)

9.	After saving the details if we stream again, now the stream shows the **recognized face details** with **Name** and **age** in the square marker.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d126.png)

#### 7.4.5 Human Detection

1.	Click on **Camera** -> Click **Connect Camera** in the right side. Fill the following fields Streaming URL, Device Name, Device Type, Aggregator, Compute Engine and Location and click **Connect**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d127.png)

2.	Once the page loads we need to select the **Human Detection** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the Marker properties

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d128.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d129.png)

3.	Fill the following fields and select **Submit**.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d130.png)

4.	Click on **Start Stream**. You will get a pop-up to **Save** video, click on **No**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d131.png)

5.	Click **No** to continue it will navigate dashboard page.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d132.png)

6.	Now you can see the **live camera count** increased by one

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d133.png)

7.	Click on the added camera to view the **live stream**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d134.png)

8.	In the **Live stream** we could see the live stream and the detected details on the right side as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d135.png)

#### 7.4.6 Object Detection

1.	Click on Connect Camera you could navigate connect camera details page. 

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d136.png)

2.	Fill the following fields and you could select Device name, Device Type **DVR**, Compute Engine **ComputeEngine** and click **Connect** Button.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d137.png)

3.	Once the page loads we need to select the **Object Detection** in the drop down then select the area of interest for face recognition. You will get a **Marker Properties** pop-up enter the Marker properties

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d138.png)

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d139.png)

4.	Click on **Start Stream**. You will get a pop-up to **Save** video, click on **No**

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d140.png)

5.	Now you can see the **live camera count** increased by one

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d141.png)

6.	Here you can see the **live camera** details. Select **Cam4** to open the live streaming for human details.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d142.png)

7.	In the **Live stream** we could see the live stream and the detected details on the right side as shown below.

![alt text](https://github.com/sysgain/SecurityAndSurveillance/blob/master/images/d143.png)
