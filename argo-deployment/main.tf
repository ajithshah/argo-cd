provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://repo.m2pfintech.com/repository/helm"
  chart      = "argo-cd"
  namespace = "argocd"
  version    = "5.51.5"

  values = [
    "${file("values.yaml")}"
  ]
}
