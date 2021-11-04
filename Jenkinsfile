node {

  try {
      stage('Preparation') {
         
         withCredentials([
	    string(credentialsId: 'jenkins-aws-secret-key-id', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'jenkins-aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
         ]) {
            sh "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
            sh "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
            sh "./terraform init"
            sh "./terraform plan"
            sh "./terraform apply -auto-approve"
         }

      }

    } catch(e) {
       throw e;
   }                                     
}       
