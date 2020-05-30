pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    environment {
        VAULT_SERVER="https://addwebprojects.com:8200"
        ROLE_ID=credentials('jenkins_app_role_id')
        ROLE_SECRET=credentialsId('jenkins_app_role_secret')
        KV_PATH="devops"
        KV_NAME="addwebprojects.com"
        KV_FIELD="private"
    }
    stages {
        stage('Build') {
            steps {
                script
                    {
                       load "./ansible.groovy"
                    }
                echo -e "READING SSH KEY \n"
                bash vault_read.sh -u $VAULT_ADDR -r $ROLE_ID -s ROLE_SECRET -p $KV_PATH -n $KV_NAME -f $KV_FIELD
                echo sh(script: 'env|sort', returnStdout: true)
                sh 'echo "${ANSIBLE_HOST} ansible_user=${ANSIBLE_USER} ansible_port=${ANSIBLE_PORT}"'
                
            }
        }
    }
}