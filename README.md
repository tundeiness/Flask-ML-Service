[![Build Status](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_apis/build/status%2Ftundeiness.Flask-ML-Service?branchName=build)](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_build/latest?definitionId=10&branchName=build)

[![Build Status](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_apis/build/status%2Ftundeiness.Flask-ML-Service?branchName=build&jobName=BuildJob)](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_build/latest?definitionId=10&branchName=build)
# Overview

This Project implements a CI/CD Pipeline for Flask-Ml-Service.
This project demonstrates the end-to-end implementation of a CI/CD pipeline for a Flask-based machine learning web service. Starting from scratch, you'll scaffold a GitHub repository and implement essential DevOps practices including linting, testing, and package installation using GitHub Actions. The pipeline is further extended to enable Continuous Delivery by integrating with Azure Pipelines, deploying the application seamlessly to Azure App Service. This project showcases a practical approach to modern DevOps workflows by combining automation, testing, and cloud deployment.

## Project Plan

* [Trello board for the project](https://trello.com/b/RLFYcLeJ/cloud-devops-project-mgt)
* [Quarterly & Yearly Plan](https://docs.google.com/spreadsheets/d/1xOI2u_aXIeydSlZv_z28VMv-HAIiq7T5bD3Z_EDui_o/edit?usp=sharing)

## Instructions for running the project

* Architectural Diagram


  ![CI_CD Architecture](https://github.com/user-attachments/assets/53c8e20d-4d5a-48d5-a2b2-aa11282c6451)



### Setting up a GitHub repository

Log into your Github account and create a new repository containing the flask application or clone it in your azure portal.
run the following code in azure cloud shell after connecting your cloud shell with github:

- git clone https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code](https://github.com/tundeiness/Flask-ML-Service/edit/main/README.md.git
- Clone the new repo
- Change the username below
- git clone https://github.com/[username]/flask-ml-service.git
- cd flask-ml-service
  
Prepare for a push
- git add -A
- git status
- git commit -m "Upload the starter flask app"
- git push


After "pushing" the new repository, ensure to enable Azure Pipelines. To enable this in your Github, navigate to https://github.com/marketplace/azure-pipelines

Install/enable the Azure Pipelines marketplace app.

configure the Azure Pipeline to allow access to the specific repositories in your Github account by going to Github >> Settings >> Integrations >> Applications(opens in a new tab)

This will successfully link, your Azure DevOps organization with any of the preferred Github repositories to set up a pipeline.




### Creating a sample web app manually


1. Clone the repo in Cloud shell

In your Azure Cloud shell environment, clone the GitHub repository you created. Change the username in the URL below before running git clone command.



2. To run the app locally Create a virtual environment, install the dependencies, and run the app

  ```bash 
     python3 -m venv ~/.myvenv
   
     source ~/.myvenv/bin/activate
   
     make install
   
     python -m flask run
  ```

   
4. Create a web app service

   Create an app service and initially deploy your app. Provide the web app name as a globally unique value.
   (You should have a resource group created alread in your azure portal)
   az webapp up --name [Your_unique_app_name]  --sku F1 --logs --runtime "PYTHON:3.10" -g [resource-group-name]


6. Verify
   Verify the deployed application works by browsing to the deployed URL.


7. Perform Prediction
   run `vim make_predict_azure_app.sh `
   and change `<yourappname>` in this line `-X POST https://<yourappname>.azurewebsites.net:$PORT/predict` to the unique app name.

   Subsequently, run `./make_predict_azure_app.sh` to see the prediction.




### Setting up the Azure DevOps project

1. Enable Public Projects

The first step you'd want to do in your azure devops portal is to ensure  your DevOps org allow creating public projects by turning the 
visibility on in the Organization settings >> Policies section before you create a new project. 
go to Azure devops Portal >> Organization settings >> Policies

2. Create Project

Create a new DevOps project in the newly created DevOps org by selecting `New`

3. Set up a Service connection
   
Go to the Project settings >> Service connection settings >> Azure Resource Manager and
Service principal (`Automatic` if you are using your personal Azure account).
Click `Next`.
Under Scope Level is	Subscription. The Subscription Name	will auto populate after authentication.
The Resource Group Name	will be already available in your subscription since the name will auto populate after the authentication
give your Service Connection a name, this will be useful at some stage in the project.	
tick the box to Grant access permission to all pipelines.
This step will connect your DevOps account with the Azure account.
Save your Service Connection, by clicking save.


### Setting up an Agent (VM)

For the DevOps pipeline, you will be setting up an Agent in place. An Agent is a VM that will perform the pipeline jobs, such as 
building your code residing in Github and deploying it to the Azure services.


1. Create a Personal Access Token (PAT)
Create a new Personal Access Token (PAT) that will be used instead of a password by the build agent (Linux VM) for authentication/authorization.
To create a PAT, go to home of azure devops org and click gear icon on the top right of the azure devops organisation.

Click on  `Personal Access Token`, give it a name, Select the organization, and give it an expiration of say 30days. Scope should be defined as full access.
Save the PAT value for future use.


2. Create an Agent Pool

An Agent pool is a collection of the agents (VMs) that will build your code and deploy it to the Azure services. The agent is the machine that does the processing job of the pipeline.

Go to the Project Settings > Agent pools and add a new agent pool, say myAgentPool.
Choose the agent pool as "Self-hosted". Provide the Agent pool a name as per your choice and grant access permissions to all pipelines.


   
3. Create an Agent(Virtual Machine)in your azure portal


Navigate to the "Virtual machines" service in the Azure Portal, and then select + Create to create a VM.
use the following values:

Subscription: `Choose existing Subscription` 
Resource group: `Choose your existing Resource group,`
Virtual machine name: `agentVM/or any preferred name`
Availability options: `No infrastructure redundency required`
Region: `Select the region same that of the resource group`
Image: `Ubuntu Server 24.04 LTS`
Size:	`Standard_D1s_v2 (1 vCPU, 3.5 GB memory)`
Authentication type:	`Password`
Username:	`devopsagent`
Password:	`P455word@123`
Public inbound ports:	`Allow selected ports`
Select inbound ports: `SSH (22)`

Leave the remaining fields as default. Review and create the VM. After creation, select `go to resources`.
Copy the Public IP address from the overview section of the virtual machine. You will need it to login to the virtual machine.


Run the following commands from an Azure cloud shell or terminal or command prompt. Replace the IP address as applicable to you.
`ssh <Virtual machine username>@70.124.65.22`
At the prompt type `Yes` and supply the password.

After you SSH into the VM, install Docker by running `sudo snap install docker`

Configure the virtual machine to run Docker, and `exit` to persist the configurations:


```bash
    sudo groupadd docker
    sudo usermod -aG docker $USER
    exit
```

Restart the Linux VM from Azure portal to apply changes made in previous steps and login back again.


Go back to the DevOps portal, and open the newly created Agent pool to add a new agent.
Go to Project settings >> Pipelines >> agent pool >> select the agent pool created earlier >> new agent.
Select the Linux tab and run the following:

```bash
  mkdir myagent && cd myagent

  curl -O https://vstsagentpackage.azureedge.net/agent/2.202.1/vsts-agent-linux-x64-2.202.1.tar.gz

  tar zxvf vsts-agent-linux-x64-2.202.1tar.gz

  ./config.sh (follow the prompt as you will need your PAT and other details here)

```

Accept the license agreement: type	Y
Server URL:	Provide your Azure DevOps organization URL For example, https://dev.azure.com/HRH_Tunde
Authentication type	Press enter to select PAT
Personal access token: Provide the PAT you have saved earlier.
Agent pool (enter the value):	Choose the one created earlier, say myAgentPool
Agent name: myAgent
Work folder: udacityProj

After the above run the below to start the service:

```bash

  sudo ./svc.sh install
  sudo ./svc.sh start

```



Prepare the agent for building the Flask application:

Run the following while in the agent:

```bash
  sudo apt-get update
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository ppa:deadsnakes/ppa
```


Check if the VM has Python installed already. Otherwise, use these commands to install Python

```bash
  sudo apt install python3.11
  sudo apt-get install python3.11-venv
  sudo apt-get install python3-pip
  python3.11 --version
  pip --version 

```

install tools for the Pipeline build steps:


```bash
  sudo apt-get install python3.7-distutils
  sudo apt-get -y install zip

```

run this as well:


```bash
  pip install pylint==2.13.7
  pip show --files pylint
  echo $PATH

```

Update the Path for Pylint:

```bash
  export PATH=$HOME/.local/bin:$PATH
  echo $PATH

```


to see if the agent is online, got to your Azure DevOps portal, navigate to Organization Settings >> Agent Pools >> myAgentPool. 
Then select the Agents tab. Confirm that the self-hosted agent is online.


### Creating a pipeline


Go to the DevOps project in your Azure DevOps org, select Pipeline, and create a new one.

Select: Select the GitHub repository containing the exercise starter code:


(configuring the azure pipeline )<img width="1413" alt="Screenshot 2025-04-14 at 7 30 27 pm" src="https://github.com/user-attachments/assets/370acc4b-2373-4aa3-8444-3fa1e046618c" />

(create pipeline in AzureDevops portal)<img width="1413" alt="Screenshot 2025-04-14 at 7 35 40 pm" src="https://github.com/user-attachments/assets/a5bd40d2-e2ba-45d6-a7a4-2c121b3e58ae" />



Connect: Choose the GitHub repository as the source code location:

(connect to the repository)<img width="1413" alt="Screenshot 2025-04-14 at 7 35 54 pm" src="https://github.com/user-attachments/assets/e66aa5fa-f7bc-4df9-99b4-c7af44d8ee83" />

(select the correct repository)<img width="1413" alt="Screenshot 2025-04-14 at 7 36 50 pm" src="https://github.com/user-attachments/assets/be6d0542-77e6-48c0-a8b3-b3e85013f451" />



Configure:

(configure pipeline with starter pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 37 28 pm" src="https://github.com/user-attachments/assets/2b814e49-90ce-4efe-80b2-99506b312e42" />

(Review pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 37 39 pm" src="https://github.com/user-attachments/assets/e457a269-c5c5-4716-b3b9-9ec86f3f82a0" />

(save)<img width="1413" alt="Screenshot 2025-04-14 at 7 38 20 pm" src="https://github.com/user-attachments/assets/c9ca173a-c8ca-4cf7-84b9-1997d61913f4" />


(run to create the pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 38 50 pm" src="https://github.com/user-attachments/assets/468fd504-da1f-4bf6-aef5-0de2e35d4195" />

(Job is created)<img width="1413" alt="Screenshot 2025-04-14 at 7 39 02 pm" src="https://github.com/user-attachments/assets/f9ef1fb4-e9c7-4183-b526-89fd222e1e27" />

(Job running process)<img width="1413" alt="Screenshot 2025-04-14 at 7 41 04 pm" src="https://github.com/user-attachments/assets/24d62701-1f04-4cbe-b4a5-9d0726005d8a" />

(job suceessful)<img width="1413" alt="Screenshot 2025-04-14 at 7 41 38 pm" src="https://github.com/user-attachments/assets/b6ce6d00-4bba-495a-9abe-2865d228bb7c" />




Run a build Job:

Edit the yaml file to run a build job)<img width="1413" alt="Screenshot 2025-04-14 at 7 47 50 pm" src="https://github.com/user-attachments/assets/25666595-3de7-4ffd-b608-8ca9a6346957" />


(Validate and save the build job)<img width="1413" alt="Screenshot 2025-04-14 at 7 49 25 pm" src="https://github.com/user-attachments/assets/6e5e05ce-1242-4f00-b93b-13ceaceed778" />

(run the build job)<img width="1413" alt="Screenshot 2025-04-14 at 7 50 13 pm" src="https://github.com/user-attachments/assets/4b885ebc-ff61-4662-ab64-cd0e81895656" />

(run the pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 50 20 pm" src="https://github.com/user-attachments/assets/62d4b976-0aee-45c2-ba41-e971be788f6d" />

(build job in process)<img width="1413" alt="Screenshot 2025-04-14 at 7 50 33 pm" src="https://github.com/user-attachments/assets/3ee0db5b-b10a-47da-9aa6-aed25ba6854b" />

(build job successful)<img width="1413" alt="Screenshot 2025-04-14 at 7 51 46 pm" src="https://github.com/user-attachments/assets/7801a8e0-b481-4e3b-9bdf-7b64f5a3cd1e" />


(edit the yaml file for deploy job)<img width="1413" alt="Screenshot 2025-04-14 at 7 53 41 pm" src="https://github.com/user-attachments/assets/e5418678-3d7f-4faa-b06a-2bfe33c1b963" />


(validate and save deploy job)<img width="1413" alt="Screenshot 2025-04-14 at 7 53 59 pm" src="https://github.com/user-attachments/assets/64c3b121-88f9-45bc-8e98-81cdec91bac5" />


(saving deploy job)<img width="1413" alt="Screenshot 2025-04-14 at 7 55 11 pm" src="https://github.com/user-attachments/assets/e7967a67-7852-4910-a7a6-d9555354b7d3" />


(run the pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 55 42 pm" src="https://github.com/user-attachments/assets/18c810cb-21b9-4c62-b32e-aa50ab017aa2" />



(build and deploy stage running)<img width="1413" alt="Screenshot 2025-04-14 at 7 56 53 pm" src="https://github.com/user-attachments/assets/5c14808b-c3c9-4c8e-bf48-aa12e7e1d518" />



(deploy stage waiting for permission to access a resource)<img width="1413" alt="Screenshot 2025-04-14 at 7 57 09 pm" src="https://github.com/user-attachments/assets/2071842c-7261-44a4-8cac-44f5ae52202e" />

(granting permission)<img width="1413" alt="Screenshot 2025-04-14 at 7 57 19 pm" src="https://github.com/user-attachments/assets/26edddc3-d923-460e-8573-16d865afa421" />


(deployment successful)<img width="1429" alt="Screenshot 2025-04-14 at 8 02 49 pm" src="https://github.com/user-attachments/assets/115aa56c-d04d-48c1-81ab-6716c0617626" />






(clone repository)<img width="1434" alt="Screenshot 2025-04-10 at 3 59 43 pm" src="https://github.com/user-attachments/assets/20b02ad1-8cfa-4378-97bd-8fbc309bacd8" />


(app deployed in azure webapp service) <img width="1413" alt="Screenshot 2025-04-14 at 7 07 28 pm" src="https://github.com/user-attachments/assets/f994a7b4-e94c-467f-a38b-a9cb4346cbb8" />






* Project running on Azure App Service

* Project cloned into Azure Cloud Shell
<img width="1434" alt="Screenshot 2025-04-10 at 3 59 43 pm" src="https://github.com/user-attachments/assets/4768e113-5300-44e4-afe3-24e5c616b4bc" />

  
<img width="1413" alt="Screenshot 2025-04-14 at 7 55 42 pm" src="https://github.com/user-attachments/assets/62934c2b-7313-4553-b1f5-85c2ea39b997" />

* Passing tests that are displayed after running the `make all` command from the `Makefile`

(test passing after running `make all`)<img width="1434" alt="Screenshot 2025-04-10 at 4 09 18 pm" src="https://github.com/user-attachments/assets/9476e82d-a716-431c-a8a9-001914160a0a" />


* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
tunde [ ~/Flask-ML-Service] $ ./make_predict_azure_app.sh
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[2.431574790057212]}
```

<img width="1399" alt="Screenshot 2025-04-13 at 8 51 52 pm" src="https://github.com/user-attachments/assets/71ecd092-cc37-484d-82c8-7d0580499e8c" />


* Output of streamed log files from deployed application
<img width="1413" alt="Screenshot 2025-04-13 at 8 55 30 pm" src="https://github.com/user-attachments/assets/e12bb428-6a28-4460-9901-c58f837b982c" />


## Enhancements

[x] Build a proper web GUI for the prediction.

Currently, the web interface displays a static message ("sklearn prediction") while predictions are only visible through the terminal in JSON format. In future iterations, the project can be improved by integrating real-time prediction results directly into the web UI. This would involve capturing user input via the frontend, sending it to the Flask backend for inference, and displaying the structured output dynamically on the website for better usability.

## Demo 

[screencast link](https://drive.google.com/file/d/1IxpxvmrHzeK8fcAcuJA4OTATKGI8tF1h/view?usp=sharing)


