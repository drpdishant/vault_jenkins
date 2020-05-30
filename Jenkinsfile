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
                        readFile 'env'
                    }
                echo sh(script: 'env|sort', returnStdout: true)

            }
        }
    }
}