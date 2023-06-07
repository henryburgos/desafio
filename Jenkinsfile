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
        IMAGEN_NAME     = 'henryburgos/desafio'
        IMAGEN_TAG      = "${BUILD_NUMBER}"
        C_DOCKER_HUB    = "${DOCKERHUB}"
    }
    stages {

    	stage ('Subiendo') {
            steps {
		script {

                    	
			docker build -t ${IMAGEN_NAME}:${IMAGEN_NAME} .
			docker images
			docker tag ${IMAGEN_NAME}:${IMAGEN_NAME} ${IMAGEN_NAME}
			docker push ${IMAGEN_NAME}:${IMAGEN_NAME}
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