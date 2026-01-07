# NGINX Stable Helm Chart

This Helm chart deploys the NGINX Ingress Controller from the official NGINX Helm repository.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- EKS cluster with worker nodes

## Installation

1. Add the NGINX Helm repository:
```bash
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
```

2. Install the chart:
```bash
helm upgrade --install nginx-ingress . --namespace nginx-ingress --create-namespace
```

3. Or use the provided deployment script:
```bash
chmod +x deployment.yaml
./deployment.yaml
```

## Configuration

The following table lists the configurable parameters and their default values:

| Parameter | Description | Default |
|-----------|-------------|---------|
| `nginx-ingress.controller.replicaCount` | Number of controller replicas | `2` |
| `nginx-ingress.controller.service.type` | Service type | `LoadBalancer` |
| `nginx-ingress.controller.ingressClass` | Ingress class name | `nginx` |
| `nginx-ingress.controller.enablePrometheusMetrics` | Enable Prometheus metrics | `true` |

## Accessing the NGINX Ingress Controller

After installation, get the external IP of the LoadBalancer:

```bash
kubectl get svc nginx-ingress-controller -n nginx-ingress
```

## Uninstalling the Chart

To uninstall/delete the deployment:

```bash
helm uninstall nginx-ingress -n nginx-ingress
```