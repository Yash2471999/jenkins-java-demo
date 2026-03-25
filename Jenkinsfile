pipeline {
    agent any

    tools {
        maven 'Maven3'
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
                    echo '📊 Test stage completed'
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
```

---

## Step 2 — Push all files to GitHub

Your repo structure should look like this:
```
jenkins-java-demo/
├── src/
│   ├── main/java/com/demo/Calculator.java
│   └── test/java/com/demo/CalculatorTest.java
├── pom.xml
└── Jenkinsfile
```

---

## Step 3 — Configure Jenkins Pipeline

1. Go to Jenkins → **New Item**
2. Name it `jenkins-java-demo` → Select **Pipeline** → Click **OK**
3. Scroll to **Pipeline** section
4. Set **Definition** to `Pipeline script from SCM`
5. Set **SCM** to `Git`
6. Enter your repo URL:
```
https://github.com/<your-username>/jenkins-java-demo.git
```
7. Set **Branch** to `*/main`
8. Set **Script Path** to `Jenkinsfile`
9. Click **Save**

---

## Step 4 — Run the Pipeline

1. Click **Build Now**
2. Watch all 5 stages turn green:
```
✅ Checkout → ✅ Build → ✅ Test → ✅ Package → ✅ Deploy
