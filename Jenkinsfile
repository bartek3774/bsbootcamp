pipeline {
  agent any
  stages {
    stage('Docker build image') {
      steps {
        sh 'docker build -t bsbootcamp .'

      }
    }
    stage ('Tag image') {
      steps {
        script {
          env.IMAGE_TAG = input message: 'User input required', ok: 'Save tag!',
          parameters: [string(name: 'IMAGE_TAG', description: 'Please provide docker image tag')]
        }
      }
    }    
    stage('Push image to ECR') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {
          sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin "943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp"'
          sh 'docker tag bsbootcamp:latest 943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp:latest'
          sh "docker tag bsbootcamp:latest 943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp:${env.IMAGE_TAG}"
          sh "docker push 943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp:latest"
          sh "docker push 943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp:${env.IMAGE_TAG}"        
        }
      }
    }
    stage('Deploy app to EKS') {
      steps {
        script{
          DOCKER_IMAGE="943696080604.dkr.ecr.eu-central-1.amazonaws.com/bsbootcamp:${env.IMAGE_TAG}"
        }
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {         
          sh "sed -i 's@devops_image@${DOCKER_IMAGE}@g' nginx_deployment.yaml"
          sh 'cat nginx_deployment.yaml'
          sh 'kubectl delete secret ecr'
          sh 'kubectl create secret docker-registry ecr   --docker-server 943696080604.dkr.ecr.eu-central-1.amazonaws.com   --docker-username=AWS   --docker-password=$(aws ecr get-login-password ) -n default'
          sh 'aws eks update-kubeconfig --name bsbootcamp --region us-east-1'
          sh 'kubectl config get-contexts'
          sh 'kubectl get nodes'
          sh 'kubectl apply -f nginx_deployment.yaml'
         // sh 'kubectl expose deployment nginx-bs --type=LoadBalancer --name=nginx-bs-service'
        }
      }
    }    
  }
}
