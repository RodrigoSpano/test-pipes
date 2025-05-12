# network ACL

resource "aws_network_acl" "acl" {
  vpc_id = module.vpc_main.vpc_id

  tags = merge(
    { Name = "${local.app_name_dashed}-ACL-MAIN_VPC" }
  , local.tags)
}

# acl rules
resource "aws_network_acl_rule" "inbound_http" {
  network_acl_id = aws_network_acl.acl.id
  rule_number    = var.acl.ingress.rule_number
  rule_action    = var.acl.ingress.rule_action
  egress         = false
  protocol       = var.acl.ingress.protocol
  cidr_block     = var.acl.ingress.cidr_block
  from_port      = var.acl.ingress.from_port
  to_port        = var.acl.ingress.to_port
}

resource "aws_network_acl_rule" "outbound_all" {
  network_acl_id = aws_network_acl.acl.id
  rule_number    = var.acl.egress.rule_number
  egress         = true
  rule_action    = var.acl.egress.rule_action
  protocol       = var.acl.egress.protocol
  cidr_block     = var.acl.egress.cidr_block
  from_port      = var.acl.egress.from_port
  to_port        = var.acl.egress.to_port
}

