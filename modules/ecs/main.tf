resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_name
  execution_role_arn       = var.iam
  task_role_arn            = var.iam
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
        containerPort = var.cport
        hostPort      = var.hport
        protocol      = "tcp"
      }
    ]
logConfiguration = {
    logDriver = "awslogs"
    options = {
      awslogs-group         = var.lg
      awslogs-region        = "ap-south-1"
      awslogs-stream-prefix = "ecs"
    }  
}
}])

}
resource "aws_security_group" "ecs_sg" {
  name   = "${var.service_name}-ecs-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.cport
    to_port     = var.cport
    protocol    = "tcp"
    security_groups  = [var.sg]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_ecs_service" "my_service" {
  name            = var.service_name
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets 
    security_groups  = [aws_security_group.ecs_sg.id]   
    assign_public_ip = false
  }
  load_balancer {
    #elb_name = var.elb
    target_group_arn = var.tg
    container_name   = var.task_name
    container_port   = var.cport
  }
  depends_on = [
 aws_ecs_task_definition.my_task_definition
]

  
}
