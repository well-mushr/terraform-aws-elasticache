output "primary_address" {
  description = "Address to primary nodes"
  value       = module.redis_cluster.redis_cluster_primary_address
}

output "reader_address" {
  description = "Address to replica nodes"
  value       = module.redis_cluster.redis_cluster_reader_address
}
