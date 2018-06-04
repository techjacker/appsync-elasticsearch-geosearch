#!/usr/bin/env bash
set -e

source .env

ES_DOMAIN=placesearch
ENDPOINT=$(aws es describe-elasticsearch-domain \
	--domain-name $ES_DOMAIN \
	--query 'DomainStatus.Endpoint' \
   --output text)
export ES_ENDPOINT=https://$ENDPOINT

export APPSYNC_API_ID=$(aws appsync list-graphql-apis \
	--query 'graphqlApis[?name==`appSyncElasticsearchTest`].apiId' \
   --output text)

export APPSYNC_API_KEY=$(aws appsync list-api-keys \
	--api-id "$APPSYNC_API_ID" \
	--query 'apiKeys[0].id' \
   --output text)

