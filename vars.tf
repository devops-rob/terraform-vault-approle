variable "policies_path" {
  type        = string
  default     = ""
  description = "Absolute path to directory containing Vault policies"
}

variable "approle_name" {
  type        = string
  description = "The name of the role."
}

variable "role_id" {
  type        = string
  default     = null
  description = "(Optional) The RoleID of this role. If not specified, one will be auto-generated."
}

variable "approle_backend_path" {
  type        = string
  default     = null
  description = "The path that the AppRole backend is mounted at."
}

variable "bind_secret_id" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to require secret_id to be presented when logging in using this AppRole. Defaults to true."
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
  description = ""
}

variable "token_explicit_max_ttl" {
  type        = number
  default     = null
  description = ""
}

variable "token_max_ttl" {
  type        = number
  default     = null
  description = ""
}

variable "token_no_default_policy" {
  type        = bool
  default     = false
  description = ""
}

variable "token_num_uses" {
  type        = number
  default     = null
  description = "(Optional) The period, if any, in number of seconds to set on the token."
}

variable "token_period" {
  type        = number
  default     = null
  description = ""
}

variable "token_ttl" {
  type        = number
  default     = null
  description = ""
}

variable "token_type" {
  type        = string
  default     = "service"
  description = ""
}

variable "additional_policies" {
  type        = list(string)
  default     = []
  description = "A list of any additional policies to add to the AppRole."
}