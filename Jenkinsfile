pipeline {
	agent any
	
    environment {
        IMAGEN = 'henryburgos/desafio'
        
    }
    stages {
        stage('Clone') {
            steps {
				echo 'Clonando repositorio'
				checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/henryburgos/desafio']])
				echo 'Repositorio clonado'
				
            }
        }
		 stage('Build Docker image') {
            steps {
					
					sh 'docker --version'
					echo 'Eliminando imagenes antiguas'
					sh 'docker rmi -f $(docker images -q)'
					echo 'Construyendo imagen'
                    sh 'docker build -t "$IMAGEN:$BUILD_NUMBER" .'
					echo 'Visualizando imagen'
					sh 'docker images'
				
            }
        }
		stage('Push Docker Hub') {
            steps {
					
					withCredentials([usernamePassword(credentialsId: 'USER_DOCKERHUB', passwordVariable: 'passx', usernameVariable: 'usuario')]) {
						echo 'Logueando a Docker Hub'
						sh 'docker login -u "$usuario" -p "$passx"'
						echo 'Logueo realizado'
						echo 'Subiendo imagen a Docker Hub'
						sh 'docker push "$IMAGEN:$BUILD_NUMBER"'
						echo 'Imagen registrada en Docker Hub'
					}	
				
            }
        }
		stage('Build Docker DEV') {
			agent dev
            steps {
					sh 'touch /home/ubuntu/prueba.txt'	
				
            }
        }
        
    }
}


