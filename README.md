# Terraform module to manager AWS Elasticache
Terraform module which creates AWS Elasticache.

These features are supported:
- Memcached Clusters
- Redis Single Node
- Redis with Read Nodes
- Redis Clusters (shards and replicas)

## Usage
```
module "redis" {
  source = "github.com/wmaramos/terraform-aws-elasticache"

  name = "my-redis-cluster"
  engine = "redis"
  engine_version = "6.x"

  node_type = "cache.t2.micro"
  cluster_size = 2

  subnet_group_name = "elasticache_subnet_group"
}
```

## Examples
- [Memcached Cluster](https://github.com/wmaramos/terraform-aws-elasticache/tree/master/examples/memcached)
- [Redis Cluster (shards and replicas)](https://github.com/wmaramos/terraform-aws-elasticache/tree/master/examples/redis-cluster)
- [Redis Single Node](https://github.com/wmaramos/terraform-aws-elasticache/tree/master/examples/redis-single-node)
- [Redis with Replicas](https://github.com/wmaramos/terraform-aws-elasticache/tree/master/examples/redis)

## Requirements

| Name                                                                      | Version             |
| ------------------------------------------------------------------------- | ------------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0, < 0.15.0 |

## Providers

| Name                                              | Version |
| ------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_elasticache_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster)                     | resource |
| [aws_elasticache_replication_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |

## Inputs

| Name                                                                                                                                                     | Description                                                                       | Type           | Default                     | Required |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------------- | --------------------------- | :------: |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled)                                   | Whether to enable encryption at rest                                              | `bool`         | `false`                     |    no    |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token)                                                                                       | The password used to access a protected server                                    | `string`       | `null`                      |    no    |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade)                                   | Specifiees wheter a minor engines upgrades will be applied automatically          | `bool`         | `true`                      |    no    |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones)                                                               | A list of availability zones                                                      | `list(string)` | `[]`                        |    no    |
| <a name="input_az_mode"></a> [az\_mode](#input\_az\_mode)                                                                                                | Wheter the nodes in Memcached are created in single or cross availability zones   | `string`       | `"single-az"`               |    no    |
| <a name="input_cluster_mode"></a> [cluster\_mode\](#input\_cluster\_mode)                                                                                | Create a native Redis Cluster                                                     | `bool`         | `false`                     |    no    |
| <a name="input_cluster_mode_num_node_groups"></a> [cluster\_mode\_num\_node\_groups](#input\_cluster\_mode\_num\_node\_groups)                           | Number of node groups (shards) for Redis replication group                        | `number`       | `2`                         |    no    |
| <a name="input_cluster_mode_replicas_per_node_group"></a> [cluster\_mode\_replicas\_per\_node\_group](#input\_cluster\_mode\_replicas\_per\_node\_group) | Number of replica nodes in each node group                                        | `number`       | `2`                         |    no    |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size)                                                                                 | The initial number of cache nodes                                                 | `number`       | `1`                         |    no    |
| <a name="input_create_elasticache"></a> [create\_elasticache](#input\_create\_elasticache)                                                               | Controls if Elasticache should be created                                         | `bool`         | `true`                      |    no    |
| <a name="input_engine"></a> [engine](#input\_engine)                                                                                                     | The name of the cache engine                                                      | `string`       | n/a                         |   yes    |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version)                                                                           | The version number of the cache engine                                            | `string`       | n/a                         |   yes    |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier)                                        | The name of your final node group (shard) snapshot                                | `string`       | `null`                      |    no    |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id)                                                                                     | The ARN of the key that you wish to use if encrypting at rest                     | `string`       | `null`                      |    no    |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window)                                                               | Specifies the weekly time range for maintenance of the cache cluster              | `string`       | `"sun:03:00-sun:04:00"`     |    no    |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az)                                                                                             | Specifies whether to enable Multi-AZ Support for the replication group            | `bool`         | `true`                      |    no    |
| <a name="input_name"></a> [name](#input\_name)                                                                                                           | Specifies Elasticache name                                                        | `string`       | n/a                         |   yes    |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type)                                                                                          | The instance class to be used                                                     | `string`       | n/a                         |   yes    |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn)                                                 | An ARN of an SNS topic                                                            | `string`       | `null`                      |    no    |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)                                                       | The name of the parameter group to associate                                      | `string`       | `null`                      |    no    |
| <a name="input_port"></a> [port](#input\_port)                                                                                                           | The number on which each of the cache nodes will accept connections               | `number`       | `null`                      |    no    |
| <a name="input_replication_group_description"></a> [replication\_group\_description](#input\_replication\_group\_description)                            | A user-created description for the replication group                              | `string`       | `"Redis replication group"` |    no    |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids)                                                             | One or more Security Groups associated with this replication group                | `list(string)` | `[]`                        |    no    |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit)                                           | The number of days for which Elasticache will retain automatic snapshots          | `number`       | `null`                      |    no    |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window)                                                                        | The daily time range (in UTC) during which Elasticache will take a daily snapshot | `string`       | `"02:00-03:00"`             |    no    |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name)                                                                | The name of the cache subnet group to be used                                     | `string`       | `null`                      |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                                           | A map of tags to assign to the resource                                           | `map(string)`  | `{}`                        |    no    |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled)                                     | Whether to enable encryption in transit                                           | `bool`         | `false`                     |    no    |

## Outputs

| Name                                                                                                                                     | Description                                     |
| ---------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| <a name="output_memcached_cache_nodes_address"></a> [memcached\_cache\_nodes\_address](#output\_memcached\_cache\_nodes\_address)        | Node address for each memcached                 |
| <a name="output_memcached_cluster_address"></a> [memcached\_cluster\_address](#output\_memcached\_cluster\_address)                      | Memcached cluster endpoint                      |
| <a name="output_memcached_configuration_endpoint"></a> [memcached\_configuration\_endpoint](#output\_memcached\_configuration\_endpoint) | Memcached configuration endpoint                |
| <a name="output_redis_cluster_primary_address"></a> [redis\_cluster\_primary\_address](#output\_redis\_cluster\_primary\_address)        | Primary address to redis cluster                |
| <a name="output_redis_cluster_reader_address"></a> [redis\_cluster\_reader\_address](#output\_redis\_cluster\_reader\_address)           | Reader address (replica nodes) to redis cluster |
| <a name="output_redis_single_node_address"></a> [redis\_single\_node\_address](#output\_redis\_single\_node\_address)                    | Node address when redis single node             |
