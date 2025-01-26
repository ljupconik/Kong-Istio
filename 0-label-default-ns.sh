#!/bin/bash

# curl --insecure https://localhost/echo-httproute?apikey=hello_world
# curl --insecure -H 'apikey: hello_world' https://localhost/echo-httproute

# k get all -n echons
# k get secret -n echons
# k get kongplugin -n echons
# k get kongconsumer -n echons
# k get httproute -n echons
# k get ingress -n echons

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

k get all -n echons
k get secret -n echons
k get kongplugin -n echons
k get kongconsumer -n echons
k get httproute -n echons
k get ingress -n echons