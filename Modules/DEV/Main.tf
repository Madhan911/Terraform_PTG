
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


# resource "aws_instance" "madhan" {
#   ami = var.ami_id
#   instance_type = var.instance_type_one
#   subnet_id = "subnet-07d58a5b680d16e8b"

#   tags = {
#     name = var.enviromment_name
#   }
  
# }


#creating user and group 

resource "aws_iam_user" "user01" {
  name = "user01"
}

resource "aws_iam_user" "user02" {
  name = "user02"
}

resource "aws_iam_group" "clara" {
  name = "clara"
}
 #assign users to group


resource "aws_iam_group_membership" "assignment" {
  name = "assignment"
  users = [ aws_iam_user.user01.name,
            aws_iam_user.user02.name
  ]
  group = aws_iam_group.clara.name
  
}

#attach policy to the group

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  # users      = [aws_iam_user.user.name]
  # roles      = [aws_iam_role.role.name]
  groups     = [aws_iam_group.clara.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}
