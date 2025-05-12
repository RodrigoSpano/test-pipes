module "vpc_main" {
  source         = "../00-a-modules/vpc"
  vpc_cidr_block = var.vpc_main.cidr_block

  #  subnets
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # tags
  preset_name_tags = local.app_name_dashed
  tags             = local.tags
}
