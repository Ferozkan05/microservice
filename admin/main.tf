terraform {
  backend "s3" {
    bucket         = "tf-ecs-fz"
    key            = "admin/terraform.tfstate"
    region         = "ap-south-1"

    encrypt        = true
  }
}
provider "aws" {
  region = "ap-south-1"
}

module "ecs" {
  source = "../modules/ecs"
  task_name = "admin"
  service_name = "admin-svc"
  cluster_name = "arn:aws:ecs:ap-south-1:376120733871:cluster/dev-ecs-cluster"
image = "376120733871.dkr.ecr.ap-south-1.amazonaws.com/dev-admin-repo:latest"
subnets = [  "subnet-0385badd767f03c1e",  "subnet-0e2e89e5b49e20703"]
sg = [ "sg-0f0c7482f9f1e92e2" ]
tg = "arn:aws:elasticloadbalancing:ap-south-1:376120733871:targetgroup/dev-ecs-tg-admission/b5b95b8c99a272f7"
cport = 3001
hport = 3001
bucket = "admin/terraform.tfstate"
lg = "ecs/admin"
}
