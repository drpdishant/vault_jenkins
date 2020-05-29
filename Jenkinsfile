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
            }
        }
    }
}