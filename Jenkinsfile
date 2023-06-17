pipeline {
	agent any
	
    environment {
        CONTAINER_NAME = 'desafio'
		IMAGEN = 'henryburgos/desafio'
		SERVIDORDEV = '192.168.1.20'
		PORT = 8089
        
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
            steps {
					
					withCredentials([usernamePassword(credentialsId: 'serverdev', passwordVariable: 'ser_passx', usernameVariable: 'ser_usuario')]) {
						script {
								
									
									if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}\$"; then
									  echo "El contenedor existe. Eliminando..."
									 
									  docker stop ${CONTAINER_NAME}
									  docker rm ${CONTAINER_NAME}
									  docker system prune -a
									  
									else
									  echo "El contenedor no existe."
									fi

								
									if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}\$"; then
									  echo "No se pudo eliminar el contenedor."
									  exit 1
									else
									  echo "El contenedor ha sido eliminado correctamente."
									fi

									echo 'Creando docker'
								
									docker run -d --name "$CONTAINER_NAME" -p "$PORT":80 "$IMAGEN:$BUILD_NUMBER"
							}
					}
                
				
            }
        }
        
    }
}

