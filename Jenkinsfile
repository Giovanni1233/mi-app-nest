pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests with Coverage') {
            steps {
                sh 'npm run test:cov'
            }
        }
    }
}