resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task-family"
  execution_role_arn       = "arn:aws:iam::376120733871:role/dev-ecs-execution-role"
  task_role_arn            = "arn:aws:iam::376120733871:role/dev-ecs-execution-role"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "my-container"
    image     = "${aws_ecr_repository.my_repository.repository_url}:latest"
    memory    = 512
    cpu       = 256
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
      }
    ]
  }])
}

resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"] # Update with your actual subnet IDs
    security_groups  = ["sg-xxxxxxxx"]  # Update with your actual security group ID
    assign_public_ip = true
  }
}
