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

}
