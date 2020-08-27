pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'tidy -q -e *.html'
                sh 'hadolint Dockerfile'
            }
        }
        stage('Build & Upload Image-Blue') {
            when {
                branch 'blue'
            }
            steps {
                sh './image-create-upload.sh'
            }
        }
        stage('Deployment-Blue') {
            when {
                branch 'blue'
            }
            steps {
                withAWS(credentials: 'mahdi', region: 'us-west-2') {
                    sh 'kubectl apply -f ./replication-controller.yaml'
                    sh 'kubectl apply -f ./service-controller.yaml'
                    sh 'kubectl get services my-service'
                }
            }
        }

        stage('Build & Upload Image-Green') {
            when {
                branch 'green'
            }
            steps {
                sh './image-create-upload.sh'
            }
        }
        stage('Deployment-Green') {
            when {
                branch 'green'
            }
            steps {
                withAWS(credentials: 'mahdi', region: 'us-west-2') {
                    sh 'kubectl apply -f ./replication-controller.yaml'
                    sh 'kubectl apply -f ./service-controller.yaml'
                    sh 'kubectl get services my-service'
                }
            }
        }
    }
}
