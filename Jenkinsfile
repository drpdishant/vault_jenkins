pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    environment {
        VAULT_ADDR="https://addwebprojects.com:8200"
        ROLE_ID=credentials('jenkins_app_role_id')
        ROLE_SECRET=credentials('jenkins_app_role_secret')
        KV_PATH="devops"
        KV_NAME="addwebprojects.com"
        KV_FIELD="private"
    }
    stages {
        stage('Run Ansible Playbook') {
            steps {
                script
                    {
                       load "./variables.groovy"
                    }
                                // echo sh(script: 'env|sort', returnStdout: true)
                sh './vault_read.sh -u $VAULT_ADDR -r $ROLE_ID -s $ROLE_SECRET -p $KV_PATH -n $KV_NAME -f $KV_FIELD > id_rsa && chmod 400 id_rsa' 
                sh '''
                echo "${ANSIBLE_HOST} ansible_user=${ANSIBLE_USER} ansible_port=${ANSIBLE_PORT}" > hosts
                ansible-playbook main.yml
                '''
            }
        }
        stage('Workspace Cleanup') {
            steps {
                sh 'rm -rf hosts id_rsa'
            }
        }
    }
}