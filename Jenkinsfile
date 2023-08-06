pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t ubuntu .' 
                sh 'docker tag ubuntu nikhilnidhi/ubuntu:latest'
                sh 'docker tag ubuntu nikhilnidhi/ubuntu:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push nikhilnidhi/ubuntu:latest'
          sh  'docker push nikhilnidhi/ubuntu:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                  sh "Sudo usermod –aG docker ec2-user"
                sh "docker run -d -p 4030:80 nikhilnidhi/ubuntu"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.86.135  run -d -p 4001:80 nikhilnidhi/ubuntu"
 
            }
        }
    }
}
