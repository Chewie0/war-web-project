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

        sh 'docker build -t war-web -f Dockerfile .'
        sh 'docker create --name temp_container war-web '
        sh 'docker cp /var/lib/jenkins/workspace/pipe/target/wwp-1.0.0.war temp_container:/usr/local/tomcat/webapps/'
        sh 'docker commit temp_container war-web'
        sh 'docker tag war-web:latest  chewie5/war-web:latest'
        sh 'docker stop temp_container && docker rm temp_container'
        withDockerRegistry([credentialsId: '048d1aca-3603-4465-ab6a-bdae46a76374', url:""]) {
          sh "docker push chewie5/war-web:latest"
        }
      }
    }
  
}
}
