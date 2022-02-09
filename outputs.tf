# Outputs ------------------------------------------------------------------------------------------
output "cluster_name" {
  description = "Name of the IKS Cluster."
  value       = var.cluster_name
}

output "iks_cluster_moid" {
  description = "Kubernetes IKS managed object ID."
  value       = data.intersight_kubernetes_cluster.iks.results[0].moid
}

output "iks_kube_config" {
  description = "Kubernetes IKS kube_config."
  value       = base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)
}

output "iks_host" {
  description = "Kubernetes IKS cluster host."
  value       = yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.server
}

output "iks_cluster_ca_certificate" {
  description = "Kubernetes IKS cluster certificate authority (CA)."
  value       = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.certificate-authority-data)
}

output "iks_client_certificate" {
  description = "Kubernetes IKS cluster client certificate."
  value       = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-certificate-data)
}

output "iks_client_key" {
  description = "Kubernetes IKS cluster client key."
  value       = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-key-data)
}
