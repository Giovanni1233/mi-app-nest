pipeline {
    agent any
    environment {
    DOCKER_HOST = 'npipe:////./pipe/docker_engine'
    }
    stages {
        stage('Etapa de construcción') {
            agent {
                docker {
                    image 'node:22'
                    reuseNode true
                }
            }
            stages {
                stage('Instalación de dependencias') {
                    steps {
                        sh 'npm install'
                    }
                }
                stage('Ejecución de pruebas automatizadas') {
                    steps {
                        sh 'npm run test:cov'
                    }
                }
                stage('Construcción de aplicación') {
                    steps {
                        sh 'npm run build'
                    }
                }
            }
        }
        stage('Etapa de empaquetado y delivery') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker build -t mi-app-nest:gdd .'
                        sh 'docker tag mi-app-nest:gdd gdiaz90/mi-app-nest:gdd'
                        sh 'docker push gdiaz90/mi-app-nest:gdd'
                    }
                }
            }
        }
    }
}
