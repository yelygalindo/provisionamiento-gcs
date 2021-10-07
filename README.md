# authenticate
```
az login
```

# set subscription
```
az account set --subscription "your subscription id"
```

# create resource group
```
az group create --name "resource-group" --location "your location"
```

# we also need to add the public key we will use to connect to the servers

# create the Postgres VM
```
az deployment group validate --name "pgFPSvr" --resource-group "resource-group" --template-file "./pg/azuredeploy.json" --parameters new=true
```

# create the Nginx VM
```
az deployment group validate --name "webFPSvr" --resource-group "resource-group" --template-file "./web/azuredeploy.json" --parameters new=true
```
