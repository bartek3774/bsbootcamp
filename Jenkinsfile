pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          
withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {
               sh "echo this is ${env.AWS_ACCESS_KEY_ID}"
               sh "echo this is ${env.AWS_SECRET_ACCESS_KEY}"
       }
      }
    }
  }
}
