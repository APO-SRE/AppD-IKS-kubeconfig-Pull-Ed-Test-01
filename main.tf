# Providers ----------------------------------------------------------------------------------------
provider "intersight" {
  apikey    = var.intersight_apikey
  secretkey = var.intersight_secretkey
  endpoint  = var.intersight_endpoint
}

provider "kubernetes" {
  host                   = yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.server
  cluster_ca_certificate = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.certificate-authority-data)
  client_certificate     = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-key-data)
}

# Data Sources -------------------------------------------------------------------------------------
data "intersight_kubernetes_cluster" "iks" {
  name = var.cluster_name
}

# Resources ----------------------------------------------------------------------------------------
resource "null_resource" "kube_config_trigger" {
  # fire the trigger when the iks cluster requires re-provisioning.
  triggers = {
    iks_cluster_moid = data.intersight_kubernetes_cluster.iks.results[0].moid

  # execute the following 'local-exec' provisioners each time the trigger is invoked.
  # generate the iks kubeconfig file using 'cat' and heredoc.
  provisioner "local-exec" {
    working_dir = "."
    command     = <<EOD
cat <<EOF > "${var.cluster_name}.yaml"
${base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)}
EOF
EOD
  }
}
