pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    script {
    readProperties(file: $PWD/env).each {key, value -> env[key] = value }
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