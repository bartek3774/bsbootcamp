pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
        sh 'docker rmi $(docker images -q barek/demo)'
      }
    }
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build --no-cache -t barek/demo:""$GIT_COMMIT"" .'
      }
    }
  }
}
