eksctl utils associate-iam-oidc-provider --cluster YOUR_CLUSTER_NAME --approve #create oidc provider to give access to your cluster for creating/deleting resources.
curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.6.1/docs/install/iam_policy.json #create IAM policy by downloading this json file
aws iam create-policy \
--policy-name AWSLoadBalancerControllerIAMPolicy \
--policy-document file://iam_policy.json #create iam policy to create/delete nodes
eksctl create iamserviceaccount \    
--cluster=YOUR_CLUSTER_NAME \  
--namespace=kube-system \  
--name=aws-load-balancer-controller \  
--attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \  
--override-existing-serviceaccounts \  
--approve #create iamservice account to perform action in your cluster on your behalf. 
kubectl get serviceaccount aws-load-balancer-controller --namespace kube-system - tocheck if service account is created successfully. 
helm repo add eks https://aws.github.io/eks-charts #make sure helm is installed. this command is used to download eks using helm
  helm repo update eks #update the eks chart. 

  helm install aws-load-balancer-controller eks/aws-load-balancer-controller \      #we are installing load balancer here from eks chart 
--set clusterName=YOUR_CLUSTER_NAME \  
--set serviceAccount.create=false \  
--set region=YOUR_REGION_CODE \  
--set vpcId=<VPC_ID> \  
--set serviceAccount.name=aws-load-balancer-controller \  #mention the service account created on line 6. 
-n kube-system #you can mention any namespace. but a different namespace is advisable for better management. 
kubectl get deployment -n kube-system aws-load-balancer-controller   # to check if alb is installed successfully. 


