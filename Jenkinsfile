pipeline {
    environment {
        IMAGEN = 'henryburgos/desafio'
        USUARIO = 'USER_DOCKERHUB'
    }
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: "master", url: 'https://github.com/henryburgos/desafio.git'
            }
        }
        stage('Build') {
            steps {
                script {
					sh 'sudo docker --version'
                    sh 'sudo docker build -t "$IMAGEN:$BUILD_NUMBER" .'
					sh 'sudo docker images'
					sh 'sudo docker tag "$IMAGEN:$BUILD_NUMBER" "$IMAGEN"'
					sh 'sudo docker push "$IMAGEN:$BUILD_NUMBER"'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                     sh 'docker image("$IMAGEN:$BUILD_NUMBER").inside('-u root')'
					
                    }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry( '', USUARIO ) {
                        newApp.push()
                    }
                }
            }
        }
        stage('Clean Up') {
            steps {
                sh "docker rmi $IMAGEN:$BUILD_NUMBER"
                }
        }
    }
}


