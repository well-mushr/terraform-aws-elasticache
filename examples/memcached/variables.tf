variable "name" {
  type        = string
  description = "Elasticache Name"
}

variable "region" {
  type        = string
  description = "Region used by provider"
}

variable "cluster_size" {
  type        = number
  description = "Size of the cluster"
}
