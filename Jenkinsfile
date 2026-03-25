// staging branch pipeline
pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        APP_NAME    = 'jenkins-java-demo'
        BRANCH_NAME = 'staging'
        DEPLOY_DIR  = '/tmp/jenkins-staging'
    }
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out STAGING branch...'
                git branch: 'staging',
                    url: 'https://github.com/Yash2471999/jenkins-java-demo.git'
            }
        }
        stage('Build') {
            steps {
                echo '🔨 Building STAGING version...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Running tests on STAGING...'
                sh 'mvn test'
            }
            post {
                success { echo '✅ STAGING tests passed!' }
                failure { echo '❌ STAGING tests failed!' }
            }
        }
        stage('Code Quality Check') {
            steps {
                echo '🔍 Running code quality checks...'
                sh 'mvn verify -DskipTests'
            }
        }
        stage('Package') {
            steps {
                echo '📦 Packaging STAGING build...'
                sh 'mvn package -DskipTests'
            }
        }
        stage('Deploy to STAGING') {
            steps {
                echo '🚀 Deploying to STAGING environment...'
                sh '''
                    mkdir -p /tmp/jenkins-staging
                    cp target/*.jar /tmp/jenkins-staging/
                    echo "✅ Deployed to STAGING at /tmp/jenkins-staging/"
                    ls -la /tmp/jenkins-staging/
                '''
            }
        }
    }
    post {
        success { echo '🎉 STAGING Pipeline completed successfully!' }
        failure { echo '❌ STAGING Pipeline failed!' }
        always  { cleanWs() }
    }
}
