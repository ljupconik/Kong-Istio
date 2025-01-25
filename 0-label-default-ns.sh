#!/bin/bash

# istioctl install --set profile=minimal -y

# kubectl create namespace kong
# kubectl label ns kong istio-injection=enabled

# kubectl create namespace echons
# kubectl label ns echons istio-injection=enabled

# kubectl label ns default istio-injection=enabled
kubectl create secret tls my-tls-secret \
  --cert=/home/ljupco/certs/server.crt \
  --key=/home/ljupco/certs/server.key

for f in *.yaml; do kubectl apply -f $f; done