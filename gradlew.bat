@echo off
setlocal
cd /d "%~dp0"
set "WRAPPER_JAR=gradle\wrapper\gradle-wrapper.jar"
if not exist "%WRAPPER_JAR%" (
  echo Downloading official Gradle wrapper bootstrap...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.14.3/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle/wrapper/gradle-wrapper.jar'"
  if errorlevel 1 exit /b 1
)
java -cp "%WRAPPER_JAR%" org.gradle.wrapper.GradleWrapperMain %*
exit /b %errorlevel%
