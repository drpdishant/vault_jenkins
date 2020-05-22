pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    script {
    readProperties(file: .env).each {key, value -> env[key] = value }
    }
    environment
    {
        load
    }
    stages {
        stage('Build') {
            steps {
                echo "$ANSIBLE_HOST"
                echo "$ANSIBLE_PORT"
                echo "$ANSIBLE_USER" 
            }
        }
    }
}