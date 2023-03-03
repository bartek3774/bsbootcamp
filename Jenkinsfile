pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          sh 'aws eks list-clusters  --profile makolab_aws --region us-east-1'
      }
    }
  }
}
