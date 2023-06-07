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
        IMAGEN_TAG      = "1"
        C_DOCKER_HUB    = "${DOCKERHUB}"
    }
    stages {

    	stage ('Prepare') {
            steps {
		script {

                    def imageName = "henryburgos/desafio"
                    def imageTag = "v1.0"
                    def dockerImage = docker.build("${imageName}:${imageTag}")
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB') {
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