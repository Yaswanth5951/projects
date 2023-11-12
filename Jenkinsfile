pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY  = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "ap-northeast-3"
    }
    stages {
        stage('Checkout SCM'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/batchusivaji/projects.git']])
                }
            }
        }
        stage('intializing terraform'){
            steps{
                script{
                    dir('AWS-EKS-CLUSTER'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage("alignment the terraform"){
            steps{
                script{
                    dir('AWS-EKS-CLUSTER'){
                        sh "terraform fmt"
                    }
                }
            }
        }
        stage("validating terraform"){
            steps{
                script{
                    dir('AWS-EKS-CLUSTER'){
                        sh "terraform validate"
                    }
                }
            }
        }
    }
}