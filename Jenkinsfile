pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'docker rmi $(docker images -q barek/demo)'
        sh 'printenv'
        sh 'docker build -t barek/demo:""$GIT_COMMIT"" .'
      }
    }
  }
}
