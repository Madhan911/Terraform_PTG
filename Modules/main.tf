terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}


provider "aws" {
    access_key = "AKIAX35BG44ZYKYFAAVX"
    secret_key = "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"
    region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "madhans3ptg"
    key    = "foo/terraform.tfstate"
    # dynamodb_table = "nanimadhanmohan"
    region = "us-east-1"
    
  }

}

module "user" {
    source = ".//IAM"
  
}

# module "EKS" {
#     source = ".//EKS"
    
# }


