customer    = "CLARIN"
environment = "DEVELOP"
project     = "CLARINCITO"
region      = "us-east-1"
sso_profile = "academy-box-2"

vpc_main = {
  cidr_block = "10.0.0.0/16"
}

public_subnets = {
  PBL-AZa = {
    cidr_block              = "10.0.1.0/24"
    az                      = "us-east-1a"
    map_public_ip_on_launch = true
  },
  PBL-AZb = {
    cidr_block              = "10.0.2.0/24"
    az                      = "us-east-1b"
    map_public_ip_on_launch = true
  }
}

private_subnets = {
  PVT-AZa = {
    cidr_block              = "10.0.3.0/24"
    az                      = "us-east-1a"
    map_public_ip_on_launch = false
  },
  PVT-AZb = {
    cidr_block              = "10.0.4.0/24"
    az                      = "us-east-1b"
    map_public_ip_on_launch = false
  }
}

acl = {
  ingress = {
    rule_number = 100
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
  }
  egress = {
    rule_number = 100
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
  }
}

route_table = {
  private = {
    cidr_block = "0.0.0.0/0"
  }
  public = {
    cidr_block = "0.0.0.0/0"
  }
}
