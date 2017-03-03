cd "js"
CALL npm run build
cd ".."
CALL mvn clean spring-boot:run