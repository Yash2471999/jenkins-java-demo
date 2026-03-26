Started by user unknown or anonymous
Checking out git https://github.com/Yash2471999/jenkins-java-demo.git into /var/lib/jenkins/workspace/Java-maven CICD@script/a9e65ee7437a47faf9a317bda9cef8cb2920f6d0722d9a4c15a3ba383dd686f7 to read Jenkinsfile
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Java-maven CICD@script/a9e65ee7437a47faf9a317bda9cef8cb2920f6d0722d9a4c15a3ba383dd686f7/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/Yash2471999/jenkins-java-demo.git # timeout=10
Fetching upstream changes from https://github.com/Yash2471999/jenkins-java-demo.git
 > git --version # timeout=10
 > git --version # 'git version 2.43.0'
 > git fetch --tags --force --progress -- https://github.com/Yash2471999/jenkins-java-demo.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 827e9faab388f004700998c11710c4e7f55a052d (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 827e9faab388f004700998c11710c4e7f55a052d # timeout=10
Commit message: "Change base image to eclipse-temurin:17-jre-jammy"
 > git rev-list --no-walk 8889bca843b8aeed62ddf928c1e55425f827e62f # timeout=10
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Java-maven CICD
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository https://github.com/Yash2471999/jenkins-java-demo.git
 > git init /var/lib/jenkins/workspace/Java-maven CICD # timeout=10
Fetching upstream changes from https://github.com/Yash2471999/jenkins-java-demo.git
 > git --version # timeout=10
 > git --version # 'git version 2.43.0'
 > git fetch --tags --force --progress -- https://github.com/Yash2471999/jenkins-java-demo.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/Yash2471999/jenkins-java-demo.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 827e9faab388f004700998c11710c4e7f55a052d (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 827e9faab388f004700998c11710c4e7f55a052d # timeout=10
Commit message: "Change base image to eclipse-temurin:17-jre-jammy"
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Tool Install)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] withEnv
[Pipeline] {
[Pipeline] echo
Pulling source code from GitHub...
[Pipeline] git
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Java-maven CICD/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/Yash2471999/jenkins-java-demo.git # timeout=10
Fetching upstream changes from https://github.com/Yash2471999/jenkins-java-demo.git
 > git --version # timeout=10
 > git --version # 'git version 2.43.0'
 > git fetch --tags --force --progress -- https://github.com/Yash2471999/jenkins-java-demo.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 827e9faab388f004700998c11710c4e7f55a052d (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 827e9faab388f004700998c11710c4e7f55a052d # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b main 827e9faab388f004700998c11710c4e7f55a052d # timeout=10
Commit message: "Change base image to eclipse-temurin:17-jre-jammy"
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] withEnv
[Pipeline] {
[Pipeline] echo
Building the application...
[Pipeline] sh
+ mvn clean compile
[INFO] Scanning for projects...
[INFO] 
[INFO] ---------------------< com.demo:jenkins-java-demo >---------------------
[INFO] Building jenkins-java-demo 1.0.0
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- clean:3.2.0:clean (default-clean) @ jenkins-java-demo ---
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ jenkins-java-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /var/lib/jenkins/workspace/Java-maven CICD/src/main/resources
[INFO] 
[INFO] --- compiler:3.11.0:compile (default-compile) @ jenkins-java-demo ---
[INFO] Changes detected - recompiling the module! :source
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 1 source file with javac [debug target 17] to target/classes
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  1.365 s
[INFO] Finished at: 2026-03-26T06:49:47Z
[INFO] ------------------------------------------------------------------------
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] withEnv
[Pipeline] {
[Pipeline] echo
Running unit tests...
[Pipeline] sh
+ mvn test
[INFO] Scanning for projects...
[INFO] 
[INFO] ---------------------< com.demo:jenkins-java-demo >---------------------
[INFO] Building jenkins-java-demo 1.0.0
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ jenkins-java-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /var/lib/jenkins/workspace/Java-maven CICD/src/main/resources
[INFO] 
[INFO] --- compiler:3.11.0:compile (default-compile) @ jenkins-java-demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ jenkins-java-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /var/lib/jenkins/workspace/Java-maven CICD/src/test/resources
[INFO] 
[INFO] --- compiler:3.11.0:testCompile (default-testCompile) @ jenkins-java-demo ---
[INFO] Changes detected - recompiling the module! :source
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 1 source file with javac [debug target 17] to target/test-classes
[INFO] 
[INFO] --- surefire:3.1.2:test (default-test) @ jenkins-java-demo ---
[INFO] Using auto detected provider org.apache.maven.surefire.junit4.JUnit4Provider
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running com.demo.CalculatorTest
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.084 s -- in com.demo.CalculatorTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.285 s
[INFO] Finished at: 2026-03-26T06:49:52Z
[INFO] ------------------------------------------------------------------------
Post stage
[Pipeline] echo
All tests passed!
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Package)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] withEnv
[Pipeline] {
[Pipeline] echo
Packaging the application...
[Pipeline] sh
+ mvn package -DskipTests
[INFO] Scanning for projects...
[INFO] 
[INFO] ---------------------< com.demo:jenkins-java-demo >---------------------
[INFO] Building jenkins-java-demo 1.0.0
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ jenkins-java-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /var/lib/jenkins/workspace/Java-maven CICD/src/main/resources
[INFO] 
[INFO] --- compiler:3.11.0:compile (default-compile) @ jenkins-java-demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ jenkins-java-demo ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /var/lib/jenkins/workspace/Java-maven CICD/src/test/resources
[INFO] 
[INFO] --- compiler:3.11.0:testCompile (default-testCompile) @ jenkins-java-demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- surefire:3.1.2:test (default-test) @ jenkins-java-demo ---
[INFO] Tests are skipped.
[INFO] 
[INFO] --- jar:3.3.0:jar (default-jar) @ jenkins-java-demo ---
[INFO] Building jar: /var/lib/jenkins/workspace/Java-maven CICD/target/jenkins-java-demo-1.0.0.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  1.480 s
[INFO] Finished at: 2026-03-26T06:49:56Z
[INFO] ------------------------------------------------------------------------
[Pipeline] echo
JAR file created!
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build Docker Image)
[Pipeline] tool
[Pipeline] envVarsForTool
[Pipeline] withEnv
[Pipeline] {
[Pipeline] echo
Building Docker image...
[Pipeline] sh
+ docker build -t rajkumar0610/calculator-app:20 .
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon    254kB

Error response from daemon: dockerfile parse error on line 6: unknown instruction: ```
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push to DockerHub)
Stage "Push to DockerHub" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy Container)
Stage "Deploy Container" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo
Cleaning up workspace...
[Pipeline] cleanWs
[WS-CLEANUP] Deleting project workspace...
[WS-CLEANUP] Deferred wipeout is used...
[WS-CLEANUP] done
[Pipeline] echo
Pipeline failed! Check the logs.
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 1
Finished: FAILURE
