locals {
  memcached_cluster = var.create_elasticache && var.engine == "memcached"
  redis_cluster     = var.create_elasticache && var.engine == "redis" && (var.cluster_size > 1 || var.cluster_mode_enabled)
  single_node_redis = var.create_elasticache && var.engine == "redis" && (var.cluster_size == 1 && ! var.cluster_mode_enabled)
}

resource "aws_elasticache_cluster" "main" {
  count = local.memcached_cluster || local.single_node_redis ? 1 : 0

  cluster_id                   = var.name
  engine                       = var.engine
  engine_version               = var.engine_version
  node_type                    = var.node_type
  num_cache_nodes              = var.cluster_size
  parameter_group_name         = var.parameter_group_name
  preferred_availability_zones = local.memcached_cluster ? var.availability_zones : null
  az_mode                      = local.memcached_cluster ? var.az_mode : null
  maintenance_window           = var.maintenance_window
  notification_topic_arn       = var.notification_topic_arn
  port                         = var.port
  security_group_ids           = var.security_group_ids
  subnet_group_name            = var.subnet_group_name
  apply_immediately            = var.apply_immediately
  tags                         = var.tags
}

resource "aws_elasticache_replication_group" "main" {
  count = local.redis_cluster ? 1 : 0

  automatic_failover_enabled    = var.multi_az
  availability_zones            = var.availability_zones
  replication_group_id          = var.name
  replication_group_description = var.replication_group_description
  engine                        = var.engine
  engine_version                = var.engine_version
  node_type                     = var.node_type
  number_cache_clusters         = var.cluster_mode_enabled ? null : var.cluster_size
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  auth_token                    = var.transit_encryption_enabled ? var.auth_token : null
  transit_encryption_enabled    = var.transit_encryption_enabled
  final_snapshot_identifier     = var.final_snapshot_identifier
  kms_key_id                    = var.kms_key_id
  maintenance_window            = var.maintenance_window
  multi_az_enabled              = var.multi_az
  notification_topic_arn        = var.notification_topic_arn
  security_group_ids            = var.security_group_ids
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_group_name             = var.subnet_group_name
  apply_immediately             = var.apply_immediately
  tags                          = var.tags

  dynamic "cluster_mode" {
    for_each = var.cluster_mode_enabled ? ["true"] : []

    content {
      replicas_per_node_group = var.cluster_mode_replicas_per_node_group
      num_node_groups         = var.cluster_mode_num_node_groups
    }
  }
}
