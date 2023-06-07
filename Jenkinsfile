pipeline {
    agent any

    environment {
        //SRC_PROJECT 	= 'desafio'
        SRC_REPO_URL 	= "https://github.com/henryburgos/desafio"
        SRC_REPO_GIT 	= "https://github.com/henryburgos/desafio.git"
        //SVC_FOLDER		= 'educacionit'
        //SVC_NAME		= 'losandescoredataservices'
        //ENVIRONMENT 	= 'desarrollo'
        BRANCH 			= 'master'
        //REGISTRY_SERVER = "${REGISTRY_DEV_SERVER}"
        IMAGEN_NAME     = 'henryburgos/web-site'
        IMAGEN_TAG      = "${BUILD_NUMBER}"
        C_DOCKER_HUB    = "${DOCKERHUB}"
    }
 


	stage('Clonar repositorio') {
            steps {
                git 'https://github.com/henryburgos/desafio.git'
            }
        }
    	stage ('Subiendo') {
            steps {
		script {

                    	
			
			sh 'docker build -t henryburgos/desafio:1.0.0 .'
			sh 'docker images'
			sh 'docker tag henryburgos/desafio:1.0.0 henryburgos/desafio'
			sh 'docker push henryburgos/desafio:1.0.0'
                    }

				}	
            }
        }

       
    }
	post {
	    always {
		    cleanWs()
	    }
    }
}