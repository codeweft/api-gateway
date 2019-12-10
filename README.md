#API Gateway Challenge from Contino

## Steps:

 1. Deploy the stack using awscli and Cloudformation


## Solution 1:  AWS CLI + CloudFormation + API Gateway + DynamoDB

### Installing Dependencies (For Mac)
 - Install Homebrew using https://brew.sh/
 - Install AWS CLI  
   $ `brew install awscli`
 - Set AWS Credentials:   
   $ `source <creds-file>`
   
### Deploy the stack using Clouformation
 - `aws cloudformation create-stack \
       --region ap-southeast-2 \
       --template-body file://<project_path>/api.yaml \
       --stack-name api-gateway \
       --capabilities CAPABILITY_IAM \
       --parameters \
           ParameterKey=MyName,ParameterValue='Harshad_Wankhede'`