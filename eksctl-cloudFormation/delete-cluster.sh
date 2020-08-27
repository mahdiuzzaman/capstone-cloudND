#!/bin/bash

eksctl delete cluster -f ./blue-cluster.yaml
eksctl delete cluster -f ./green-cluster.yaml