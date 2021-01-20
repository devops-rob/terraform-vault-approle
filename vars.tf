variable "approle_name" {
  type        = string
  description = "(Required) The name of the AppRole."
}

variable "policies_path" {
  type        = string
  default     = ""
  description = "(Optional) The absolute path to directory containing Vault policies. If not set, it defaults to current working directory."
}

variable "role_id" {
  type        = string
  default     = null
  description = "(Optional) The RoleID of this role. If not specified, one will be auto-generated."
}

variable "approle_backend_path" {
  type        = string
  default     = null
  description = "(Optional) The unique name of the auth backend to configure. Defaults to `approle`."
}

variable "bind_secret_id" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to require `secret_id` to be presented when logging in using this AppRole. Defaults to `true`."
}

variable "secret_id_bound_cidrs" {
  type        = list(string)
  default     = null
  description = "(Optional) If set, specifies blocks of IP addresses which can perform the login operation."
}

variable "secret_id_num_uses" {
  type        = number
  default     = 3600
  description = "(Optional) The number of times any particular SecretID can be used to fetch a token from this AppRole, after which the SecretID will expire. A value of zero will allow unlimited uses."
}

variable "secret_id_ttl" {
  type        = number
  default     = null
  description = "(Optional) The number of seconds after which any SecretID expires."
}

variable "token_bound_cidrs" {
  type        = list(string)
  default     = null
  description = "(Optional) List of CIDR blocks; if set, specifies blocks of IP addresses which can authenticate successfully, and ties the resulting token to these blocks as well."
}

variable "token_explicit_max_ttl" {
  type        = number
  default     = null
  description = "(Optional) If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if `token_ttl` and `token_max_ttl` would otherwise allow a renewal."
}

variable "token_max_ttl" {
  type        = number
  default     = null
  description = "(Optional) The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
}

variable "token_no_default_policy" {
  type        = bool
  default     = false
  description = "(Optional) If set, the default policy will not be set on generated tokens; otherwise it will be added to the policies set in token_policies."
}

variable "token_num_uses" {
  type        = number
  default     = null
  description = "(Optional) The period, if any, in number of seconds to set on the token."
}

variable "token_period" {
  type        = number
  default     = null
  description = "(Optional) If set, indicates that the token generated using this role should never expire. The token should be renewed within the duration specified by this value. At each renewal, the token's TTL will be set to the value of this field. Specified in seconds."
}

variable "token_ttl" {
  type        = number
  default     = null
  description = "(Optional) The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
}

variable "token_type" {
  type        = string
  default     = "service"
  description = "(Optional) The type of token that should be generated. Can be service, batch, or default to use the mount's tuned default (which unless changed will be service tokens). For token store roles, there are two additional possibilities: default-service and default-batch which specify the type to return unless the client requests a different type at generation time."
}

variable "additional_policies" {
  type        = list(string)
  default     = []
  description = "(Optional) A list of any additional policies to add to the AppRole. These policies must already exist in Vault."
}