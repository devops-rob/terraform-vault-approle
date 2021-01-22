provider "vault" {
  address = "http://127.0.0.1:8200"
  token = var.vault_token
}

variable "vault_token" {
  description = "Set this value with the TF_VAR_vault_token environment variable"
}

resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = "approle"
}


module "example" {
  source = "devops-rob/approle/vault"

  approle_name = "example"

  depends_on = [
    vault_auth_backend.approle
  ]
}