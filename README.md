# Lab - K8S provider for Terraform

## Dependencies

- [Kind v0.10.0]()
- [Terraform v0.14.6]()
- [Kubectl 1.20]()

## Creating cluster

```
(~) kind create cluster --name tf-k8s --config=src/kind-config/clusterconfig.yml 
```



## References

- https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#kubernetes
