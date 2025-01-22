#!/bin/bash

istioctl install --set profile=minimal -y
kubectl label ns default istio-injection=enabled