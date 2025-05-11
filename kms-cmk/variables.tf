variable "description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = "Customer Managed Key"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "rotation_period_in_days" {
  description = "Duration in days after which the key is automatically rotated"
  type        = number
  default     = 365
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 15
}

variable "alias_name" {
  description = "Name of the alias (do not include 'alias/' prefix)"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9/_-]+$", var.alias_name)) && length(var.alias_name) <= 256
    error_message = "Alias name must be alphanumeric and <= 256 chars."
  }
}

variable "key_usage" {
  description = "Specifies the intended use of the key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "additional_key_owners" {
  description = "List of IAM ARNs that should have full key permissins"
  type        = list(string)
  default     = []
}

variable "additional_key_admins" {
  description = "List of IAM ARNs that should have key administration permissions"
  type        = list(string)
  default     = []
}

variable "key_users" {
  description = "List of IAM ARNs that should have key usage permissions"
  type        = list(string)
  default     = []
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}