pipeline {
    agent { label 'jenkins-jenkins-slave' }
    stages {        
        stage('Dockerize') {
            steps {
                sh 'docker build -t thezultimate/docker-demo-react .'
            }
        }
    }
}