pipline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentias('AWS_ACCESS_KEY_ID')
        AWS_SECRET_KEY_ID = credentias('AWS_SECRET_KEY_ID')
        AWS_DEFAULT_REGION = "ap-northeast-3"
    }
    stages {
        stage(git check out main){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/batchusivaji/projects.git']])
                }
            }
        }
    }
}