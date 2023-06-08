pipeline{
    agent any
    stages{
        stage('cloning script'){
            steps{
                git 'https://github.com/henryburgos/desafio.git'
            }
        }
        stage('Docker Build'){
            steps{
                echo "Hola como estan"
                //sh 'docker --version'
                //sh 'docker build -t kaza514/demo:1.11 .'
                //sh 'docker kill -f demoapp2'
                //sh 'docker run -d -p 8081:8080 --name demoapp2 kaza514/demo:1.11'
            }
        }
    }
}