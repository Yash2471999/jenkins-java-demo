// trigger build
pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        APP_NAME = 'calculator-app'
        VERSION  = '1.0.0'
        DOCKER_IMAGE = 'your-dockerhub-username/calculator-app'
        DOCKER_TAG = "${BUILD_NUMBER}"
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
        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                echo '✅ Docker image built!'
            }
        }
        stage('Push to DockerHub') {
            steps {
                echo '📤 Pushing image to DockerHub...'
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
                echo '✅ Image pushed to DockerHub!'
            }
        }
        stage('Deploy Container') {
            steps {
                echo '🚀 Deploying container...'
                sh '''
                    docker stop calculator-app || true
                    docker rm calculator-app || true
                    docker run -d \
                        --name calculator-app \
                        -p 9090:8080 \
                        your-dockerhub-username/calculator-app:latest
                    echo "✅ Container deployed!"
                    docker ps
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
```

> ⚠️ Replace `your-dockerhub-username` with your actual DockerHub username in the Jenkinsfile!

---

## Step 7 — Open Port 9090 in AWS Security Group

1. Go to **AWS Console → EC2 → Security Groups**
2. Click **Edit inbound rules → Add rule**
3. Set: **Port** = `9090`, **Source** = `0.0.0.0/0`
4. Click **Save rules**

---

## Final Pipeline Stages:
```
✅ Checkout → ✅ Build → ✅ Test → ✅ Package → ✅ Docker Build → ✅ Push → ✅ Deploy
