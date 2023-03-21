pipeline {
  agent any
  stages {
    stage('Docker build image') {
      steps {
        sh 'docker build -t wp1 -f wordpress.Dockerfile .'

      }
    }
    stage ('Tag image') {
      steps {
        sh 'docker tag wp1:latest 943696080604.dkr.ecr.us-east-1.amazonaws.com/bs-bc3:wordpress'
      }
    }     
    stage('Push image to ECR') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {
          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 943696080604.dkr.ecr.us-east-1.amazonaws.com'
          sh "docker push 943696080604.dkr.ecr.us-east-1.amazonaws.com/bs-bc3:wordpress"        
        }
      }
    }   
    stage('Deploy app to EKS') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {         
          sh 'aws eks update-kubeconfig --name bs-bc3-eks --region us-east-1'
          sh 'kubectl config get-contexts'
          sh 'kubectl get nodes'
          sh 'kubectl apply -f wordpress.yaml'
          sh 'kubectl apply -f wordpress-service.yaml'
        }
      }
    }    
  }
}
