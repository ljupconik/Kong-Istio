#!/bin/bash

# curl --insecure https://localhost/echo-httproute?apikey=echo_key
# curl --insecure -H 'apikey: echo_key' https://localhost/echo-httproute

# curl -sSL http://httpbin.org/headers
# curl -sSL http://edition.cnn.com/politics
# kubectl logs -f -l gateway.networking.k8s.io/gateway-name=bin-egress-gateway -c istio-proxy

# 
# k get all -n echons
# k get secret -n echons
# k get kongplugin -n echons
# k get kongconsumer -n echons
# k get httproute -n echons
# k get ingress -n echons

istioctl install --set profile=demo -y --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY

# kubectl create namespace kong
# kubectl label ns kong istio-injection=enabled

# kubectl create namespace echons
# kubectl label ns echons istio-injection=enabled

# kubectl label ns default istio-injection=enabled

# kubectl create secret tls my-tls-secret \
#   --cert=/home/ljupco/certs/server.crt \
#   --key=/home/ljupco/certs/server.key

for f in *.yaml; do kubectl apply -f $f; done
