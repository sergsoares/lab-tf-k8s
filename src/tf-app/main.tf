terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

#####################################
# Variables
#####################################

variable "port" {
  type = string
  # default = 9898
  default = 5678
}

variable "app" {
  type = string
  default = "aplication"
}

variable "namespace" {
  type = string
  default = "apps"
}

variable "image" {
  type = string
  default = "hashicorp/http-echo:0.2.3"
  # default = "stefanprodan/podinfo"
}

#####################################
# Resources
#####################################

resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "test" {
  metadata {
    name      = var.app
    namespace = var.namespace
    labels = {
      app = var.app
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        container {
          name  = var.app
          image = var.image 
          args  = ["-text=Great lab-tf-k8s"]
        }
      }
    }
  }
}

resource "kubernetes_service" "test" {
  metadata {
    name      = var.app
    namespace = var.namespace
  }
  spec {
    selector = {
      app = var.app      
    }
    port {
      port = var.port
    }
  }
}


resource "kubernetes_ingress" "test" {
  metadata {
    name = var.app
    namespace = var.namespace
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = var.app
            service_port = var.port
          }
          # path = "/ser"
        }
      }
    }
  }
}

