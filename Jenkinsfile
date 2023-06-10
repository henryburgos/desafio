pipeline {
	agent nodo
	
    environment {
        IMAGEN = 'henryburgos/desafio'
        USUARIO = 'USER_DOCKERHUB'
    }
    stages {
        stage('Clone') {
            steps {
                git branch: "master", url: 'https://github.com/henryburgos/desafio.git'
            }
        }
        stage('Build') {
            steps {
                script {
					sh 'docker --version'
					sh 'echo  $USUARIO'
                    sh 'docker build -t "$IMAGEN:$BUILD_NUMBER" .'
					sh 'docker images'
					sh 'docker tag "$IMAGEN:$BUILD_NUMBER" "$IMAGEN"'
					sh 'docker push "$IMAGEN:$BUILD_NUMBER"'
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


