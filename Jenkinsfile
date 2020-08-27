pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'tidy -q -e *.html'
                sh 'hadolint Dockerfile' 
            }
        }
        stage('Build & Upload Image') {
            when {
                branch 'blue' 
            }
            steps {
                sh './image-create-upload.sh'
            }
        }
        stage('Deployment') {
            when {
                branch 'blue' 
            }
            steps {
                sh "kubectl apply -f ./replication-controller.yaml"
                sh "kubectl apply -f ./service-controller.yaml"
                sh "kubectl get services my-service"
            }
        }



        stage('Build & Upload Image') {
            when {
                branch 'green' 
            }
            steps {
                sh './image-create-upload.sh'
            }
        }
        stage('Deployment') {
            when {
                branch 'green' 
            }
            steps {
                sh "kubectl apply -f ./replication-controller.yaml"
                sh "kubectl apply -f ./service-controller.yaml"
                sh "kubectl get services my-service"
            }
        }
    }
}


