pipeline {
    agent any
    triggers {
        pollSCM('')
    }

    stages {
        stage('Build') {
            steps {
                cat env
                cat main.yml
            }
        }
    }
}