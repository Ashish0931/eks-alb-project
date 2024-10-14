aws configure
#give requested tokens and region
#make sure eksctl and kubectl are already installed. 
eksctl create cluster --name <clustername> --region <region:ex us-east-1> --fargate #creating a fargate  cluster for better manageability.
