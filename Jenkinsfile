pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          sh 'docker rmi -f $(docker images -q barek/demo)'
      }
    }
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build --no-cache -t barek/demo:latest .'
      }
    }
    stage ('Tag image') {
      steps {
        sh 'docker tag barek/demo:latest barek/demo:""$GIT_COMMIT"" '
      }
    }
  }
}
