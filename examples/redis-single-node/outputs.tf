output "single_node_address" {
  description = "Address to redis node"
  value       = module.redis_single_node.redis_single_node_address
}
