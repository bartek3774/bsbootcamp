pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
          sh 'echo hello'
          //sh 'docker rmi -f $(docker images -q 943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp)'
      }
    }
    stage ('Build') {
      steps {
        sh 'printenv'
        script {
          app = docker.build("--no-cache -t bsbootcamp -f Dockerfile")
        }
       //sh 'docker build -t barek/demo:latest .'
      }
    }
    stage ('Tag image') {
      steps {
        script {
          env.IMAGE_TAG = input message: 'User input required', ok: 'Save tag!',
          parameters: [string(name: 'IMAGE_TAG', description: 'Please provide docker image tag')]
          app.tag(env.IMAGE_TAG)
        }
        //sh 'docker tag barek/demo:latest barek/demo:""$GIT_COMMIT"" '
      }
    }
    stage ('Push image') {
      steps {
        script {
            docker.withRegistry('https://943696080604.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-central-1:makolab_aws') {
            app.push("latest")
            app.push(env.IMAGE_TAG)
            }
        }
      }
    }    
  }
}
