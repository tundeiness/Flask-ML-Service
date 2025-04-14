[![Build Status](https://dev.azure.com/HRHtunde/Flask-ML-Service/_apis/build/status%2Ftundeiness.Flask-ML-Service?branchName=main)](https://dev.azure.com/HRHtunde/Flask-ML-Service/_build/latest?definitionId=9&branchName=main)
# Overview

<TODO: complete this with an overview of your project>

## Project Plan
<TODO: Project Plan

* A link to a Trello board for the project
* A link to a spreadsheet that includes the original and final project plan>

## Instructions

* Architectural Diagram
  ![CI_CD Architecture](https://github.com/user-attachments/assets/53c8e20d-4d5a-48d5-a2b2-aa11282c6451)


<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

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


