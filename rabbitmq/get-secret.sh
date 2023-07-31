#! /bin/bash

# Username
kubectl get secret rabbitmq-cluster-default-user -o jsonpath="{.data.username}" -n rabbitmq | base64 -d

# Password
kubectl get secret rabbitmq-cluster-default-user -n rabbitmq -o jsonpath="{.data.password}" | base64 -d