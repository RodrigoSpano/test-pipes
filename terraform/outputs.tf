output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc_main.vpc_cidr_block
}

output "public_subnets" {
  description = "public subnets"
  value       = module.vpc_main.public_subnets
}

output "private_subnets" {
  description = "private subnets"
  value       = module.vpc_main.private_subnets
}
