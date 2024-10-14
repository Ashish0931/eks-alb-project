provider "aws" {
  region = "your-preferred-region"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-fargate-cluster"
  subnets         = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]
  vpc_id          = "vpc-xxxxxxxxxxxxxxxxx"
  cluster_version = "1.21"
  fargate_profile = {
    eks_cluster_name = "eks-fargate-cluster"
    subnets          = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]
  }
}
