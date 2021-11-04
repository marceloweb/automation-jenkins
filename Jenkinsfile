node {

  try {
      environment {
         AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
      }

      stage('Preparation') {
        checkout scm
      }

      stage('Building EC2') {
        sh "./terraform init"
        sh "./terraform plan"
        sh "./terraform apply -auto-approve" 
      }
    } catch(e) {
       throw e;
   }                                     
}       
