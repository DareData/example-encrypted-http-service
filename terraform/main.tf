provider "aws" {
  profile    = "default"
  region     = "eu-west-1"
  version = "~>2.45"
}

terraform {
  required_version = "~>0.12"
  backend "s3" {
    region = "eu-west-1"
    bucket = "TODO"
    key    = "tfstates/"
  }
}

module "vpc" {
  source = "./modules/vpc"
  app_name = var.app_name
  stage = var.stage
  database_port = var.database_port
}

module "aws-rds" {
  source = "./modules/aws-rds"
  app_name = var.app_name
  stage = var.stage
  subnet_id_a = module.vpc.subnet_server_id_a
  subnet_id_b = module.vpc.subnet_server_id_b
  instance_type = var.rds_instance_type
  security_group = module.vpc.database_security_group_id
  database_user = var.database_user
  database_password = var.database_password
  database_port = var.database_port
}

module "http-server" {
  source = "./modules/http-server"
  app_name = var.app_name
  stage = var.stage
  ssh_key_name = var.ssh_key_name
  subnet_id = module.vpc.subnet_server_id_a
  vpc_security_group_ids = module.vpc.vpc_security_group_ids
  instance_type = var.instance_type
  elastic_ip_allocation_id = var.http_server_elastic_ip_allocation_id
}
