pipeline {
  agent any
  stages {
    stage('Docker build image') {
      steps {
        sh 'docker build -t wp1 -f wordpress.Dockerfile .'

      }
    }
   
   
  }
}
