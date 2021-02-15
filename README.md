# Lab - K8S provider for Terraform

## Dependencies

- [Kind v0.10.0]()
- [Terraform v0.14.6]()
- [Kubectl 1.20]()

## Structure

```
src
├── kind-config (Kind configuration to support ingress)
├── tf-ingress (nginx ingress for terraform)
├── tf-app (application manifest created in terraform)
└── yaml-manifests (support yaml manifest )
```

## Creating cluster with kind (supporting ingress)

```
(~) kind create cluster --name tf-k8s --config=src/kind-config/clusterconfig.yml 
```

## 


## References

- https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#kubernetes
