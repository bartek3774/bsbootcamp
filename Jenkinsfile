pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          
            withCredentials([string(credentialsId: 'makolab_aws', variable: 'klucz')]) {
        sh 'aws eks list-clusters  --profile klucz --region us-east-1'
    }
      }
    }
  }
}
