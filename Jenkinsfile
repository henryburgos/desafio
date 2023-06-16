pipeline {
	agent any
	
    environment {
        IMAGEN = 'henryburgos/desafio'
        
    }
    stages {
        stage('Clone') {
            steps {
				checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/henryburgos/desafio']])
				
            }
        }
		 stage('Build Docker image') {
            steps {
					sh 'docker --version'
					sh 'docker rmi -f $(docker images -q)'
                    sh 'docker build -t "$IMAGEN:$BUILD_NUMBER" .'
					sh 'docker images'
				
            }
        }
		stage('Push Docker Hub') {
            steps {
					
					withCredentials([usernamePassword(credentialsId: 'USER_DOCKERHUB', passwordVariable: 'passx', usernameVariable: 'usuario')]) {
						sh 'docker login -u "$usuario" -p "$passx"'
						sh 'docker push "$IMAGEN:$BUILD_NUMBER"'
					}	
				
            }
        }
        
    }
}


