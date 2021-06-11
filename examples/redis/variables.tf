variable "name" {
  type        = string
  description = "Elasticache Name"
  default     = "testing"
}

variable "region" {
  type        = string
  description = "Specified region used by provider"
  default     = "sa-east-1"
}
