node {

  try {
      environment {
         AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
      }

      stage('Preparation') {
        checkout scm
      }

      stage('Building EC2') {
        sh "export AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}"
        sh "export AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}"
        sh "./terraform init"
        sh "./terraform plan"
        sh "./terraform apply -auto-approve" 
      }
    } catch(e) {
       throw e;
   }                                     
}       
