pipeline {
    agent {
        label 'master'
    }
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
        IMAGEN_TAG      = "${BUILD_ID}"
        C_DOCKER_HUB    = "${DOCKERHUB}"
    }
    stages {

        stage('Checkout') {
            steps {
                git 'SRC_REPO_URL'
            }
        }

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

        stage ('Build') {
            steps {
				script {
					echo 'Build'
                }	
            }
        }

	    stage ('Publish Docker Image') {
	        steps {
				script {
					echo 'Publish Docker Image'
                }	
		    }
	    }

	    stage ('Deploy Docker Container') {
	        steps {
				script {
					echo 'Deploy Docker Container'
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