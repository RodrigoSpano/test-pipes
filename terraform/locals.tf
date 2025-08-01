locals {
  app_name_dashed = "${var.customer}-${var.project}-${var.environment}"
  project_name    = var.project

  some_new_tag = "pepito"

  tags = {
    application_name = local.app_name_dashed
    environment      = var.environment
    team             = "devops"
    project          = local.app_name_dashed
    created_by       = "terraform"
    customer         = var.customer
    code_repo        = "terraform-rodrigo-s"
    provisioner      = "terraform"
  }
}
