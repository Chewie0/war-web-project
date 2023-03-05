pipeline {
  agent {
    docker {
      image 'chewie5/build-container:latest'
      args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {

    stage('Copy source with configs') {
      steps {
        git 'https://github.com/Chewie0/war-web-project.git'
      }
    }
    stage('Mvn build') {
      steps {
        sh 'mvn -f pom.xml package'
      }
    }
   stage('Make docker image') {
      steps {
        sh 'ls target/'
        sh 'pwd'
        sh 'docker build -t war-web -f Dockerfile .'
        sh 'docker tag war-web:latest  chewie5/war-web:latest'
        withDockerRegistry([credentialsId: '048d1aca-3603-4465-ab6a-bdae46a76374', url:""]) {
          bat "docker push chewie5/war-web:latest"
        }
      }
    }
  
}
}
