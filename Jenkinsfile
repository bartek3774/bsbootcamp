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
    stage ('Push image') {
      steps {
        docker.withRegistry('943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp', 'ecr:eu-central-1:makolab_aws') {
                            app.push("latest")
                            }
      }
    }    
  }
}
