# Appsync Elasticsearch Geo Search

Example Geo Search API built on AWS Appysnc & Elasticsearch.


-----------------------------------------------------------
## Example Usage

### 1. Set up

Install the Serverless Framework plugins used by the project.
```Shell
$ npm install
```

Create an `.env` file and update the `AWS_ACCOUNT_ID` variable.
```Shell
export AWS_ACCCOUNT_ID=123456789
```

### 2. Deploy Elasticsearch
```Shell
$ ./bin/deploy
```

### 3. Create Elasticsearch Geo Mapping
Redeploy the lambda function so it has the updated elasticsearch endpoint value created in the last step.
```Shell
$ ./bin/deploy-lambda
```

Then invoke it to create the mapping in elasticsearch.
```Shell
$ ./bin/invoke-lambda
```

### 4. Deploy the Appsync API
```Shell
$ ./bin/deploy-appsync
```

### 5. Update the Appsync API.
```Shell
$ ./bin/update-appsync
```

### 6. Destroy Stack
```Shell
$ ./bin/destroy
```


-----------------------------------------------------------
## Lambda Development Setup

Create a virtualenv then install requirements:
```
$ make env
$ source env/bin/activate
$ make deps
```

-----------------------------------------------------------
## Unit Tests
```
$ make test
```

-----------------------------------------------------------

## Local Development

To invoke the lambda function locally do the following.

#### 1. Add the following to the `.env` file
```Shell
# .env
export ES_ENDPOINT=https://xxx.xxx.es.amazonaws.com # UPDATE ME
export ES_INDEX=places
export ES_REGION=eu-west-1
export ES_GEO_MAPPING_FILE=elasticsearch/location_geopoint_mapping.json
```

#### 2. Invoke the lambda function.
```Shell
$ ./bin/invoke-local
```
