pipeline {
    agent any
    stages {
        stage('Example') {
            input {
                message "Can we Proceed?"
                ok "Yes"
                submitter "Digital Varys"
                parameters {
                    string(name: 'PERSON', defaultValue: 'DigiralVarys', description: 'Member')
                }
            }
            steps {
                echo "${PERSON}, is proceeding..."
            }
        }
    }
}