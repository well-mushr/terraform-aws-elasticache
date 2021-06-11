output "memcached_cache_nodes_address" {
  description = "Node address for each memcached"
  value       = try([for i in aws_elasticache_cluster.main.*.cache_nodes[0] : i.address], null)
}

output "memcached_cluster_address" {
  description = "Memcached cluster endpoint"
  value       = try(aws_elasticache_cluster.main.*.cluster_address[0], null)
}

output "memcached_configuration_endpoint" {
  description = "Memcached configuration endpoint"
  value       = try(aws_elasticache_cluster.main.*.cluster_address[0], null)
}

output "redis_single_node_address" {
  description = "Node address when redis single node"
  value       = try([for i in aws_elasticache_cluster.main.*.cache_nodes[0] : i.address][0], null)
}

output "redis_cluster_primary_address" {
  description = "Primary address to redis cluster"
  value       = try(aws_elasticache_replication_group.main.*.primary_endpoint_address[0], null)
}

output "redis_cluster_reader_address" {
  description = "Reader address (replica nodes) to redis cluster"
  value       = try(aws_elasticache_replication_group.main.*.reader_endpoint_address[0], null)
}
