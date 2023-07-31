#! /bin/bash

# # create an ingress to expose the rabbitmq dashboard:

kubectl create ing rabbit-ing-1 --class <ingress-class> --rule="<hostname>/*=rabbitmq-cluster:15672" -n rabbitmq

# # To expose using port-forwarding:

## kubectl port-forward svc/rabbitmq-cluster -n rabbitmq 8091:15672