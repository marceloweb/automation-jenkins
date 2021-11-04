node {

  try {
      environment {
         
         withCredentials([string(credentialsId: 'jenkins-aws-secret-key-id', variable: 'AWS_ACCESS_KEY_ID')]) {
            AWS_ACCESS_KEY_ID = $AWS_ACCESS_KEY_ID
         }

         withCredentials([string(credentialsId: 'jenkins-aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            AWS_SECRET_ACCESS_KEY = $AWS_SECRET_ACCESS_KEY
         }    

      }


      stage('Preparation') {
        checkout scm
      }

      stage('Building EC2') {
        sh "echo $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY"
        sh "./terraform init"
        sh "./terraform plan"
        sh "./terraform apply -auto-approve" 
      }
    } catch(e) {
       throw e;
   }                                     
}       
