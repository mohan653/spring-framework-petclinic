pipeline {
  agent none
  stages {
    stage('Build App') {
      agent {
        docker {
          image 'maven:3.5.0'
          args '-v $HOME/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn clean install'
        sh 'ls -lrt target/*'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t vsiraparapu/petclinicapp:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        // withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        //   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        //   sh 'docker push vsiraparapu/petclinicapp:latest:latest'
        // }
        withCredentials([usernamePassword(credentialsId: 'docker_hub_creds', passwordVariable: 'dokcer_hub_pass', usernameVariable: 'dokcer_hub_uname')]) {
              // some block
              sh "docker login -u ${env.dokcer_hub_uname} -p ${env.dokcer_hub_pass}"
              sh "docker push vsiraparapu/petclinicapp:latest"
        }
      }
    }
  }
}