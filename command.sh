az account list

az group create --location eastus --name Azuredevops

az group list

az webapp up --name udacityFlaskApp001 --resource-group Azuredevops --sku F1 --logs
