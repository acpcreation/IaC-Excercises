provider "aws" {
  region  = var.region_selection
}

terraform {
  cloud {
    hostname     = "api.app.stackguardian.io"
    organization = "of-the-galaxy"

    workspaces {
      name = "wfgrps:Demo-Environment:Alex-WFG:wfs:aws-ec2-simple"
    }
  }
}
