output "cache_nodes" {
  description = "Cache node address"
  value       = module.memcached.memcached_cache_nodes_address
}

output "cluster_address" {
  description = "Cluster address"
  value       = module.memcached.memcached_cluster_address
}

output "configuration_endpoint" {
  description = "Configuration endpoint"
  value       = module.memcached.memcached_configuration_endpoint
}
