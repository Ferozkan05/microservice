task_name = "patient"
service_name = "patient-svc"
cluster_name = "dev-ecs-cluter"
image = "376120733871.dkr.ecr.ap-south-1.amazonaws.com/dev-hospital-repo:latest"
subnets = [  "subnet-072d3230e8619b10c",  "subnet-0a569c5e7fa311f0c"]
sg = [ "sg-0f0c7482f9f1e92e2" ]
tg = "arn:aws:elasticloadbalancing:ap-south-1:376120733871:targetgroup/dev-ecs-tg/c178c186098d6b0b"
elb = "dev-alb-2029066131.ap-south-1.elb.amazonaws.com"
