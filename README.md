# Kubernetes course lab

Lab files for the course "Kubernetes in Arabic: Beginner to Advanced, Hands-On".

## What you need

- Docker Engine on Linux (primary path): https://docs.docker.com/engine/install/
  Docker Desktop is optional on macOS or Windows: https://docs.docker.com/desktop/
  Alternatives: Docker Engine in WSL2, Colima.
- kind v0.33 or newer: https://kind.sigs.k8s.io/docs/user/quick-start/#installation
- kubectl: https://kubernetes.io/docs/tasks/tools/
- cloud-provider-kind v0.12 or newer: https://github.com/kubernetes-sigs/cloud-provider-kind#install
  (on macOS: `brew install cloud-provider-kind`; elsewhere: `go install sigs.k8s.io/cloud-provider-kind@latest`
  or a release binary). On macOS and Windows it may need to run with sudo or as administrator.

## Getting Kubernetes section

- kubectl install: https://kubernetes.io/docs/tasks/tools/
- Version skew: kubectl within one minor of 1.37. https://kubernetes.io/releases/version-skew-policy/
- kubeconfig: https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
  Multiple clusters: https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
  kubectl config: https://kubernetes.io/docs/reference/kubectl/generated/kubectl_config/
- kind quick start: https://kind.sigs.k8s.io/docs/user/quick-start/
- cloud-provider-kind install: https://github.com/kubernetes-sigs/cloud-provider-kind#install
  Project: https://github.com/kubernetes-sigs/cloud-provider-kind
- Course lab repo: https://github.com/abohmeed/k8s-course-lab

```
./up.sh      # creates the cluster k8s-course (3 nodes, Kubernetes 1.37) and starts cloud-provider-kind
./down.sh    # deletes the cluster and stops cloud-provider-kind
```

## The course cluster

```
./up.sh      # creates the cluster k8s-course (3 nodes, Kubernetes 1.37) and starts cloud-provider-kind
./down.sh    # deletes the cluster and stops cloud-provider-kind
```

cloud-provider-kind gives Services of type LoadBalancer an external IP and provides the Gateway API
(GatewayClass `cloud-provider-kind`).

## Troubleshooting

Check `docker ps`, then `cloud-provider-kind.log` in the repo root.

## Folders

| Folder | Section |
|---|---|
| s03 | Pods: requests and limits, probes, volumes, PersistentVolumeClaims |
| s05 | Services: LoadBalancer, ExternalName, a Service without a selector |
| s06 | Gateway API: path and host routing, TLS termination |
| s10 | NetworkPolicy |
| s11 | StatefulSets: MySQL |
| s12 | Final project: the WeatherApp database and its UI behind a Gateway (HTTPS) |
| UI, auth, weather, mysql-init, kubernetes | The WeatherApp source and its manifests |

Certificates and keys are created during the labs with openssl and are never committed.
