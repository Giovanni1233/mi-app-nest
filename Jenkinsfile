pipeline {
  agent {
    docker {
      image 'node-with-docker-cli:22'
      args '-v //./pipe/docker_engine://./pipe/docker_engine -e DOCKER_HOST=npipe:////./pipe/docker_engine'
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
    //stage('Empaquetado y delivery') {
      //steps {
        //script {
          //docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
          //  sh 'docker build -t mi-app-nest:gdd .'
          //  sh 'docker tag mi-app-nest:gdd gdiaz90/mi-app-nest:gdd'
          //  sh 'docker push gdiaz90/mi-app-nest:gdd'
          //}
        //}
      //}
    //}
  }
}
