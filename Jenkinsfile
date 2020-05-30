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
                       env.ANSIBLE_VARS = readFile 'env'
                    }
                echo sh(script: 'env|sort', returnStdout: true)
                echo "$ANSIBLE_HOST ansible_user=$ANSIBLE_USER ansible_port=$ANSIBLE_PORT

            }
        }
    }
}