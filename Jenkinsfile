// production branch pipeline
pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        APP_NAME    = 'jenkins-java-demo'
        BRANCH_NAME = 'production'
        DEPLOY_DIR  = '/tmp/jenkins-production'
    }
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out PRODUCTION branch...'
                git branch: 'production',
                    url: 'https://github.com/Yash2471999/jenkins-java-demo.git'
            }
        }
        stage('Build') {
            steps {
                echo '🔨 Building PRODUCTION version...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Running tests on PRODUCTION...'
                sh 'mvn test'
            }
            post {
                success { echo '✅ PRODUCTION tests passed!' }
                failure { echo '❌ PRODUCTION tests failed!' }
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
                echo '📦 Packaging PRODUCTION build...'
                sh 'mvn package -DskipTests'
            }
        }
        stage('Approval') {
            steps {
                echo '⏳ Waiting for manual approval...'
                input message: '🚀 Deploy to PRODUCTION?', ok: 'Yes, Deploy!'
            }
        }
        stage('Deploy to PRODUCTION') {
            steps {
                echo '🚀 Deploying to PRODUCTION environment...'
                sh '''
                    mkdir -p /tmp/jenkins-production
                    cp target/*.jar /tmp/jenkins-production/
                    echo "✅ Deployed to PRODUCTION at /tmp/jenkins-production/"
                    ls -la /tmp/jenkins-production/
                '''
            }
        }
    }
    post {
        success { echo '🎉 PRODUCTION Pipeline completed successfully!' }
        failure { echo '❌ PRODUCTION Pipeline failed!' }
        always  { cleanWs() }
    }
}
```

---

## Step 3 — Update Each Branch's Jenkinsfile on GitHub

1. Switch to `dev` branch on GitHub
2. Click on `Jenkinsfile` → Click **pencil icon**
3. Replace with the `dev` Jenkinsfile above
4. Click **Commit changes**
5. Repeat for `staging` and `production` branches

---

## Step 4 — Create Multibranch Pipeline in Jenkins

1. Go to Jenkins home → Click **New Item**
2. Enter name: `jenkins-java-demo-multibranch`
3. Select **Multibranch Pipeline**
4. Click **OK**

---

## Step 5 — Configure Multibranch Pipeline

1. Under **Branch Sources** → Click **Add source** → Select **Git**
2. Enter **Repository URL:**
```
https://github.com/Yash2471999/jenkins-java-demo.git
```
3. Under **Behaviours** make sure **Discover branches** is added
4. Under **Build Configuration** set **Script Path** to:
```
Jenkinsfile
