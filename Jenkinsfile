// trigger build
pipeline {
    agent any
    tools {
        maven 'Maven3'
        allure 'Allure'
    }
    environment {
        APP_NAME = 'jenkins-java-demo'
        VERSION  = '1.0.0'
        REPO_URL = 'https://github.com/Yash2471999/jenkins-java-demo.git'
    }
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Pulling source code from GitHub...'
                git branch: 'main',
                    url: 'https://github.com/Yash2471999/jenkins-java-demo.git'
            }
        }
        stage('Build') {
            steps {
                echo '🔨 Building the application...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Running unit tests...'
                sh 'mvn test'
            }
            post {
                always {
                    allure includeProperties: false,
                           jdk: '',
                           results: [[path: 'target/allure-results']]
                }
                success {
                    echo '✅ All tests passed!'
                }
                failure {
                    echo '❌ Some tests failed!'
                }
            }
        }
        stage('Package') {
            steps {
                echo '📦 Packaging the application...'
                sh 'mvn package -DskipTests'
                echo '✅ JAR file created!'
            }
        }
        stage('Deploy') {
            steps {
                echo '🚀 Deploying the application...'
                sh '''
                    mkdir -p /tmp/jenkins-deploy
                    cp target/*.jar /tmp/jenkins-deploy/
                    echo "✅ Deployed to /tmp/jenkins-deploy/"
                    ls -la /tmp/jenkins-deploy/
                    java -jar /tmp/jenkins-deploy/*.jar
                '''
            }
        }
    }
    post {
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check the logs.'
        }
        always {
            echo '🧹 Cleaning up workspace...'
            cleanWs()
        }
    }
}
