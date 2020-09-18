pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t udacity-capstone-app .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh "docker tag udacity-capstone-app mydocker49/udacity-capstone-app"
                      sh 'docker push mydocker49/udacity-capstone-app'
                  }
              }
         }
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'aws', region: 'ap-south-1') {
                      sh "aws eks --region ap-south-1 update-kubeconfig --name jenkinscapstone"
                      sh "kubectl config use-context arn:aws:eks:ap-south-1:527375347403:cluster/jenkinscapstone"
                      sh "kubectl set image deployments/udacity-cloud-devops-capstone udacity-cloud-devops-capstone=mydocker49/udacity-cloud-devops-capstone:latest"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/udacity-cloud-devops-capstone"
                  }
              }
        }
        
     }
}
