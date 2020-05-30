pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    stages {
        stage('Build') {
            steps {
                script
                    {
                       load "./stacktest-staging.groovy"
                    }
                echo sh(script: 'env|sort', returnStdout: true)
                sh 'echo "${ANSIBLE_HOST} ansible_user=${ANSIBLE_USER} ansible_port=${ANSIBLE_PORT}"'
            }
        }
    }
}