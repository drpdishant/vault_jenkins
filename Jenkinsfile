pipeline {
    agent any
    triggers {
        pollSCM('')
    }
    stages {
        stage('Build') {
            input {
                message "Can we Proceed?"
                ok "Yes"
                submitter "Digital Varys"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Dishant Pandya', description: 'Member')
                }
            }
            steps {
                echo "${PERSON}, is proceeding..."
            }
        }
    }
}