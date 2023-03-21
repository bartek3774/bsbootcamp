pipeline {
  agent any
  stages {
    stage('Deploy to EKS') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'makolab_aws', variable: 'AWS_ACCESS_KEY_ID']]) {         
          sh 'aws eks update-kubeconfig --name bs-bc3-eks --region us-east-1'
          sh 'kubectl apply -f ingress.yaml'
      }
    }   
  }
 }
}