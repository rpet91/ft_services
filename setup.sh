#!/bin/zsh
minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard

# Configuring metallb:

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# Setting up Minikube's Docker:

eval $(minikube docker-env)

# Creating an serviceaccount:

kubectl create serviceaccount remco
kubectl apply -f srcs/serviceaccount.yaml

# Creating nginx:

docker build -t nginx srcs/nginx/
kubectl apply -f srcs/nginx.yaml

# Creating ftps:

docker build -t ftps srcs/ftps/
kubectl apply -f srcs/ftps.yaml

# Creating wordress:

docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/wordpress.yaml
