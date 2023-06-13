pipeline {
	agent any
	
    environment {
        IMAGEN = 'henryburgos/desafio'
        USUARIO = 'USER_DOCKERHUB'
    }
    stages {
        stage('Clone') {
            steps {
				checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/henryburgos/desafio']])
            }
        }
        
    }
}


