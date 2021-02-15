# Lab - K8S provider for Terraform

## Dependencies

- [Kind v0.10.0](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [Terraform v0.14.6](https://www.terraform.io/downloads.html)
- [Kubectl 1.20](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Structure

```
src
├── kind-config (Kind configuration to support ingress)
├── tf-ingress (nginx ingress for terraform *in progress)
├── tf-app (application manifest created in terraform)
└── yaml-manifests (support yaml manifest )
```

## Creating cluster with kind (supporting ingress)

```
$ kind create cluster --name tf-k8s --config=src/kind-config/clusterconfig.yml 
```

## Creating ingress in kind

```
$ cd src/yaml-manifests
$ kubectl apply -f nginx-ingress-kind.yml 
```

## Creating application with terraform

```
$ cd src/tf-apps
$ terraform apply -auto-approve
```


## References

- https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#kubernetes
- https://aperogeek.fr/kubernetes-deployment-with-terraform/

