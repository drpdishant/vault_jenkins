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
                       env = readFile 'env'
                    }
                echo sh(script: 'env|sort', returnStdout: true)

            }
        }
    }
}