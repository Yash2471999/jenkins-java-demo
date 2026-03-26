FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**Step 3** — Click **Commit changes**

---

## Then Run the Build Again in Jenkins

1. Click **Build Now**
2. Click **Console Output**

---

## Expected Result This Time:
```
✅ Checkout
✅ Build
✅ Test
✅ Package
✅ Build Docker Image
✅ Push to DockerHub
✅ Deploy Container
