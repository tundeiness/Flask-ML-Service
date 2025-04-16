[![Build Status](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_apis/build/status%2Ftundeiness.Flask-ML-Service?branchName=main)](https://dev.azure.com/HRHtunde/udacityFlaskApp001/_build/latest?definitionId=10&branchName=main)
# Overview

This Project demonstrates the end-to-end implementation of a CI/CD pipeline for a Flask-based machine learning web service. You'll scaffold a GitHub repository and implement essential DevOps practices including linting, testing, and package installation using GitHub Actions. The pipeline is further extended to enable Continuous Delivery by integrating with Azure Pipelines, deploying the application seamlessly to Azure App Service. This project showcases a practical approach to modern DevOps workflows by combining automation, testing, and cloud deployment.

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
- git commit -m "Upload the starter file"
- git push


After "pushing" the new repository, ensure to enable Azure Pipelines. To enable this in your Github, navigate to https://github.com/marketplace/azure-pipelines

Install/enable the Azure Pipelines marketplace app.

configure the Azure Pipeline to allow access to the specific repositories in your Github account by going to Github >> Settings >> Integrations >> Applications(opens in a new tab)

This will successfully link, your Azure DevOps organization with any of the preferred Github repositories to set up a pipeline.




### Creating a sample web app manually


1. Clone the repo in Cloud shell

In your Azure Cloud shell environment, clone the GitHub repository you created. 

<img width="1434" alt="Screenshot 2025-04-15 at 2 11 12 pm" src="https://github.com/user-attachments/assets/ade46fbf-944b-4719-8adc-d7d9987a4c1a" />

<img width="1434" alt="Screenshot 2025-04-15 at 2 11 25 pm" src="https://github.com/user-attachments/assets/de987546-e3a5-4c3b-8c2a-64ffc22ee1be" />

<img width="1434" alt="Screenshot 2025-04-15 at 2 11 31 pm" src="https://github.com/user-attachments/assets/026963dd-8166-457c-980f-37b9511a2a9d" />



2. create a github action workflow in your repository.
   
   In github, select the `action` button >> create my yml file, then populate it with the content below:

   <img width="1434" alt="Screenshot 2025-04-15 at 3 25 55 pm" src="https://github.com/user-attachments/assets/97d2d74c-3f44-4984-9877-c49e89a415cd" />

  This way, I have created a github action file as part of the CI/CD pipeline.
  
  <img width="1434" alt="Screenshot 2025-04-15 at 3 26 42 pm" src="https://github.com/user-attachments/assets/ff36b393-79d7-4fbe-9218-ec5f2906a115" />

  <img width="1434" alt="Screenshot 2025-04-15 at 3 26 52 pm" src="https://github.com/user-attachments/assets/53269049-d336-43a6-86d3-83a5e7984852" />

   
4. To run the app locally Create a virtual environment, install the dependencies, and run the app

  ```bash 
     python3 -m venv ~/.myvenv
   
     source ~/.myvenv/bin/activate
   
     make all
   
     python -m flask run
  ```


  <img width="1434" alt="Screenshot 2025-04-15 at 3 51 28 pm" src="https://github.com/user-attachments/assets/52f66a6c-9a74-45ba-b098-8c197931f1d3" />
  
  <img width="1434" alt="Screenshot 2025-04-15 at 3 51 52 pm" src="https://github.com/user-attachments/assets/a7a8a75c-c283-436c-a012-9159adc0f445" />

  <img width="1434" alt="Screenshot 2025-04-15 at 3 55 55 pm" src="https://github.com/user-attachments/assets/86f24349-626c-4de7-8108-5e085b56e138" />
  
  <img width="1434" alt="Screenshot 2025-04-15 at 3 56 05 pm" src="https://github.com/user-attachments/assets/dc491a0f-bc27-4430-9153-5883d8464fa2" />

  
  <img width="1434" alt="Screenshot 2025-04-15 at 5 32 49 pm" src="https://github.com/user-attachments/assets/7525e889-efd4-483e-a101-3b15ed162794" />

  <img width="1434" alt="Screenshot 2025-04-15 at 5 37 24 pm" src="https://github.com/user-attachments/assets/0dcd5398-9dad-4b02-ada9-bf8b6052b672" />
  
  <img width="1434" alt="Screenshot 2025-04-15 at 6 28 32 pm" src="https://github.com/user-attachments/assets/92e09f93-3e2e-4eeb-a611-5ddfe72167c5" />

   <img width="1434" alt="Screenshot 2025-04-15 at 6 31 50 pm" src="https://github.com/user-attachments/assets/2c83f3ac-9806-4914-b734-f272a8379dc5" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 32 17 pm" src="https://github.com/user-attachments/assets/0a5eda21-619d-49bb-9e55-ee39a3ede655" />



4. Create a web app service

   Create an app service and initially deploy your app. Provide the web app name as a globally unique value.
   (You should have a resource group created alread in your azure portal)
   az webapp up --name [Your_unique_app_name]  --sku F1 --logs --runtime "PYTHON:3.10" -g [resource-group-name]

   
  <img width="1434" alt="Screenshot 2025-04-15 at 6 40 40 pm" src="https://github.com/user-attachments/assets/30d794da-0139-47b8-824e-298b5e56821e" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 41 58 pm" src="https://github.com/user-attachments/assets/24ce7308-dc6a-4201-84f5-e7f878fe53cb" />


6. Verify
   Verify the deployed application works by browsing to the deployed URL.

  <img width="1434" alt="Screenshot 2025-04-15 at 6 41 32 pm" src="https://github.com/user-attachments/assets/310a727a-0673-4e2d-85f8-6aa03bbb2b75" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 42 28 pm" src="https://github.com/user-attachments/assets/b5a48327-b181-4974-920a-65d3600fb97d" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 44 27 pm" src="https://github.com/user-attachments/assets/aaf34490-73b3-478f-9dd4-adc2df4c7d4a" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 44 34 pm" src="https://github.com/user-attachments/assets/4d5401bd-f50d-4c39-95f3-4ec6544269fe" />

  <img width="1434" alt="Screenshot 2025-04-15 at 6 45 26 pm" src="https://github.com/user-attachments/assets/d7778786-e03f-4b3d-92d5-4228b818dc5e" />





7. Perform Prediction
   run `vim make_predict_azure_app.sh `
   and change `<yourappname>` in this line `-X POST https://<yourappname>.azurewebsites.net:$PORT/predict` to the unique app name.

   Subsequently, run `./make_predict_azure_app.sh` to see the prediction.

  <img width="1434" alt="Screenshot 2025-04-15 at 6 47 51 pm" src="https://github.com/user-attachments/assets/8bc15e96-fdcd-478d-ad08-49b24a6c12c8" />


  <img width="1434" alt="Screenshot 2025-04-15 at 6 50 55 pm" src="https://github.com/user-attachments/assets/e7926bc9-5101-4bf3-b33c-f11e091760e4" />


  <img width="1434" alt="Screenshot 2025-04-15 at 6 51 54 pm" src="https://github.com/user-attachments/assets/0c200165-38b4-4d37-9955-9774d1e5be47" />

  
  <img width="1434" alt="Screenshot 2025-04-15 at 6 52 04 pm" src="https://github.com/user-attachments/assets/a21da911-e09c-4ee5-ac7d-fd2f95c17396" />
  

  <img width="1434" alt="Screenshot 2025-04-15 at 6 53 32 pm" src="https://github.com/user-attachments/assets/19027981-6494-454c-9d55-0eeb90acac2e" />




### Setting up the Azure DevOps project

1. Enable Public Projects

The first step you'd want to do in your azure devops portal is to ensure  your DevOps org allow creating public projects by turning the 
visibility on in the Organization settings >> Policies section before you create a new project. 
go to Azure devops Portal >> Organization settings >> Policies

<img width="1434" alt="Screenshot 2025-04-15 at 7 03 01 pm" src="https://github.com/user-attachments/assets/9b1db788-aa78-4ead-8945-e07175804a09" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 03 27 pm" src="https://github.com/user-attachments/assets/3ef50061-52b7-44c1-bc7a-f87266b2af66" />





2. Create Project

Create a new DevOps project in the newly created DevOps org by selecting `New`

<img width="1434" alt="Screenshot 2025-04-15 at 7 15 53 pm" src="https://github.com/user-attachments/assets/3061c606-c10a-4094-af7f-4fbd9679d15f" />


3. Set up a Service connection
   
Go to the Project settings >> Service connection settings >> Azure Resource Manager and
Service principal (`Automatic` if you are using your personal Azure account).


<img width="1434" alt="Screenshot 2025-04-15 at 7 16 08 pm" src="https://github.com/user-attachments/assets/03737e8c-3a89-4dd5-b0c7-cf8a9ecaf711" />



<img width="1434" alt="Screenshot 2025-04-15 at 7 04 34 pm" src="https://github.com/user-attachments/assets/7c1ce4d9-0b2b-406a-a6b9-08c0811b406e" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 04 51 pm" src="https://github.com/user-attachments/assets/056b3f29-ab54-4e25-ba3b-f037412e41b2" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 05 31 pm" src="https://github.com/user-attachments/assets/47d57a11-6775-442e-81fd-1ac23140563d" />


Click `Next`.
Under Scope Level is	Subscription. The Subscription Name	will auto populate after authentication.
The Resource Group Name	will be already available in your subscription since the name will auto populate after the authentication
give your Service Connection a name, this will be useful at some stage in the project.	
tick the box to Grant access permission to all pipelines.
This step will connect your DevOps account with the Azure account.
Save your Service Connection, by clicking save.

<img width="1434" alt="Screenshot 2025-04-15 at 7 27 51 pm" src="https://github.com/user-attachments/assets/4c33aa67-6d74-4388-b974-18a485abab3f" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 27 59 pm" src="https://github.com/user-attachments/assets/6645a684-95e2-48a8-bb46-69af6467b4ac" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 28 52 pm" src="https://github.com/user-attachments/assets/7c8d9936-de1e-4dca-8e3e-0dc5a2b35928" />


### Setting up an Agent (VM)

For the DevOps pipeline, you will be setting up an Agent in place. An Agent is a VM that will perform the pipeline jobs, such as 
building your code residing in Github and deploying it to the Azure services.


1. Create a Personal Access Token (PAT)
Create a new Personal Access Token (PAT) that will be used instead of a password by the build agent (Linux VM) for authentication/authorization.
To create a PAT, go to home of azure devops org and click gear icon on the top right of the azure devops organisation.

Click on  `Personal Access Token`, give it a name, Select the organization, and give it an expiration of say 30days. 
The scope should be defined as full access. Save the PAT value for future use.


2. Create an Agent Pool

An Agent pool is a collection of the agents (VMs) that will build your code and deploy it to the Azure services. The agent is the machine that does the processing job of the pipeline.

Go to the Project Settings > Agent pools and add a new agent pool, say myAgentPool.
Choose the agent pool as "Self-hosted". Provide the Agent pool a name as per your choice and grant access permissions to all pipelines.

<img width="1434" alt="Screenshot 2025-04-15 at 7 30 06 pm" src="https://github.com/user-attachments/assets/e779e4ed-b4d5-4f5c-b875-f19d51eacb02" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 30 28 pm" src="https://github.com/user-attachments/assets/b9cc14c4-02c7-4ed7-b0c4-b4640ebc0b78" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 31 22 pm" src="https://github.com/user-attachments/assets/feb78c8a-d2d8-4e7a-9bc3-0fc95e37fd1c" />



<img width="1434" alt="Screenshot 2025-04-15 at 7 40 32 pm" src="https://github.com/user-attachments/assets/c7e96019-d35b-479b-a23c-c2e1330378a3" />


   
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


<img width="1434" alt="Screenshot 2025-04-15 at 6 58 29 pm" src="https://github.com/user-attachments/assets/00708ffc-61c9-40a3-9645-4c36cf109bd3" />

<img width="1434" alt="Screenshot 2025-04-15 at 6 59 07 pm" src="https://github.com/user-attachments/assets/bcc96571-b2d4-4a1a-b971-19515c4221bd" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 00 06 pm" src="https://github.com/user-attachments/assets/16e3520d-b6c6-4d31-a157-a31766188c54" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 00 37 pm" src="https://github.com/user-attachments/assets/364db61a-c8c9-4e5c-846c-7914ecc264f5" />



Leave the remaining fields as default. Review and create the VM. After creation, select `go to resources`.

<img width="1434" alt="Screenshot 2025-04-15 at 7 01 39 pm" src="https://github.com/user-attachments/assets/26330302-1a8e-4137-b4e2-3860c191d95d" />


Copy the Public IP address from the overview section of the virtual machine. You will need it to login to the virtual machine.

<img width="1434" alt="Screenshot 2025-04-15 at 7 01 52 pm" src="https://github.com/user-attachments/assets/80f67383-afa7-4655-85e9-6203882dfe4b" />


Run the following commands from an Azure cloud shell or terminal or command prompt. Replace the IP address as applicable to you.

`ssh <Virtual machine username>@70.124.65.22`

<img width="1434" alt="Screenshot 2025-04-15 at 7 34 41 pm" src="https://github.com/user-attachments/assets/b2a5f466-7666-4d1d-a5a4-c62ad19bb5b1" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 35 28 pm" src="https://github.com/user-attachments/assets/49950f98-ffbe-49f0-85e7-d6f9b0bb619f" />


At the prompt type `Yes` and supply the password.

After you SSH into the VM, install Docker by running `sudo snap install docker`

<img width="1434" alt="Screenshot 2025-04-15 at 7 36 03 pm" src="https://github.com/user-attachments/assets/d9ad90d5-9813-4dbd-bacf-583fba8aae94" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 36 36 pm" src="https://github.com/user-attachments/assets/0709a0cb-1902-4e38-a0c9-19135b0c198e" />

Configure the virtual machine to run Docker, and `exit` to persist the configurations:


```bash
    sudo groupadd docker
    sudo usermod -aG docker $USER
    exit
```

Restart the Linux VM from Azure portal to apply changes made in previous steps and login back again.


Go back to the DevOps portal, and open the newly created Agent pool to add a new agent.
Go to Project settings >> Pipelines >> agent pool >> select the agent pool created earlier >> new agent.


<img width="1434" alt="Screenshot 2025-04-15 at 7 40 32 pm" src="https://github.com/user-attachments/assets/45a38280-6b70-4263-8ef2-279a8e2366fc" />


Select the Linux tab and run the following:



<img width="1434" alt="Screenshot 2025-04-15 at 7 40 48 pm" src="https://github.com/user-attachments/assets/b52826f5-2131-452f-b41a-77c14bf2dec4" />



```bash
  mkdir myagent && cd myagent

  curl -O https://vstsagentpackage.azureedge.net/agent/2.202.1/vsts-agent-linux-x64-2.202.1.tar.gz

  tar zxvf vsts-agent-linux-x64-2.202.1tar.gz

  ./config.sh (follow the prompt as you will need your PAT and other details here)

```

<img width="1434" alt="Screenshot 2025-04-15 at 7 41 18 pm" src="https://github.com/user-attachments/assets/05f8c16a-0681-41ab-b3ee-253fde1aca75" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 41 48 pm" src="https://github.com/user-attachments/assets/cb7b48ae-c5a7-48d2-9b54-a27eee216106" />



<img width="1434" alt="Screenshot 2025-04-15 at 7 42 00 pm" src="https://github.com/user-attachments/assets/c3ca2797-2561-497c-a505-71477d1b6352" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 42 50 pm" src="https://github.com/user-attachments/assets/d8c6221e-6e37-418c-ba5f-b3ff5ef1b732" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 43 09 pm" src="https://github.com/user-attachments/assets/c778fed5-edd5-4430-b4d4-2663a6a5f7ba" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 43 48 pm" src="https://github.com/user-attachments/assets/441f49ab-91f2-4945-933a-4044dfdaecb1" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 45 12 pm" src="https://github.com/user-attachments/assets/b6070d4b-5509-44e7-a559-f62e6fe624fb" />



Accept the license agreement: type	Y
Server URL:	Provide your Azure DevOps organization URL For example, https://dev.azure.com/HRH_Tunde
Authentication type	Press enter to select PAT
Personal access token: Provide the PAT you have saved earlier.
Agent pool (enter the value):	Choose the one created earlier, say myAgentPool
Agent name: myAgent
Work folder: udacityProj

<img width="1434" alt="Screenshot 2025-04-15 at 7 45 52 pm" src="https://github.com/user-attachments/assets/a55cad5d-59c8-42c7-857a-5e2d0897afc4" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 46 09 pm" src="https://github.com/user-attachments/assets/ede69fdd-3b43-4949-8b62-3f010ee9a13c" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 46 35 pm" src="https://github.com/user-attachments/assets/fffe05d7-4106-45a3-8a12-4a74274b660d" />



After the above run the below to start the service:

```bash

  sudo ./svc.sh install
  sudo ./svc.sh start

```

<img width="1434" alt="Screenshot 2025-04-15 at 7 47 22 pm" src="https://github.com/user-attachments/assets/fedda37c-bb24-47fb-af67-514a3f6e1552" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 47 36 pm" src="https://github.com/user-attachments/assets/106cd89d-bd59-4f0f-9bbb-0803aaaeb88d" />



Prepare the agent for building the Flask application:

Run the following while in the agent:

```bash
  sudo apt-get update
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository ppa:deadsnakes/ppa
```


<img width="1434" alt="Screenshot 2025-04-15 at 7 48 06 pm" src="https://github.com/user-attachments/assets/5e3e807a-222c-48d2-ac9c-bce2f3111e14" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 48 47 pm" src="https://github.com/user-attachments/assets/7ff3338f-b3c6-4a3d-9ca8-fef4f0eb627a" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 49 20 pm" src="https://github.com/user-attachments/assets/4b17dd9b-24ac-4d77-a091-6cf1545af7f5" />

<img width="1434" alt="Screenshot 2025-04-15 at 7 50 01 pm" src="https://github.com/user-attachments/assets/685b9783-7aa7-46b3-b489-e512d97329d4" />




Check if the VM has Python installed already. Otherwise, use these commands to install Python

```bash
  sudo apt install python3.10
  sudo apt-get install python3.10-venv
  sudo apt-get install python3-pip
  python3.10 --version
  pip --version 

```

<img width="1434" alt="Screenshot 2025-04-15 at 7 51 09 pm" src="https://github.com/user-attachments/assets/5327b5f6-5aa2-4f6c-8e76-78603f6c252a" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 51 40 pm" src="https://github.com/user-attachments/assets/ad9201de-4fad-4d24-9d90-2785bc393938" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 51 46 pm" src="https://github.com/user-attachments/assets/570dffee-f38a-4c73-85a0-fc66d9fe920c" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 53 28 pm" src="https://github.com/user-attachments/assets/b1d62b04-7918-439e-99d6-b421624696d4" />





install tools for the Pipeline build steps:


```bash
  sudo apt-get install python3.10-distutils
  sudo apt-get -y install zip

```

<img width="1434" alt="Screenshot 2025-04-15 at 7 53 57 pm" src="https://github.com/user-attachments/assets/fba593bc-0e60-4a1c-956c-b1559f68b0f7" />


<img width="1434" alt="Screenshot 2025-04-15 at 7 54 14 pm" src="https://github.com/user-attachments/assets/2a3629be-9eb6-4f1e-bdaf-08db258cd88c" />


run this as well:


```bash
  sudo apt install pipx
  pipx install pylint==2.15.0
  pip show --files pylint
  echo $PATH

```


<img width="1434" alt="Screenshot 2025-04-15 at 8 01 40 pm" src="https://github.com/user-attachments/assets/747f4040-bca3-42a9-a316-227810eaf3db" />


<img width="1434" alt="Screenshot 2025-04-15 at 8 02 27 pm" src="https://github.com/user-attachments/assets/2f8d5b53-f91e-434b-a0b3-7ac9152b5a67" />


<img width="1434" alt="Screenshot 2025-04-15 at 8 04 14 pm" src="https://github.com/user-attachments/assets/75abcf89-6444-4147-bc51-85c00a6b4bb0" />




Update the Path for Pylint:

```bash
  export PATH=$HOME/.local/bin:$PATH
  echo $PATH

```

<img width="1434" alt="Screenshot 2025-04-15 at 8 04 21 pm" src="https://github.com/user-attachments/assets/699a2812-d07b-45d3-b82d-ef45ff7e9166" />


<img width="1434" alt="Screenshot 2025-04-15 at 8 04 38 pm" src="https://github.com/user-attachments/assets/3ebad47f-8376-48b0-b9bc-a74fdf93fffd" />


<img width="1434" alt="Screenshot 2025-04-15 at 8 04 53 pm" src="https://github.com/user-attachments/assets/c23a8dea-4d13-4229-b1ba-45ce27e63f6a" />



to see if the agent is online, go to your Azure DevOps portal, navigate to Organization Settings >> Agent Pools >> myAgentPool. 
Then select the Agents tab. Confirm that the self-hosted agent is online.



### Creating a pipeline


Go to the DevOps project in your Azure DevOps org, select Pipeline, and create a new one.


<img width="1434" alt="Screenshot 2025-04-15 at 8 06 15 pm" src="https://github.com/user-attachments/assets/c6bb05d1-812c-447b-b15a-67b5f1739f8a" />


<img width="1434" alt="Screenshot 2025-04-15 at 8 07 39 pm" src="https://github.com/user-attachments/assets/aaaa4726-939e-4cd4-8ca2-ada2e73bc5ca" />



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


<img width="1399" alt="Screenshot 2025-04-13 at 8 51 52 pm" src="https://github.com/user-attachments/assets/71ecd092-cc37-484d-82c8-7d0580499e8c" />




## Enhancements

[x] Build a proper web GUI for the prediction.

Currently, the web interface displays a static message ("sklearn prediction") while predictions are only visible through the terminal in JSON format. In future iterations, the project can be improved by integrating real-time prediction results directly into the web UI. This would involve capturing user input via the frontend, sending it to the Flask backend for inference, and displaying the structured output dynamically on the website for better usability.

## Demo 

[screencast link](https://www.loom.com/share/f55a37e06d0540a3b24fe0c2ddfb9a9d?sid=505f208f-73e6-4f98-83b7-60eb0ef51e85)


