pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {
            sh 'aws eks list-clusters --region us-east-1'
          }
          sh 'kubectl config get-contexts'
      }
    }
  }
}
