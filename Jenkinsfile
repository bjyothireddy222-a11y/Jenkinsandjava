pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/bjyothireddy222-a11y/Jenkinsandjava'
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '002356213193'
        ECR_REPO_NAME = 'java-demo-app'
        IMAGE_TAG = "latest"
        IMAGE_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:${IMAGE_TAG}"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git url: "${GIT_REPO}", branch: 'main'
            }
        }

        stage('Build Java App') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Login to AWS ECR') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-ecr-creds'
                ]]) {
                    sh '''
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_URI} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push ${IMAGE_URI}'
            }
        }
    }
}
