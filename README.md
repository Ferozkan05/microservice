To Build and Deploy Microservices to ECS Fargate


/deployments folder contains taskdefinition json of microservice that is to be deployed

example admin.json contains admission microservice deployment and patient.json containts patient microservice

For initial setup of task and service, terraform resources are used with custom modules

/modules/ecs/main.tf creates task with logging, security group for service, and service with lb and target group already added

/admin/main.tf will create task and service for admission microservice & /patient/main.tf will create task and service for patient microservice


GIT HUB WORKFLOWS

Build.yml workflow will build docker image and push to ecr based on inputs provided on trigger. Its mandatory to provide which microservice to be build, repo name of that microservice is provided as input

task-registry-apply.yml workflow is for terraform provisioning of initial setup of ECS Task, Security Group & Service with Target Group
This needs which microservice task need to created as input such as terraform directory of the microservice (ex admin), vars file for terraform, action to create or destory?. Create will do terraform aply on resources, destory will perform terraform destory

ecs-deploy.yml workflow will deploy the latest changes to ecs. 
    Inputs to be provided: Name of the microservice to deploy, Container name, Image name with version

    
