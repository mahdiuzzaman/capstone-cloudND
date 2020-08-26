#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker image build -t mahdiuzzaman/nginx-hello-world .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker container run --name hello -p 8000:80 mahdiuzzaman/nginx-hello-world
