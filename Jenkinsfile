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
                        env.FILENAME = readFile 'env'
                    }   
                echo "${env.FILENAME}"
                sh 'cat <<EOF > hosts
                ${ANSIBLE_HOST} ansible_user=${ANSIBLBE_USER} ansible_port=${ANSIBLE_PORT}
                EOF'
                
            }
        }
    }
}