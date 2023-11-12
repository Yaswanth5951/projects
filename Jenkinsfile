pipeline {
    agent none
    environment {
        AWS_ACCESS_KEY_ID = credentias('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY  = credentias('AWS_SECRET_ACCESS_KEY')
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
    }
}