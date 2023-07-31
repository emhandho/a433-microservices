#! /bin/bash

# # deploy the rabbitmq operator, which will create the rabbitmq CRDs:

helm repo add bitnami https://charts.bitnami.com/bitnami;

helm install rabbit-operator bitnami/rabbitmq-cluster-operator --namespace rabbitmq --create-namespace --atomic;

# # To verify execute the command:
kubectl get crds