locals {
  path = var.policies_path == "" ? path.cwd : var.policies_path
  policies = toset([
    for pol in fileset(local.path, "*.{hcl,json}") :
    pol if pol != ".terraform.lock.hcl"
  ])

}

resource "vault_policy" "approle_policies" {
  for_each = local.policies
  name     = each.key
  policy   = file("${local.path}/${each.key}")
}


resource "vault_approle_auth_backend_role" "approle" {
  role_name = var.approle_name
  role_id   = var.role_id

  backend        = var.approle_backend_path
  bind_secret_id = var.bind_secret_id

  secret_id_bound_cidrs = var.secret_id_bound_cidrs
  secret_id_num_uses    = var.secret_id_num_uses
  secret_id_ttl         = var.secret_id_ttl

  token_bound_cidrs       = var.token_bound_cidrs
  token_explicit_max_ttl  = var.token_explicit_max_ttl
  token_max_ttl           = var.token_max_ttl
  token_no_default_policy = var.token_no_default_policy
  token_num_uses          = var.token_num_uses
  token_period            = var.token_period
  token_policies          = concat(tolist(local.policies), var.additional_policies)
  token_ttl               = var.token_ttl
  token_type              = var.token_type

}