node {

  try {
      environment {
         AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
      }

      withCredentials([string(credentialsId: 'jenkins-aws-secret-key-id', variable: 'AWS_ACCESS_KEY_ID')]) {
         echo "AWS: '{$AWS_ACCESS_KEY_ID}'"
      }

      stage('Preparation') {
        checkout scm
      }

      stage('Building EC2') {
        sh "echo ${env.AWS_ACCESS_KEY_ID} ${env.AWS_SECRET_ACCESS_KEY}"
        sh "./terraform init"
        sh "./terraform plan"
        sh "./terraform apply -auto-approve" 
      }
    } catch(e) {
       throw e;
   }                                     
}       
