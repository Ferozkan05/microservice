resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_name
  execution_role_arn       = "arn:aws:iam::376120733871:role/dev-ecs-execution-role"
  task_role_arn            = "arn:aws:iam::376120733871:role/dev-ecs-execution-role"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = var.task_name
    image     = var.image
    memory    = 512
    cpu       = 256
    essential = true
    portMappings = [
      {
        containerPort = 3000
        hostPort      = 3000
        protocol      = "tcp"
      }
    ]
  }])
}

resource "aws_ecs_service" "my_service" {
  name            = var.service_name
  cluster         = var.cluster_name
  task_definition = "arn:aws:iam::376120733871:role/dev-ecs-execution-role"
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets # Update with your actual subnet IDs
    security_groups  = var.sg   # Update with your actual security group ID
    assign_public_ip = false
  }
  load_balancer {
    elb_name = var.elb
    target_group_arn = var.tg
    container_name   = var.task_name
    container_port   = 3000
  }
}
