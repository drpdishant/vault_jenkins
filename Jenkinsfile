pipeline {
    agent any
    triggers {
        pollSCM('')
    }

    stages {
        stage('Build') {
            steps {
                sh 'cat env'
                sh 'cat main.yml'
            }
        }
    }
}