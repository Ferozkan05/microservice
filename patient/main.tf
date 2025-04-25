terraform {
  backend "s3" {
    bucket         = "tf-ecs-fz"
    key            = "patient/terraform.tfstate"
    region         = "ap-south-1"

    encrypt        = true
  }
}
provider "aws" {
  region = "ap-south-1"
}

module "ecs" {
  source = "../modules/ecs"
  task_name = "patient"
service_name = "patient-svc"
cluster_name = "arn:aws:ecs:ap-south-1:376120733871:cluster/dev-ecs-cluster"
image = "376120733871.dkr.ecr.ap-south-1.amazonaws.com/dev-hospital-repo:latest"
subnets = [  "subnet-0385badd767f03c1e",  "subnet-0e2e89e5b49e20703"]
sg = [ "sg-0f0c7482f9f1e92e2" ]
tg = "arn:aws:elasticloadbalancing:ap-south-1:376120733871:targetgroup/dev-ecs-tg/c178c186098d6b0b"
cport = 3000
hport = 3000
bucket = "patient/terraform.tfstate"
lg = "ecs/patients"
}
