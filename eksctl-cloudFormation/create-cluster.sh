#!/bin/bash

eksctl create cluster -f ./blue-cluster.yaml
eksctl create cluster -f ./green-cluster.yaml