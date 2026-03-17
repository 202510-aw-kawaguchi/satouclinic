@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET "BASE_DIR=%~dp0"
SET "WRAPPER_DIR=%BASE_DIR%.mvn\wrapper"
SET "WRAPPER_PROPERTIES=%WRAPPER_DIR%\maven-wrapper.properties"
SET "WRAPPER_JAR=%WRAPPER_DIR%\maven-wrapper.jar"

IF NOT EXIST "%WRAPPER_PROPERTIES%" (
  ECHO Wrapper properties not found: "%WRAPPER_PROPERTIES%"
  EXIT /B 1
)

IF NOT EXIST "%WRAPPER_JAR%" (
  FOR /F "usebackq delims=" %%A IN (`powershell -NoProfile -Command "(Get-Content '%WRAPPER_PROPERTIES%' | Where-Object { $_ -like 'wrapperUrl=*' } | Select-Object -First 1).Split('=', 2)[1]"`) DO SET "WRAPPER_URL=%%A"
  IF "!WRAPPER_URL!"=="" (
    ECHO wrapperUrl is not set in "%WRAPPER_PROPERTIES%"
    EXIT /B 1
  )

  powershell -NoProfile -ExecutionPolicy Bypass -Command "New-Item -ItemType Directory -Force -Path '%WRAPPER_DIR%' | Out-Null; Invoke-WebRequest -UseBasicParsing -Uri '!WRAPPER_URL!' -OutFile '%WRAPPER_JAR%'" || EXIT /B 1
)

java -classpath "%WRAPPER_JAR%" "-Dmaven.multiModuleProjectDirectory=%BASE_DIR%" org.apache.maven.wrapper.MavenWrapperMain %*
