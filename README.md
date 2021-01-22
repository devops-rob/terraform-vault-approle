# Vault AppRole Terraform module

The Vault AppRole Terraform module configures HashiCorp Vault AppRoles and associated policies for machines or applications to authenticate against Vault. For more information on AppRole, refer to the [documentation.](https://www.vaultproject.io/docs/auth/approle)

### Prerequisites

This module requires the AppRole auth method to be enabled and configured at a path of your choice.

### Usage

This module supports the creation of Vault policies written in HCL and JSON.  These policies can be stored in any location on the machine running the `terraform apply`.  By default, the module will look in the current working directory for any policy files. This can be changed by setting the `policies_path` variable to the absolute path of your Vault policy files. The module will write these policies into Vault.

The module also provides the option of adding pre-existing Vault policies, in addition to, or instead of Vault policies defined by this module. To achieve the latter, simply do not create any Vault policy files in the current working directory and do not set the `policies_path` variable.

The below code snippet is an example of how to use the module:

```hcl
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
```