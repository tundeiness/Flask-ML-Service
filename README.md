[![Build Status](https://dev.azure.com/HRHtunde/Flask-ML-Service/_apis/build/status%2Ftundeiness.Flask-ML-Service?branchName=main)](https://dev.azure.com/HRHtunde/Flask-ML-Service/_build/latest?definitionId=9&branchName=main)
# Overview

This Project implements a CI/CD Pipeline for Flask-Ml-Service.

## Project Plan

* [Trello board for the project](https://trello.com/b/RLFYcLeJ/cloud-devops-project-mgt)
* [Quarterly & Yearly Plan](https://docs.google.com/spreadsheets/d/1xOI2u_aXIeydSlZv_z28VMv-HAIiq7T5bD3Z_EDui_o/edit?usp=sharing)

## Instructions

* Architectural Diagram


  ![CI_CD Architecture](https://github.com/user-attachments/assets/53c8e20d-4d5a-48d5-a2b2-aa11282c6451)


<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

(clone repository)<img width="1434" alt="Screenshot 2025-04-10 at 3 59 43 pm" src="https://github.com/user-attachments/assets/20b02ad1-8cfa-4378-97bd-8fbc309bacd8" />


(app deployed in azure webapp service) <img width="1413" alt="Screenshot 2025-04-14 at 7 07 28 pm" src="https://github.com/user-attachments/assets/f994a7b4-e94c-467f-a38b-a9cb4346cbb8" />



(configuring the azure pipeline )<img width="1413" alt="Screenshot 2025-04-14 at 7 30 27 pm" src="https://github.com/user-attachments/assets/370acc4b-2373-4aa3-8444-3fa1e046618c" />

(create pipeline in AzureDevops portal)<img width="1413" alt="Screenshot 2025-04-14 at 7 35 40 pm" src="https://github.com/user-attachments/assets/a5bd40d2-e2ba-45d6-a7a4-2c121b3e58ae" />
(connect to the repository)<img width="1413" alt="Screenshot 2025-04-14 at 7 35 54 pm" src="https://github.com/user-attachments/assets/e66aa5fa-f7bc-4df9-99b4-c7af44d8ee83" />

(select the correct repository)<img width="1413" alt="Screenshot 2025-04-14 at 7 36 50 pm" src="https://github.com/user-attachments/assets/be6d0542-77e6-48c0-a8b3-b3e85013f451" />


(configure pipeline with starter pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 37 28 pm" src="https://github.com/user-attachments/assets/2b814e49-90ce-4efe-80b2-99506b312e42" />

(Review pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 37 39 pm" src="https://github.com/user-attachments/assets/e457a269-c5c5-4716-b3b9-9ec86f3f82a0" />

(save)<img width="1413" alt="Screenshot 2025-04-14 at 7 38 20 pm" src="https://github.com/user-attachments/assets/c9ca173a-c8ca-4cf7-84b9-1997d61913f4" />


(run to create the pipeline)<img width="1413" alt="Screenshot 2025-04-14 at 7 38 50 pm" src="https://github.com/user-attachments/assets/468fd504-da1f-4bf6-aef5-0de2e35d4195" />

(Job is created)<img width="1413" alt="Screenshot 2025-04-14 at 7 39 02 pm" src="https://github.com/user-attachments/assets/f9ef1fb4-e9c7-4183-b526-89fd222e1e27" />

(Job running process)<img width="1413" alt="Screenshot 2025-04-14 at 7 41 04 pm" src="https://github.com/user-attachments/assets/24d62701-1f04-4cbe-b4a5-9d0726005d8a" />

(job suceessful)<img width="1413" alt="Screenshot 2025-04-14 at 7 41 38 pm" src="https://github.com/user-attachments/assets/b6ce6d00-4bba-495a-9abe-2865d228bb7c" />


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

[x] Build a proper GUI for the prediction.

## Demo 

[screencast link](https://drive.google.com/file/d/1IxpxvmrHzeK8fcAcuJA4OTATKGI8tF1h/view?usp=sharing)


