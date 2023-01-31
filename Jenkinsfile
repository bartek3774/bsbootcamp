pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t barek/demo:""$GIT_COMMIT"" .'
      }
    }
  }
}
