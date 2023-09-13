pipeline {
    agent any
    tools {
        maven 'maven_3_9_2'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/aminos98/backEnd']])
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t myapp .'
                }
            }
        }
        stage('Push image to DockerHub') {
            steps {
                script {
                    withCredentials([
                        usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: 'USER', passwordVariable: 'PWD')
                        ]){
                             sh "docker login -u $USER -p $PWD"
                             sh "docker tag myapp:latest ahmedamin1998/myapp:latest"
                             sh "docker push ahmedamin1998/myapp:latest"
                          }
                }
            }
        }
        stage('Deploy to Minikube') {
            agent any
            steps {
                script {
                    // Define the Kubernetes configuration credentials
                    def kubeconfigCredentialId = 'mykubeconfig'
                    // Use withCredentials to set KUBECONFIG from the credential file
                    withCredentials([file(credentialsId: kubeconfigCredentialId, variable: 'KUBECONFIG')]) {
                        sh "kubectl apply -f /home/amine/backEnd/Kubernetes/spring-app-deployment.yaml"
                    }
                }
            }
        }
    }
}