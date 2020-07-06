#!/bin/zsh
minikube start --vm-driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard
#minikube dashboard &

# Configuring metallb:

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Creating images:

eval $(minikube docker-env) #eval $(minikube -p minikube docker-env)

docker build -t nginx srcs/nginx/

# Creating services:

kubectl apply -f srcs/
