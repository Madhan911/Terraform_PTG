



# resource "aws_instance" "madhan" {
#   ami = var.ami_id
#   instance_type = var.instance_type_one
#   subnet_id = "subnet-07d58a5b680d16e8b"

#   tags = {
#     name = var.enviromment_name
#   }
  
# }


#creating user and group 

resource "aws_iam_user" "user001" {
  name = "user01"
}

resource "aws_iam_user" "user002" {
  name = "user02"
}

resource "aws_iam_group" "PTG" {
  name = "clara"
}
 #assign users to group


resource "aws_iam_group_membership" "PTGassignment" {
  name = "assignment"
  users = [ aws_iam_user.user001.name,
            aws_iam_user.user002.name
  ]
  group = aws_iam_group.PTG.name
  
}

#attach policy to the group

resource "aws_iam_policy_attachment" "ptg-attach" {
  name       = "test-attachment"
  # users      = [aws_iam_user.user.name]
  # roles      = [aws_iam_role.role.name]
  groups     = [aws_iam_group.PTG.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}
