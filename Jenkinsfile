pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          //sh 'docker rmi -f $(docker images -q barek/demo)'
      }
    }
    stage ('Build') {
      steps {
        sh 'printenv'
        app = docker.build("bsbootcamp")
       //sh 'docker build -t barek/demo:latest .'
      }
    }
    stage ('Tag image') {
      steps {
         sh 'echo hello'
        //sh 'docker tag barek/demo:latest barek/demo:""$GIT_COMMIT"" '
      }
    }
    stage ('Push image') {
      steps {
        script {
            docker.withRegistry('https://943696080604.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-central-1:makolab_aws') {
            app.push("latest")
            app.push("22")
                              }
        }
      }
    }    
  }
}
