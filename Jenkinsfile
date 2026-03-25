// dev branch pipeline
pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        APP_NAME    = 'jenkins-java-demo'
        BRANCH_NAME = 'dev'
        DEPLOY_DIR  = '/tmp/jenkins-dev'
    }
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out DEV branch...'
                git branch: 'dev',
                    url: 'https://github.com/Yash2471999/jenkins-java-demo.git'
            }
        }
        stage('Build') {
            steps {
                echo '🔨 Building DEV version...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Running tests on DEV...'
                sh 'mvn test'
            }
            post {
                success { echo '✅ DEV tests passed!' }
                failure { echo '❌ DEV tests failed!' }
            }
        }
        stage('Package') {
            steps {
                echo '📦 Packaging DEV build...'
                sh 'mvn package -DskipTests'
            }
        }
        stage('Deploy to DEV') {
            steps {
                echo '🚀 Deploying to DEV environment...'
                sh '''
                    mkdir -p /tmp/jenkins-dev
                    cp target/*.jar /tmp/jenkins-dev/
                    echo "✅ Deployed to DEV at /tmp/jenkins-dev/"
                    ls -la /tmp/jenkins-dev/
                '''
            }
        }
    }
    post {
        success { echo '🎉 DEV Pipeline completed successfully!' }
        failure { echo '❌ DEV Pipeline failed!' }
        always  { cleanWs() }
    }
}
