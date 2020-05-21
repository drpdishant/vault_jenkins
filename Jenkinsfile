node {
    // define the secrets and the env variables
    // engine version can be defined on secret, job, folder or global.
    // the default is engine version 2 unless otherwise specified globally.
    stage('Build') {
     
        def secrets = [
        [
            path: 'secret/testing', engineVersion: 1, secretValues: 
            [
                [envVar: 'testing', vaultKey: 'testing_1'],
                [envVar: 'testing_again', vaultKey: 'testing_2']
            ]
        ],
        [
            path: 'kv/test', engineVersion: 2, secretValues: 
            [
                [vaultKey: 'testing']
            ]
        ]
    ]
    
    // optional configuration, if you do not provide this the next higher configuration
    // (e.g. folder or global) will be used
    def configuration = [vaultUrl: 'https://addwebprojects.com:8200',
                         vaultCredentialId: 'jenkins_app_role',
                         engineVersion: 1]
    // inside this block your credentials will be available as env variables
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        set -x 
        load "./.env"
        echo "$ANSIBLE_HOST"
        echo "$ANSIBLE_PORT"
        echo "$ANSIBLE_USER"
        echo "$ANSIBLE_HOST ansible_port=$ANSIBLE_PORT ansible_user=$ANSIBLE_USER" > hosts
        cat hosts
        echo "Pipline Succesfull"
        // sh 'ansible-playbook main.yml'
    }
    }
    
}