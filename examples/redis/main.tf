provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-redis-vpc"
  cidr = "10.1.0.0/16"

  azs                 = ["${var.region}a", "${var.region}c"]
  elasticache_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets      = ["10.1.3.0/24", "10.1.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "redis" {
  source = "../../"

  name              = var.name
  engine            = "redis"
  engine_version    = "6.x"
  cluster_size      = 2
  node_type         = "cache.t2.micro"
  subnet_group_name = module.vpc.elasticache_subnet_group_name
}
