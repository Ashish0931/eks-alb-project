#execute the files in the following order: 
#1. setup_eks.sh - to create eks environment
#2. configure_alb.sh - to create application load balancer .
#3. create_fargate_profile.sh - to create a fargate profile to execute apps
#4. deploy_k8.sh - to run k8 deployment commands for creating deployment,svc & ing-controller. 
#5. Once all these are ran successfully, copy the url from kubectl get ing -n <namespace> address section , add http// in front and open. 
it should work!