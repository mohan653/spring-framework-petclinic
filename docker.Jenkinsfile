pipeline {
  agent none
  stages {
    stage('Maven Install') {
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
    // stage('Docker Build') {
    //   agent any
    //   steps {
    //     sh 'docker build -t shanem/spring-petclinic:latest .'
    //   }
    // }
    // stage('Docker Push') {
    //   agent any
    //   steps {
    //     withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
    //       sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
    //       sh 'docker push shanem/spring-petclinic:latest'
    //     }
    //   }
    // }
  }
}