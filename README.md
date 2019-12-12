# API Gateway Challenge from Contino

# Problem Statement:

 - Make the necessary changes so data is successfully written to the DynamoDB Table once a POST request is received by the API Gateway - Done
 - Add any required resources to send a message to a SNS Topic whenever a new item is added to the DynamoDB Table. The message can be either table updated or the content of the new item added - Done
 - Implement any type of authentication to the API Gateway.

## Considerations:
 - Share your code with us through your own git repository. Add user ContinoTest to private repo
 - Consider security on all pieces of your work.
 - Make sure that all resources required by your stack are included on the deployment process.
 - Include a README with details on how to run your code. Add a section with recommended improvements for this stack.
 - On the same README file, include a section with recommended improvements to be done on the stack/repo that you consider important.

## Steps:

 1. Deploy the stack using awscli and Cloudformation - Done
 2. Make the necessary changes so data is successfully written to the DynamoDB Table once a POST request is received by the API Gateway - Done
 3. Make application modular and parameterized using Ansible - Done
 4. Send a message to a SNS Topic whenever a new item is added - Done
 5. Improve security - IAM Permissions, Environment Variables, Server Side Encryption..  - In progress

## Environments:
 - Use environment variable name for db_name

## Solution 1:  CloudFormation + API Gateway + DynamoDB

### Installing and configuring Dependencies (For Mac)
 - Install Homebrew using https://brew.sh/
 - Install AWS CLI : `brew install awscli`
 - Set AWS Credentials: `source <creds-file>`
   
### Deploy the stack using Clouformation
 - Deploy: `aws cloudformation create-stack \
                --region ap-southeast-2 \
                --template-body file://<project_path>/api.yaml \
                --stack-name api-gateway \
                --capabilities CAPABILITY_IAM \
                --parameters \
                   ParameterKey=MyName,ParameterValue='Harshad_Wankhede'`
 - Update: `aws cloudformation update-stack \
                --region ap-southeast-2 \
                --template-body file://<project_path>/api.yaml \
                --stack-name api-gateway \
                --capabilities CAPABILITY_IAM \
                --parameters \
                  ParameterKey=MyName,ParameterValue='Harshad_Wankhede'`
 - Delete: `aws cloudformation delete-stack \
                --region ap-southeast-2 \
                --stack-name api-gateway`
           

## Solution 2: Using Ansible + CloudFormation + API Gateway + DynamoDB

### Installing Dependencies for using Python Virtual Env and Ansible
 - Install Homebrew using https://brew.sh/
 - Install AWS CLI : `brew install awscli`
 - Install Ansible and Dependencies: `brew install ansible`
 - Install Boto3: `pip3 install boto3`
 - Set AWS Credentials: `source <creds-file>`
 - If needed update Ansible inventory /inventory/development/group_vars/all

### Deploying Application on AWS
 - $ ``aws cloudformation package --template-file ./cloudformation/db.yml --s3-bucket coding-challenge-builds --s3-prefix lambda --output-template-file ./cloudformation/db-packaged.yml``
 
 - Deploy DB using Ansible: 
   $ ``ansible-playbook deploy-db.yml -i inventory/development/ -e "ansible_python_interpreter=`which python3`"``
 - Deploy Application using Ansible: 
   $ ``ansible-playbook deploy-api.yml -i inventory/development/ -e "ansible_python_interpreter=`which python3`"``

### Testing Post Request
 - `curl -i --header "Content-Type: application/json" \
        --request POST --data '{"team_name":"contino","team_country":"au4","team_desc":"team contino is the best","team_rating":"10"}' \
        'https://7g55a0f9w7.execute-api.ap-southeast-2.amazonaws.com/v1/add_new'`
  
### Deploying Using CI(Shippable?) 
 - TODO

### Cost
 - TODO
