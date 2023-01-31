pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'docker rmi barek/demo'
        sh 'printenv'
        sh 'docker build -t barek/demo:""$GIT_COMMIT"" .'
      }
    }
  }
}
