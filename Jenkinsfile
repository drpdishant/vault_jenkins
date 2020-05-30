pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    stages {
        stage('Build') {
            steps {
                 def secrets = [
                        [path: 'kv2/secret/another_test', engineVersion: 2, secretValues: [
                        [vaultKey: 'another_test']]],
                        [path: 'kv1/secret/testing', engineVersion: 1, secretValues: [
                        [envVar: 'testing', vaultKey: 'value_one'],
                        [envVar: 'testing_again', vaultKey: 'value_two']]]
                    ]
                script
                    {
                       load "./ansible.groovy"
                    }
                echo sh(script: 'env|sort', returnStdout: true)
                sh 'echo "${ANSIBLE_HOST} ansible_user=${ANSIBLE_USER} ansible_port=${ANSIBLE_PORT}"'
                withCredentials([[$class: 'VaultTokenCredentialBinding', credentialsId: 'vaulttoken', vaultAddr: 'https://localhost:8200']]) {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
    }
            }
        }
    }
}