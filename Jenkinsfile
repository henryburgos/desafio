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
    stages {

    	stage ('Subiendo') {
            steps {
		script {

                    	
			docker login -u henryburgos
			docker build -t henryburgos/desafio:1.0.0 .
			docker images
			docker tag henryburgos/desafio:1.0.0 henryburgos/desafio
			docker push henryburgos/desafio:1.0.0
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