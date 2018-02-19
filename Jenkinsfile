pipeline {
    agent none
    stages {        
        stage('Dockerize') {
            agent any
            steps {
                sh 'docker build -t thezultimate/docker-demo-react .'
            }
        }
    }
}