pipeline {
    agent { label 'jenkins-jenkins-slave' }
    stages {        
        stage('Dockerize') {
            steps {
                sh 'echo summoning the docker daemon'
                sh 'dockerd'
                sh 'echo starting docker build'
                sh 'docker build -t thezultimate/docker-demo-react .'
            }
        }
    }
}