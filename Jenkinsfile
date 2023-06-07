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
        IMAGEN_NAME     = 'web-site'
        IMAGEN_TAG      = "1"
        C_DOCKER_HUB    = "${DOCKERHUB}"
    }
    stages {

    	stage ('Prepare') {
            steps {
				 script {

                    def dockerImage = docker.build('IMAGEN_NAME':'IMAGEN_TAG')
                    docker.withRegistry('SRC_REPO_URL', 'C_DOCKER_HUB') {
                        dockerImage.push()
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