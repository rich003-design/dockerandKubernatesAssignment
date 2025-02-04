#!/bin/bash
# run.sh: Script to run my Docker container

# Install Minikube
brew install minikube

# Install Kubectl (Kubernetes CLI)
brew install kubectl

# Check if Minikube and Kubectl are installed:
minikube version
kubectl version --client

# Start a local Kubernetes cluster using Minikube.
minikube start --driver=docker
# The --driver=docker flag tells Minikube to run on Docker.

# Verify the Minikube Cluster is Running
kubectl get nodes

# Create a Simple "Hello World" Deployment
# We will now deploy a simple container running the official hello-world Docker image.
# Create a Deployment
kubectl create deployment hello-world --image=hello-world

# Verify Deployment
kubectl get deployments

# Expose the Deployment
# Since the hello-world image exits immediately, we will use another simple container (nginx) for demonstration.
kubectl delete deployment hello-world
kubectl create deployment hello-world --image=nginx

# Expose the Deployment as a Service
kubectl expose deployment hello-world --type=NodePort --port=80
# This creates a Kubernetes Service that maps port 80 of the container to a NodePort.

# Get Minikube Service URL
minikube service hello-world --url



