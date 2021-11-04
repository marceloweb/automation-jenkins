node {

  try {
      environment {
         AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
      }

      stage('Preparation') {
        checkout scm
      }

      stage('Creating cluster') {
        sh "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}"
        sh "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
        sh "./terraform init"
        sh "./terraform plan"
        sh "./terraform apply -auto-approve" 
      }
    } catch(e) {
       throw e;
   }                                     
}       
