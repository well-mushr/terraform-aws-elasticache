provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-memcached-vpc"
  cidr = "10.0.0.0/16"

  azs                 = ["${var.region}a", "${var.region}c"]
  elasticache_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "memcached" {
  source = "../../"

  name              = var.name
  engine            = "memcached"
  engine_version    = "1.6.6"
  cluster_size      = var.cluster_size
  node_type         = "cache.t2.micro"
  subnet_group_name = module.vpc.elasticache_subnet_group_name
}
