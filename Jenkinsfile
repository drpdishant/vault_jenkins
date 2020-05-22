node {

    // define the secrets and the env variables
    // engine version can be defined on secret, job, folder or global.
    // the default is engine version 2 unless otherwise specified globally.
    stage('Build') {
     
        // load "./.env"
        echo "$ANSIBLE_HOST"
        echo "$ANSIBLE_PORT"
        echo "$ANSIBLE_USER"
        echo "$ANSIBLE_HOST ansible_port=$ANSIBLE_PORT ansible_user=$ANSIBLE_USER" > hosts
        cat hosts
        echo "Pipline Succesfull"
        // sh 'ansible-playbook main.yml'
    }
    
}