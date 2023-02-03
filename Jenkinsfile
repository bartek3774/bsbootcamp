pipeline {
  agent any
  stages {
    stage('Remove previous images') {
      steps {
                        script {
                    env.IMAGE_TAG = input message: 'User input required', ok: 'Release!',
                            parameters: [string(name: 'IMAGE_TAG', description: 'Please provide docker image tag')]
                }
          sh 'echo hello'
          //sh 'docker rmi -f $(docker images -q barek/demo)'
      }
    }
    stage ('Build') {
      steps {
        sh 'printenv'
        script {
          app = docker.build("bsbootcamp")
        }
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
            app.push(env.IMAGE_TAG)
                              }
        }
      }
    }    
  }
}
