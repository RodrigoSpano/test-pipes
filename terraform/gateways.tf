# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = module.vpc_main.vpc_id

  tags = merge(
    { Name = "${local.app_name_dashed}-IGW" }
  , local.tags)

  depends_on = [module.vpc_main]
}

resource "aws_eip" "nat" {
  for_each = module.vpc_main.private_subnets

  tags = merge(
    { Name = "${local.app_name_dashed}-EIP-${each.value.availability_zone}" }, local.tags
  )
}

resource "aws_nat_gateway" "natgw" {
  for_each = module.vpc_main.private_subnets

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.id

  tags = merge(
    { Name = "${local.app_name_dashed}-NATGW-${each.value.availability_zone}" }, local.tags
  )
}

