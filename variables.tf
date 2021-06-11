variable "apply_immediately" {
  type        = bool
  description = "Wheter any database modifications are applied immediatly"
  default     = false
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Whether to enable encryption at rest"
  default     = false
}

variable "auth_token" {
  type        = string
  description = "The password used to access a protected server"
  default     = null
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Specifiees wheter a minor engines upgrades will be applied automatically"
  default     = true
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones"
  default     = []
}

variable "az_mode" {
  type        = string
  description = "Wheter the nodes in Memcached are created in single or cross availability zones"
  default     = "single-az"
}

variable "create_elasticache" {
  type        = bool
  description = "Controls if Elasticache should be created"
  default     = true
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Create a native Redis Cluster"
  default     = false
}

variable "cluster_mode_num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for Redis replication group"
  default     = 2
}

variable "cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group"
  default     = 2
}

variable "cluster_size" {
  type        = number
  description = "The initial number of cache nodes"
  default     = 1
}

variable "engine" {
  type        = string
  description = "The name of the cache engine"
}

variable "engine_version" {
  type        = string
  description = "The version number of the cache engine"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final node group (shard) snapshot"
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "The ARN of the key that you wish to use if encrypting at rest"
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "Specifies the weekly time range for maintenance of the cache cluster"
  default     = "sun:03:00-sun:04:00"
}

variable "multi_az" {
  type        = bool
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
  default     = true
}

variable "name" {
  type        = string
  description = "Specifies Elasticache name"
}

variable "node_type" {
  type        = string
  description = "The instance class to be used"
}

variable "notification_topic_arn" {
  type        = string
  description = "An ARN of an SNS topic"
  default     = null
}

variable "parameter_group_name" {
  type        = string
  description = "The name of the parameter group to associate"
  default     = null
}

variable "port" {
  type        = number
  description = "The number on which each of the cache nodes will accept connections"
  default     = null
}

variable "replication_group_description" {
  type        = string
  description = "A user-created description for the replication group"
  default     = "Redis replication group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "One or more Security Groups associated with this replication group"
  default     = []
}

variable "snapshot_retention_limit" {
  type        = number
  description = "The number of days for which Elasticache will retain automatic snapshots"
  default     = null
}

variable "snapshot_window" {
  type        = string
  description = "The daily time range (in UTC) during which Elasticache will take a daily snapshot"
  default     = "02:00-03:00"
}

variable "subnet_group_name" {
  type        = string
  description = "The name of the cache subnet group to be used"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}
}

variable "transit_encryption_enabled" {
  type        = bool
  description = "Whether to enable encryption in transit"
  default     = false
}
