# PBL ROUTE TABLE
resource "aws_route_table" "rt_public" {
  vpc_id = module.vpc_main.vpc_id

  route {
    cidr_block = var.route_table.public.cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(
    { Name = "${local.app_name_dashed}-RT-PBL" }
  )
}

# PBL ROUTE ASSOC
# public assoc
resource "aws_route_table_association" "public_rt_subnets" {
  for_each = module.vpc_main.public_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt_public.id
  depends_on     = [module.vpc_main.public_subnets, aws_route_table.rt_public]
}

#  PVT ROUTE
resource "aws_route_table" "rt_private" {
  for_each = aws_nat_gateway.natgw

  vpc_id = module.vpc_main.vpc_id

  route {
    cidr_block = var.route_table.public.cidr_block
    gateway_id = each.value.id
  }

  tags = merge(
    { Name = "${local.app_name_dashed}-RT-PVT-${each.key}" }
  )
}

# assoc pvt
resource "aws_route_table_association" "private_rt_subnets" {
  for_each = module.vpc_main.private_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt_private[each.key].id
  depends_on     = [module.vpc_main.private_subnets, aws_route_table.rt_private]
}
