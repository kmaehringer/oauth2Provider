#!/bin/bash

docker run --name oauth_postgres -p 5433:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=iteratec0 -d oauth_postgres

