# Kubernetes Orchestrated Microservices Engine

An enterprise-grade, high-throughput Kubernetes orchestration architecture leveraging custom Go Operators, Terraform, Helm, Ingress-Nginx, and Prometheus telemetry.

## Architecture Highlights

* **Custom Go Operator & CRDs**: Automates zero-downtime rolling updates, status reconciliation, and automatic failovers.
* **Traffic Routing**: Handles 50k+ req/sec using Ingress-Nginx with canary traffic splitting and cert-manager automated TLS termination.
* **Infrastructure as Code**: EKS cluster provisioning using declarative Terraform modules.
* **Observability**: Real-time alerting for CPU throttling, pod health, and latency metric dashboards via Grafana & Prometheus Operator.
* **Security & RBAC**: Enforces strict PodSecurityPolicies, zero-trust NetworkPolicies, and automated Trivy vulnerability scans in CI/CD.

## Quickstart

### 1. Provision Infrastructure

cd terraform
terraform init
terraform apply -auto-approve

### 2. Deploy Operator & Resources

make deploy

### 3. Run Unit & Integration Tests

make test