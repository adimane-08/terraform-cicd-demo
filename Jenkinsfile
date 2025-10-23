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
                git branch: 'main', url: 'https://github.com/your-repo/terraform-cicd.git'
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply') {
            when {
                expression { return params.APPLY == true }
            }
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
