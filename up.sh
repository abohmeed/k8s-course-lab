#!/usr/bin/env bash
# The course cluster in one command: kind (Kubernetes 1.37), LoadBalancer and Gateway API via cloud-provider-kind.
# Needs: docker, kind v0.33+, kubectl, cloud-provider-kind v0.12+.
set -euo pipefail
cd "$(dirname "$0")"
kind get clusters | grep -qx k8s-course || kind create cluster --config kind-config.yaml
# cloud-provider-kind gives LoadBalancer IPs and the "cloud-provider-kind" GatewayClass; it runs on the host.
if ! pgrep -f cloud-provider-kind >/dev/null; then
  nohup cloud-provider-kind --enable-lb-port-mapping > cloud-provider-kind.log 2>&1 &
fi
kubectl wait --for=condition=Ready nodes --all --timeout=180s
until kubectl get gatewayclass cloud-provider-kind >/dev/null 2>&1; do sleep 2; done
kubectl get nodes
kubectl get storageclass
kubectl get gatewayclass
