provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-redis-single-node-vpc"
  cidr = "10.2.0.0/16"

  azs                 = ["${var.region}a", "${var.region}c"]
  elasticache_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
  public_subnets      = ["10.2.3.0/24", "10.2.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "redis_single_node" {
  source = "../../"

  name              = var.name
  engine            = "redis"
  engine_version    = "6.x"
  cluster_size      = 1
  node_type         = "cache.t2.micro"
  subnet_group_name = module.vpc.elasticache_subnet_group_name
}
