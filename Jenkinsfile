pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    parameters {
        booleanParam(name: 'APPLY', defaultValue: false, description: 'Apply Terraform changes')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/adimane-08/terraform-cicd-demo.git'
            }
        }

        stage('Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Apply') {
            when {
                expression { 
                    return params.APPLY == true }
            }
            steps {
                bat 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Destroy') {
            when {
                expression {
                    return params.DESTROY == true
                }
            }
            steps {
                bat 'terraform destroy -auto-approve'
            }
        }
    
    }
}
